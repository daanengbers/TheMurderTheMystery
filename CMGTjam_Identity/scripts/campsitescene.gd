extends Node2D

func _ready():
	$ySORT/SleepingTeacher/Anim.play("sleep")
	$ZeldaCamera/Control/LightningVisual/Anim.play("thunder")

func _on_nextscene_area_body_entered(body):
	if body.is_in_group("player"):
		GlobalDialogue.fadeOut()

func thundersound():
	$Thunder.play()
