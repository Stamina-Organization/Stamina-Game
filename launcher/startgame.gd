extends Button

func _ready():
	OS.set_window_fullscreen(false)


func _on_Button_pressed():
	get_tree().change_scene("res://maps/map.tscn")
	
func _process(_delta):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
