extends Camera2D
@export var rain = false

func _ready():
	if rain == true:
		$Rain.emitting = true
	pass

func _process(delta):
	var pos = get_node("../ySORT/player").global_position - Vector2(0,0)
	var x = floor(pos.x / 320) * 320
	position.x = x
	var y = floor(pos.y / 180) * 180
	position.y = y
