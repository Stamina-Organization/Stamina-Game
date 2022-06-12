extends Control

@onready var settings_windows = $Background/Settings
@export var show_settings: bool = false

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

func _on_control_tree_exiting():
	print("Le mec quitte le jeu")


func _on_control_tree_exited():
	print("Le mec quitte VRAIMENT le jeu")
