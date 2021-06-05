extends Node2D


enum Option { FIRST_SLOT, SECOND_SLOT, THIRD_SLOT, FOURTH_SLOT, FIFTH_SLOT, SIXTH_SLOT, CANCEL }

onready var options: Dictionary = {
	Option.FIRST_SLOT: $MainPokemonSlot/Background,
	Option.SECOND_SLOT: $SecondPokemonSlot/Background,
	Option.THIRD_SLOT: $ThirdPokemonSlot/Background,
	Option.FOURTH_SLOT: $FourthPokemonSlot/Background,
	Option.FIFTH_SLOT: $FifthPokemonSlot/Background,
	Option.SIXTH_SLOT: $SixthPokemonSlot/Background,
	Option.CANCEL: $CancelButton,
}

var selected_option: int = Option.FIRST_SLOT

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
			Option.CANCEL:
				Utils.get_scene_manager().transition_exit_party_screen()
		
