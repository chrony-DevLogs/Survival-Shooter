extends RigidBody2D


func _on_timer_timeout():
	freeze = true
	$PointLight2D.enabled = false
