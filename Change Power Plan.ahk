;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;		Change Laptop Power Plan	;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ; Just hit Capslock + 1 for Power Saver mode, Capslock + 2 for Balanced mode or Capslock + 3 for High Performance Mode

; Power saver
Capslock & 1::
Run, powercfg -s a1841308-3541-4fab-bc81-f71556f20b4a
Return

; Balanced
Capslock & 2::
Run, powercfg -s 381b4222-f694-41f0-9685-ff5bb260df2e
Return

; High Performance
Capslock & 3::
Run, powercfg -s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;