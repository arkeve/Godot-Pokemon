extends Node2D


onready var options: Dictionary = {
	0: $MainPokemonSlot/Background,
	1: $SecondPokemonSlot/Background,
	2: $ThirdPokemonSlot/Background,
	3: $FourthPokemonSlot/Background,
	4: $FifthPokemonSlot/Background,
	5: $SixthPokemonSlot/Background,
	6: $CancelButton,
}

var selected_option: int = 0

func unset_active_option():
	options[selected_option].frame = 0

func set_active_option():
	options[selected_option].frame = 1

func _ready():
	set_active_option()


func _input(event):
	if event.is_action_pressed("ui_down"):
		unset_active_option()
		selected_option = (selected_option + 1) % 7
		set_active_option()
	elif event.is_action_pressed("ui_up"):
		unset_active_option()
		if selected_option == 0:
			selected_option = 6
		else:
			selected_option = (selected_option - 1) % 7
		set_active_option()
	elif event.is_action_pressed("ui_left"):
		unset_active_option()
		selected_option = 0
		set_active_option()
	elif event.is_action_pressed("ui_right") and selected_option == 0:
		unset_active_option()
		selected_option = 1
		set_active_option()
	elif event.is_action_pressed("z"):
		match selected_option:
			6:
				get_parent().get_parent().transition_exit_party_screen()
		
