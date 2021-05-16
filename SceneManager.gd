extends Node2D

var next_scene = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func transition_to_scene(new_scene: String):
	next_scene = new_scene
	$ScreenTransition.fade_screen_out()
	
func finished_fading():
	$CurrentScene.get_child(0).queue_free()
	
	var scene = load(next_scene)
	$CurrentScene.add_child(scene.instance())
	
	$ScreenTransition.fade_screen_normal()

