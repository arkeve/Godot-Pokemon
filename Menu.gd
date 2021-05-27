extends CanvasLayer

var selected_option: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Control.visible = false
	$Control/NinePatchRect/TextureRect.rect_position.y = 10 + (selected_option % 6) * 14
	
func _unhandled_input(event):
	if event.is_action_pressed("menu"):
		var player = get_parent().get_node("CurrentScene").get_children().back().find_node("Player")
		if $Control.visible:
			player.set_physics_process(true)
			$Control.visible = !$Control.visible
		else:
			if !player.is_moving:
				player.set_physics_process(false)
				$Control.visible = !$Control.visible
	
	if $Control.visible:
		if event.is_action_pressed("ui_up"):
			if selected_option == 0:
				selected_option = 5
			else:
				selected_option -=1
			$Control/NinePatchRect/TextureRect.rect_position.y = 10 + (selected_option % 6) * 14
		elif event.is_action_pressed("ui_down"):
			selected_option +=1
			$Control/NinePatchRect/TextureRect.rect_position.y = 10 + (selected_option % 6) * 14
