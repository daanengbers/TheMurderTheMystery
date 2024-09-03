extends Node2D

var global_dialogue_on = false
var linenr = 0
var maxlines = 1
var charsvis = 0
var personspeaking = ""

var loadedline1 = ""
var loadedline2 = "2"
var loadedline3 = "3"
var loadedline4 = "4"
var loadedline5 = "5"
var loadedline6 = ""
var loadedline7 = ""
var loadedline8 = ""
var loadedline9 = ""

#var text_in_box = ""

func _process(delta):
	if charsvis < 200 && global_dialogue_on == true:
		charsvis += 0.5
	$UI/Textbox/Text.visible_characters = charsvis
	$UI/Textbox/Linenr.set_text(str(maxlines))
	if Input.is_action_just_pressed("interact") && global_dialogue_on == true:
		nextLine()

func setDialougueOn():
	global_dialogue_on = true
	$UI/Textbox.visible = true

func setDialougueOff():
	$Timers/DisableDialogueTimer.start()
	$UI/Textbox.visible = false
	linenr = 0
	$UI/Textbox/Text.visible_characters = 0

func setPersonSpeaking(p_s):
	personspeaking = p_s
	$UI/Textbox/Name.set_text(str(personspeaking))
	if personspeaking == "Your cellphone":
		$UI/Textbox/CharPortraits.frame = 2

func loadLines(ll1,ll2,ll3,ll4,ll5,ll6,ll7,ll8,ll9):
	loadedline1 = ll1
	loadedline2 = ll2
	loadedline3 = ll3
	loadedline4 = ll4
	loadedline5 = ll5
	loadedline6 = ll6
	loadedline7 = ll7
	loadedline8 = ll8
	loadedline9 = ll9
	

func nextLine():
	linenr += 1
	if linenr == 1:
		$UI/Textbox/Text.set_text(str(loadedline1))
	if linenr == 2:
		$UI/Textbox/Text.set_text(str(loadedline2))
	if linenr == 3:
		$UI/Textbox/Text.set_text(str(loadedline3))
	if linenr == 4:
		$UI/Textbox/Text.set_text(str(loadedline4))
	if linenr == 5:
		$UI/Textbox/Text.set_text(str(loadedline5))
	if linenr == 6:
		$UI/Textbox/Text.set_text(str(loadedline6))
	if linenr == 7:
		$UI/Textbox/Text.set_text(str(loadedline7))
	if linenr == 8:
		$UI/Textbox/Text.set_text(str(loadedline8))
	if linenr == 9:
		$UI/Textbox/Text.set_text(str(loadedline9))
	
	if linenr > maxlines:
		setDialougueOff()
	charsvis = 0


func _on_disable_dialogue_timer_timeout():
	global_dialogue_on = false
