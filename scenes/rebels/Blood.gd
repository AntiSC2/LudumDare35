
extends Sprite

var image_speed = 0.15;
var delta_image = 0;

func _ready():
	add_to_group("Blood");
	set_fixed_process(true);

func _fixed_process(delta):
	var GM = get_node("/root/GlobalManager");
	if (GM.Battle == true):
		delta_image += delta;
		if (delta_image > image_speed):
			if (get_frame() < 3):
				set_frame(get_frame() + 1);
			delta_image = 0;
	else:
		queue_free();