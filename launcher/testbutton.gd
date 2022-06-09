extends Control

onready var settings_windows = $Background/Popup/PopupMenu

func _on_SettingsButton_pressed():
	#settings_windows.set_exclusive(true)
	settings_windows.popup_centered()
