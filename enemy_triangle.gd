extends KinematicBody2D

export var player_position : Vector2
signal hit()
signal die(body)
export var base_speed = 60
export var move_speed = 60

func _ready():
	$alive_timer.start()

func _process(delta):
	_move_toward_player()
	
func _move_toward_player():
	look_at(player_position)
	rotation_degrees += 75
	var distance = position.distance_to(player_position)
	var direction = player_position - position
	var normalized_direction = direction.normalized() * move_speed
	move_and_slide(normalized_direction )
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if (collision.collider.name == "playable_character"):
			emit_signal("hit")

func _on_alive_timer_timeout():
	emit_signal("die", self)
	queue_free()
	hide()
	set_deferred("disabled", true)
