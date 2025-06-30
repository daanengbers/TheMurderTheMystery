extends Node

##SceneObjects##
@onready var LineText = $LineLabel

@onready var option1 = $Option1
@onready var option2 = $Option2
@onready var option3 = $Option3
@onready var option4 = $Option4
@onready var option5 = $Option5

@onready var Pointer = $Hammer
###########################


##Editor Options##
@export var FirstDailogueArray = ["",""]
@export var SeccondDailogueArray = ["",""]
@export var ThirdDailogueArray = ["",""]
@export var FourthDailogueArray = ["",""]

@export var optionAmount = 0
@export var options = ["",""]

@export var CorrectEvidence = [0,0,0,0]

@export var CorrectLine = [0,0,0,0]
###########################


##Internals##
#Includes all dailogues setup in the editor
var dailogueArray = []

#Amount of lines and current line
var currentLine = 1
var linesInDailogue

#After ready this int defines the amount of dailogues in a scene
var totalDailogueAmount = 0

#Checks if we are currently in dialogue, as long as this is true we cant progress to next argument
var goingThroughDailogue = false

#The dailogue we are currently going through, changes every scene
var currentDailogueArray

#The number of the dailogue we are currently in
var currentDailogueNumber = 1

#Vars for use in the evidence select system
var currentEvidenceSelected = 1

var optionLocs = [Vector2(0,83)]
###########################


func _ready():
	resetValues()
	CheckDailogueAmount()
	setupOptions()
	goThroughDailogue()

func _process(delta):
	pass

func CheckDailogueAmount():
	##Checks if the dailogues are initialized and adds them to the dailogu array so they can be played before counting
	if FirstDailogueArray != ["",""]:
		dailogueArray.append(FirstDailogueArray)
	if SeccondDailogueArray != ["",""]:
		dailogueArray.append(SeccondDailogueArray)
	if ThirdDailogueArray != ["",""]:
		dailogueArray.append(ThirdDailogueArray)
	if FourthDailogueArray != ["",""]:
		dailogueArray.append(FourthDailogueArray)
	totalDailogueAmount = dailogueArray.size()

func resetValues():
	dailogueArray = []

func goThroughDailogue():
	##Var setup
	var tweenWaitTime = 1
	var waitTimeBetweenLines = 4
	
	##Setup for first and next iteration
	if goingThroughDailogue == false:
		currentLine = 0
		if currentDailogueNumber < totalDailogueAmount:
			currentDailogueArray = dailogueArray[currentDailogueNumber - 1]
		else:
			print_debug("end of dailogue")
		linesInDailogue = currentDailogueArray.size()
		goingThroughDailogue = true
	
	##Actual dailogue
	if currentLine < linesInDailogue:
		LineText.text = currentDailogueArray[currentLine]
		print_debug(currentLine)
		LineText.visible_characters = 0
		var tween = create_tween()
		tween.tween_property(LineText, "visible_characters" , LineText.get_total_character_count(), tweenWaitTime)
		await get_tree().create_timer(waitTimeBetweenLines).timeout
		currentLine +=1
		goThroughDailogue()
	else:
		##show oof message
		pass

func checkCorrectOptions():
	var EvidenceCorrect = false
	var LineCorrect = false
	
	if currentEvidenceSelected == CorrectEvidence[currentDailogueNumber - 1]:
		EvidenceCorrect == true
	if currentLine == CorrectLine[currentDailogueNumber - 1]:
		EvidenceCorrect == true
	
	if EvidenceCorrect && LineCorrect:
		pass
	else:
		pass
	pass

func setupOptions():
	match optionAmount:
		0:
			pass
		1:
			option1.visible = true
			optionLocs = [Vector2(0,83)]
			option1.position = optionLocs[0]
			option1.text = options[0]
			Pointer.position = optionLocs[0] + Vector2(55,7)
		2:
			option1.visible = true
			option2.visible = true
			optionLocs = [Vector2(0,67), Vector2(0,99)]
			option1.position = optionLocs[0]
			option2.position = optionLocs[1]
			option1.text = options[0]
			option2.text = options[1]
			Pointer.position = optionLocs[0] + Vector2(55,7)
		3:
			option1.visible = true
			option2.visible = true
			option3.visible = true
			optionLocs = [Vector2(0,59), Vector2(0,83), Vector2(0,107)]
			option1.position = optionLocs[0]
			option2.position = optionLocs[1]
			option3.position = optionLocs[2]
			option1.text = options[0]
			option2.text = options[1]
			option3.text = options[2]
			Pointer.position = optionLocs[0] + Vector2(55,7)
		4:
			option1.visible = true
			option2.visible = true
			option3.visible = true
			option4.visible = true
			optionLocs = [Vector2(0,35), Vector2(0,67), Vector2(0,99), Vector2(0,131)]
			option1.position = optionLocs[0]
			option2.position = optionLocs[1]
			option3.position = optionLocs[2]
			option4.position = optionLocs[3]
			option1.text = options[0]
			option2.text = options[1]
			option3.text = options[2]
			option4.text = options[3]
			Pointer.position = optionLocs[0] + Vector2(55,7)
		5:
			option1.visible = true
			option2.visible = true
			option3.visible = true
			option4.visible = true
			option5.visible = true
			optionLocs = [Vector2(0,35), Vector2(0,59), Vector2(0,83), Vector2(0,107), Vector2(0,131)]
			option1.position = optionLocs[0]
			option2.position = optionLocs[1]
			option3.position = optionLocs[2]
			option4.position = optionLocs[3]
			option5.position = optionLocs[4]
			option1.text = options[0]
			option2.text = options[1]
			option3.text = options[2]
			option4.text = options[3]
			option5.text = options[4]
			Pointer.position = optionLocs[0] + Vector2(55,7)
