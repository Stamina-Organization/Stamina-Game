extends KinematicBody


const MIN_FPS_CAMERA_ANGLE = -60
const MAX_FPS_CAMERA_ANGLE = 70
const MIN_TPS_CAMERA_ANGLE = -60
const MAX_TPS_CAMERA_ANGLE = 45
const GRAVITY = -20


export var camera_sensitivity: float = 0.1
export var speed: float = 10.0
export var acceleration: float = 6.0
export var jump_impulse: float = 12.0
export var camera_mode: String = "fps"
export var angular_acceleration: float = 7
var velocity : Vector3 = Vector3.ZERO
var camerot_h = 0
var camerot_v = 0


onready var head: Spatial = $Head
onready var tps: Spatial = $TPS


func _ready():
	#direction = Vector3.BACK.rotated(Vector3.UP, $TPS/h.global_transform.basis.get_euler().y)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	start_camera(camera_mode)
	
func _physics_process(delta):
	var movement = _get_movement_direction()
	velocity.x = lerp(velocity.x, movement.x * speed,acceleration * delta)
	velocity.z = lerp(velocity.z, movement.z * speed,acceleration * delta)
	velocity.y += GRAVITY * delta
	velocity = move_and_slide_with_snap(velocity, Vector3.FORWARD, Vector3.UP, true)
	
	_switch_camera()
#	if camera_mode == "tps":
#		$Body.rotation.y = lerp_angle($Body.rotation.y, $TPS/h/v/ClippedCamera.rotation.y, delta * angular_acceleration)


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		_handle_camera_rotation(event)

func _handle_camera_rotation(event):
	if camera_mode == "fps":
		rotate_y(deg2rad(-event.relative.x * camera_sensitivity))
		head.rotate_x(deg2rad(-event.relative.y * camera_sensitivity))
		head.rotation.x = clamp(head.rotation.x, deg2rad(MIN_FPS_CAMERA_ANGLE), deg2rad((MAX_FPS_CAMERA_ANGLE)))
	elif camera_mode == "tps":
		if velocity.x > 0 or velocity.x < 0 && velocity.z > 0 or velocity.z < 0:
			rotate_y(deg2rad(-event.relative.x * camera_sensitivity))
			tps.rotate_x(deg2rad(-event.relative.y * camera_sensitivity))
			tps.rotation.x = clamp(tps.rotation.x, deg2rad(MIN_TPS_CAMERA_ANGLE), deg2rad((MAX_TPS_CAMERA_ANGLE)))
			#var direction = Basis.from_euler (Vector3(velocity.x, 0, velocity.z))
			#tps.global_transform.basis = direction
		elif velocity.x == 0 && velocity.z == 0 :
			$TPS/h.rotate_y(deg2rad(-event.relative.x * camera_sensitivity))
			$TPS/h/v.rotate_x(deg2rad(-event.relative.y * camera_sensitivity))
			$TPS/h/v.rotation.x = clamp($TPS/h/v.rotation.x, deg2rad(MIN_TPS_CAMERA_ANGLE), deg2rad((MAX_TPS_CAMERA_ANGLE)))
		#camerot_h += -event.relative.x * camera_sensitivity
		#$TPS/h.rotation_degrees.y = camerot_h
		#camerot_v += -event.relative.y * camera_sensitivity
		#$TPS/h/v.rotation_degrees.x = clamp(camerot_v, MIN_TPS_CAMERA_ANGLE, MAX_TPS_CAMERA_ANGLE)

func _get_movement_direction():
	var direction = Vector3.DOWN
	
	if Input.is_action_pressed("forward"):
		direction -= transform.basis.z
	if Input.is_action_pressed("backward"):
		direction += transform.basis.z
	if Input.is_action_pressed("left"):
		direction -= transform.basis.x
	if Input.is_action_pressed("right"):
		direction += transform.basis.x
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_impulse
	
	return direction.normalized()

func _switch_camera():
	if Input.is_action_just_pressed("change_view"):
		if $Head/Camera.current == true:
			$Head/Camera.clear_current(true)
			camera_mode = "tps"
			$TPS/h/v/ClippedCamera.make_current()
			print(camera_mode)
		
		elif $TPS/h/v/ClippedCamera.current == true:
			$TPS/h/v/ClippedCamera.clear_current(true)
			camera_mode = "fps"
			$Head/Camera.make_current()
			print(camera_mode)

func start_camera(mode: String):
	if mode == "fps":
		$TPS/h/v/ClippedCamera.clear_current(true)
		$Head/Camera.make_current()
		print("Mode de départ : " + mode)
	elif mode == "tps":
		$Head/Camera.clear_current(true)
		$TPS/h/v/ClippedCamera.make_current()
		print("Mode de départ : " + mode)
