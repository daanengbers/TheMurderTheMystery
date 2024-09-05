extends Node2D

func _ready():
	GlobalDialogue.fadeIn()
	
	#GlobalDialogue.setDialougueOff()
	
	# play all the floating animations -----
	$Axe/Anim.play("float")
	$ySORT/Tent9/Anim.play("float")
	$ySORT/Tent12/Anim.play("float")
