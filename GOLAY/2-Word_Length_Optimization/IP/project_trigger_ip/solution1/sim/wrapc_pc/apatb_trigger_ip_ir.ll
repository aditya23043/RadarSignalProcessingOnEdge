; ModuleID = 'C:/Users/nadis/AppData/Roaming/Xilinx/Vitis/trigger_ip_project/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>" = type { %"struct.hls::axis<std::complex<float>, 0, 0, 0>" }
%"struct.hls::axis<std::complex<float>, 0, 0, 0>" = type { %"struct.std::complex<float>", %"struct.ap_uint<8>", %"struct.ap_uint<8>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>" }
%"struct.std::complex<float>" = type { { float, float } }
%"struct.ap_uint<8>" = type { %"struct.ap_int_base<8, false>" }
%"struct.ap_int_base<8, false>" = type { %"struct.ssdm_int<8, false>" }
%"struct.ssdm_int<8, false>" = type { i8 }
%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1, false>" }
%"struct.ap_int_base<1, false>" = type { %"struct.ssdm_int<1, false>" }
%"struct.ssdm_int<1, false>" = type { i1 }

; Function Attrs: noinline
define void @apatb_trigger_ip_ir(%"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* noalias nocapture nonnull dereferenceable(16) %s_axis_in, %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* noalias nocapture nonnull dereferenceable(16) %m_axis_out, %"struct.ap_uint<1>"* nocapture readonly %sync_reset, %"struct.ap_uint<1>"* noalias nocapture nonnull dereferenceable(1) %trigger_done) local_unnamed_addr #0 {
entry:
  %s_axis_in_copy.data = alloca i64
  %s_axis_in_copy.keep = alloca i8
  %s_axis_in_copy.strb = alloca i8
  %s_axis_in_copy.last = alloca i1
  %m_axis_out_copy.data = alloca i64
  %m_axis_out_copy.keep = alloca i8
  %m_axis_out_copy.strb = alloca i8
  %m_axis_out_copy.last = alloca i1
  %trigger_done_copy = alloca %"struct.ap_uint<1>", align 512
  call fastcc void @copy_in(%"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* nonnull %s_axis_in, i64* %s_axis_in_copy.data, i8* %s_axis_in_copy.keep, i8* %s_axis_in_copy.strb, i1* %s_axis_in_copy.last, %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* nonnull %m_axis_out, i64* %m_axis_out_copy.data, i8* %m_axis_out_copy.keep, i8* %m_axis_out_copy.strb, i1* %m_axis_out_copy.last, %"struct.ap_uint<1>"* nonnull %trigger_done, %"struct.ap_uint<1>"* nonnull align 512 %trigger_done_copy)
  call void @apatb_trigger_ip_hw(i64* %s_axis_in_copy.data, i8* %s_axis_in_copy.keep, i8* %s_axis_in_copy.strb, i1* %s_axis_in_copy.last, i64* %m_axis_out_copy.data, i8* %m_axis_out_copy.keep, i8* %m_axis_out_copy.strb, i1* %m_axis_out_copy.last, %"struct.ap_uint<1>"* %sync_reset, %"struct.ap_uint<1>"* %trigger_done_copy)
  call void @copy_back(%"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %s_axis_in, i64* %s_axis_in_copy.data, i8* %s_axis_in_copy.keep, i8* %s_axis_in_copy.strb, i1* %s_axis_in_copy.last, %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %m_axis_out, i64* %m_axis_out_copy.data, i8* %m_axis_out_copy.keep, i8* %m_axis_out_copy.strb, i1* %m_axis_out_copy.last, %"struct.ap_uint<1>"* %trigger_done, %"struct.ap_uint<1>"* %trigger_done_copy)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in(%"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* noalias, i64* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i8* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i8* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.3" %_V_last_V, %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* noalias, i64* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.0" %_V_data_V1, i8* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.1" %_V_keep_V2, i8* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.2" %_V_strb_V3, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.3" %_V_last_V4, %"struct.ap_uint<1>"* noalias readonly, %"struct.ap_uint<1>"* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>.21"(i64* %_V_data_V, i8* %_V_keep_V, i8* %_V_strb_V, i1* %_V_last_V, %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %0)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>.21"(i64* %_V_data_V1, i8* %_V_keep_V2, i8* %_V_strb_V3, i1* %_V_last_V4, %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %1)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(%"struct.ap_uint<1>"* align 512 %3, %"struct.ap_uint<1>"* %2)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(%"struct.ap_uint<1>"* noalias align 512, %"struct.ap_uint<1>"* noalias readonly) unnamed_addr #2 {
entry:
  %2 = icmp eq %"struct.ap_uint<1>"* %0, null
  %3 = icmp eq %"struct.ap_uint<1>"* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %.0.0.04 = getelementptr %"struct.ap_uint<1>", %"struct.ap_uint<1>"* %1, i32 0, i32 0, i32 0, i32 0
  %.01.0.05 = getelementptr %"struct.ap_uint<1>", %"struct.ap_uint<1>"* %0, i32 0, i32 0, i32 0, i32 0
  %5 = bitcast i1* %.0.0.04 to i8*
  %6 = load i8, i8* %5
  %7 = trunc i8 %6 to i1
  store i1 %7, i1* %.01.0.05, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out(%"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* noalias, i64* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i8* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i8* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.3" %_V_last_V, %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* noalias, i64* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.0" %_V_data_V1, i8* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.1" %_V_keep_V2, i8* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.2" %_V_strb_V3, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.3" %_V_last_V4, %"struct.ap_uint<1>"* noalias, %"struct.ap_uint<1>"* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"(%"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %0, i64* %_V_data_V, i8* %_V_keep_V, i8* %_V_strb_V, i1* %_V_last_V)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"(%"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %1, i64* %_V_data_V1, i8* %_V_keep_V2, i8* %_V_strb_V3, i1* %_V_last_V4)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(%"struct.ap_uint<1>"* %2, %"struct.ap_uint<1>"* align 512 %3)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"(%"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* noalias align 512 "fpga.caller.interfaces"="layout_transformed", i64* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i8* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i8* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.3" %_V_last_V) unnamed_addr #4 {
entry:
  %1 = icmp eq %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %0, null
  %2 = or i1 %1, false
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>.16"(%"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* nonnull align 512 %0, i64* %_V_data_V, i8* %_V_keep_V, i8* %_V_strb_V, i1* %_V_last_V)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>.16"(%"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* noalias nocapture align 512 "fpga.caller.interfaces"="layout_transformed", i64* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i8* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i8* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_strb_V, i1* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.3" %_V_last_V) unnamed_addr #5 {
entry:
  %1 = alloca %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"
  %2 = alloca i64
  %3 = alloca i8
  %4 = alloca i8
  %5 = alloca i1
  br label %empty

empty:                                            ; preds = %push, %entry
  %6 = bitcast i64* %_V_data_V to i8*
  %7 = call i1 @fpga_fifo_not_empty_8(i8* %6)
  br i1 %7, label %push, label %ret

push:                                             ; preds = %empty
  %8 = bitcast i64* %2 to i8*
  %9 = bitcast i64* %_V_data_V to i8*
  call void @fpga_fifo_pop_8(i8* %8, i8* %9)
  %10 = load volatile i64, i64* %2
  %11 = getelementptr inbounds %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>", %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 0
  %12 = bitcast %"struct.std::complex<float>"* %11 to i64*
  store i64 %10, i64* %12
  call void @fpga_fifo_pop_1(i8* %4, i8* %_V_keep_V)
  %13 = load volatile i8, i8* %4
  %14 = getelementptr inbounds %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>", %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 1
  %15 = bitcast %"struct.ap_uint<8>"* %14 to i8*
  store i8 %13, i8* %15
  call void @fpga_fifo_pop_1(i8* %3, i8* %_V_strb_V)
  %16 = load volatile i8, i8* %3
  %17 = getelementptr inbounds %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>", %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 2
  %18 = bitcast %"struct.ap_uint<8>"* %17 to i8*
  store i8 %16, i8* %18
  %19 = bitcast i1* %5 to i8*
  %20 = bitcast i1* %_V_last_V to i8*
  call void @fpga_fifo_pop_1(i8* %19, i8* %20)
  %21 = bitcast i1* %5 to i8*
  %22 = load i8, i8* %21
  %23 = trunc i8 %22 to i1
  %24 = getelementptr inbounds %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>", %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 4
  %25 = bitcast %"struct.ap_uint<1>"* %24 to i1*
  store i1 %23, i1* %25
  %26 = bitcast %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %1 to i8*
  %27 = bitcast %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %0 to i8*
  call void @fpga_fifo_push_16(i8* %26, i8* %27)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>.21"(i64* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.0" %_V_data_V, i8* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.1" %_V_keep_V, i8* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.3" %_V_last_V, %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* noalias "fpga.caller.interfaces"="layout_transformed") unnamed_addr #4 {
entry:
  %1 = icmp eq %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %0, null
  %2 = or i1 false, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>.24"(i64* %_V_data_V, i8* %_V_keep_V, i8* %_V_strb_V, i1* %_V_last_V, %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* nonnull %0)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>.24"(i64* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.0" %_V_data_V, i8* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.1" %_V_keep_V, i8* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.2" %_V_strb_V, i1* noalias nocapture "fpga.caller.interfaces"="layout_transformed" "unpacked"="0.3" %_V_last_V, %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* noalias nocapture "fpga.caller.interfaces"="layout_transformed") unnamed_addr #5 {
entry:
  %1 = alloca %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"
  %2 = alloca %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %0 to i8*
  %4 = call i1 @fpga_fifo_not_empty_16(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %0 to i8*
  call void @fpga_fifo_pop_16(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>", %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %2
  store %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>" %7, %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %1
  %8 = getelementptr inbounds %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>", %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 0
  %9 = bitcast %"struct.std::complex<float>"* %8 to i64*
  %10 = bitcast i64* %9 to i8*
  %11 = bitcast i64* %_V_data_V to i8*
  call void @fpga_fifo_push_8(i8* %10, i8* %11)
  %12 = getelementptr inbounds %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>", %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 1
  %13 = bitcast %"struct.ap_uint<8>"* %12 to i8*
  call void @fpga_fifo_push_1(i8* %13, i8* %_V_keep_V)
  %14 = getelementptr inbounds %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>", %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 2
  %15 = bitcast %"struct.ap_uint<8>"* %14 to i8*
  call void @fpga_fifo_push_1(i8* %15, i8* %_V_strb_V)
  %16 = getelementptr inbounds %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>", %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %1, i32 0, i32 0, i32 4
  %17 = bitcast %"struct.ap_uint<1>"* %16 to i1*
  %18 = bitcast i1* %17 to i8*
  %19 = bitcast i1* %_V_last_V to i8*
  call void @fpga_fifo_push_1(i8* %18, i8* %19)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

declare void @apatb_trigger_ip_hw(i64*, i8*, i8*, i1*, i64*, i8*, i8*, i1*, %"struct.ap_uint<1>"*, %"struct.ap_uint<1>"*)

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_back(%"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* noalias, i64* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.0" %_V_data_V, i8* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.1" %_V_keep_V, i8* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.2" %_V_strb_V, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="1.3" %_V_last_V, %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* noalias, i64* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.0" %_V_data_V1, i8* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.1" %_V_keep_V2, i8* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.2" %_V_strb_V3, i1* noalias "fpga.caller.interfaces"="layout_transformed" "unpacked"="3.3" %_V_last_V4, %"struct.ap_uint<1>"* noalias, %"struct.ap_uint<1>"* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"(%"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %0, i64* %_V_data_V, i8* %_V_keep_V, i8* %_V_strb_V, i1* %_V_last_V)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"(%"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %1, i64* %_V_data_V1, i8* %_V_keep_V2, i8* %_V_strb_V3, i1* %_V_last_V4)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<1>"(%"struct.ap_uint<1>"* %2, %"struct.ap_uint<1>"* align 512 %3)
  ret void
}

define void @trigger_ip_hw_stub_wrapper(i64*, i8*, i8*, i1*, i64*, i8*, i8*, i1*, %"struct.ap_uint<1>"*, %"struct.ap_uint<1>"*) #6 {
entry:
  %10 = alloca %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"
  %11 = alloca %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"
  call void @copy_out(%"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %10, i64* %0, i8* %1, i8* %2, i1* %3, %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %11, i64* %4, i8* %5, i8* %6, i1* %7, %"struct.ap_uint<1>"* null, %"struct.ap_uint<1>"* %9)
  call void @trigger_ip_hw_stub(%"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %10, %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %11, %"struct.ap_uint<1>"* %8, %"struct.ap_uint<1>"* %9)
  call void @copy_in(%"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %10, i64* %0, i8* %1, i8* %2, i1* %3, %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"* %11, i64* %4, i8* %5, i8* %6, i1* %7, %"struct.ap_uint<1>"* null, %"struct.ap_uint<1>"* %9)
  ret void
}

declare void @trigger_ip_hw_stub(%"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"*, %"class.hls::stream<hls::axis<std::complex<float>, 0, 0, 0>, 0>"*, %"struct.ap_uint<1>"*, %"struct.ap_uint<1>"*)

declare i1 @fpga_fifo_not_empty_16(i8*)

declare i1 @fpga_fifo_not_empty_8(i8*)

declare void @fpga_fifo_pop_16(i8*, i8*)

declare void @fpga_fifo_pop_8(i8*, i8*)

declare void @fpga_fifo_pop_1(i8*, i8*)

declare void @fpga_fifo_push_16(i8*, i8*)

declare void @fpga_fifo_push_8(i8*, i8*)

declare void @fpga_fifo_push_1(i8*, i8*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #5 = { argmemonly noinline "fpga.wrapper.func"="streamcpy_hls" }
attributes #6 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.rotate.disable"}
