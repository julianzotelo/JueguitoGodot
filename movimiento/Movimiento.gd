extends CharacterBody2D


@export var speed : float

# Called when the node enters the scene tree for the first time.
func _process(delta):
 motion_ctrl()# Replace with function body.


func motion_ctrl() -> void:
 velocity.x = Global.get_axis().x * speed
 velocity.y = Global.get_axis().y * -speed
 move_and_slide()
#func motion_ctrl() -> void:
	#velocity.x = Global.get_axis().x * speed
	#velocity.y = Global.get_axis().y * -speed
	#move_and_slide()
	
	
