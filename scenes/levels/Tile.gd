
extends StaticBody2D

export var owned = false;
var army = false;
var selected = false;
var left_adjust = false;
var index_list = 0;
var mouse_over = false;
var rebel = false;

func _ready():
	add_to_group("Tiles");
	set_fixed_process(true);
	if (owned == true):
		get_node("Sprite").set_modulate(Color(1, 1, 1));

func _find_neighbour():
	var GM = get_node("/root/Root");
	var max_w = GM.width;
	var max_h = GM.height;
	var check_l = false;
	var check_r = false;
	var check_ur = false;
	var check_ul = false;
	var check_dr = false;
	var check_dl = false;
	
	var temp = index_list;
	while (temp >= max_w):
		temp -= max_w;
	
	if (temp > 0):
		check_l = true;
	if (temp < (max_w - 1)):
		check_r = true;
	
	if (index_list - max_w - 1 >= 0 && left_adjust == false):
		check_ur = true;
		
		if (check_l == true):
			check_ul = true;
	elif (index_list - max_w >= 0 && left_adjust == true):
		check_ul = true;
		
		if (check_r == true):
			check_ur = true;
	
	if (index_list + max_w + 1 < max_w * max_h && left_adjust == true):
		check_dl = true;
		
		if (check_r == true):
			check_dr = true;
	elif (index_list + max_w < max_w * max_h && left_adjust == false):
		check_dr = true;
		
		if (check_l == true):
			check_dl = true;
	
	var tiles = get_tree().get_nodes_in_group("Tiles");
	if (left_adjust == true):
		if (check_l == true):
			if (tiles[index_list - 1].owned == true):
				return true;
		if (check_r == true):
			if(tiles[index_list + 1].owned == true):
				return true;
		if (check_ul == true):
			if (tiles[index_list - max_w].owned == true):
				return true;
		if (check_ur == true):
			if (tiles[index_list - (max_w - 1)].owned == true):
				return true;
		if (check_dl == true):
			if (tiles[index_list + max_w].owned == true):
				return true;
		if(check_dr == true):
			if (tiles[index_list + max_w + 1].owned == true):
				return true;
	else:
		if (check_l == true):
			if (tiles[index_list - 1].owned == true):
				return true;
		if (check_r == true):
			if(tiles[index_list + 1].owned == true):
				return true;
		if (check_ul == true):
			if (tiles[index_list - max_w - 1].owned == true):
				return true;
		if (check_ur == true):
			if (tiles[index_list - max_w].owned == true):
				return true;
		if (check_dl == true):
			if (tiles[index_list + (max_w - 1)].owned == true):
				return true;
		if(check_dr == true):
			if (tiles[index_list + max_w].owned == true):
				return true;
	
	return false;

func _find_army():
	var GM = get_node("/root/Root");
	var max_w = GM.width;
	var max_h = GM.height;
	var check_l = false;
	var check_r = false;
	var check_ur = false;
	var check_ul = false;
	var check_dr = false;
	var check_dl = false;
	
	var temp = index_list;
	while (temp >= max_w):
		temp -= max_w;
	
	if (temp > 0):
		check_l = true;
	if (temp < (max_w - 1)):
		check_r = true;
	
	if (index_list - max_w - 1 >= 0 && left_adjust == false):
		check_ur = true;
		
		if (check_l == true):
			check_ul = true;
	elif (index_list - max_w >= 0 && left_adjust == true):
		check_ul = true;
		
		if (check_r == true):
			check_ur = true;
	
	if (index_list + max_w + 1 < max_w * max_h && left_adjust == true):
		check_dl = true;
		
		if (check_r == true):
			check_dr = true;
	elif (index_list + max_w < max_w * max_h && left_adjust == false):
		check_dr = true;
		
		if (check_l == true):
			check_dl = true;
	
	var tiles = get_tree().get_nodes_in_group("Tiles");
	if (left_adjust == true):
		if (check_l == true):
			if (tiles[index_list - 1].army == true):
				tiles[index_list - 1].army = false;
				tiles[index_list - 1].get_node("Sprite").set_modulate(Color(0, 0, 0));
				return true;
		if (check_r == true):
			if(tiles[index_list + 1].army == true):
				tiles[index_list + 1].army = false;
				tiles[index_list + 1].get_node("Sprite").set_modulate(Color(0, 0, 0));
				return true;
		if (check_ul == true):
			if (tiles[index_list - max_w].army == true):
				tiles[index_list - max_w].army = false;
				tiles[index_list - max_w].get_node("Sprite").set_modulate(Color(0, 0, 0));
				return true;
		if (check_ur == true):
			if (tiles[index_list - (max_w - 1)].army == true):
				tiles[index_list - (max_w - 1)].army = false;
				tiles[index_list - (max_w - 1)].get_node("Sprite").set_modulate(Color(0, 0, 0));
				return true;
		if (check_dl == true):
			if (tiles[index_list + max_w].army == true):
				tiles[index_list + max_w].army = false;
				tiles[index_list + max_w].get_node("Sprite").set_modulate(Color(0, 0, 0));
				return true;
		if(check_dr == true):
			if (tiles[index_list + max_w + 1].army == true):
				tiles[index_list + max_w + 1].army = false;
				tiles[index_list + max_w + 1].get_node("Sprite").set_modulate(Color(0, 0, 0));
				return true;
	else:
		if (check_l == true):
			if (tiles[index_list - 1].army == true):
				tiles[index_list - 1].army = false;
				tiles[index_list - 1].get_node("Sprite").set_modulate(Color(0, 0, 0));
				return true;
		if (check_r == true):
			if(tiles[index_list + 1].army == true):
				tiles[index_list + 1].army = false;
				tiles[index_list + 1].get_node("Sprite").set_modulate(Color(0, 0, 0));
				return true;
		if (check_ul == true):
			if (tiles[index_list - max_w - 1].army == true):
				tiles[index_list - max_w - 1].army = false;
				tiles[index_list - max_w - 1].get_node("Sprite").set_modulate(Color(0, 0, 0));
				return true;
		if (check_ur == true):
			if (tiles[index_list - max_w].army == true):
				tiles[index_list - max_w].army = false;
				tiles[index_list - max_w].get_node("Sprite").set_modulate(Color(0, 0, 0));
				return true;
		if (check_dl == true):
			if (tiles[index_list + (max_w - 1)].army == true):
				tiles[index_list + (max_w - 1)].army = false;
				tiles[index_list + (max_w - 1)].get_node("Sprite").set_modulate(Color(0, 0, 0));
				return true;
		if(check_dr == true):
			if (tiles[index_list + max_w].army == true):
				tiles[index_list + max_w].army = false;
				tiles[index_list + max_w].get_node("Sprite").set_modulate(Color(0, 0, 0));
				return true;
	
	return false;

func _fixed_process(delta):
	var GM = get_node("/root/GlobalManager");
	if (mouse_over == true && army == false && Input.is_action_pressed("select") && GM.moves > 0 && GM.hold == false):
		GM.hold = true;
		if (_find_army() == true):
			if (rebel == true):
				rebel = false;
				GM.rebels_tiles -= 1;
			army = true;
			GM.moves -= 1;
			get_node("/root/Root/Army").set_pos(get_pos());
			get_node("Sprite").set_modulate(Color(0.4, 1, 0.4));
	elif (selected == false && owned == false && mouse_over == true && Input.is_action_pressed("select") && GM.expands > 0 && GM.hold == false):
		GM.hold = true;
		if (_find_neighbour() == true):
			GM.expands -= 1;
			GM.tiles_owned += 1;
			if (rebel == true):
				rebel = false;
				GM.rebels_tiles -= 1;
			GM.army_health += 2;
			owned = true;
	elif (Input.is_action_pressed("select") == false && GM.hold == true):
		GM.hold = false;
	
	if (rebel == true):
		get_node("Sprite").set_modulate(Color(1, 0, 0));
	elif (mouse_over == false && selected == false && owned == true):
		get_node("Sprite").set_modulate(Color(0.4, 0.4, 0.8));
	elif (mouse_over == true && selected == false && owned == true):
		get_node("Sprite").set_modulate(Color(0.6, 0.6, 1));
	elif (mouse_over == true && selected == false && army == true):
		get_node("Sprite").set_modulate(Color(0.4, 1, 0.4));
	elif (mouse_over == false && selected == false && army == true):
		get_node("Sprite").set_modulate(Color(0.2, 1, 0.5));
	elif (mouse_over == true):
		get_node("Sprite").set_modulate(Color(0.3, 0.3, 0.3));
	else:
		get_node("Sprite").set_modulate(Color(0, 0, 0));

func _on_Tile_mouse_enter():
	mouse_over = true;

func _on_Tile_mouse_exit():
	mouse_over = false;