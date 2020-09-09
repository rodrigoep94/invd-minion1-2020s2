extends CanvasLayer


func _hide():
	$difficulty_1.visible = false
	$difficulty_2.visible = false
	$difficulty_3.visible = false
	$difficulty_label.visible = false

func _show():
	$difficulty_1.visible = true
	$difficulty_2.visible = true
	$difficulty_3.visible = true
	$difficulty_label.visible = true
