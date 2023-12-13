extends Camera2D

var zoomspeed=100
var zoommargin=0.3
var zoomMin=0.7
var zoomMax=3
var zoompos=Vector2()
var zoomfactor= 1
var lag_factor = 2000000000000
# A lower lag_factor means the camera lags more behind the player, creating the effect of looking ahead.
# A higher lag_factor means the camera follows the player more closely, reducing the lag effect.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	zoom.x=lerp(zoom.x, zoom.x*zoomfactor,zoomspeed*delta)
	zoom.y=lerp(zoom.y, zoom.y*zoomfactor,zoomspeed*delta)
	zoom.x=clamp(zoom.x, zoomMin,zoomMax)
	zoom.y=clamp(zoom.y, zoomMin,zoomMax)
	
	var target_position = global_position
	var current_position = global_position
	var new_position = current_position + (target_position - current_position) * lag_factor
	global_position = new_position


func _input(event):
	if abs(zoompos.x-get_global_mouse_position().x)>zoommargin:
		zoomfactor=1.0
	if abs(zoompos.y-get_global_mouse_position().y)>zoommargin:
		zoomfactor=1.0
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index==MOUSE_BUTTON_WHEEL_UP: #zoom out
				zoomfactor-=0.02
				zoompos=get_global_mouse_position()
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index==MOUSE_BUTTON_WHEEL_DOWN: #zoom in
				zoomfactor+=0.02
				zoompos=get_global_mouse_position()
