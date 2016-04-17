
extends CheckButton

func _ready():
	if (OS.is_window_fullscreen() == true):
		set_pressed(true);

func _on_CheckButton_toggled( pressed ):
	OS.set_window_fullscreen(pressed);
