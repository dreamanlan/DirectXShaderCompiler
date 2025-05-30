; REQUIRES: dxil-1-9
; RUN: not %dxv %s 2>&1 | FileCheck %s

target datalayout = "e-m:e-p:32:32-i1:32-i8:32-i16:32-i32:32-i64:64-f16:32-f32:32-f64:64-n8:16:32:64"
target triple = "dxil-ms-dx"

%dx.types.HitObject = type { i8* }

; CHECK: Function: ?main@@YAXXZ: error: Use of undef coherence hint or num coherence hint bits in MaybeReorderThread.
; CHECK-NEXT: note: at 'call void @dx.op.maybeReorderThread(i32 268, %dx.types.HitObject %nop, i32 1, i32 undef)'

; CHECK: Function: ?main@@YAXXZ: error: Use of undef coherence hint or num coherence hint bits in MaybeReorderThread.
; CHECK-NEXT: note: at 'call void @dx.op.maybeReorderThread(i32 268, %dx.types.HitObject %nop, i32 undef, i32 1)'

; CHECK: Function: ?main@@YAXXZ: error: HitObject is undef.
; CHECK-NEXT: note: at 'call void @dx.op.maybeReorderThread(i32 268, %dx.types.HitObject undef, i32 11, i32 0)'

; CHECK: Validation failed.

; Function Attrs: nounwind
define void @"\01?main@@YAXXZ"() #0 {
  %nop = call %dx.types.HitObject @dx.op.hitObject_MakeNop(i32 266)  ; HitObject_MakeNop()

  ; Validate that hit object is not undef.
  call void @dx.op.maybeReorderThread(i32 268, %dx.types.HitObject undef, i32 11, i32 0)  ; MaybeReorderThread(hitObject,coherenceHint,numCoherenceHintBitsFromLSB)

  ; Validate that coherence hint is not undef while numCoherenceHintBitsFromLSB is not 0.
  call void @dx.op.maybeReorderThread(i32 268, %dx.types.HitObject %nop, i32 undef, i32 1)  ; MaybeReorderThread(hitObject,coherenceHint,numCoherenceHintBitsFromLSB)

  ; Validate that num coherence hint bits from LSB is not undef.
  call void @dx.op.maybeReorderThread(i32 268, %dx.types.HitObject %nop, i32 1, i32 undef)  ; MaybeReorderThread(hitObject,coherenceHint,numCoherenceHintBitsFromLSB)
  ret void
}

; Function Attrs: nounwind readnone
declare %dx.types.HitObject @dx.op.hitObject_MakeNop(i32) #1

; Function Attrs: nounwind
declare void @dx.op.maybeReorderThread(i32, %dx.types.HitObject, i32, i32) #0

attributes #0 = { nounwind }
attributes #1 = { nounwind readnone }

!dx.version = !{!0}
!dx.valver = !{!0}
!dx.shaderModel = !{!1}
!dx.typeAnnotations = !{!2}
!dx.entryPoints = !{!6, !8}

!0 = !{i32 1, i32 9}
!1 = !{!"lib", i32 6, i32 9}
!2 = !{i32 1, void ()* @"\01?main@@YAXXZ", !3}
!3 = !{!4}
!4 = !{i32 1, !5, !5}
!5 = !{}
!6 = !{null, !"", null, null, !7}
!7 = !{i32 0, i64 0}
!8 = !{void ()* @"\01?main@@YAXXZ", !"\01?main@@YAXXZ", null, null, !9}
!9 = !{i32 8, i32 7, i32 5, !10}
!10 = !{i32 0}
