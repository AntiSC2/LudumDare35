
extends KinematicBody2D

var speed = 60;
var image_speed = 0.15;
var delta_image = 0;
var direction = 0;

func _ready():
	speed = rand_range(50, 100);
	direction = rand_range(-0.4, 0.4)
	set_fixed_process(true);

func _fixed_process(delta):
	if (get_node("/root/GlobalManager").Battle == true):
		delta_image = delta + delta_image;
		if (delta_image > image_speed):
			if (get_node("Sprite").get_frame() < 3):
				get_node("Sprite").set_frame(get_node("Sprite").get_frame() + 1);
			else:
				get_node("Sprite").set_frame(0);
			delta_image = 0;
		var motion = Vector2(direction, 1) * speed * delta;
		motion = move(motion);
		if (get_pos().x < 16):
			set_pos(Vector2(16, get_pos().y));
		elif (get_pos().x > get_viewport_rect().size.x - 16):
			set_pos(Vector2(get_viewport_rect().size.x - 16, get_pos().y));
		if (motion != Vector2(0, 0)):
			var b = preload("res://scenes/rebels/Blood.scn").instance();
			revert_motion();
			b.set_pos(get_pos() + get_parent().get_pos());
			get_node("/root/Root").add_child(b);
			b = null;
			queue_free();
		if (is_colliding()):
			revert_motion();
			var b = preload("res://scenes/rebels/Blood.scn").instance();
			b.set_pos(get_pos() + get_parent().get_pos());
			get_node("/root/Root").add_child(b);
			b = null;
			queue_free();
		if (get_pos().y > get_viewport_rect().size.y):
			get_node("/root/GlobalManager").army_health -= 1;
			if (get_node("/root/GlobalManager").army_health < 1):
				get_node("/root/GlobalManager")._gameover();
			queue_free();
	else:
		queue_free();