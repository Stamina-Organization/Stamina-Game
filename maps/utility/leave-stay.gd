extends Control

@onready var leave_windows = $Panel/Popup
var leave_or_not = "capture"


func _on_stay_game_pressed():
	leave_windows.hide()
	leave_or_not = "capture"


func _on_leave_game_pressed():
	get_tree().change_scene("res://launcher/launcher.tscn")
	#var screen_size := OS.get_screen_size()
	#OS.set_window_size(screen_size)
	

func _process(_delta):
	if leave_or_not == "visible":
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if leave_or_not == "capture":
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_Popup_about_to_show():
	leave_or_not = "visible"
