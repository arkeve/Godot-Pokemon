tool

extends Area2D

export(String, FILE) var next_scene_path = ""
onready var sprite = $Sprite
onready var anim_player = $AnimationPlayer

var player_near_door: bool = false

func _ready():
	sprite.visible = false
	var player = find_parent("CurrentScene").get_children().back().find_node("Player")
	player.connect("player_entering_door_signal", self, "enter_door")
	player.connect("player_entered_door_signal", self, "close_door")


func _get_configuration_warning():
	if next_scene_path == "":
		return "next_scene_path must be set for the door to work."
	else:
		return ""

func enter_door():
	if player_near_door:
		anim_player.play("OpenDoor")

func close_door():
	if player_near_door:
		anim_player.play("CloseDoor")
	
func door_closed():
	get_node(NodePath("/root/SceneManager")).transition_to_scene(next_scene_path)

func _on_Door_body_entered(body):
	player_near_door = true

func _on_Door_body_exited(body):
	player_near_door = false

