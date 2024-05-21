extends CharacterBody2D


const MoveSpeed = 250
const MaxSpeed = 50
const JUMP_VELOCITY = -400

const up = Vector2(0,-1)
#const gravity = 15


var motion = Vector2()

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):

	motion.y -= gravity
	velocity.y += gravity * delta*0.7
	
	if  is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY
			$Sprite2D/Anim.play("Flip")

		
	if  Input.is_action_just_pressed("ui_left"):
		$Sprite2D.flip_h = true
	elif  Input.is_action_just_pressed("ui_right"):
		$Sprite2D.flip_h = false
		
		
		
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * MoveSpeed
	else:
		velocity.x = move_toward(velocity.x, 0, MoveSpeed)

	move_and_slide()
	#animaciones()

#func animaciones():
	#if is_on_floor():
		#if velocity.x != 0:
			#$Anim.play("idle")
		#else:
			#$Anim.play("idle")
	#else:
		#$Anim.play("Flip")



func _on_animation_player_animation_finished(anim_name):
	$Sprite2D/Anim.play("idle")
