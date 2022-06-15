extends CharacterBody3D

@export var hp_max:int = 300
@export var hp: int = hp_max
var hp_last_hit: int = hp
@export var defense: int = 0

signal die(player)
signal receive_damage(amount: int, time)

func _process(_delta):
	if hp_last_hit > hp:
		emit_signal("receive_damage", hp_last_hit - hp, null)
		hp_last_hit = hp
	
	if hp == 0 or hp < 0:
		emit_signal("die", self)
		queue_free()

func _on_hurtbox_area_entered(hitbox):
	var base_damage = hitbox.damage
	self.hp -= base_damage
	print(hitbox.get_parent().name, "'s hitbox touched ", name, "'hurtbox dealt ", str(base_damage))


func _on_ennemy_receive_damage(amount, _time):
	$DamageReceiveLable.text = str(-amount)
	$Label3D.text = "Ennemy " + str(hp)
