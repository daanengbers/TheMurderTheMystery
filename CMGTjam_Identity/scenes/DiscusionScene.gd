extends Node2D

@onready var TextLabel = $Label
@onready var pointer = $Node2D/Pointer

@onready var TextBoxLabel = $Textbox/Text

var Conversation1 = ["'The knife has to be the one from the kitchen!'", "'Eddie was checking the kitchen! He had acces to the knife'", "'So if the knife was used to kill Raisa...'", "'The murderer is Eddie!!!'!"]
var tweenWaitTime = 1

@export var evidencePossitions = []
var currentPosition = 0
var currentText = 0
var canChangePos = true

var hasArgued = false

var waitTimeBetween = 3

var canProgress = false
var canProgress1 = false
var progressAmount = 0

var endOfConvo = false
var argumentChecked = false
var responseGiven = false

var rightArgument = false

func _ready():
	FirstConvo()
	pointer.position = evidencePossitions[0]
	pass # Replace with function body.

func _process(delta):
	if currentPosition < 1 and Input.is_action_pressed("down") and canChangePos == true:
		currentPosition +=1
		pointer.position = evidencePossitions[currentPosition]
	if currentPosition > 0 and Input.is_action_pressed("up") and canChangePos == true:
		currentPosition -=1
		pointer.position = evidencePossitions[currentPosition]
	if canProgress == false and canProgress1 == false and Input.is_action_just_pressed("interact"):
		if progressAmount == 0:
			canProgress1 = true
			canChangePos = false
			FirstArgument()
	if canProgress == true and Input.is_action_just_pressed("interact"):
		if progressAmount == 1:
			FirstResponse()
	if endOfConvo == true and Input.is_action_just_pressed("interact"):
		endOfConvo = false
		ResetConvo()
	if argumentChecked == true and Input.is_action_just_pressed("interact"):
		argumentChecked = false
		ResetConvo()
	if responseGiven == true and Input.is_action_just_pressed("interact"):
		responseGiven = false
		CheckIfRight()
	pass

func FirstConvo():
	if hasArgued == false:
		TextLabel.text = Conversation1[0]
		TextLabel.visible_characters = 0
		var tween0 = create_tween()
		tween0.tween_property(TextLabel, "visible_characters" , TextLabel.get_total_character_count(), tweenWaitTime)
		currentText = 0
		await get_tree().create_timer(waitTimeBetween).timeout
	
	if hasArgued == false:
		TextLabel.text = Conversation1[1]
		TextLabel.visible_characters = 0
		var tween1 = create_tween()
		tween1.tween_property(TextLabel, "visible_characters" , TextLabel.get_total_character_count(), tweenWaitTime)
		currentText = 1
		await get_tree().create_timer(waitTimeBetween).timeout
		
	if hasArgued == false:
		TextLabel.text = Conversation1[2]
		TextLabel.visible_characters = 0
		var tween2 = create_tween()
		tween2.tween_property(TextLabel, "visible_characters" , TextLabel.get_total_character_count(), tweenWaitTime)
		currentText = 2
		await get_tree().create_timer(waitTimeBetween).timeout
	
	if hasArgued == false:
		TextLabel.text = Conversation1[3]
		TextLabel.visible_characters = 0
		var tween3 = create_tween()
		tween3.tween_property(TextLabel, "visible_characters" , TextLabel.get_total_character_count(), tweenWaitTime)
		currentText = 3
		await get_tree().create_timer(waitTimeBetween).timeout
		
		resetAfterConvoOver()

func FirstArgument():
	hasArgued = true
	TextLabel.visible = false
	$Textbox.visible = true
	match currentText:
		0:
			match currentPosition:
				0:
					TextBoxLabel.text = "It can't be the knife from the kitchen!"
					TextBoxLabel.visible_characters = 0
					var tween0 = create_tween()
					tween0.tween_property(TextBoxLabel, "visible_characters" , TextBoxLabel.get_total_character_count(), tweenWaitTime)
					currentText = 0
					await get_tree().create_timer(1).timeout
					progressAmount +=1
					canProgress = true
				1:
					TextBoxLabel.text = "What about the wound on her head?"
					TextBoxLabel.visible_characters = 0
					var tween0 = create_tween()
					tween0.tween_property(TextBoxLabel, "visible_characters" , TextBoxLabel.get_total_character_count(), tweenWaitTime)
					currentText = 0
					await get_tree().create_timer(1).timeout
					progressAmount +=1
					canProgress = true
		1:
			match currentPosition:
				0:
					TextBoxLabel.text = "I coulnd't be the one to use the knife!"
					TextBoxLabel.visible_characters = 0
					var tween0 = create_tween()
					tween0.tween_property(TextBoxLabel, "visible_characters" , TextBoxLabel.get_total_character_count(), tweenWaitTime)
					currentText = 0
					await get_tree().create_timer(1).timeout
					progressAmount +=1
					canProgress = true
				1:
					TextBoxLabel.text = "What about the wound on her head?"
					TextBoxLabel.visible_characters = 0
					var tween0 = create_tween()
					tween0.tween_property(TextBoxLabel, "visible_characters" , TextBoxLabel.get_total_character_count(), tweenWaitTime)
					currentText = 0
					await get_tree().create_timer(1).timeout
					progressAmount +=1
					canProgress = true
		2:
			match currentPosition:
				0:
					TextBoxLabel.text = "The knife was used to kill Raisa!"
					TextBoxLabel.visible_characters = 0
					var tween0 = create_tween()
					tween0.tween_property(TextBoxLabel, "visible_characters" , TextBoxLabel.get_total_character_count(), tweenWaitTime)
					currentText = 0
					await get_tree().create_timer(1).timeout
					progressAmount +=1
					canProgress = true
				1:
					TextBoxLabel.text = "The knife wasn't used to kill Raisa! And I can prove it!"
					TextBoxLabel.visible_characters = 0
					var tween0 = create_tween()
					tween0.tween_property(TextBoxLabel, "visible_characters" , TextBoxLabel.get_total_character_count(), tweenWaitTime)
					currentText = 0
					await get_tree().create_timer(1).timeout
					progressAmount +=1
					rightArgument = true
					canProgress = true
		3:
			match currentPosition:
				0:
					TextBoxLabel.text = "I didn't stab her!"
					TextBoxLabel.visible_characters = 0
					var tween0 = create_tween()
					tween0.tween_property(TextBoxLabel, "visible_characters" , TextBoxLabel.get_total_character_count(), tweenWaitTime)
					currentText = 0
					await get_tree().create_timer(1).timeout
					progressAmount +=1
					canProgress = true
				1:
					TextBoxLabel.text = "What about the wound on her head?"
					TextBoxLabel.visible_characters = 0
					var tween0 = create_tween()
					tween0.tween_property(TextBoxLabel, "visible_characters" , TextBoxLabel.get_total_character_count(), tweenWaitTime)
					currentText = 0
					await get_tree().create_timer(1).timeout
					progressAmount +=1
					canProgress = true

func FirstResponse():
	canProgress = false
	canProgress1 = true
	canChangePos = false
	hasArgued = true
	TextLabel.visible = false
	$Textbox.visible = true
	match currentText:
		0:
			match currentPosition:
				0:
					TextBoxLabel.text = "Why not! It's clearly the missing knife!"
					TextBoxLabel.visible_characters = 0
					var tween0 = create_tween()
					tween0.tween_property(TextBoxLabel, "visible_characters" , TextBoxLabel.get_total_character_count(), tweenWaitTime)
					currentText = 0
					await get_tree().create_timer(1).timeout
				1:
					TextBoxLabel.text = "That doesn't change a thing about where the knife is from!"
					TextBoxLabel.visible_characters = 0
					var tween0 = create_tween()
					tween0.tween_property(TextBoxLabel, "visible_characters" , TextBoxLabel.get_total_character_count(), tweenWaitTime)
					currentText = 0
					await get_tree().create_timer(1).timeout
		1:
			match currentPosition:
				0:
					TextBoxLabel.text = "Why not? You were the only one with acces to the knife!"
					TextBoxLabel.visible_characters = 0
					var tween0 = create_tween()
					tween0.tween_property(TextBoxLabel, "visible_characters" , TextBoxLabel.get_total_character_count(), tweenWaitTime)
					currentText = 0
					await get_tree().create_timer(1).timeout
				1:
					TextBoxLabel.text = "What about it? She was stabbed to death!"
					TextBoxLabel.visible_characters = 0
					var tween0 = create_tween()
					tween0.tween_property(TextBoxLabel, "visible_characters" , TextBoxLabel.get_total_character_count(), tweenWaitTime)
					currentText = 0
					await get_tree().create_timer(1).timeout
		2:
			match currentPosition:
				0:
					TextBoxLabel.text = "Thats what we are saying! And you were in the kitchen!"
					TextBoxLabel.visible_characters = 0
					var tween0 = create_tween()
					tween0.tween_property(TextBoxLabel, "visible_characters" , TextBoxLabel.get_total_character_count(), tweenWaitTime)
					currentText = 0
					await get_tree().create_timer(1).timeout
				1:
					TextBoxLabel.text = "How!"
					TextBoxLabel.visible_characters = 0
					var tween0 = create_tween()
					tween0.tween_property(TextBoxLabel, "visible_characters" , TextBoxLabel.get_total_character_count(), tweenWaitTime)
					currentText = 0
					await get_tree().create_timer(1).timeout
		3:
			match currentPosition:
				0:
					TextBoxLabel.text = "Off course you would say that!"
					TextBoxLabel.visible_characters = 0
					var tween0 = create_tween()
					tween0.tween_property(TextBoxLabel, "visible_characters" , TextBoxLabel.get_total_character_count(), tweenWaitTime)
					currentText = 0
					await get_tree().create_timer(1).timeout
				1:
					TextBoxLabel.text = "What about it? She was stabbed to death!"
					TextBoxLabel.visible_characters = 0
					var tween0 = create_tween()
					tween0.tween_property(TextBoxLabel, "visible_characters" , TextBoxLabel.get_total_character_count(), tweenWaitTime)
					currentText = 0
					await get_tree().create_timer(1).timeout
	responseGiven = true

func CheckIfRight():
	$Textbox.visible = true
	TextLabel.visible = false
	canProgress = false
	canProgress1 = true
	canChangePos = false
	
	if rightArgument == true:
		TextBoxLabel.text = "Yippie!"
		TextBoxLabel.visible_characters = 0
		var tween0 = create_tween()
		tween0.tween_property(TextBoxLabel, "visible_characters" , TextBoxLabel.get_total_character_count(), tweenWaitTime)
		currentText = 0
		await get_tree().create_timer(3).timeout
	if rightArgument == false:
		TextBoxLabel.text = "Shit! I've got to make sense of this or I'm fucked!"
		TextBoxLabel.visible_characters = 0
		var tween0 = create_tween()
		tween0.tween_property(TextBoxLabel, "visible_characters" , TextBoxLabel.get_total_character_count(), tweenWaitTime)
		currentText = 0
		await get_tree().create_timer(3).timeout
		argumentChecked = true
		pass

func resetAfterConvoOver():
	$Textbox.visible = true
	TextLabel.visible = false
	canProgress = false
	canProgress1 = true
	canChangePos = false
	TextBoxLabel.text = "I really need to think something or I'm fucked!"
	TextBoxLabel.visible_characters = 0
	var tween0 = create_tween()
	tween0.tween_property(TextBoxLabel, "visible_characters" , TextBoxLabel.get_total_character_count(), tweenWaitTime)
	await get_tree().create_timer(3).timeout
	endOfConvo = true
	
func ResetConvo():
	$Textbox.visible = false
	TextLabel.visible = true
	currentPosition = 0
	currentText = 0
	canProgress = false
	canProgress1 = false
	canChangePos = true
	progressAmount = 0
	hasArgued = false
	FirstConvo()
