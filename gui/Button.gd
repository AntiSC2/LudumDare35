
extends Button

func _on_Button_pressed():
	var GM = get_node("/root/GlobalManager");
	GM._start();