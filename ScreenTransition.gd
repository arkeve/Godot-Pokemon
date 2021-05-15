extends CanvasLayer

onready var anim_player = $AnimationPlayer

func _ready():
	pass # Replace with function body.

func fade_screen_out():
	anim_player.play("FadeToBlack")
	
func fade_screen_normal():
	anim_player.play("FadeToNormal")
