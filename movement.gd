extends CharacterBody2D

@export var speed = 150
@export var jump_speed = -250
@export var gravity = 1000
@export var debug_mode = false
@export var sprint=false
@export var max_jumps=1
@export var jump_count=0

func _physics_process(delta):
	if Input.is_action_just_pressed("debug mode"):
		debug_mode = !debug_mode
		print(debug_mode)
	if debug_mode:
		var gravity = 300
		if Input.is_action_just_pressed("jump"):
				velocity.y = jump_speed
		if Input.is_action_just_pressed("up"):
				velocity.y = jump_speed
		#no collision
		if Input.is_action_just_pressed("noclip-on"):
			debug_mode = true
			set_collision_layer_value(1, false)
			set_collision_mask_value(1,false)
			if Input.is_action_just_pressed("jump"):
				velocity.y = jump_speed
			if Input.is_action_just_pressed("up"):
				velocity.y = jump_speed
		if Input.is_action_just_pressed("noclip-off"):
			debug_mode = true
			set_collision_layer_value(1, true)
			set_collision_mask_value(1,true)
	else:
		set_collision_layer_value(1, true)
		set_collision_mask_value(1,true)
		var gravity = 1000
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = jump_speed
			jump_count=jump_count+1
		if jump_count<max_jumps:
			if Input.is_action_just_pressed("jump"):
				velocity.y = jump_speed
				jump_count=jump_count+1
		if jump_count<max_jumps:
			if Input.is_action_just_pressed("up"):
				velocity.y = jump_speed
				jump_count=jump_count+1
		if Input.is_action_just_pressed("up") and is_on_floor():
			velocity.y = jump_speed
			jump_count=jump_count+1
		if Input.is_action_just_pressed("sprint"):
			speed=200
			jump_speed=-300
		if is_on_floor() and jump_count!=0:
			jump_count=0
		#this down part doesnt work
		if Input.is_action_just_pressed("down"):
			velocity.y-=50
			# Add gravity every frame
	velocity.y += gravity * delta
	# Input affects x axis only
	velocity.x = Input.get_axis("left", "right") * speed
	move_and_slide()
