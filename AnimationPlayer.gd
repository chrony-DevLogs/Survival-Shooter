extends AnimationPlayer




func _on_timer_timeout():
	$"../explotion".visible = true
	play("explotion")
