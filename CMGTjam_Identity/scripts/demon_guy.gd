extends Node2D

func _ready():
	playSummon()

func playSummon():
	$Bodyparts/Anim.play("summon")

func playIdle():
	$Bodyparts/Anim.play("idle")

func _on_idle_timer_timeout():
	playIdle()
