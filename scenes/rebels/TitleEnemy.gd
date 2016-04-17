
extends Sprite

var speed = 60;
var image_speed = 0.15;
var delta_image = 0;
var direction = 0;

func _ready():
	speed = rand_range(50, 100);
	direction = rand_range(-0.4, 0.4)
	set_fixed_process(true);

func _fixed_process(delta):
	delta_image = delta + delta_image;
	if (delta_image > image_speed):
		if (get_frame() < 3):
			set_frame(get_frame() + 1);
		else:
			set_frame(0);
		delta_image = 0;
	var motion = Vector2(direction, 1) * speed * delta;
	set_pos(get_pos() + motion);
	if (get_pos().x < 640):
		set_pos(Vector2(640, get_pos().y));
	elif (get_pos().x > get_viewport_rect().size.x - 16):
		set_pos(Vector2(get_viewport_rect().size.x - 16, get_pos().y));
		
	if (get_pos().y > get_viewport_rect().size.y):
		queue_free();