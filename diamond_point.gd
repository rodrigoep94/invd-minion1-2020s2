extends Area2D

func _on_diamond_point_body_entered(body):
	if body.name == "playable_character":
		hide()
		$CollisionPolygon2D.set_deferred("disabled", true)


func _on_Main_game_over():
	hide()
	$CollisionPolygon2D.set_deferred("disabled", true)
