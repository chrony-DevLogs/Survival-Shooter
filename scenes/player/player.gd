extends CharacterBody2D

var canLaserShoot = true
var canGurnadeShoot = true
var speed = 350

signal lazer(pos)
signal gurnade(pos)
signal DoFlash

func _process(_delta):
	# mouvement input
	
	var direction  = Input.get_vector("left","right","up","down")
	direction = direction.normalized()
	
	velocity = direction * speed
	move_and_slide()
	
	if( (direction != Vector2.ZERO)):
		var tween = create_tween()	
		tween.tween_property($".","rotation",direction.angle(),0.2)

		
	if(Input.is_action_pressed("primary action") and canLaserShoot):
		var markPos = $GunMarks.get_children()
		var RandomPos = markPos[randi() % markPos.size()]
		canLaserShoot = false
		lazer.emit(RandomPos.global_position)
		$gunParticles/GPUParticles2D.set_emitting(true)
		$laserTimer.start()
		DoFlash.emit()

		
	if(Input.is_action_pressed("secondary action") and canGurnadeShoot):
		var gurnadePos = $GunMarks/gurnadePos
		gurnade.emit(gurnadePos.global_position)
		canGurnadeShoot = false
		$gurnadeTimer.start()
	
	if(Input.is_action_pressed("run")):
		speed = 700
	if(Input.is_action_just_released("run")):
		speed = 300



func _on_gurnade_timer_timeout():
	if(!canGurnadeShoot):
		canGurnadeShoot = true


func _on_laser_timer_timeout():
	if(!canLaserShoot):
		canLaserShoot = true




func _on_house_body_entered(body):
	if(body == $"."):
		var tween2 = create_tween()
		tween2.tween_property($Camera2D,"zoom",Vector2(0.8,0.8),0.5)
		print("bagra")



func _on_house_body_exited(body):
	if(body == $"."):
		var tween2 = create_tween()
		tween2.tween_property($Camera2D,"zoom",Vector2(0.5,0.5),0.5)
		print("bagra")
