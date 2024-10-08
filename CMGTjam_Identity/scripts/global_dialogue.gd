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
	if is_cutscene == false:
		linenr = 0
	if cscene == 1:
		setDialougueOn()
		pentagramSceneDialogue()
		nextLine()
	if cscene == 2:
		setDialougueOn()
		charlinenr = 1
		TrappedInAnotherWorldSceneDialogue()
		nextLine()
	if cscene == 3:
		setDialougueOn()
		charlinenr = 1
		DiscusionInTheMainBuilding()
		nextLine()
	if cscene == 4:
		setDialougueOn()
		charlinenr = 1
		AfterMurderInTheMainBuilding()
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
			if cscene == 3:
				charlinenr += 1
				linenr = 1
				DiscusionInTheMainBuilding()
				nextLine()
			if cscene == 4:
				charlinenr += 1
				linenr = 1
				AfterMurderInTheMainBuilding()
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
		$Sounds/Clock.play()
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
		$Sounds/Largewoosh.play()
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
	if charlinenr == 25:
		$Timers/PressTimer.wait_time = 3
		setPersonSpeaking("???")
		maxlines = 1
		$UI/Textbox/Text.modulate = Color(1,1,1)
		loadLines("","WHOOOOOOSHHHH","","","","","","","")
		fadeOut()

# Dialogue 1 funcs

func spawnDemon():
	var de = DEMON.instantiate()
	get_tree().current_scene.add_child(de)
	de.position = Vector2(163,114)


func spawnDemon1():
	var de = DEMON.instantiate()
	get_tree().current_scene.add_child(de)
	de.position = Vector2(150,-50)



func TrappedInAnotherWorldSceneDialogue():
	linenr = 1
	if charlinenr == 1:
		setPersonSpeaking("?")
		maxlines = 1
		ShadowSprites = true
		loadLines("","Where are we!? what do we do!? Oh my god we're all going to die!","","","","","","","",)
	if charlinenr == 2:
		$Timers/PressTimer.wait_time = .25
		setPersonSpeaking("?")
		maxlines = 2
		loadLines("","Calm down you wimp! We'll find a way out of here!","Wa...- Who was that? Wait, what are you?!","","","","","","",)
	if charlinenr == 3:
		setPersonSpeaking("?")
		maxlines = 1
		loadLines("","What do you mean what are you? It's us you dumbass... wait- what?... why do you all look like that?!","","","","","","","",)
	if charlinenr == 4:
		setPersonSpeaking("?")
		maxlines = 3
		loadLines("","Wait everyone, shut up for a second!","This is gonna get confusing very quickly.","Lets first all say our names before we continue.","","","","","",)
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
		loadLines("","Now that that's all cleared up, lets all stay calm and think about our situation.","","","","","","","",)
	if charlinenr == 12:
		setPersonSpeaking("Jaime")
		maxlines = 2
		loadLines("","What do you mean stay calm?!","You heard that freak, only 4 of us can leave here!","","","","","","",)
	if charlinenr == 13:
		$Timers/PressTimer.wait_time = 2
		$UI/Textbox/Text.modulate = Color(1,0,0)
		setPersonSpeaking("Alex")
		maxlines = 1
		loadLines("","SHUT THE FUCK UP AND KEEP CALM!!...","","","","","","","",)
	if charlinenr == 14:
		$Timers/PressTimer.wait_time = .25
		$UI/Textbox/Text.modulate = Color(1,1,1)
		setPersonSpeaking("Jaime")
		maxlines = 1
		loadLines("","Wow. Alright. Sorry...","","","","","","","",)
	if charlinenr == 15:
		setPersonSpeaking("Alex")
		maxlines = 1
		loadLines("","I-I'm sorry...","","","","","","","",)
	if charlinenr == 16:
		setPersonSpeaking("Raisa")
		maxlines = 1
		loadLines("","No, dont be, I'm happy you are finnaly speaking up.","","","","","","","",)
	if charlinenr == 17:
		setPersonSpeaking("Alex")
		maxlines = 3
		loadLines("","I - I swear I'm not like this...","It's this world, it has to be.","I dont know what it is but I cant seem to keep my big mouth shut...","","","","","",)
	if charlinenr == 18:
		setPersonSpeaking("Jaime")
		maxlines = 3
		loadLines("","That bastard did say we would be stripped to our souls.","It seems hiding your true self is much harder here...","Which means your true self is as brass as a bell Alex! hahaha!","","","","","")
	if charlinenr == 19:
		setPersonSpeaking("Alex")
		maxlines = 1
		loadLines("","Want me to punch you in the nose funny boy?","","","","","","","",)
	if charlinenr == 20:
		setPersonSpeaking("YOU")
		maxlines = 2
		loadLines("","Haha! I think I like you much better like this Alex!","You should have shown us this side of you way sooner!","","","","","","",)
	if charlinenr == 21:
		setPersonSpeaking("Alex")
		maxlines = 3
		loadLines("","Rea- Really...","No one ever wants to hang out with me when they get to know me","you guys sure you won't hate me?","","","","","",)
	if charlinenr == 22:
		setPersonSpeaking("Alynne")
		maxlines = 1
		loadLines("","Off course we're sure, we still tolerate Jaime, so why not you","","","","","","","",)
	if charlinenr == 23:
		setPersonSpeaking("Jaime")
		maxlines = 1
		loadLines("","Hey! What the hell?!","","","","","","","",)
	if charlinenr == 24:
		setPersonSpeaking("Micah")
		maxlines = 3
		loadLines("","Enough off this!!!","Are you all forgetting what situation we are in!","We need to get out of here or we are in deep shit, sob stories can come later.","","","","","",)
	if charlinenr == 25:
		setPersonSpeaking("Raisa")
		maxlines = 3
		loadLines("","Micah is right.","it seems that this world reflects our own, so I suggest we start looking around for a way out.","I just know there has to be another way out.","","","","","",)
	if charlinenr == 26:
		setPersonSpeaking("Raisa")
		maxlines = 4
		loadLines("","Let's split up.","I know its not the safest plan, but it will allow us to cover the most ground the fastest.","And we don't have much time left.","Also, I call dips on the shed!","","","","",)
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
		loadLines("","I'll investigate the toilet building... I guess.","","","","","","","",)
	if charlinenr == 30:
		setPersonSpeaking("Alynne")
		maxlines = 1
		loadLines("","I'll investigate the main building.","","","","","","","",)
	if charlinenr == 31:
		setPersonSpeaking("YOU")
		maxlines = 1
		loadLines("","Which leaves me with the dining hall and the Kitchen.","","","","","","","",)
	if charlinenr == 32:
		setPersonSpeaking("Raisa")
		maxlines = 2
		loadLines("","Great! Let's go then!","And remember, if anything is wrong give a shout, the campgrounds aren't too big so we'll be there in a flash.","","","","","","",)
	if charlinenr == 33:
		setPersonSpeaking("")
		maxlines = 1
		loadLines("","","","","","","","","",)
		fadeOut()
		setDialougueOff()

func DiscusionInTheMainBuilding():
	linenr = 1
	if charlinenr == 1:
		ShadowSprites = true
		setPersonSpeaking("Raisa")
		maxlines = 1
		loadLines("","Wait before you two go...","","","","","","","",)
	if charlinenr == 2:
		setPersonSpeaking("YOU")
		maxlines = 1
		loadLines("","What is it Raisa?","","","","","","","",)
	if charlinenr == 3:
		setPersonSpeaking("Raisa")
		maxlines = 3
		loadLines("","Ehmm... Would either of you mind swapping with me?","I... I sorta forgot there are gonna be a lot of spiders in the shed....","And... I'm kinda afraid of them..","","","","","",)
	if charlinenr == 4:
		setPersonSpeaking("Alynne")
		maxlines = 3
		loadLines("","Hahahah, little old Raisa is afraid of some small spiders","Sure love I'll swap with you.","Even though I'm not such a fan of spiders too.","","","","","",)
	if charlinenr == 5:
		setPersonSpeaking("Raisa")
		maxlines = 1
		loadLines("","Thank you Alynne! I promise I'll make it up to you","","","","","","","",)
	if charlinenr == 6:
		setPersonSpeaking("Alynne")
		maxlines = 1
		loadLines("","I can't wait","","","","","","","",)
	if charlinenr == 7:
		setPersonSpeaking("YOU")
		maxlines = 1
		loadLines("","Well then, let's meet back here in a few. Stay safe!","","","","","","","",)
	if charlinenr == 8:
		setPersonSpeaking("Alynne")
		maxlines = 1
		loadLines("","Stay safe!","","","","","","","",)
	if charlinenr == 9:
		setPersonSpeaking("Raisa")
		maxlines = 1
		loadLines("","Stay safe!","","","","","","","",)
	if charlinenr == 10:
		var soulGuys = get_tree().get_nodes_in_group("SoulGuys")
		soulGuys[0].queue_free()
		soulGuys[1].queue_free()
		is_cutscene = false
		setDialougueOff()

func AfterMurderInTheMainBuilding():
	linenr = 1
	if charlinenr == 1:
		ShadowSprites = true
		setPersonSpeaking("Jaime")
		maxlines = 1
		loadLines("","Oh my god what happened!!! Is... is that Alynne!","","","","","","","",)
	if charlinenr == 2:
		setPersonSpeaking("Alynne")
		maxlines = 3
		loadLines("","N-no... *sob* i-its Raisa *sob*","w-we swapped, I went to look in the shed and when *sob* a-an when *sob* ","And when I came back I found her like this","","","","","",)
	if charlinenr == 3:
		$Timers/PressTimer.wait_time = 6
		setPersonSpeaking("???")
		spawnDemon1()
		$UI/Textbox/Text.modulate = Color(1,0,0)
		maxlines = 1
		loadLines("","Look at that, the first soul for me to keep!","","","","","","","",)
	if charlinenr == 4:
		$Timers/PressTimer.wait_time = .25
		setPersonSpeaking("???")
		spawnDemon1()
		$UI/Textbox/Text.modulate = Color(1,0,0)
		maxlines = 2
		loadLines("","Now you guys just need to find the murderer and the remaining souls can leave scot free.","Unless you convict the wrong one, hahahaha!","","","","","","",)
	if charlinenr == 5:
		$Timers/PressTimer.wait_time = .25
		setPersonSpeaking("Alex")
		$UI/Textbox/Text.modulate = Color(1,1,1)
		maxlines = 1
		loadLines("","You monster! I'll fucking kill you!!!","","","","","","","",)
	if charlinenr == 6:
		setPersonSpeaking("???")
		$UI/Textbox/Text.modulate = Color(1,0,0)
		maxlines = 3
		loadLines("","So hurtfull, seems to me your energie is better spend investigating.","Not that it matters to me, I will enjoy this however it might go.","Just remember, your time is running out. Hahahaha.","","","","","",)
	if charlinenr == 7:
		setPersonSpeaking("Micah")
		var demon = get_tree().get_nodes_in_group("Demon")
		demon[0].queue_free()
		$UI/Textbox/Text.modulate = Color(1,1,1)
		maxlines = 1
		loadLines("","He is right, no matter how terrible this is, we need to figure out who did this and quick.","","","","","","","",)
	if charlinenr == 8:
		setPersonSpeaking("Jaime")
		maxlines = 1
		loadLines("","What happened to finding another way out?!","","","","","","","",)
	if charlinenr == 9:
		setPersonSpeaking("Micah")
		maxlines = 3
		loadLines("","I didn't find another way out, did you?","And besides, do you wanna return with Raisas murderer still among?","...","","","","","",)
	if charlinenr == 10:
		$Timers/PressTimer.wait_time = 1
		setPersonSpeaking("Micah")
		$UI/Textbox/Text.modulate = Color(1,0,0)
		maxlines = 1
		loadLines("","I for one will not rest before the monster who did this rots.","","","","","","","",)
	if charlinenr == 11:
		$Timers/PressTimer.wait_time = .25
		$UI/Textbox/Text.modulate = Color(1,1,1)
		setPersonSpeaking("Jaime")
		maxlines = 1
		loadLines("","I guess...","","","","","","","",)
	if charlinenr == 12:
		setPersonSpeaking("Micah")
		maxlines = 5
		loadLines("","Well then I suggest we get right on it, starting with this","As we can see Raisa was killed with a knife from the kitchen","...","Eddie, you were the one to investigate the kitchen right!","","","","",)
	if charlinenr == 13:
		setPersonSpeaking("YOU")
		maxlines = 1
		loadLines("","Wait you are accusing me!","","","","","","","",)
	if charlinenr == 14:
		setPersonSpeaking("Micah")
		$UI/Textbox/Text.modulate = Color(1,0,0)
		maxlines = 2
		loadLines("","Well it seems obvious right.","You were the one investigating the kitchen, a kitchen knife was used as the murder weapon!","","","","","","",)
	if charlinenr == 15:
		setPersonSpeaking("YOU")
		$UI/Textbox/Text.modulate = Color(1,1,1)
		maxlines = 2
		loadLines("","I swear I didn't do it!","The kitchen knife was already missing when I got there, someone must have gotten it through the backdoor!","","","","","","",)
	if charlinenr == 16:
		setPersonSpeaking("Jaime")
		maxlines = 1
		loadLines("","Seems rather convenient to me...","","","","","","","",)
	if charlinenr == 17:
		setPersonSpeaking("YOU")
		maxlines = 2
		loadLines("","I swear I didn't do it, and I can prove it too!","(come on think Eddie, what can prove my innocence) ","","","","","","",)
	if charlinenr == 18:
		fadeOut()
		setDialougueOff()
		
		
func setDialougueOn():
	global_dialogue_on = true
	$UI/Textbox.visible = true

func setDialougueOff():
	#if is_cutscene == false:
	$Timers/DisableDialogueTimer.start()
	$UI/Textbox.visible = false
	#else:
		#charlinenr += 1
	#	if cscene == 1:
	#		linenr = 1
	#		pentagramSceneDialogue()
	
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
	$Sounds/Next.play()
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
	#initialize()
	if cscene == 4:
		get_tree().change_scene_to_file("res://scenes/to_be_continued.tscn")
		is_cutscene = false
		setDialougueOff()
		fadeIn()
	if cscene == 2:
		get_tree().change_scene_to_file("res://scenes/dark_campsitescene.tscn")
		is_cutscene = false
		setDialougueOff()
	if cscene == 1:
		get_tree().change_scene_to_file("res://scenes/mainsceneDark.tscn")
	if cscene == 0:
		get_tree().change_scene_to_file("res://scenes/mainscene.tscn")
	$Timers/Nextscene1Timer.stop()

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
	elif personspeaking == "???":
		$UI/Textbox/CharPortraits.frame = 17
	elif personspeaking == "Ritual Circle":
		$UI/Textbox/CharPortraits.frame = 18
	elif personspeaking == "Clock":
		$UI/Textbox/CharPortraits.frame = 19
	
	else:
		$UI/Textbox/CharPortraits.frame = 0

func _on_press_timer_timeout():
	canpress = true

