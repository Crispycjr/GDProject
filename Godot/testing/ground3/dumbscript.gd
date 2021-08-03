extends KinematicBody2D

const INCH_TOP = null
const INCH_ACCEL = null
const ACCELERATION = 500
const TOP_SPEED = 80
const FRICTION = 800

enum {
	STAND,
	RUN,
	CRAWL,
	SLIDE
}

var state = STAND
var velocity = Vector2.ZERO
var run_vector = Vector2.DOWN

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

func _ready():
	animationTree.active = true

func _process(delta):
	match state:
		STAND:
			input_vector(delta)
		RUN:
			run_State(delta)
		CRAWL:
			pass
	
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	if input_vector != Vector2.ZERO:
		state = RUN
	
func run_State(delta):
	animationTree.set("parameters/Idle/blend_position", input_vector)
	animationTree.set("parameters/Inch/blend_position", input_vector)
	animationTree.set("parameters/Run/blend_position", input_vector)
	animationState.travel("Inch")
	animationState.travel("Run")
	velocity = velocity.move_toward(input_vector * TOP_SPEED, ACCELERATION * delta)
	if input_vector = Vector2.ZERO:
			animationState.travel("Idle")
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)



func _on_SoundSpace_body_entered(_body):
	$SoundSpace/AudioStreamPlayer2D.play()
