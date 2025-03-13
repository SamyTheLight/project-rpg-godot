extends Node

var current_scene = "world" # world cliff_side
var transition_scene = false

var player_exit_cliffside_posx = 0
var player_exit_cliffside_posy = 0

var player_start_posx = 0
var player_start_posy = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func finish_changescene():
	if transition_scene == true:
		transition_scene = false
		if current_scene == "world":
			current_scene = "cliff_side"
		else:
			current_scene = "world"
