extends Area2D

@export var bulletSpeed = 1800
signal enableFlash
# Called when the node enters the scene tree for the first time.
func _ready():
	enableFlash.emit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector2(cos(rotation + PI/2),sin(rotation + PI/2))
	position -= direction * bulletSpeed * delta
	



func _on_body_entered(body):
	queue_free()
