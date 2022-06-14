extends Sword

@onready var weapon = $Weapon
@onready var hitbox = $Hitbox
var on_attack = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("attack"):
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
