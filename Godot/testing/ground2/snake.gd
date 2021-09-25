extends KinematicBody2D

func _ready():
	pass

# variables to define on ready
onready var status = $Status_Registry.dict_Status_Player
onready var animation_State = $AnimationTree.get("parameters/playback")

# constants to define as 100, to then be multiplied/divided accordingly
const ACCELERATION := 100.0
const TOP_SPEED := 100.0
const FRICTION := 100.0

# enumeration of each distinct state
enum {
	STAND,
	CROUCH
}

# variables to define as default
var state := STAND
var velocity = Vector2.ZERO
var buffer_Vector = Vector2.ZERO
var input_Vector = Vector2.ZERO

func _process(delta):
	input_Vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_Vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_Vector = input_Vector.normalized()
	
	match state:
		STAND:
			if input_Vector != Vector2.ZERO:
				status.Isrunning = true
				buffer_Vector = input_Vector
				$AnimationTree.set("parameters/Idle/blend_position", input_Vector)
				$AnimationTree.set("parameters/Run_Cycle/Inch/blend_position", input_Vector)
				$AnimationTree.set("parameters/Run_Cycle/Run/blend_position", input_Vector)
				animation_State.travel("Run_Cycle")
				velocity = velocity.move_toward(input_Vector * (TOP_SPEED * 5.00), (ACCELERATION * 2) * delta)
			else:
				status.Isrunning = false
				animation_State.travel("Idle")
				velocity = velocity.move_toward(Vector2.ZERO, (FRICTION * 4.00) * delta)
			print(velocity)
			print(status.HP)
			print(status.Isrunning)
		CROUCH:
			pass
	velocity = move_and_slide(velocity)


