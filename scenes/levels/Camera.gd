
extends Camera2D

var mouse_start = Vector2(0, 0);
var drag = false;

func _ready():
	set_process_input(true);

func _input(ev):
	var GM = get_node("/root/GlobalManager");
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
		get_node("Next/Label").set_text("Move army");
	elif (GM.expands > 0):
		get_node("Next/Label").set_text("Expand or do tile action");
	else:
		get_node("Next/Label").set_text("Next turn");
	if (get_pos().x < -128):
		set_pos(get_pos() - Vector2(get_pos().x + 128, 0));
	if (get_pos().y < -128):
		set_pos(get_pos() - Vector2(0, get_pos().y + 128));
	if (get_pos().x > 600):
		set_pos(Vector2(600, get_pos().y));
	if (get_pos().y > 800):
		set_pos(Vector2(get_pos().x, 800));