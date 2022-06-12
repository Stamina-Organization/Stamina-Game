extends AnimatableBody3D

var velocity = Vector3.FORWARD

func _physics_process(delta):
	position += velocity * delta * 5


func _on_timer_timeout():
	queue_free()
