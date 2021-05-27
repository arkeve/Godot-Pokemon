extends Node2D

var next_scene = null
var player_location = Vector2(0, 0)
var player_direction = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func transition_to_scene(new_scene: String, spawn_location: Vector2, spawn_direction: Vector2):
	next_scene = new_scene
	player_location = spawn_location
	player_direction = spawn_direction
	$ScreenTransition/AnimationPlayer.play("FadeToBlack")
	
func finished_fading():
	$CurrentScene.get_child(0).queue_free()
	$CurrentScene.add_child(load(next_scene).instance())
	var player = get_node("CurrentScene").get_children().back().find_node("Player")
	player.set_spawn(player_location, player_direction)
	$ScreenTransition/AnimationPlayer.play("FadeToNormal")
