extends Spatial

const display_resolutions = [
	Vector2(1280, 720),
	Vector2(1366, 768),
	Vector2(1600, 900),
	Vector2(1920, 1080),
	Vector2(2560, 1440),
	Vector2(3200, 1800),
	Vector2(3840, 2160),
]

onready var leavenode = preload("res://maps/utility/exit.tscn").instance()

onready var leave = $Exit/Panel/Popup

func _ready():
	pass
	#OS.set_window_fullscreen(true)
	#var screen_size := OS.get_screen_size()
	#OS.set_window_size(screen_size)

func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		leave.popup_centered()
		#get_tree().change_scene("res://launcher/launcher.tscn")

