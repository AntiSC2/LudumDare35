
extends StaticBody2D

var selected = false;
var left_adjust = false;
var hold = false;

func _ready():
	add_to_group("Player");
	set_fixed_process(true);

func _fixed_process(delta):
	var rebels = get_tree().get_nodes_in_group("enemy");
	var a = 0;
	for i in rebels:
		if (i.get_pos().x >= get_pos().x - 24 && i.get_pos().x <= get_pos().x + 24 && i.get_pos().y >= get_pos().y - 24 && i.get_pos().y <= get_pos().y + 24):
			i.queue_free();
			get_node("/root/GlobalManager")._move_to_battle();
		a += 1;