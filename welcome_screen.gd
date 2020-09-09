extends CanvasLayer

export var dificulty = 1

func _ready():
	$dificulty_choser._hide()
	_show()

func _hide():
	$game_name.visible = false
	$start_game.visible = false
	$difficulty_btn.visible = false

func _show():
	$game_name.visible = true
	$start_game.visible = true
	$difficulty_btn.visible = true


func _on_difficulty_btn_pressed():
	_hide()
	$dificulty_choser._show()


func _on_difficulty_1_pressed():
	dificulty = 1
	$dificulty_choser._hide()
	_show()


func _on_difficulty_2_pressed():
	dificulty = 2
	$dificulty_choser._hide()
	_show()


func _on_difficulty_3_pressed():
	dificulty = 3
	$dificulty_choser._hide()
	_show()
