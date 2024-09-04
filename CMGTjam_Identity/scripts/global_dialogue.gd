extends Node2D

var global_dialogue_on = false
var linenr = 1
var charlinenr = 1
var maxlines = 0
var charsvis = 0
var personspeaking = ""
@export var is_cutscene = false
@onready var DEMON = preload("res://scenes/demon_guy.tscn")

var cscene = 0
var canpress = true

var loadedline1 = "line1"
var loadedline2 = "line2"
var loadedline3 = "line3"
var loadedline4 = "line4"
var loadedline5 = "line5"
var loadedline6 = "line6"
var loadedline7 = "line7"
var loadedline8 = "line8"
var loadedline9 = "line9"

var ClockAnimOn = false
var ShadowSprites = false

@export var nextscene = PackedScene

var cancontinueafterdemon = false

func _ready():
	$UI/Blackbox/AnimationPlayer.play("fadein")
	initialize()

func initialize():
	if cscene == 1:
		setDialougueOn()
		pentagramSceneDialogue()
		nextLine()
	if cscene == 2:
		setDialougueOn()
		charlinenr = 1
		TrappedInAnotherWorldSceneDialogue()
		nextLine()

func _process(delta):
	
	if charsvis < 200 && global_dialogue_on == true:
		charsvis += 0.5
	$UI/Textbox/Text.visible_characters = charsvis
	$UI/Textbox/Linenr.set_text("MAX LINES = " + str(maxlines) + " ,LINENR = " + str(linenr) + " ,CHARLNR = " + str(charlinenr) + " ,CHARSPEAKING = " + str(personspeaking))
	if Input.is_action_just_pressed("interact") && global_dialogue_on == true && canpress == true:
		canpress = false
		charsvis = 0
		if linenr > maxlines:
			if cscene == 1:
				charlinenr += 1
				linenr = 1
				pentagramSceneDialogue()
				nextLine()
			if cscene == 2:
				charlinenr += 1
				linenr = 1
				TrappedInAnotherWorldSceneDialogue()
				nextLine()
			if is_cutscene == false:
				setDialougueOff()
		else:
			nextLine()
			
		
		$Timers/PressTimer.start()
	
	

func pentagramSceneDialogue():
	linenr = 1
	if charlinenr == 1:
		setPersonSpeaking("YOU")
		maxlines = 1
		loadLines("","Who's idea was this again?","","","","","","","",)
	if charlinenr == 2:
		setPersonSpeaking("Raisa")
		maxlines = 3
		loadLines("","What's wrong Eddie, you scared?","Come on! we can't pass up this possibility!","A group of teens on a summercamp alone at night messing with the occult, someone better call Jason Vorhees!","","f","f","f","f",)
	if charlinenr == 3:
		setPersonSpeaking("Alynne")
		maxlines = 2
		loadLines("","That's not funny!","You knock on wood right this instant, before something really happens!","","","","","","",)
	if charlinenr == 4:
		setPersonSpeaking("Raisa")
		maxlines = 1
		loadLines("","Why I thought you didn't believe in all of that?","","","","","","","",)
	if charlinenr == 5:
		setPersonSpeaking("Alynne")
		maxlines = 1
		loadLines("","No... but it couldn't hurt now could it?","","","","","","","",)
	if charlinenr == 6:
		setPersonSpeaking("Micah")
		maxlines = 1
		loadLines("","Are you two done argueing?!?","","","","","","","",)
	if charlinenr == 7:
		setPersonSpeaking("Raisa")
		maxlines = 1
		loadLines("","Someone sure is in a hurry...","","","","","","","",)
	if charlinenr == 8:
		setPersonSpeaking("Micah")
		maxlines = 2
		loadLines("","I just want this dumb thing to be over.","I should have never showed you that stupid book in the first place.","","","","","","",)
	if charlinenr == 9:
		setPersonSpeaking("Raisa")
		maxlines = 3
		loadLines("","Ah don't be like that now Micah.","Every summer camp needs a test of courage and you just happened to give me the perfect one.","And who knows, maybe its actually real?","","","","","")
	if charlinenr == 10:
		setPersonSpeaking("Alynne")
		maxlines = 1
		loadLines("","Stop that Raisa, I'm telling you you are jinxing us all!!","","","","","","","")
	if charlinenr == 11:
		setPersonSpeaking("Alex")
		maxlines = 1
		loadLines("","So what do we do excactly?","","","","","","","")
	if charlinenr == 12:
		setPersonSpeaking("Raisa")
		maxlines = 1
		loadLines("","Why would you look at that Alynne, she does speak!","","","","","","","")
	if charlinenr == 13:
		setPersonSpeaking("Alynne")
		maxlines = 3
		loadLines("","Don't tease her Raisa!","According to this book, we sit around this beautiful circle I drew at exactly midnight during a thunder storm...","...and then we should be transported to another world!","","","","","")
	if charlinenr == 14:
		setPersonSpeaking("Jaime")
		maxlines = 1
		loadLines("","As if! I'm too old for this shit. I'm heading back to my tent. See you later.","","","","","","","")
	if charlinenr == 15:
		setPersonSpeaking("YOU")
		maxlines = 1
		loadLines("","Hah! Someone's really scared!","","","","","","","")
	if charlinenr == 16:
		setPersonSpeaking("Alex")
		maxlines = 1
		loadLines("","Come on Jaime please stay, at least 'till midnight!","","","","","","","")
	if charlinenr == 17:
		setPersonSpeaking("Alex")
		maxlines = 1
		loadLines("","Besides, the book says we need 6 people for the ritual, so theres no way we can let you go. Sorry not sorry!","","","","","","","")
	if charlinenr == 18:
		setPersonSpeaking("Jaime")
		maxlines = 1
		loadLines("","Whatever.","","","","","","","")
	if charlinenr == 19:
		$Timers/PressTimer.wait_time = 4
		setPersonSpeaking("Clock")
		ClockAnimOn = true
		maxlines = 1
		loadLines("","Ding Dong!","","","","","","","")
	if charlinenr == 20:
		$Timers/PressTimer.wait_time = .25
		setPersonSpeaking("Jaime")
		ClockAnimOn = true
		maxlines = 1
		loadLines("","See, nothing happened! Now can I leave this dump.","","","","","","","")
	if charlinenr == 21:
		$Timers/PressTimer.wait_time = 6
		setPersonSpeaking("Ritual Circle")
		maxlines = 1
		loadLines("","Wooosh!","","","","","","","")
		spawnDemon()
	if charlinenr == 22:
		$Timers/PressTimer.wait_time = .25
		setPersonSpeaking("???")
		maxlines = 7
		$UI/Textbox/Text.modulate = Color(1,0,0)
		loadLines("","Welcome to the Show!","Oh my, what an aspicous group of souls we have here!","I'm sure you know the rules already since you drew the circle yourself.","...but let me repeat them just to be safe.","All 6 of you will enter through this portal to my world where your souls will be laid bare for all to see.","...and only 4 of you will be allowed out, the other 2... ...I will keep.","Oh, and if you aren't out by daybreak I guess I can keep all of your puny souls. HAHAHAHAHA!","")
	if charlinenr == 23:
		setPersonSpeaking("Jaime")
		maxlines = 1
		$UI/Textbox/Text.modulate = Color(1,1,1)
		loadLines("","Wait what!? No wait! Please! We didn't know what we were doing!","","","","","","","")
	if charlinenr == 24:
		setPersonSpeaking("???")
		maxlines = 1
		$UI/Textbox/Text.modulate = Color(1,0,0)
		loadLines("","No way to undo whats done. Good luck darlings!","","","","","","","")
	if charlinenr == 24:
		$Timers/PressTimer.wait_time = 20
		setPersonSpeaking("???")
		maxlines = 1
		loadLines("","WHOOOOOOSHHHH","","","","","","","")
		fadeOut()

# Dialogue 1 funcs

func spawnDemon():
	var de = DEMON.instantiate()
	get_tree().current_scene.add_child(de)
	de.position = Vector2(163,114)


func TrappedInAnotherWorldSceneDialogue():
	linenr = 1
	if charlinenr == 1:
		setPersonSpeaking("?")
		maxlines = 1
		ShadowSprites = true
		loadLines("","Where are we! what do we do! Oh my god were all going to die!","","","","","","","",)
	if charlinenr == 2:
		setPersonSpeaking("?")
		maxlines = 2
		loadLines("","Calm down you wimp we'll find a way out of here!","Wa... who was that, wait what are you!","","","","","","",)
	if charlinenr == 3:
		setPersonSpeaking("?")
		maxlines = 1
		loadLines("","What do you mean what are you, its us you dumbass... wait what... why do you all look like that!","","","","","","","",)
	if charlinenr == 4:
		setPersonSpeaking("?")
		maxlines = 3
		loadLines("","Wait everyone shut up for a seccond!","This is gonna get confusing very quickly.","Lets first all say our names before we continue.","","","","","",)
	if charlinenr == 5:
		setPersonSpeaking("Alynne")
		maxlines = 1
		loadLines("","Alynne!","","","","","","","",)
	if charlinenr == 6:
		setPersonSpeaking("Micah")
		maxlines = 1
		loadLines("","Micah!","","","","","","","",)
	if charlinenr == 7:
		setPersonSpeaking("Alex")
		maxlines = 1
		loadLines("","Alex!","","","","","","","",)
	if charlinenr == 8:
		setPersonSpeaking("Jaime")
		maxlines = 1
		loadLines("","Jaime!","","","","","","","",)
	if charlinenr == 9:
		setPersonSpeaking("YOU")
		maxlines = 1
		loadLines("","Eddie!","","","","","","","",)
	if charlinenr == 10:
		setPersonSpeaking("Raisa")
		maxlines = 1
		loadLines("","Raisa!","","","","","","","",)
	if charlinenr == 11:
		setPersonSpeaking("Raisa")
		maxlines = 1
		loadLines("","Now thats all cleared up lets all stay calm and think about our situation!","","","","","","","",)
	if charlinenr == 12:
		setPersonSpeaking("Jaime")
		maxlines = 2
		loadLines("","What do you mean stay calm!","You heard that freak, only 4 of us can leave here!","","","","","","",)
	if charlinenr == 13:
		setPersonSpeaking("Alex")
		maxlines = 1
		loadLines("","Shut the fuck up and keep calm!...","","","","","","","",)
	if charlinenr == 14:
		setPersonSpeaking("Jaime")
		maxlines = 1
		loadLines("","Wow alright, sorry.","","","","","","","",)
	if charlinenr == 15:
		setPersonSpeaking("Alex")
		maxlines = 1
		loadLines("","I-I'm sorry...","","","","","","","",)
	if charlinenr == 16:
		setPersonSpeaking("Raisa")
		maxlines = 1
		loadLines("","No dont be, I'm happy you are finnaly speaking up.","","","","","","","",)
	if charlinenr == 17:
		setPersonSpeaking("Alex")
		maxlines = 3
		loadLines("","I - I swear I'm not like this...","It's this world, it has to be.","I dont know what it is but I cant seem to keep my big mouth shut","","","","","",)
	if charlinenr == 18:
		setPersonSpeaking("Jaime")
		maxlines = 3
		loadLines("","That bastard did say we would be stripped to our souls.","It seems hiding your true self is much harder here...","Which means your true self is as brass as a bell Alex! hahaha!","","","","","")
	if charlinenr == 19:
		setPersonSpeaking("Alex")
		maxlines = 1
		loadLines("","Want me to punch you in the nose pretty boy!","","","","","","","",)
	if charlinenr == 20:
		setPersonSpeaking("YOU")
		maxlines = 2
		loadLines("","Hahaha, I think I like you much better like this Alex!","You should have shown us this side of you way sooner!","","","","","","",)
	if charlinenr == 21:
		setPersonSpeaking("Alex")
		maxlines = 3
		loadLines("","Rea- Really...","No one ever wants to hang out with me when they get to know me","you guys sure you won't hate me?","","","","","",)
	if charlinenr == 22:
		setPersonSpeaking("Alynne")
		maxlines = 1
		loadLines("","Off course we're sure, we still tollerate Jaime so why not you","","","","","","","",)
	if charlinenr == 23:
		setPersonSpeaking("Jaime")
		maxlines = 1
		loadLines("","Hey what the hell!","","","","","","","",)
	if charlinenr == 24:
		setPersonSpeaking("Micah")
		maxlines = 3
		loadLines("","Enough off this!!!","Are you all forgetting what situation we are in!","We need to get out of here or we are in deep shit, sob stories can come later.","","","","","",)
	if charlinenr == 25:
			setPersonSpeaking("Raisa")
			maxlines = 2
			loadLines("","Micah is right, it seems that this world reflects our own, so I suggest we start looking around for a way out."," I just know there has to be another way out","","","","","","",)
	if charlinenr == 26:
		setPersonSpeaking("Raisa")
		maxlines = 4
		loadLines("","Let's split up.","I know its not the safest plan but it will allow us to cover the most ground the fastest","And we don't have much time left.","Also I call dips on the shed!","","","","",)
	if charlinenr == 27:
		setPersonSpeaking("Micah")
		maxlines = 1
		loadLines("","Fine, I'll investigate the tents then.","","","","","","","",)
	if charlinenr == 28:
		setPersonSpeaking("Alex")
		maxlines = 1
		loadLines("","I'll be looking round the campfire!","","","","","","","",)
	if charlinenr == 29:
		setPersonSpeaking("Jaime")
		maxlines = 1
		loadLines("","I'll investigate the toilet building I guess","","","","","","","",)
	if charlinenr == 30:
		setPersonSpeaking("Alynne")
		maxlines = 1
		loadLines("","I'll investigate the main building","","","","","","","",)
	if charlinenr == 31:
		setPersonSpeaking("YOU")
		maxlines = 1
		loadLines("","Which leaves me with the dining hall and Kitchen","","","","","","","",)
	if charlinenr == 32:
		setPersonSpeaking("Raisa")
		maxlines = 2
		loadLines("","Great! Let's go then!","And remember, if anything is wrong give a shout, the campgrounds aren't too big so we'll be there in a flash","","","","","","",)


func DiscusionInTheMainBuilding():
	linenr = 1
	if charlinenr == 1:
		setPersonSpeaking("?")
		maxlines = 1
		ShadowSprites = true
		loadLines("","Wait before you two go...","","","","","","","",)
		
	
func setDialougueOn():
	global_dialogue_on = true
	$UI/Textbox.visible = true

func setDialougueOff():
	if is_cutscene == false:
		$Timers/DisableDialogueTimer.start()
		$UI/Textbox.visible = false
	else:
		#charlinenr += 1
		if cscene == 1:
			linenr = 1
			pentagramSceneDialogue()
	
	linenr = 0
	$UI/Textbox/Text.visible_characters = 0
	$UI/Textbox/Text.modulate = Color(1,1,1)



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
	
	#if linenr > maxlines:
	#	if is_cutscene == false:
	#		setDialougueOff()
	#	else:
	#		if cscene == 1:
	#			charlinenr += 1
	#			linenr = 1
	#			pentagramSceneDialogue()
				

func fadeIn():
	$UI/Blackbox/AnimationPlayer.play("fadein")

func fadeOut():
	$UI/Blackbox/AnimationPlayer.play("fadeout")
	$Timers/Nextscene1Timer.start()

func _on_disable_dialogue_timer_timeout():
	global_dialogue_on = false

func _on_nextscene_1_timer_timeout():
	if cscene == 0:
		get_tree().change_scene_to_file("res://scenes/mainscene.tscn")
	if cscene == 1:
		get_tree().change_scene_to_file("res://scenes/dark_campsitescene.tscn")

func setPersonSpeaking(p_s):
	personspeaking = p_s
	$UI/Textbox/Name.set_text(str(personspeaking))
	if personspeaking == "Your cellphone":
		$UI/Textbox/CharPortraits.frame = 1
	elif personspeaking == "Sleeping Teacher":
		$UI/Textbox/CharPortraits.frame = 2
	elif personspeaking == "Letter":
		$UI/Textbox/CharPortraits.frame = 3
	elif personspeaking == "YOU":
		if ShadowSprites == false:
			$UI/Textbox/CharPortraits.frame = 4
		if ShadowSprites == true:
			$UI/Textbox/CharPortraits.frame = 11
	elif personspeaking == "Micah":
		if ShadowSprites == false:
			$UI/Textbox/CharPortraits.frame = 5
		if ShadowSprites == true:
			$UI/Textbox/CharPortraits.frame = 12
	elif personspeaking == "Alynne":
		if ShadowSprites == false:
			$UI/Textbox/CharPortraits.frame = 6
		if ShadowSprites == true:
			$UI/Textbox/CharPortraits.frame = 13
	elif personspeaking == "Alex":
		if ShadowSprites == false:
			$UI/Textbox/CharPortraits.frame = 7
		if ShadowSprites == true:
			$UI/Textbox/CharPortraits.frame = 14
	elif personspeaking == "Jaime":
		if ShadowSprites == false:
			$UI/Textbox/CharPortraits.frame = 8
		if ShadowSprites == true:
			$UI/Textbox/CharPortraits.frame = 15
	elif personspeaking == "Raisa":
		if ShadowSprites == false:
			$UI/Textbox/CharPortraits.frame = 9
		if ShadowSprites == true:
			$UI/Textbox/CharPortraits.frame = 16
	elif personspeaking == "?":
		$UI/Textbox/CharPortraits.frame = 10
	
	
	else:
		$UI/Textbox/CharPortraits.frame = 0

func _on_press_timer_timeout():
	canpress = true

