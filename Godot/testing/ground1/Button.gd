extends Button


func _on_Button_pressed():
	self.text = "pog"

func _on_Button_button_down():
	self.text = "let it go nigga"
	self.add_color_override("font_color", Color(0,0,0))
	
func _on_Button_mouse_entered():
	self.add_color_override("font_color_hover", Color(0,0,0))

