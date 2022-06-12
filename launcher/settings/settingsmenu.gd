extends Control

@onready var settings_item = $Panel/ItemList

var control_settings = [
	"forward : Z",
	"backward : S",
	"left : Q",
	"right : D",
	"jump : Espace",
	"dodge : Shift (à venir...)",
	"first_spell : a",
	"second_spell : e (à venir...)",
	"attack : Clic gauche (à venir...)",
	"parry : Clic droit (à venir...)"
]

func _ready():
	var i = 0
	while i < control_settings.size():
		settings_item.add_item(control_settings[i], null, false)
		
		i+=1
