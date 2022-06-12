extends Control

@onready var settings_item = $Panel/ItemList

var control_settings = [
	"forward : W",
	"backward : S",
	"left : A",
	"right : D",
	"jump : Space",
	"dodge : Shift",
	"first_spell : a",
	"second_spell : e",
	"attack : Left Mouse Button",
	"parry : Right Click Button"
]

func _ready():
	var i = 0
	while i < control_settings.size():
		settings_item.add_item(control_settings[i], null, false)
		
		i+=1
