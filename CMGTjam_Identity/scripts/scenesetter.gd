extends Node

@export var local_is_cutscene = false
@export var local_cutscenenr = 0

func _ready():
	initializeAfterLoadExportVariables()

func initializeAfterLoadExportVariables():
	GlobalDialogue.is_cutscene = local_is_cutscene
	GlobalDialogue.cscene = local_cutscenenr
	GlobalDialogue.initialize()



