extends Control

@export var vsync_state:bool = true
@export var sharpen_intensity: float = 0.0
@export var anisotropic_filter_level: int = 4
@export var nearest_mipma_filter: bool = false
@export var msaa: bool = false
@export var fxaa: bool = true
@export var debanding: bool = false
@export var filter_mod: String = "PCF5"
@export var voxel_cone_tracing: bool = false
@export var hdr: bool = true
var path = "res://Launcher/settings/settings_data.json"
var settings_data = {
	"settings" : {
		"filters": {
			"sharpen_intensity": 0.0,
			"anisotropic_filter_level": 4,
			"nearest_mipma_filter": false,
			"msaa": false,
			"fxaa": true,
			"debanding": false
		},
		"shadow": {
			"filter_mod": "PCF5"
			# À compléter
		},
		"qualities": {
			"voxel_cone_tracing": false,
			"hdr": true,
			"vsync": true
		}
	}
}

var settings = {}

func _ready():
	blablaload()
	load_settings()

func save():
	var file = File.new()
	file.open(path, File.WRITE)
	file.store_line(settings_data.get_as_text())
	file.close()

func blablaload():
	var file = File.new()
	if not file.file_exists(path):
		save()
		return
	file.open(path, File.READ)
	var data = file.get_as_text()
	settings_data = data

func _on_PopupMenu_id_pressed(id):
	if id == 2:
		if settings_data["settings"]["qualities"]["vsync"] == true:
			#OS.set_use_vsync(false)
			settings_data["settings"]["qualities"]["vsync"] = false
			print(settings_data["settings"]["qualities"]["vsync"])
			$Popup/PopupPanel/PopupMenu.toggle_item_checked($Popup/PopupPanel/PopupMenu.get_item_index(2))
		elif settings_data["settings"]["qualities"]["vsync"] == false:
			#OS.set_use_vsync(true)
			settings_data["settings"]["qualities"]["vsync"] = true
			print(settings_data["settings"]["qualities"]["vsync"])
			$Popup/PopupPanel/PopupMenu.toggle_item_checked($Popup/PopupPanel/PopupMenu.get_item_index(2))
	elif id == 7:
		if nearest_mipma_filter == true:
			#OS.mipmap_filter(false)
			vsync_state = false
			$Popup/PopupPanel/PopupMenu.toggle_item_checked($Popup/PopupPanel/PopupMenu.get_item_index(2))
		if nearest_mipma_filter == false:
			#OS.mipmap_filter(true)
			vsync_state = true
			$Popup/PopupPanel/PopupMenu.toggle_item_checked($Popup/PopupPanel/PopupMenu.get_item_index(2))

func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		save()

func load_settings():
	pass
#	if settings_data["settings"]["qualities"]["vsync"] == true:
#		#OS.set_use_vsync(true)
#		print(settings_data["settings"]["qualities"]["vsync"])
#	elif settings_data["settings"]["qualities"]["vsync"] == false:
#		#OS.set_use_vsync(false)
#		print(settings_data["settings"]["qualities"]["vsync"])
#		$Popup/PopupPanel/PopupMenu.toggle_item_checked($Popup/PopupPanel/PopupMenu.get_item_index(2))
