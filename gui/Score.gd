
extends Label

func _ready():
	set_text(get_text() + var2str(get_node("/root/GlobalManager").turns));