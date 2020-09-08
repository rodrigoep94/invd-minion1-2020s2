extends Node2D	

export (PackedScene) var Food	
var score = 0
var max_food = 10
var food_shown = 0

func _ready():
	_new_game()
	
func _new_game():
	_show_character()
	_spawn_food()
	
func _show_character():
	$playable_character.position = Vector2(get_viewport().size.x/2, get_viewport().size.y/2)
	
func _spawn_food():
	for i in range(0, max_food):
		_instatiate_food()

func _instatiate_food():
	var screen_size = get_viewport().get_visible_rect().size
	var food = Food.instance()
	randomize()
	var x = rand_range(0,screen_size.x)
	randomize()
	var y = rand_range(0,screen_size.y)
	food.position.x = x
	food.position.y = y
	food_shown += 1
	add_child(food)

func _on_food_timer_timeout():
	print("Termino timer comida")


func _on_diamond_point_body_entered(body):
	print("pepe")
