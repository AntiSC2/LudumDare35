
extends Button

func _ready():
	set_fixed_process(true);

func _on_Button_pressed():
	var GM = get_node("/root/GlobalManager");
	GM._start();

func _fixed_process(delta):
	var f = rand_range(0, 100);
	if (f > 99):
		var b = preload("res://scenes/rebels/TitleEnemy.scn").instance();
		b.set_pos(Vector2(rand_range(700, get_viewport_rect().size.x), 0));
		get_node("/root/Title").add_child(b);