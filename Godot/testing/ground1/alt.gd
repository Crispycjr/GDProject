extends Node

func _ready():
	var dialog = AcceptDialog.new()
	dialog.get_label().text = "You OK with this?"
	self.add_child(dialog)
	dialog.popup_centered()
