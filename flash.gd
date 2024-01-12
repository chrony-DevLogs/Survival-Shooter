extends Area2D

func _on_timer_timeout():
	$PointLight2D.enabled = false


func _on_player_do_flash():
	$Timer.start()
	$PointLight2D.enabled = true


func _on_lazer_enable_flash():
	$PointLight2D.enabled = true
