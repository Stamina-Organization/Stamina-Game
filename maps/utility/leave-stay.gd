extends Control

@onready var leave_windows = $"."


func _on_stay_game_pressed():
	leave_windows.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_leave_game_pressed():
	get_tree().change_scene("res://launcher/launcher.tscn")
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	#var screen_size := OS.get_screen_size()
	#OS.set_window_size(screen_size)

func _on_panel_visibility_changed():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
