extends Control

onready var leave_windows = $Panel/Popup
var leave_or_not = "capture"


func _on_stay_game_pressed():
	leave_windows.hide()
	leave_or_not = "capture"



func _on_leave_game_pressed():
	get_tree().change_scene("res://launcher/launcher.tscn")
	

func _process(delta):
	if leave_or_not == "visible":
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if leave_or_not == "capture":
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_Popup_about_to_show():
	leave_or_not = "visible"
