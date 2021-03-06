extends CharacterBody3D


const MIN_FPS_CAMERA_ANGLE = -60
const MAX_FPS_CAMERA_ANGLE = 70
const MIN_TPS_CAMERA_ANGLE = -60
const MAX_TPS_CAMERA_ANGLE = 45
const GRAVITY = -20

signal cast_spell(spell, direction, location)

@onready var spell_one = preload("res://actors/player/Spells/Spell1/Spell1.tscn")


@export var camera_sensitivity: float = 0.1
@export var speed: float = 10.0
@export var acceleration: float = 6.0
@export var jump_impulse: float = 12.0
@export var camera_mode: String = "fps"
var true_velocity : Vector3 = Vector3.ZERO


@onready var head = $Head/Camera
@onready var tps = $TPS
@onready var camcollider = $TPS/h/v/CamCollider
@onready var camera = $TPS/h/v/Camera3D
@onready var map = get_node("/root/Map")


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	start_camera(camera_mode)
	

func _process(_delta):
	if camcollider.is_colliding():
		camera.global_transform.origin = camcollider.get_collision_point()
	#else:
	#	camera.translation = camcollider.target_position

func _physics_process(delta):
	var movement = _get_movement_direction()
	true_velocity.x = lerp(true_velocity.x, movement.x * speed,acceleration * delta)
	true_velocity.z = lerp(true_velocity.z, movement.z * speed,acceleration * delta)
	if !is_on_floor():
		true_velocity.y += GRAVITY * delta
	
	velocity = true_velocity
	move_and_slide()
	switch_camera()
	
	if Input.is_action_just_pressed("first_spell"):
		if !map.settings_is_visible == true:
			emit_signal("cast_spell", spell_one, rotation, position)

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		_handle_camera_rotation(event)

func _handle_camera_rotation(event):
	if camera_mode == "fps":
		rotate_y(deg2rad(-event.relative.x * camera_sensitivity))
		head.rotate_x(deg2rad(-event.relative.y * camera_sensitivity))
		head.rotation.x = clamp(head.rotation.x, deg2rad(MIN_FPS_CAMERA_ANGLE), deg2rad((MAX_FPS_CAMERA_ANGLE)))
	elif camera_mode == "tps":
		rotate_y(deg2rad(-event.relative.x * camera_sensitivity))
		tps.rotate_x(deg2rad(-event.relative.y * camera_sensitivity))
		tps.rotation.x = clamp(tps.rotation.x, deg2rad(MIN_TPS_CAMERA_ANGLE), deg2rad((MAX_TPS_CAMERA_ANGLE)))

func _get_movement_direction():
	var direction = Vector3.DOWN
	if !map.settings_is_visible == true:
		if Input.is_action_pressed("forward"):
			direction -= transform.basis.z
		if Input.is_action_pressed("backward"):
			direction += transform.basis.z
		if Input.is_action_pressed("left"):
			direction -= transform.basis.x
		if Input.is_action_pressed("right"):
			direction += transform.basis.x
		if Input.is_action_just_pressed("jump") and is_on_floor():
			true_velocity.y = jump_impulse
	return direction.normalized()

func switch_camera():
	if Input.is_action_just_pressed("change_view"):
		print("Changer de cam??ra")
		if $"Head/Camera".current == true:
			print("F P S  to  T P S")
			$"Head/Camera".clear_current(true)
			camera_mode = "tps"
			$"TPS/h/v/Camera3D".make_current()
			print(camera_mode)
		elif $"TPS/h/v/Camera3D".current == true:
			print("T P S  to  F P S")
			$"TPS/h/v/Camera3D".clear_current(true)
			camera_mode = "fps"
			$"Head/Camera".make_current()
			print(camera_mode)

func start_camera(mode: String):
	if mode == "fps":
		$"TPS/h/v/Camera3D".clear_current(true)
		$"Head/Camera".make_current()
		print("Mode de d??part : " + mode)
	elif mode == "tps":
		$"Head/Camera".clear_current(true)
		$"TPS/h/v/Camera3D".make_current()
		print("Mode de d??part : " + mode)
