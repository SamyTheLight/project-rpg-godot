extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	change_scenes()


func _on_cliffside_exit_point_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		global.transtition_scene = true


func _on_cliffside_exit_point_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		global.transtition_scene = false

func change_scenes():
	if global.transition_scene == true:
		if global.current_scene == "cliffside":
			get_tree().change_scene_to_file("res://scenes/cliffside.tscn")
			global.finish_changescene()
