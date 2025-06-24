extends Node

@onready var knifeEvidence = preload("res://evidence_file_knife.tscn")

var evidenceFilesCollected = []

# Called when the node enters the scene tree for the first time.
func _ready():
	addKnifeEvidence()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func addKnifeEvidence():
	var KnifeEvidence = knifeEvidence.instantiate()
	$"..".add_child(KnifeEvidence)
	evidenceFilesCollected.append(KnifeEvidence)
