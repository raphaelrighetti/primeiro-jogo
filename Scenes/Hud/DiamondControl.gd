extends Control


func _process(_delta):
	$CanvasLayer/Label.text = "= " + str(GlobalVar.coins)
