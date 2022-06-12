extends Node

var progress = []
var scene_load_status = 0

var real_path = ""
@onready var loading_bar = $ProgressBar
@onready var lets_go_button = $LetsGoButton
@onready var error = $Error
@export var max_load_time = 10000

func _process(_delta):
	
	scene_load_status = ResourceLoader.load_threaded_get_status(real_path, progress)
	#loading_bar.value = progress[0] * 100
	print(progress)
	
	if scene_load_status == ResourceLoader.THREAD_LOAD_FAILED:
		error.show()
	if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
		lets_go_button.show()


func goto_scene(path, current_scene, windows_mode: bool):
	print("Début du chargement...")
	
	real_path = path
	
	var loader = ResourceLoader.load_threaded_request(path)
	
	if windows_mode == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	elif windows_mode == false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)



func _on_lets_go_button_pressed():
	get_tree().change_scene_to(ResourceLoader.load_threaded_get(real_path))
	queue_free()
