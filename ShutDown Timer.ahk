;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;		 ShutDown Timer	 	;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Just type sd.. for initializing Shutdown Scheduler

::sd.:: 
InputBox, password, Shutdown Timer, Enter minutes to shutdown , ,300,160
if ErrorLevel
    MsgBox, shutdown canceled.
else
{	
	SECS = 60 ;
	MINTS:=  (password * SECS) ;
	runwait, shutdown -s -t  %MINTS%
}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Type sds.. to remove and Scheduled Shutdown

::sds.:: 
runwait, shutdown /a
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;