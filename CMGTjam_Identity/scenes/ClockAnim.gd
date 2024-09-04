extends Sprite2D

var HasClocked = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalDialogue.ClockAnimOn == true && HasClocked == false:
		$AnimationPlayer.play("12_O_COCK")
		HasClocked = true
	pass
