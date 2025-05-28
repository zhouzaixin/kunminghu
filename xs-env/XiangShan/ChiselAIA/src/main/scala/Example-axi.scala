/***************************************************************************************
* Copyright (c) 2024 Beijing Institute of Open Source Chip (BOSC)
*
* ChiselAIA is licensed under Mulan PSL v2.
* You can use this software according to the terms and conditions of the Mulan PSL v2.
* You may obtain a copy of Mulan PSL v2 at:
*          http://license.coscl.org.cn/MulanPSL2
*
* THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
* EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
* MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
*
* See the Mulan PSL v2 for more details.
***************************************************************************************/

package aia

import chisel3.{IO, _}
import chisel3.util._
import freechips.rocketchip.diplomacy._
import org.chipsalliance.cde.config.{Parameters, Config}
import freechips.rocketchip.amba.axi4._
// _root_ disambiguates from package chisel3.util.circt if user imports chisel3.util._
import _root_.circt.stage.ChiselStage


class AXI4AIA()(implicit p: Parameters) extends LazyModule {
  val toAIA = AXI4MasterNode(
    Seq(AXI4MasterPortParameters(
      Seq(AXI4MasterParameters("aia_axi4", IdRange(0, 16)))
    )))
  val toAIA_xbar = LazyModule(new AXI4Xbar).node
  toAIA_xbar := toAIA

  // Here we create 2 imsic groups, each group contains two 2 CPUs
  val imsic_params = IMSICParams(EnableImsicAsyncBridge = true)
  val aplic_params = APLICParams(groupsNum = 2, membersNum = 2)
  val imsics_fromMem_xbar = LazyModule(new AXI4Xbar).node
  imsics_fromMem_xbar := toAIA_xbar

  val imsics = (0 until 4).map(i => {
    val (groupID, memberID) = aplic_params.hartIndex_to_gh(i)
    require(groupID < aplic_params.groupsNum, f"groupID ${groupID} should less than groupsNum ${aplic_params.groupsNum}")
    require(memberID < aplic_params.membersNum, f"memberID ${memberID} should less than membersNum ${aplic_params.membersNum}")
    println(f"Generating IMSIC groupID=0x${groupID}%x memberID=0x${memberID}%x")
    val map = LazyModule(new AXI4Map(addrSet => addrSet.base.toLong match {
      case imsic_params.mAddr => groupID * pow2(aplic_params.groupStrideWidth) + aplic_params.mBaseAddr + memberID * pow2(aplic_params.mStrideWidth)
      case imsic_params.sgAddr => groupID * pow2(aplic_params.groupStrideWidth) + aplic_params.sgBaseAddr + memberID * pow2(aplic_params.sgStrideWidth)
      case _ => assert(false, f"unknown address ${addrSet.base}"); 0
    })(Parameters.empty)).node

    val teemap = LazyModule(new AXI4Map(addrSet => addrSet.base.toLong match {
      case imsic_params.mAddr => groupID * pow2(aplic_params.groupStrideWidth) + 0x40010000L + memberID * pow2(aplic_params.mStrideWidth)
      case imsic_params.sgAddr => groupID * pow2(aplic_params.groupStrideWidth) + 0x80010000L + memberID * pow2(aplic_params.sgStrideWidth)
      case _ => assert(false, f"unknown address ${addrSet.base}"); 0
    })(Parameters.empty)).node

    val imsic = LazyModule(new AXI4IMSIC(imsic_params)(new Config((site, here, up) => {
      case IMSICParameKey => IMSICParameters(HasTEEIMSIC = false)
    })))

    imsic.axireg.axireg.axi4tolite.head.node := map := imsics_fromMem_xbar
    imsic.axireg.tee_axireg.foreach { tee_axireg => tee_axireg.axi4tolite.head.node := teemap := imsics_fromMem_xbar }
    imsic
  })

  val aplic = LazyModule(new AXI4APLIC(aplic_params)(Parameters.empty))
  aplic.fromCPU := toAIA_xbar
  imsics_fromMem_xbar := aplic.toIMSIC

  lazy val module = new LazyModuleImp(this) with HasIMSICParameters{
    toAIA.makeIOs()(ValName("toaia"))
    (0 until 4).map(i => {
      val toCSR = IO(Output(chiselTypeOf(imsics(i).module.toCSR))).suggestName(f"toCSR${i}")
      val fromCSR = IO(Input(chiselTypeOf(imsics(i).module.fromCSR))).suggestName(f"fromCSR${i}")
      toCSR <> imsics(i).module.toCSR
      fromCSR <> imsics(i).module.fromCSR
    })
    val intSrcs = IO(Input(chiselTypeOf(aplic.module.intSrcs)))
    intSrcs <> aplic.module.intSrcs
    val sec_cmode = if (GHasTEEIMSIC) Some(IO(Input(Bool()))) else None
    val sec_notice_pending = if (GHasTEEIMSIC) Some(IO(Output(Vec(4,Bool())))) else None
    for (i <- 0 until 4) {
      imsics(i).module.soc_clock := clock
      imsics(i).module.soc_reset := reset
      sec_cmode.foreach { sec_cmode =>
        imsics(i).module.io_sec.foreach {
          instance_iosec =>
            instance_iosec.cmode := sec_cmode
        }
      }

      sec_notice_pending.foreach { sec_notice_pending =>
        imsics(i).module.io_sec.foreach {
          instance_iosec =>
            sec_notice_pending(i) := instance_iosec.notice_pending
        }
      }
    }
  }
}

/**
 * Generate Verilog sources
 */
object AXI4AIA extends App {

  val axi4top = LazyModule(new AXI4AIA()(
    Parameters.empty.alterPartial({
      case IMSICParameKey => IMSICParameters(HasTEEIMSIC=false)
    })
  ))


  ChiselStage.emitSystemVerilog(
    axi4top.module,
    args = Array("--dump-fir"),
    // more opts see: $CHISEL_FIRTOOL_PATH/firtool -h
    firtoolOpts = Array(
      "-disable-all-randomization",
      "-strip-debug-info",
      // without this, firtool will exit with error: Unhandled annotation
      "--disable-annotation-unknown",
      "--lowering-options=explicitBitcast,disallowLocalVariables,disallowPortDeclSharing,locationInfoStyle=none",
      "--split-verilog", "-o=gen_axi",
    )
  )
}