extends CharacterBody2D

signal PlayerClose
signal PlayerFar
signal DoFlash

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	PlayerClose.emit()


func _on_area_2d_body_exited(body):
	PlayerFar.emit()
