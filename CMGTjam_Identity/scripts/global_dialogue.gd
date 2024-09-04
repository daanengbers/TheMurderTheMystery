extends Node2D

var global_dialogue_on = false
var linenr = 1
var charlinenr = 1
var maxlines = 1
var charsvis = 0
var personspeaking = ""
@export var is_cutscene = true

var cscene = 1
var canpress = true

var loadedline1 = ""
var loadedline2 = "2"
var loadedline3 = "3"
var loadedline4 = "4"
var loadedline5 = "5"
var loadedline6 = ""
var loadedline7 = ""
var loadedline8 = ""
var loadedline9 = ""

@export var nextscene = PackedScene

#var text_in_box = ""

func _ready():
	$UI/Blackbox/AnimationPlayer.play("fadein")
	if cscene == 1:
	#if get_tree().current_scene.name == "mainscene":
		setDialougueOn()
		pentagramSceneDialogue()
		nextLine()

func _process(delta):
	
	
	if charsvis < 200 && global_dialogue_on == true:
		charsvis += 0.5
	$UI/Textbox/Text.visible_characters = charsvis
	$UI/Textbox/Linenr.set_text(str(maxlines))
	if Input.is_action_just_pressed("interact") && global_dialogue_on == true && canpress == true:
		canpress = false
		charsvis = 0
		nextLine()
		$Timers/PressTimer.start()
	
	

func setDialougueOn():
	global_dialogue_on = true
	$UI/Textbox.visible = true

func setDialougueOff():
	if is_cutscene == false:
		$Timers/DisableDialogueTimer.start()
		$UI/Textbox.visible = false
	else:
		charlinenr += 1
		if cscene == 1:
			linenr = 1
			pentagramSceneDialogue()
	
	linenr = 0
	$UI/Textbox/Text.visible_characters = 0
	$UI/Textbox/Text.modulate = Color(1,1,1)

func setPersonSpeaking(p_s):
	personspeaking = p_s
	$UI/Textbox/Name.set_text(str(personspeaking))
	if personspeaking == "Your cellphone":
		$UI/Textbox/CharPortraits.frame = 2
	elif personspeaking == "Sleeping Teacher":
		$UI/Textbox/CharPortraits.frame = 3
	elif personspeaking == "Letter":
		$UI/Textbox/CharPortraits.frame = 4
	else:
		$UI/Textbox/CharPortraits.frame = 0

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
	charsvis = 1
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
		if is_cutscene == false:
			setDialougueOff()
		else:
			if cscene == 1:
				charlinenr += 1
				linenr = 1
				pentagramSceneDialogue()
				

func fadeIn():
	$UI/Blackbox/AnimationPlayer.play("fadein")

func fadeOut():
	$UI/Blackbox/AnimationPlayer.play("fadeout")
	$Timers/Nextscene1Timer.start()

func _on_disable_dialogue_timer_timeout():
	global_dialogue_on = false

func _on_nextscene_1_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/mainscene.tscn")

func pentagramSceneDialogue():
	linenr = 1
	if charlinenr == 1:
		setPersonSpeaking("YOU")
		maxlines = 1
		loadLines("","Who's idea was this again?","","","","","","","",)
		
	if charlinenr == 2:
		setPersonSpeaking("Raisa")
		maxlines = 3
		loadLines("","What's wrong Eddie, you scared?","Come on! we can't pass up this possibility!","A group of teens blabla","f","f","f","f","f",)
		
	if charlinenr == 3:
		setPersonSpeaking("Alynne")
		maxlines = 2
		loadLines("","That's not funny!...","...you knock on wood right this instant before something really happens!","","","","","","",)
		
	
	
	
	
	
	





func _on_press_timer_timeout():
	canpress = true
