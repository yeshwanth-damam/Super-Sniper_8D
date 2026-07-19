extends Control

## Main menu for Super Sniper 8D (Milestone 1).
## Only the Exit button performs an action for now; Play, Weapons and
## Settings are wired up so later milestones can hook their scenes in.

func _ready() -> void:
	var play_button: Button = $Buttons/PlayButton
	if play_button:
		play_button.grab_focus()


func _on_play_button_pressed() -> void:
	# Gameplay scene is added in Milestone 2.
	pass


func _on_weapons_button_pressed() -> void:
	# Weapon shop is added in a later milestone.
	pass


func _on_settings_button_pressed() -> void:
	# Settings screen is added in a later milestone.
	pass


func _on_exit_button_pressed() -> void:
	get_tree().quit()
