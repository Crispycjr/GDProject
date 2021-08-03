extends KinematicBody2D

const INCH_TOP := null
const INCH_ACCEL := null
const ACCELERATION := 100
const TOP_SPEED := 100
const FRICTION := 100

enum {
	STAND,
	CROUCH
}

var state := STAND
var velocity = Vector2.ZERO
var buffer_Vector = Vector2.ZERO

onready var status = $Status_Registry.dict_Status_Player
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

func _ready():
	animationTree.active = true

func _process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	match state:
		STAND:
			if input_vector != Vector2.ZERO:
				status.Isrunning = true
				buffer_Vector = input_vector
				animationTree.set("parameters/Idle/blend_position", input_vector)
				animationTree.set("parameters/Run_Cycle/Inch/blend_position", input_vector)
				animationTree.set("parameters/Run_Cycle/Run/blend_position", input_vector)
				animationState.travel("Run_Cycle")
				
				velocity = velocity.move_toward(input_vector * (TOP_SPEED * .80), (ACCELERATION * 4) * delta)
			else:
				status.Isrunning = false
				animationState.travel("Idle")
				velocity = velocity.move_toward(Vector2.ZERO, (FRICTION * 4) * delta)
			print(velocity)
			print(status.HP)
			print(status.Isrunning)
		CROUCH:
			pass
	velocity = move_and_slide(velocity)



