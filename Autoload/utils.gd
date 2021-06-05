extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_player():
	return get_node("/root/SceneManager/CurrentScene").get_children().back().find_node("Player")

func get_scene_manager():
	return get_node("/root/SceneManager")
