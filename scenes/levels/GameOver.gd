
extends Label

var delta_t = 5.5;

func _ready():
	set_fixed_process(true);

func _fixed_process(delta):
	delta_t -= delta;
	set_size(get_viewport_rect().size);
	if (delta_t < 0):
		get_node("/root/GlobalManager")._goto_title();