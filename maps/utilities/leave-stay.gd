extends Control

@onready var leave_windows = $"."
var windows_show = false


func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		leave_windows.hide()


func _on_stay_game_pressed():
	leave_windows.hide()

func _on_leave_game_pressed():
	ChangeScene.goto_scene("res://launcher/launcher.tscn", self, false)
