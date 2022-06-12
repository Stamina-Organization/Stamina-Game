extends AnimatableBody3D

var velocity = Vector3.FORWARD

func _physics_process(delta):
	position += velocity * delta * 10


func _on_timer_timeout():
	queue_free()

func _on_area_3d_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	print(body_rid)




func _on_area_3d_body_entered(CSGCombiner3D):
	print("??????")
	queue_free()
	#print(body)
	


func _on_area_3d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print(body_rid)
