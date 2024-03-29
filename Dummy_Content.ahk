;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;		Dummy Content Creator		;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Note: You need to choose autohotkey unicode version for the arabic text to work. 
; Just hit Ctrl+WinKey+L


^#l::

Gui, Add, Text, x17 y8 w120 h20, Number of Words: 
Gui, Add, Text, x17 yp+30 wp hp, Number of Paragraphs: 
Gui, Add, Edit, xp+140 y8 w100 hp vChars, 20 
Gui, Add, Edit, xp yp+30 wp hp vParas, 1
Gui, Add, Checkbox, x17 yp+30 w60 h20 vAddTag, Add tag
Gui, Add, Edit, x157 yp w100 h20 vTag, p
Gui, Add, Radio, Checked x17 yp+30 w50 h20 vLanguage +Checked gRadio, English
Gui, Add, Radio, xp+60 yp w50 hp vLanguage2 +Tabstop gRadio, Arabic
Gui, Add, Button, default x17 yp+40 w70 hp gOK, OK 
Gui, Add, Button, xp+170 yp wp hp gCancel, Cancel 
Gui, Show, x279 y217 h190 w272 , Text Generator
Gui, Add, Text, right x0 yp+30 w256 h20 vcreated, Created by Faraz Umer Ata
Gui, Font, c777777 s6.5
GuiControl, Font, created

Return 




OK: 
Gui, Submit


englishWords :=["was", "bulb","transport","chickens","lettuce","poison","arch","cemetery","spot","church","snake","aunt","place","year","minute","rat","rice","show","jewel","jelly","spiders","clover","observation","rod","protest","example","loss","tree","robin","rose","laugh","drink","control","cattle","cart","ants","record","verse","town","discovery","seashore","ladybug","mint","railway","side","geese","language","wilderness","seat","trains","arithmetic","rest","sound","cherries","flight","fly","locket","yam","offer","leather","blood","cause","quilt","letters","level","distribution","blow","minister","ocean","roll","chalk","raspy","tasteful","aberrant","shivering","uttermost","amused","far","material","outrageous","simplistic","various","gamy","zippy","adjoining","truculent","abortive","pretty","stiff","cute","cynical","lush","natural","abnormal","deadpan","scandalous","recently","roughly","yawningly","mechanically","deceivingly","strongly","swiftly","scarily","deeply","occasionally","previously","wearily","silently","mostly","rightfully","specifically","below","highly","annually","virtually","questionably","valiantly","vaguely","fondly","terribly","tickle","decay","groan","carve","interest","present","inject","welcome","care","drain","curl","rule","pick","rinse","skip","yawn","tumble","store","suspend","point","stop","part","fasten","heap","impress","whine","hover","deliver","judge","bolt","nest","escape","back","pinch","grin","aboard","since","beyond","towards","than","before","for","after","behind","despite","minus","unlike","off","through","near","toward","concerning","on","over","as","during","along","at","within","under","with","across","between","about","like","except","from","around","excepting","per","to","inside","beneath","beside","onto","save","down","upon","regarding","underneath","round","plus","via","following","considering","am","are","is","was","were","be","being","been","have","has","had","shall","will","do","does","did","may","must","might","can","could","would","should"]

loremWords := ["lorem", "ipsum", "dolor", "sit", "amet", "consectetur", "adipisicing", "elit","exercitatione", "perferendi","perspiciati","laboru","evenie","sun","iur","na","nobi","eu","cu","officii","exceptur","odi","consectetu","quas","au","quisqua","ve","eligend","itaqu","no","odi","tempor","quaera","dignissimo","facili","nequ","nihi","expedit","vita","ver","ipsu","nis","anim","cumqu","pariatu","veli","mod","natu","iust","eaqu","sequ","ill","se","e","e","voluptatibu","tempor","veritati","ration","assumend","incidun","nostru","placea","aliqui","fug","providen","praesentiu","re","necessitatibu","suscipi","adipisc","quide","possimu","volupta","debiti","sin","accusantiu","und","sapient","voluptat","qu","aspernatu","laudantiu","solut","ame","qu","aliqua","saep","culp","liber","ips","dict","reiciendi","nesciun","doloribu","aute","impedi","minim","maiore","repudianda","ipsa","obcaecat","ulla","eni","tota","delectu","ducimu","qui","voluptate","dolore","molestia","haru","dolore","qui","voluptate","molestia","magn","distincti","omni","illu","doloru","voluptatu","e","qua","qua","corpori","qua","blanditii","atqu","deserun","laboriosa","earu","consequuntu","hi","cupiditat","quibusda","accusamu","u","reru","erro","minu","eiu","a","a","nem","fugi","offici","a","i","i","quo","reprehenderi","numqua","ist","fugia","si","inventor","beata","repellendu","magna","recusanda","quo","explicab","doloremqu","aperia","consequatu","asperiore","commod","opti","dolo","labor","temporibu","repella","venia","architect","es","ess","molliti","null","similiqu","eo","alia","dolor","tenetu","delenit","porr","facer","maxim","corrupt"]

arabicWords := ["الشبكات", "الاجتماعية", "هي", "شائع", "للتواصل", "مع", "الأصدقاء", "حول", "الزاوية", "وحول", "العالم", "لقد", "أصبح", "واحدا", "من", "أهم", "أشكال", "الاتصال", "حتى", "فوق", "الهاتف", "الاستفادة", "التواصل", "العالمي", "ومع", "ذلك", "تأتي", "المخاطر", "والآثار", "السلبية", "القليل", "اليوم", "يتذكر", "خطوط", "الحزب", "القديمة", "لكن", "تشبه", "إلى", "حد", "كبير", "هذه", "الخطوط", "الحزبية", "يجب", "أن", "يكون", "الشبكيون", "حذرين", "فيما", "يقولون", "لأن", "العالم", "يراقب", "في", "حين", "أصحاب", "لديهم", "القدرة", "على", "الدردشة", "والدردشة", "واحدة", "واحد", "فإن", "الكثير", "مما", "يقال", "يمكن", "رؤيته", "قبل", "الجمهور", "مثل", "لا", "توجد", "خصوصية", "عندما", "يستطيع", "الجميع", "رؤية", "ما", "مشكلة", "أخرى", "القرصنة", "نظرًا", "تقدم", "إجراءات", "أمان", "لمستخدميها", "العديد", "أجهزة", "الكمبيوتر", "المستخدمة", "مستخدمي", "عرضة", "للقراصنة", "يصبح", "كل", "جزء", "المعلومات", "كمبيوتر", "أحد", "الشبكة", "متاحًا", "لأولئك", "الماهرين", "هذا", "العلم", "وغالبًا", "دون", "معرفة", "صاحب", "جنبا", "جنب", "الاختراق", "هو", "زرع", "الفيروسات", "يتم", "تمرير", "الفيروسات", "عبر", "وكثيراً", "اكتشافها", "ساحة", "لعب", "لفيروسات", "غير", "خاضعة", "للرقابة", "كبير", "قد", "يبدو", "إلا", "بعض", "الصور", "واللغات", "قِبل", "مناسبة", "للأطفال", "فهي", "قابلة", "للعرض", "الأطفال", "أي", "عمر", "يمكنهم", "الخصوصية", "والرقابة", "قضية", "المفترسات", "السيبرانية", "تقوم", "شبكات", "الاجتماعي", "بفحص", "مستخدميها", "وليس", "لديها", "طريقة", "حقيقية", "لمعرفة", "أنواع", "الأشخاص", "الذين", "يستخدمون", "الشبكة", "توفر", "صيد", "نوع", "للحيوانات", "المفترسة", "التي", "تبحث", "عن", "شبكيين", "مرتابين", "كما", "لمستخدمي", "الإنترنت", "استخدام", "كطريقة", "سهلة", "لتفجير", "فرائسهم", "وإلى", "تجد", "لفحص", "وعدم", "السماح", "بالحيوانات", "والبلطجة"]


if Language = 1 
{
	words := englishWords
}
else  
{
	words := arabicWords
}


space:= " "
enter:= "<br><br>`r`n`r`n"
lineBreak:= "`n`n\n\n"
fullStop:= "."
wordCount:= words.Length()

getRandomWord(){
	global words
	global wordCount
	Random, rand, 1, %wordCount%
	temp1:= words[rand]
	return temp1	
}

getString(i){
	newString:= getRandomWord()
	newString:=RegExReplace(newString, "^(.)", "$u1")		;	capitalize first word
	i:= i - 1
	global space
	Loop %i% {
		newWord:= getRandomWord()
		newString:= newString . space . newWord . fullStop
	}
	return newString
}






fullString := getString(Chars)
fullString := fullString . fullStop

if AddTag = 1 
{
	fullString := "<" . Tag . ">" . fullString . "</" . Tag . ">"
}

Paras:= Paras - 1

Loop %Paras% {
	wordsString := getString(Chars)
	wordsString := wordsString . fullStop
	
	if AddTag = 1 
	{
		fullString := fullString . lineBreak . "<" . Tag . ">"  . wordsString . "</" . Tag . ">" 
	}
	else  
	{
		fullString := fullString . enter . wordsString
	}
	
}

Clipboard = %fullString%
Send ^v
Gui Destroy  
Return


; Tabbing code for radio buttons tabbing
Radio:
Gui, test: Submit, NoHide
Loop, 2
	if	(A_GuiControl <> "Radio" A_Index)
		GuiControl, , Radio%A_Index%, 0
Return

Cancel: 
GuiClose: 
GuiEscape: 
Gui Destroy 
Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
