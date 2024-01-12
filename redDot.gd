extends PointLight2D

var lightWorks = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	enabled = lightWorks


func _on_timer_2_timeout():
	enabled = !lightWorks
