extends Control

@onready var settings_windows = $Background/Settings
@onready var credits_windows = $Background/Credits
@export var show_settings: bool = false
@export var show_credits: bool = false

func _on_SettingsButton_pressed():
	if show_settings == false:
		settings_windows.show()
		show_settings = true
	elif show_settings == true:
		settings_windows.hide()
		show_settings = false

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		settings_windows.hide()

func _on_credits_button_pressed():
	if show_credits == false:
		credits_windows.show()
		show_credits = true
	elif show_credits == true:
		credits_windows.hide()
		show_credits = false
