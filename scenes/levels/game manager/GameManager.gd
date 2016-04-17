
extends Node2D

var num_tiles = 0;
var jump = true;
const width = 8;
const height = 8;
var left_adjust = false;
var start = false;
export var generate = true;

func _ready():
	set_process(generate);
	randomize();

func _process(delta):
	if (num_tiles == 0):
		var rebel = preload("res://scenes/rebels/Rebels.scn").instance();
		rebel.random_move = true;
		rebel.set_pos(get_pos());
		rebel.width = 0;
		rebel.height = 0;
		rebel.left_adjust = false;
		add_child(rebel);
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
			var star = Sprite.new();
			star.set_texture(preload("res://scenes/levels/Capital.tex"));
			star.set_pos(get_pos());
			add_child(star);
			start = true;
		if (num_tiles == (width * height) - 1):
			var rebel = preload("res://scenes/rebels/Rebels.scn").instance();
			rebel.set_pos(get_pos());
			rebel.width = width - 1;
			rebel.height = height - 1;
			rebel.left_adjust = left_adjust;
			add_child(rebel);
		
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
