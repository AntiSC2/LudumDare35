
extends Node2D

var num_tiles = 0;
var jump = true;
const width = 8;
const height = 8;
var left_adjust = false;
var start = false;

func _ready():
	set_process(true);

func _process(delta):
	if (num_tiles < width * height):
		var tile = preload("res://scenes/levels/Tile.scn").instance();
		tile.index_list = num_tiles;
		tile.left_adjust = left_adjust;
		
		if (num_tiles >= ((width * height) / 2) - (width / 2) && start == false):
			tile.owned = true;
			tile.army = true;
			var army = preload("res://scenes/player/Player.scn").instance();
			army.set_pos(get_pos());
			add_child(army);
			start = true;
		
		tile.set_pos(get_pos());
		add_child(tile);
		
		set_pos(get_pos() + Vector2(208, 0));
		if (get_pos().x >= width * 208):
			if (left_adjust == false):
				set_pos(Vector2(104, get_pos().y + 180))
				left_adjust = true;
			else:
				set_pos(Vector2(0, get_pos().y + 180))
				left_adjust = false;
		
		num_tiles += 1;
	else:
		set_pos(Vector2(0, 0));
		set_process(false);
