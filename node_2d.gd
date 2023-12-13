extends Node2D
var deaths=0
var t = Timer.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	#$music.play()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()

func _on_abyss_body_entered(body):
	$splash.play()
	await get_tree().create_timer(0.5).timeout
	body.position = Vector2.ZERO
	deaths += 1
	$"HUD/death counter".text = "Deaths: " + str(deaths)
