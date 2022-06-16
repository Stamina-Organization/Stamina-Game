extends Node

class_name Item

class TheItem: 
	var name = ""
	var bonus_damage = 0
	var bonus_defense = 0
	var bonus_move_speed = 0
	
	var scale_damage = 0.0

var items = Array()

func _ready():
	var the_famous_sword = TheItem.new()
	the_famous_sword.bonus_damage = 50
	the_famous_sword.name = "The Famous Sword!"
	items.append(the_famous_sword)

func on_item_bought():
	# reset player stat
	# ...
	
	for item in items:
		player.damage += item.bonus_damage
		player.defense += item.bonus_defense
		player.move_speed += item.move_speed
	
	var temp_damage = player.damage
	for item in items:
		player.damage += item.scale_damage * temp_damage
		
	

var damage:int = 50
