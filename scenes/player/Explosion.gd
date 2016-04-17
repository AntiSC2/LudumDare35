
extends StaticBody2D

var image_speed = 0.1;
var delta_image = 0;

func _ready():
	add_to_group("Explosion");
	set_fixed_process(true);
	get_node("SamplePlayer2D").play("Explosion");

func _fixed_process(delta):
	delta_image = delta + delta_image;
	if (delta_image > image_speed):
		delta_image = 0;
		if (get_node("Sprite").get_frame() < 3):
			get_node("Sprite").set_frame(get_node("Sprite").get_frame() + 1);
		else:
			queue_free();