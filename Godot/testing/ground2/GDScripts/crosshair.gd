extends KinematicBody2D


func _ready():
 set_process(true)

func _process(_delta):
 set_position(Vector2(get_viewport().get_mouse_position().x , get_viewport().get_mouse_position().y))
