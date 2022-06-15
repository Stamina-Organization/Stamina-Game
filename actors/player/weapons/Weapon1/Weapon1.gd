extends Sword

@onready var weapon = $Weapon
@onready var hitbox = $Hitbox
@onready var map = get_node("/root/Map")
var on_attack = false


func _ready():
	var c = Epic_Sword.new()
	print(c.class_damage)


func _process(_delta):
	if Input.is_action_just_pressed("attack"):
		if !map.settings_is_visible == true:
			if on_attack == false :
				on_attack = true
				$Timer.start()
				hitbox.set_collision_layer_value(3, true)
				print("That's enable hitbox")
			if on_attack == true:
				print("On peut pas attaquer maintenant")


func _on_timer_timeout():
	hitbox.set_collision_layer_value(3, false)
	print("That's disable hitbox")
	on_attack = false
