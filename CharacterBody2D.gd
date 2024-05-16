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
	
	if Input.is_action_pressed("ui_accept"):
		$AnimationPlayer.play("Flip")
	else:
		$AnimationPlayer.play("idle")
		
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY
	if not is_on_floor():
		velocity.y += gravity * delta

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * MoveSpeed
	else:
		velocity.x = move_toward(velocity.x, 0, MoveSpeed)

	move_and_slide()
