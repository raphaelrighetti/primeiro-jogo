extends Control


func _process(_delta):
	$CanvasLayer/Label.text = "Moedas: " + str(GlobalVar.coins)
