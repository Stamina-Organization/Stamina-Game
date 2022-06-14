extends AnimatableBody3D

@export var damage:int = 50
var velocity = Vector3.FORWARD

func _physics_process(delta):
	position += velocity * delta * 10


func _on_timer_timeout():
	queue_free()
