extends Node2D

func _ready():
	$Window/AnimationPlayer.play("thunder")
	$Window2/AnimationPlayer.play("thunder")
	$Window3/AnimationPlayer.play("thunder")
	
