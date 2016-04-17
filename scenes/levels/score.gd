
extends Node2D

func _ready():
	set_fixed_process(true);

func _fixed_process(delta):
	get_node("Quit").set_pos(get_viewport_rect().size - Vector2(256, 128));