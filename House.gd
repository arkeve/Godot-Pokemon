extends StaticBody2D

onready var door_sprite = $Door/Sprite
onready var door_anim_player = $Door/AnimationPlayer

var player_near_door: bool = false

func _ready():
	door_sprite.visible = false
	get_tree().current_scene.find_node("Player").connect("player_entering_door_signal", self, "enter_door")
	get_tree().current_scene.find_node("Player").connect("player_entered_door_signal", self, "close_door")

func enter_door():
	if player_near_door:
		door_anim_player.play("OpenDoor")

func close_door():
	if player_near_door:
		door_anim_player.play("CloseDoor")

func _on_Door_body_entered(body):
	player_near_door = true

func _on_Door_body_exited(body):
	player_near_door = false
