extends Node2D

@onready var firstTitle = $FirstEvidence/FirstTitle

@onready var firstDiscription = $FirstEvidence/FirstDescription

@onready var UITitles = [firstTitle]
@onready var UIDescriptions = [firstDiscription]

var collectedJournalFiles = []

func _ready():
	collectedJournalFiles = GlobalEvidence.evidenceFilesCollected
	openFileList()

func openFileList():
	collectedJournalFiles = GlobalEvidence.evidenceFilesCollected
	UITitles[0].text = collectedJournalFiles[0].Title
	for i in range(collectedJournalFiles.size()):
		UITitles[i].text = collectedJournalFiles[i].Title
		UIDescriptions[i].text = collectedJournalFiles[i].Desciription
	pass

