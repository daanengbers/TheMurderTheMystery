extends Node

##SceneObjects##
@onready var LineText = $LineLabel
###########################


##Editor Options##
@export var FirstDailogueArray = ["",""]
@export var SeccondDailogueArray = ["",""]
@export var ThirdDailogueArray = ["",""]
@export var FourthDailogueArray = ["",""]

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
###########################


func _ready():
	resetValues()
	CheckDailogueAmount()
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
