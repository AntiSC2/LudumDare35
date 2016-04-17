
extends StaticBody2D

var width = 0;
var height = 0;
var left_adjust = false;
var random_move = false;
var skip = false;

func _ready():
	add_to_group("enemy");

func _move_ul():
	if (left_adjust == true):
		set_pos(get_pos() + Vector2(-104, -180));
		left_adjust = false;
		height -= 1;
	else:
		set_pos(get_pos() + Vector2(-104, -180));
		width -= 1;
		height -= 1;
		left_adjust = true;

func _move_ur():
	if (left_adjust == true):
		set_pos(get_pos() + Vector2(104, -180));
		left_adjust = false;
		height -= 1;
		width += 1;
	else:
		set_pos(get_pos() + Vector2(104, -180));
		height -= 1;
		left_adjust = true;

func _move_r():
	set_pos(get_pos() + Vector2(208, 0));
	width += 1;

func _move_dr():
	if (left_adjust == true):
		set_pos(get_pos() + Vector2(104, 180));
		left_adjust = false;
		height += 1;
		width += 1;
	else:
		set_pos(get_pos() + Vector2(104, 180));
		height += 1;
		left_adjust = true;

func _move_dl():
	if (left_adjust == true):
		set_pos(get_pos() + Vector2(-104, 180));
		left_adjust = false;
		height += 1;
	else:
		set_pos(get_pos() + Vector2(-104, 180));
		width -= 1;
		height += 1;
		left_adjust = true;

func _move_l():
	set_pos(get_pos() + Vector2(-208, 0));
	width -= 1;

func _move_up():
	if(left_adjust == true):
		_move_ul();
	else:
		_move_ur();

func _move_down():
	if(left_adjust == true):
		_move_dl();
	else:
		_move_dr();

func _process_turn():
	if (skip == true):
		skip = false;
	else:
		var tiles = get_tree().get_nodes_in_group("Tiles");
		if (tiles[width + (height * 8)].owned == true):
			skip = true;
			tiles[width + (height * 8)].owned = false;
			get_node("/root/GlobalManager").tiles_owned -= 1;
		elif (tiles[width + (height * 8)].rebel != true):
			tiles[width + (height * 8)].rebel = true;
			get_node("/root/GlobalManager").rebels_tiles += 1;
		var f = round(rand_range(0, 100));
		if (random_move == false):
			if (f > 25 && skip == false): 
				if (width < 4):
					_move_r();
				elif (width > 4):
					_move_l();
				elif (height > 3):
					_move_up();
				elif (height < 3):
					_move_down();
				else:
					get_node("/root/GlobalManager")._gameover();
			elif (height < 3 && f > 20 && height > 0 && skip == false):
				_move_up();
			elif (height > 3 && f > 20 && height < 7 && skip == false):
				_move_down();
			elif (width < 3 && width > 0 && skip == false):
				_move_l();
			elif (width > 3 && width < 7 && skip == false):
				_move_l();
		else:
			if (f < 20):
				_move_l();
			elif (f < 40):
				_move_ul();
			elif (f < 60):
				_move_dl();
			elif (f < 80):
				_move_dr();
			elif (f < 90):
				_move_ur();
			else:
				_move_r();
			while (width < 0):
				_move_r();
			while (width > 7):
				_move_l();
			while (height < 0):
				_move_down();
			while (height > 7):
				_move_up();