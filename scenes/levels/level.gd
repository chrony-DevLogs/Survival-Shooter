extends Node2D

var lazer:PackedScene = preload("res://scenes/objects/area_2d.tscn")
var gurnade:PackedScene = preload("res://gurnade.tscn")
var useCar = false
func _on_gate_player_entred_gate(body):
	print("Teleported To Level 1")
	
	body.position = $"Levels/LevelOne/Level-Location".global_position


func _on_player_lazer(pos):
	var lazer_instance = lazer.instantiate()

	lazer_instance.rotation = $Player.rotation + PI/2
	lazer_instance.position = pos
	$Projectiles.add_child(lazer_instance)
	

func _on_player_gurnade(pos):
	var gurnade_instance = gurnade.instantiate() as RigidBody2D
	gurnade_instance.position = pos 
	gurnade_instance.linear_velocity = Vector2(cos($Player.rotation),sin($Player.rotation)) * 700
	$Projectiles.add_child(gurnade_instance)

func _process(_delta):

	var projectiles = $Projectiles.get_children()
	
	for projectile in projectiles:
		var lengthVector = abs(projectile.global_position - $Player.global_position)
		if(lengthVector.length() > 1500):
			projectile.queue_free()

func _on_car_player_close():
	useCar = true
	print("Get in Car ?")

func _on_car_player_far():
	useCar = false
	print("Buy")

