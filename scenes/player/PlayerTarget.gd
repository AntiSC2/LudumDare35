
extends Sprite

var cooldown = 0.5;
var hold = false;

func _ready():
	set_process(true);

func _process(delta):
	if (Input.is_action_pressed("escape") == true):
		get_node("/root/GlobalManager")._goto_title();
	var GM = get_node("/root/GlobalManager");
	if (GM.Battle == true):
		set_pos(get_viewport().get_mouse_pos() + get_node("/root/Root/Camera").get_pos());
		if (cooldown >= 0.1):
			cooldown -= delta;
		if (Input.is_action_pressed("select") == true && hold == false && cooldown < 0.1):
			hold = true;
			var s = preload("res://scenes/player/Explosion.scn").instance();
			s.set_pos(get_pos());
			get_node("/root/Root").add_child(s);
			cooldown = 0.5;
		elif (Input.is_action_pressed("select") == false && hold == true):
			hold = false;
	else:
		set_pos(Vector2(5000, 0));
		cooldown = 0.5;
		hold = false;