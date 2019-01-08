;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;			URL Shortner			;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Just Select a URL and then hit WinKey + W

#w::
clipboard = "" ; Start off empty to allow ClipWait to detect when the text has arrived.
Send ^c
ClipWait  ; Wait for the clipboard to contain text.
MyString = %clipboard%


;MsgBox mb1 Control-C copied the following contents to the clipboard:`n`n"%MyString%"
Test := Googl(MyString)
clipboard = % Test
MsgBox Url Shortened to: %clipboard%`nCopied to clipboard
return

Googl(URL)	{
	Googl:= ComObjCreate("WinHttp.WinHttpRequest.5.1")
	Googl.Open("POST", "https://www.googleapis.com/urlshortener/v1/url?key=AIzaSyDgA5V-nKt8TZ-km9yGmkg1GMnXnrO0V_k")
	Googl.SetRequestHeader("Content-Type", "application/json")
	Googl.Send("{""longUrl"": """ URL """}")
	Return RegExReplace(Googl.ResponseText,"s).*""id"": ""(.*?)"".*","$1")
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;