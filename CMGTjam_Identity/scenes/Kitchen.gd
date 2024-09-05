extends Node2D
var HasScreamed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalBools.HasInvestigatedKnifes == true && HasScreamed == false:
		GlobalDialogue.loadLines("","AAAAAAAAAAAAAAH!!!","","","","","","","")
		GlobalDialogue.setPersonSpeaking("?")
		GlobalDialogue.setDialougueOn()
		GlobalDialogue.maxlines = 0
		GlobalDialogue.nextLine()
		HasScreamed = true
	pass
