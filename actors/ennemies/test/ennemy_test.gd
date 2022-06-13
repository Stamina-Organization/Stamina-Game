extends CharacterBody3D

@export var hp_max:int = 300
@export var hp: int = hp_max
var hp_last_hit: int = hp
@export var defense: int = 0

signal die(player)
signal receive_damage(amount: int, time)

func _process(delta):
	if hp_last_hit > hp:
		hp_last_hit = hp
		emit_signal("receive_damage")
		print("dégats reçu")
	
	if hp == 0:
		emit_signal("die", self)
		queue_free()

func _on_hurtbox_area_entered(hitbox):
	var base_damage = hitbox.damage
	self.hp -= base_damage
	print(hitbox.get_parent().name, "'s hitbox touched ", name, "'hurtbox dealt ", str(base_damage))
