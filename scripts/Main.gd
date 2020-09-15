extends Node2D	

export (PackedScene) var Food	
export (PackedScene) var Hole	
export (PackedScene) var Triangle

var score = 0
var max_food = 10
var max_triangles = 25
var food_shown = 0
var active_enemies = []
var food_list = []
var holes = []
var holes_position = []

func _ready():
	pass
	
func _process(delta):
	for triangle in active_enemies:
		if (triangle != null):
			triangle.player_position = $playable_character.position
	
func _new_game():
	$welcome_screen._hide()
	score = 0
	max_food = 10
	food_shown = 0
	$food_timer.start()
	$game_over_hud._hide()
	$enemies_timer.start()
	$game_over_sound.stop()
	if (!$background_music.playing):
		$background_music.play()
	$score.show()
	_show_character()
	_spawn_food()
	_show_holes()
	
func _show_triangle():
	randomize()
	var position = randi()%4
	var triangle = Triangle.instance()
	triangle.position = holes_position[position]
	triangle.connect("hit", self, "_on_playable_character_hit")
	triangle.connect("die", self, "_on_triangle_dead")
	triangle.move_speed = triangle.base_speed * $welcome_screen.dificulty
	add_child(triangle)
	active_enemies.append(triangle)
	
func _on_triangle_dead(body):
	active_enemies.erase(body)
	
func _show_character():
	$playable_character.show()
	$playable_character.position = Vector2(get_viewport().size.x/2, get_viewport().size.y/2)
	
func _spawn_food():
	for i in range(0, max_food):
		_instatiate_food()

func _show_holes():
	for i in range(0,5):
		var screen_size = get_viewport().get_visible_rect().size
		var hole = Hole.instance()
		randomize()
		var x = rand_range(0,screen_size.x)
		randomize()
		var y = rand_range(0,screen_size.y)
		var pos = Vector2(x,y)
		hole.position = pos
		holes_position.append(pos)
		add_child(hole)
		holes.append(hole)

func _instatiate_food():
	var screen_size = get_viewport().get_visible_rect().size
	var food = Food.instance()
	food.connect("body_entered", self, "_on_diamond_eaten")
	randomize()
	var x = rand_range(0,screen_size.x)
	randomize()
	var y = rand_range(0,screen_size.y)
	food.position.x = x
	food.position.y = y
	food_shown += 1
	food_list.append(food)
	add_child(food)

func _on_food_timer_timeout():
	var food_left = max_food - food_shown
	for i in range(0, food_left):
		_instatiate_food()

func _on_diamond_eaten(body):
	if body.name == "playable_character":
		$point_gained.play()
		food_shown -=1
		score += 1
		$score.text = "Score: " + str(score)

func _on_playable_character_hit():
	$game_over_sound.play()
	$background_music.stop()
	$game_over_hud._show()
	$score.text = "Score: " + str(0)
	_clean_holes_and_triangles()

func _clean_holes_and_triangles():
	for item in active_enemies:
		item.hide()
		item.set_deferred("disabled", true)
		item.queue_free()
	active_enemies = []
	for item in holes:
		item.hide()
		item.set_deferred("disabled", true)
		item.queue_free()
	holes = []
	for item in food_list:
		item.hide()
		item.set_deferred("disabled", true)
		item.queue_free()
	food_list = []
	holes_position = []
	$playable_character.hide()
	$score.hide()
	$food_timer.stop()
	$enemies_timer.stop()

func _on_enemies_timer_timeout():
	if (active_enemies.size() < max_triangles):
		_show_triangle()


func _on_back_to_menu_pressed():
	$game_over_hud._hide()
	$welcome_screen._show()
