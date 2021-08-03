extends Node

func _ready():
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load("res://testing/ground1/Oxygen-Sys-Warning.ogg")
	player.play()
