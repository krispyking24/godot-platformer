extends Sprite2D

@onready var texture_pressed = preload("res://space pressed.png")
@onready var texture_unpressed = preload("res://space normal.png")

func _input(ev):
	if Input.is_action_pressed("jump"):
		texture = texture_pressed
	else:
		texture = texture_unpressed
