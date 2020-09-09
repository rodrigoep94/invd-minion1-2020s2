extends KinematicBody2D

signal hit()
const normal_speed = 250

export var move_speed = normal_speed
export var stop_distance = 35
export var state = 1 #1 = Movimiento normal, 2 = Dashing

func start(pos):
	position = pos
	
func _process(delta):
	_verify_state()
	_move_by_state()
	
func _move_by_state():
	if state == 1:
		move_speed = normal_speed
		_look_at_mouse()
		_move_to_mouse()
	
	if state == 2:
		move_speed = normal_speed * 3
		_move_to_mouse()
	
func _verify_state():
	if Input.is_key_pressed(32) && state != 2:
		state = 2
		$DashTimer.set_wait_time(0.4)
		$DashTimer.start()

func _look_at_mouse():
	look_at(get_global_mouse_position())
	rotation_degrees += 35 #Acomodo los ojos
	
func _move_to_mouse():
	var distance = position.distance_to(get_global_mouse_position())
	if distance > stop_distance:
		var direction = get_global_mouse_position() - position
		var normalized_direction = direction.normalized() * move_speed
		move_and_slide(normalized_direction)
		for i in get_slide_count():
			var collision = get_slide_collision(i)
			if (collision.collider.name == "enemy_triangle"):
				emit_signal("hit")

func _on_DashTimer_timeout():
	state = 1
