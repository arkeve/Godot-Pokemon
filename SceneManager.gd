extends Node2D

var next_scene = null
var player_location = Vector2(0, 0)
var player_direction = Vector2(0, 0)


enum TransitionType {
	NEW_SCENE, PARTY_SCREEN,
}
var transition_type = TransitionType.NEW_SCENE

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	
	
func transition_to_party_screen():
	$ScreenTransition/AnimationPlayer.play("FadeToBlack")
	transition_type = TransitionType.PARTY_SCREEN

func transition_to_scene(new_scene: String, spawn_location: Vector2, spawn_direction: Vector2):
	next_scene = new_scene
	player_location = spawn_location
	player_direction = spawn_direction
	transition_type = TransitionType.NEW_SCENE
	$ScreenTransition/AnimationPlayer.play("FadeToBlack")
	
func finished_fading():
	
	match transition_type:
		TransitionType.NEW_SCENE:
			$CurrentScene.get_child(0).queue_free()
			$CurrentScene.add_child(load(next_scene).instance())
			var player = get_node("CurrentScene").get_children().back().find_node("Player")
			player.set_spawn(player_location, player_direction)
		TransitionType.PARTY_SCREEN:
			$Menu.load_party_screen()
			$ScreenTransition/AnimationPlayer.play("FadeToNormal")
