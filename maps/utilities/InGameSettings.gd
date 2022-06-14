extends Control

@onready var keyboads_options = $Panel/TabContainer/Keyboard/RichTextLabel/ItemList
@onready var change_key = $Panel/ChangeKey
@onready var change_key_label = $Panel/ChangeKey/Panel/Label

var listen_new_key: bool = false
var new_key : Object
var true_index 
var is_visible: bool = false

var keyboards_settings = ["Touches de déplacements :","","Z","S","Q","D","Space","A","E"]

var keyboards_name = ["","","forward","backward","left","right","jump","first_spell","second_spell"]

func _ready():
	keyboads_options.add_item("Touches de déplacements :", null, false)
	keyboads_options.add_item("", null, false)
	keyboads_options.add_item("forward : Z", null, true)
	keyboads_options.add_item("backward : S", null, true)
	keyboads_options.add_item("left : Q", null, true)
	keyboads_options.add_item("right : D", null, true)
	keyboads_options.add_item("jump : Space", null, true)
	keyboads_options.add_item("first_spell : A", null, true)
	keyboads_options.add_item("second_spell : E", null, true)

func _process(_delta):
	if new_key != null:
		var hehe = InputMap.action_get_events(keyboards_name[true_index])
		if hehe[0] != null:
			InputMap.action_erase_event(keyboards_name[true_index], hehe[0])
			InputMap.action_add_event(keyboards_name[true_index], new_key)
			keyboards_settings[true_index] = new_key.as_text()
			new_key = null
	if Input.is_action_just_pressed("ui_accept"):
		change_key.hide()

func _input(event):
	if listen_new_key == true:
		if event is InputEventMouseMotion:
			return
		else:
			new_key = event
			listen_new_key = false
			change_key_label.text = event.as_text()


func _on_item_list_item_activated(index):
	true_index = index
	keyboads_options.set_item_text(index, keyboards_name[index] + " : " + keyboards_settings[index])
	if index == 1:
		return
	else:
		change_key.show()
		$Timer.start()


func _on_timer_timeout():
	listen_new_key = true

func _on_change_key_visibility_changed():
	is_visible = !is_visible

func _on_leave_game_popup_pressed():
	$Panel/Exit.show()


func _on_leave_menu_pressed():
	$".".hide()
