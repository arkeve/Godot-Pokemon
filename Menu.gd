extends CanvasLayer

const PokemonPartyScreen = preload("res://PokemonPartyScreen.tscn")

var selected_option: int = 0
enum ScreenLoaded { JUST_MENU, PARTY_SCREEN, SETTINGS,  }
var screen_loaded = ScreenLoaded.JUST_MENU

onready var select_arrow = $Control/NinePatchRect/SelectArrow
onready var menu = $Control

# Called when the node enters the scene tree for the first time.
func _ready():
	menu.visible = false
	select_arrow.rect_position.y = 10 + (selected_option % 6) * 14

func load_party_screen():
	menu.visible = false
	screen_loaded = ScreenLoaded.PARTY_SCREEN
	var party_screen = PokemonPartyScreen.instance()
	add_child(party_screen)

func _unhandled_input(event):
	match screen_loaded:
		ScreenLoaded.JUST_MENU:
			if event.is_action_pressed("menu"):
				var player = get_parent().get_node("CurrentScene").get_children().back().find_node("Player")
				if menu.visible:
					player.set_physics_process(true)
					menu.visible = !menu.visible
				else:
					if !player.is_moving:
						player.set_physics_process(false)
						menu.visible = !menu.visible
			
			if menu.visible:
				if event.is_action_pressed("ui_up"):
					if selected_option == 0:
						selected_option = 5
					else:
						selected_option -=1
					select_arrow.rect_position.y = 10 + (selected_option % 6) * 14
				elif event.is_action_pressed("ui_down"):
					selected_option +=1
					select_arrow.rect_position.y = 10 + (selected_option % 6) * 14
				elif event.is_action_pressed("z"):
					get_parent().transition_to_party_screen()
		ScreenLoaded.PARTY_SCREEN:
			pass
