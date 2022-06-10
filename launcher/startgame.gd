extends Button

func _ready():
	#OS.set_window_fullscreen(false)
	pass

func _process(_delta):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_start_gamee_pressed():
	get_tree().change_scene("res://maps/map.tscn")
