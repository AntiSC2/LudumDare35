
extends StaticBody2D

var selected = false;
var left_adjust = false;
var hold = false;

func _ready():
	add_to_group("Player");
	set_fixed_process(true);	

func _fixed_process(delta):
	pass