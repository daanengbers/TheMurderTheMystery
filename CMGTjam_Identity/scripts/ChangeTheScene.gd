extends Node

@export var SceneToLoad = "sceneToLoad"
@export var BoolToCheck = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("player"):
		if BoolToCheck == 0:
			get_tree().change_scene_to_file(SceneToLoad)
			#standard load of next scene // no check
		if BoolToCheck == 1:
			if GlobalBools.MainBuildingInvestigated == true:
				get_tree().change_scene_to_file(SceneToLoad) 
				#To check if the main building has been fully investigated // change to the correct scene later
		pass # Replace with function body.
