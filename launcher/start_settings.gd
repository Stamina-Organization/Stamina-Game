extends Control

@onready var settings_windows = $Background/Settings

func _on_SettingsButton_pressed():
	settings_windows.show()

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		settings_windows.hide()
