extends CanvasLayer

func _ready():
	_hide()

func _hide():
	$game_over.visible = false
	$new_game.visible = false
	$back_to_menu.visible = false

func _show():
	$game_over.visible = true
	$new_game.visible = true
	$back_to_menu.visible = true
