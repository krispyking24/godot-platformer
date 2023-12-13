extends Sprite2D

@onready var texture_pressed = load("res://run pressed.png")
@onready var texture_unpressed = load("res://run normal.png")

func _input(ev):
	if Input.is_action_pressed("sprint"):
		texture = texture_pressed
	else:
		texture = texture_unpressed
