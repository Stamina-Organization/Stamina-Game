extends Node3D

const display_resolutions = [
	Vector2(1280, 720),
	Vector2(1366, 768),
	Vector2(1600, 900),
	Vector2(1920, 1080),
	Vector2(2560, 1440),
	Vector2(3200, 1800),
	Vector2(3840, 2160),
]

@onready var leavenode = preload("res://maps/utilities/exit.tscn").instantiate()
@onready var settings = $InGameSettings
@onready var player = $Player

var settings_is_visible: bool = false
var spell_velocity = Vector3.FORWARD

func _ready():
	pass

func _process(_delta):
	leave_game()

func leave_game():
	if Input.is_action_just_pressed("ui_cancel"):
		if settings_is_visible == false:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			settings.show()
			settings_is_visible = true
		elif settings_is_visible == true:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			settings.hide()
			settings_is_visible = false

func _on_player_cast_spell(spell, direction, location):
	var b = spell.instantiate()
	add_child(b)
	b.rotation = direction
	b.position = location + Vector3(0,1,0)
	#b.velocity = spell_velocity.rotated(Vector3(0,1,0), direction.y)
	b.velocity = b.velocity.rotated(Vector3(0,1,0), direction.y)


func _on_h_slider_value_changed(value):
	$AudioStreamPlayer.volume_db = (value -80) /2


func _on_leave_menu_pressed():
	settings.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	settings_is_visible = false
