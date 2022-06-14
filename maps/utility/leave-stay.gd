extends Control

@onready var leave_windows = $"."
var windows_show = false


func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if windows_show == true:
			leave_windows.hide()
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			windows_show = false
		elif windows_show == false: 
			leave_windows.show()
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			windows_show = true


func _on_stay_game_pressed():
	leave_windows.hide()
	windows_show = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_leave_game_pressed():
	ChangeScene.goto_scene("res://launcher/launcher.tscn", self, false)
