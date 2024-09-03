extends ColorRect

@onready var LightningSprite: ColorRect = $"."

func _ready():
	$LightningTimer2.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	


func _on_lightning_timer_2_timeout():
	print("help")
	var LightningColor = Color(1, 1, 1)
	
	LightningSprite.set_color("#ffffff")
	pass # Replace with function body.
