extends AnimatableBody3D

@export var damage:int = 10
var velocity = Vector3.FORWARD

func _physics_process(delta):
	position += velocity * delta * 10


func _on_timer_timeout():
	queue_free()



func _on_area_3d_area_entered(area):
	print(area)
