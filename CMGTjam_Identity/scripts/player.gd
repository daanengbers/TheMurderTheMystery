extends CharacterBody2D

var SPEED = 60

var rpress = false
var lpress = false
var upress = false
var dpress = false
var lookdir = 0


func _physics_process(delta):
	
	if GlobalDialogue.global_dialogue_on == false:
		
		# Movement
		if Input.is_action_pressed("right") && lpress == false:
			velocity.x = SPEED
			$Char.flip_h = false
			$Char/Anim.play("walk_s")
		elif Input.is_action_pressed("left") && rpress == false:
			velocity.x = -SPEED
			$Char.flip_h = true
			$Char/Anim.play("walk_s")
		else:
			velocity.x = 0
		if Input.is_action_pressed("up") && dpress == false:
			velocity.y = -SPEED
			if rpress == false && lpress == false:
				$Char/Anim.play("walk_u")
		elif Input.is_action_pressed("down") && upress == false:
			velocity.y = SPEED
			if rpress == false && lpress == false:
				$Char/Anim.play("walk_d")
		else:
			velocity.y = 0
		
		# Look in directions
		if Input.is_action_pressed("left"):
			lpress = true
		else:
			lpress = false
		if Input.is_action_pressed("right"):
			rpress = true
		else:
			rpress = false
		if Input.is_action_pressed("up"):
			upress = true
		else:
			upress = false
		if Input.is_action_pressed("down"):
			dpress = true
		else:
			dpress = false
		
		if dpress == true && lpress == true && rpress == false && upress == false:
			lookdir = 1
			$Interactbox.rotation_degrees = 135
		elif (dpress == true && lpress == false && rpress == false && upress == false) or (dpress == true && lpress == true && rpress == true && upress == false):
			lookdir = 2
			$Interactbox.rotation_degrees = 90
		elif dpress == true && lpress == false && rpress == true && upress == false:
			lookdir = 3
			$Interactbox.rotation_degrees = 45
		elif (dpress == false && lpress == true && rpress == false && upress == false) or (dpress == true && lpress == true && rpress == false && upress == true):
			lookdir = 4
			$Interactbox.rotation_degrees = 180
		elif dpress == false && lpress == false && rpress == false && upress == false:
			lookdir = 5
		elif (dpress == false && lpress == false && rpress == true && upress == false) or (dpress == true && lpress == false && rpress == true && upress == true):
			lookdir = 6
			$Interactbox.rotation_degrees = 0
		elif dpress == false && lpress == true && rpress == false && upress == true:
			lookdir = 7
			$Interactbox.rotation_degrees = 225
		elif (dpress == false && lpress == false && rpress == false && upress == true) or (dpress == false && lpress == true && rpress == true && upress == true):
			lookdir = 8
			$Interactbox.rotation_degrees = 270
		elif dpress == false && lpress == false && rpress == true && upress == true:
			lookdir = 9
			$Interactbox.rotation_degrees = 315
		
		$Label.set_text(str(lookdir))
		
		# Interact
		if Input.is_action_just_pressed("interact"):
			tryToInteract()
	else:
		velocity = Vector2(0,0)
	
	move_and_slide()


func tryToInteract():
	$Interactbox/box.set_deferred("disabled", false)
	$Timers/InteractboxTimer.start()


func _on_interactbox_body_entered(body):
	if body.is_in_group("interactable"):
		body.interact()


func _on_interactbox_timer_timeout():
	$Interactbox/box.set_deferred("disabled", true)
