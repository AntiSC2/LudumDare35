
extends Node;

var current_scene = null;
var index_list = 0;
var moves = 1;
var expands = 1;
var hold = false;
var Battle = false;
var supply = 0;
var rebels_tiles = 0;
var turns = 0;
var army_health = 2;
var tiles_owned = 1;

func _ready():
	var root = get_tree().get_root();
	current_scene = root.get_child(root.get_child_count() - 1);

func _start():
	index_list = 0;
	moves = 1;
	expands = 1;
	hold = false;
	Battle = false;
	supply = 0;
	rebels_tiles = 0;
	turns = 0;
	army_health = 2;
	tiles_owned = 1;
	call_deferred("_start_real");


func _start_real():
	current_scene.queue_free();
	var map = preload("res://scenes/levels/Level1.scn");
	current_scene = map.instance();
	get_tree().get_root().add_child(current_scene);
	get_tree().set_current_scene(current_scene);

func _gameover():
	call_deferred("_go_gameover");

func _go_gameover():
	current_scene.queue_free();
	var score = preload("res://scenes/levels/GameOver.scn");
	current_scene = score.instance();
	get_tree().get_root().add_child(current_scene);
	get_tree().set_current_scene(current_scene);

func _goto_title():
	call_deferred("_goto_real_title");

func _move_to_battle():
	supply = 10 * rebels_tiles;
	Battle = true;

func _move_to_map():
	Battle = false;

func _victory():
	call_deferred("_goto_score");

func _goto_score():
	current_scene.queue_free();
	var score = preload("res://scenes/levels/score.scn");
	current_scene = score.instance();
	get_tree().get_root().add_child(current_scene);
	get_tree().set_current_scene(current_scene);

func _goto_real_title():
	current_scene.queue_free();
	var score = preload("res://scenes/levels/Title.scn");
	current_scene = score.instance();
	get_tree().get_root().add_child(current_scene);
	get_tree().set_current_scene(current_scene);