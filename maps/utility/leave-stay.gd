extends Control

@onready var leave_windows = $"."


func _on_stay_game_pressed():
	leave_windows.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_leave_game_pressed():
	ChangeScene.goto_scene("res://launcher/launcher.tscn", self, false)


func _on_panel_visibility_changed():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
