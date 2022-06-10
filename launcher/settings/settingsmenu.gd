extends Control

export var vsync_state:bool = true
export var sharpen_intensity: float = 0.0
export var anisotropic_filter_level: int = 4
export var nearest_mipma_filter: bool = false
export var msaa: bool = false
export var fxaa: bool = true
export var debanding: bool = false
export var filter_mod: String = "PCF5"
export var voxel_cone_tracing: bool = false
export var hdr: bool = true
var path = "res://Launcher/settings/settings_data.json"
var settings_data = [
	{
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
]

var settings = {}

func _ready():
	blablaload()

func save():
	var file = File.new()
	file.open(path, File.WRITE)
	file.store_line(to_json(settings_data))
	file.close()

func blablaload():
	var file = File.new()
	if not file.file_exists(path):
			 save()
			 return
	file.open(path, File.READ)
	var data = parse_json(file.get_as_text())
	settings_data = data
	print(settings_data.get("qualities", 2))

func _on_PopupMenu_id_pressed(id):
	if id == 2:
		if settings_data["qualities"]["vsync"] == true:
			OS.set_use_vsync(false)
			vsync_state = false
			$Popup/PopupMenu.toggle_item_checked($Popup/PopupMenu.get_item_index(2))
		elif vsync_state == false:
			OS.set_use_vsync(true)
			vsync_state = true
			$Popup/PopupMenu.toggle_item_checked($Popup/PopupMenu.get_item_index(2))
	elif id == 7:
		if nearest_mipma_filter == true:
			OS.mipmap_filter(false)
			vsync_state = false
			$Popup/PopupMenu.toggle_item_checked($Popup/PopupMenu.get_item_index(2))
		if nearest_mipma_filter == false:
			OS.mipmap_filter(true)
			vsync_state = true
			$Popup/PopupMenu.toggle_item_checked($Popup/PopupMenu.get_item_index(2))

func _on_PopupMenu_index_pressed(_index):
	pass # Replace with function body.
