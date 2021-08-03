extends Node

#func _ready():
	#$FileDialog.show_modal()

#func _on_FileDialog_file_selected(path):
#	print("File selected at " + path)

func _ready():
	$ConfirmationDialog.show_modal(true)
	$ConfirmationDialog.get_cancel().connect("pressed", self, "_on_Cancel")


func _on_ConfirmationDialog_confirmed():
	print("Okay Clicked")


