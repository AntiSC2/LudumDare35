
extends TextureButton

func _ready():
	pass

func _on_Next_pressed():
	var GM = get_node("/root/GlobalManager");
	if (GM.moves <= 0 && GM.expands <= 0):
		if (get_tree().get_nodes_in_group("enemy").empty() == true):
			GM._victory();
		get_tree().call_group(0, "enemy", "_process_turn");
		GM.moves = 1;
		GM.expands = 1;
		GM.turns += 1;