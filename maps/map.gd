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

@onready var leavenode = preload("res://maps/utility/exit.tscn").instantiate()
@onready var leave = $Exit/Panel
@onready var player = $Player

var spell_velocity = Vector3.FORWARD

func _ready():
	pass

func _process(_delta):
	leave_game()

func leave_game():
	if Input.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		$Exit.show()


func _on_player_cast_spell(spell, direction, location):
	var b = spell.instantiate()
	add_child(b)
	b.rotation = direction
	b.position = location + Vector3(0,1,0)
	#b.velocity = spell_velocity.rotated(Vector3(0,1,0), direction.y)
	b.velocity = b.velocity.rotated(Vector3(0,1,0), direction.y)
