extends Spatial

onready var leavenode = preload("res://maps/utility/exit.tscn").instance()

onready var leave = $Exit/Panel/Popup

func _ready():
	OS.set_window_fullscreen(true)

func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		leave.popup_centered()
		#get_tree().change_scene("res://launcher/launcher.tscn")

