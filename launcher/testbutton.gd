extends Control

onready var settings_windows = $Background/Settings/Popup/PopupPanel/PopupMenu
onready var settings_popup = $Background/Settings/Popup

func _on_SettingsButton_pressed():
	settings_windows.popup_centered()

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		settings_windows.hide()
