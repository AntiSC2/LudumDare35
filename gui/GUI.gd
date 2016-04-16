
extends TextureButton

func _ready():
	pass

func _on_Next_pressed():
	var GM = get_node("/root/GlobalManager");
	if (GM.moves <= 0 && GM.expands <= 0):
		GM.moves = 1;
		GM.expands = 1;
