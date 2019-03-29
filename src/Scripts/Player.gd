extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

const UP = Vector2(0, -1)
const GRAVITY = 18.2
const SPEED = 200
const JUMP_HEIGHT = -550
var motion = Vector2()

func _physics_process(delta):
	
	# reset motion.	
	motion.y += GRAVITY
	motion.x = 0
	
	if Input.is_action_pressed('ui_right'):
		motion.x += SPEED
	
	if Input.is_action_pressed('ui_left'):
		motion.x -= SPEED
		
	if is_on_floor():
		if Input.is_action_just_pressed('ui_up'):
			motion.y = JUMP_HEIGHT	
		
	#move and slide.
	motion = move_and_slide(motion, UP)
	
	pass