extends Node2D

@export var sprites = []
var currentSprite = 0
@onready var Sprite = $BackgroundSprite

var canClick = true
var canProgress = false

@onready var label = $Textbox/Text
@export var tweenWaitTime = 1
var textToShow = 0

var journalFileAleadyCollected = [false,false]

func _ready():
	currentSprite = 0
	#if sprites != null:
		#$BackgroundSprite.texture = sprites[currentSprite]

func _process(delta):
	if canClick == false and canProgress == true and Input.is_action_just_pressed("interact") and textToShow != "Head":
		afterText()
	if canClick == false and canProgress == true and Input.is_action_just_pressed("interact") and textToShow == "Head":
		textToShow = "Head2"
		DisplayText()
	if canClick == false and canProgress == true and Input.is_action_just_pressed("interact") and textToShow == "Head3":
		afterTextChangeScene()

###Make the textbox visible and show the correct text by matching the number the button signals
func DisplayText():
	canClick = false
	$Textbox.visible = true
	match textToShow:
		"Knife":
			label.text = "Mate thats a proper knife innit?"
			label.visible_characters = 0
			
			var tween = create_tween()
			tween.tween_property(label, "visible_characters" , label.get_total_character_count(), tweenWaitTime)
			
			if journalFileAleadyCollected[0] == false:
				ShowJournalAdded()
				GlobalEvidence.addKnifeEvidence()
				journalFileAleadyCollected[0] = true
				
			await get_tree().create_timer(tweenWaitTime).timeout
			canProgress = true
		"Head":
			label.text = "Whats this? There's a lot of blood pooling around her head. I need to check..."
			label.visible_characters = 0
			
			var tween = create_tween()
			tween.tween_property(label, "visible_characters" , label.get_total_character_count(), tweenWaitTime)
				
			await get_tree().create_timer(tweenWaitTime).timeout
			canProgress = true
		"Head2":
			label.text = "Sorry, I really dont want to do this but I will have Move You..."
			label.visible_characters = 0
			
			var tween = create_tween()
			tween.tween_property(label, "visible_characters" , label.get_total_character_count(), tweenWaitTime)
				
			await get_tree().create_timer(tweenWaitTime).timeout
			textToShow = "Head3"
			canProgress = true

###Set the visible chars back to 0 and make the textbox invisible
func afterText():
	label.visible_characters = 0
	$Textbox.visible = false
	await get_tree().create_timer(1.0).timeout
	canClick = true

func afterTextChangeScene():
	var checked = false
	if $BackgroundSprite.visible == true && checked == false:
		$BackgroundSprite.visible = false
		$BackgroundSprite2.visible = true
		checked = true
	if $BackgroundSprite.visible == false && checked == false:
		$BackgroundSprite.visible = true
		$BackgroundSprite2.visible = false
		checked = true
	checked = false
	label.visible_characters = 0
	$Textbox.visible = false
	await get_tree().create_timer(1.0).timeout
	canClick = true

###Show the text in the top to notify players of a new journal file and then have it dissapear
func ShowJournalAdded():
	$JournallAdded.visible = true
	await get_tree().create_timer(3.0).timeout
	$JournallAdded.visible = false

func _on_button_pressed():
	if canClick == true:
		textToShow = "Head"
		DisplayText()

func _on_button_2_pressed():
	if canClick == true:
		textToShow = "Knife"
		DisplayText()

