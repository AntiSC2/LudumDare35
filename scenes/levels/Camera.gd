
extends Camera2D

var mouse_start = Vector2(0, 0);
var drag = false;

func _ready():
	set_process_input(true);
	set_process(true);

func _process(delta):
	var GM = get_node("/root/GlobalManager");
	if (GM.Battle == true):
		get_node("Health").set_hidden(false);
		get_node("Health").set_size(get_viewport_rect().size);
		get_node("Health").set_text("Health: " + var2str(GM.army_health));
		get_node("Next").set_hidden(true);
		get_node("Next").set_ignore_mouse(true);
		set_pos(Vector2(4100, 0));
		var f = rand_range(0, 100);
		if (f > 93 && GM.supply > 0):
			var temp_x = rand_range(0, get_viewport_rect().size.x);
			var rebels = preload("res://scenes/rebels/Enemy.scn").instance();
			rebels.set_pos(Vector2(temp_x, 0));
			add_child(rebels);
			GM.supply -= 1;
		elif (GM.supply < 1 && get_child_count() < 3):
			GM._move_to_map();
	else:
		get_node("Next").set_hidden(false);
		get_node("Health").set_hidden(true);
		get_node("Next").set_ignore_mouse(false);

func _input(ev):
	var GM = get_node("/root/GlobalManager");
	if (GM.Battle == false):
		if (ev.is_action_pressed("pan") && drag == false):
			mouse_start = get_pos() + ev.pos;
			drag = true;
		elif (ev.is_action_released("pan")):
			drag = false;
		if (ev.type == InputEvent.MOUSE_MOTION && drag == true):
			var mouse_motion = get_pos() + ev.pos;
			mouse_motion = mouse_start - mouse_motion;
			set_pos(get_pos() + mouse_motion);
		get_node("Next").set_pos(get_viewport_rect().size - get_node("Next").get_size());
		if (GM.moves > 0):
			get_node("Next/Label").release_focus();
			get_node("Next/Label").set_text("Move army");
		elif (GM.expands > 0):
			get_node("Next/Label").release_focus();
			get_node("Next/Label").set_text("Expand");
		else:
			get_node("Next/Label").grab_focus();
			get_node("Next/Label").set_text("Next turn");
		if (get_pos().x < -128):
			set_pos(get_pos() - Vector2(get_pos().x + 128, 0));
		if (get_pos().y < -128):
			set_pos(get_pos() - Vector2(0, get_pos().y + 128));
		if (get_pos().x > 600):
			set_pos(Vector2(600, get_pos().y));
		if (get_pos().y > 800):
			set_pos(Vector2(get_pos().x, 800));