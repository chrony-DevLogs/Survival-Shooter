extends PointLight2D

var flashLightEnabled = false

func _process(_delta):
	if(Input.is_action_just_pressed("flashLight")):
		flashLightEnabled = !flashLightEnabled
	enabled = flashLightEnabled
	$"../flashLight".visible = flashLightEnabled
