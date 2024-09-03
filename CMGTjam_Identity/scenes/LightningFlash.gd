extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	$"Lightning Timer".start()
	var NoColor = Color("#ffffff00")
	$".".color = NoColor
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_lightning_timer_timeout():
	var LightningCollor = Color("#ffffff")
	get_node("Lightning Sprite").Set_color(LightningCollor)
	pass # Replace with function body.
