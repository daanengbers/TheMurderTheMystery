extends ColorRect

@onready var LightningSprite: ColorRect = $"."

func _ready():
	$LightningTimer2.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	


func _on_lightning_timer_2_timeout():
	LightningSprite.set_color("#ffffff")
	$LigthningStop.start()
	pass # Replace with function body.
	


func _on_ligthning_stop_timeout():
	LightningSprite.set_color("#ffffff00")
	pass # Replace with function body.
