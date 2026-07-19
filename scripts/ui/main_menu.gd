extends Control

## Main menu for Super Sniper 8D.
##
## Navigation remains in SceneManager and cross-screen messages travel through
## UIManager, so this presentation script does not own global game state.

func _ready() -> void:
	var play_button: Button = $Buttons/PlayButton
	if play_button:
		play_button.grab_focus()
	UIManager.notice_requested.connect(_on_notice_requested)


func _on_play_button_pressed() -> void:
	UIManager.show_notice("Campaign missions are coming in the gameplay milestone.")


func _on_weapons_button_pressed() -> void:
	UIManager.show_notice("The weapon inventory will be available in a future milestone.")


func _on_settings_button_pressed() -> void:
	UIManager.show_notice("Settings will be available in a future milestone.")


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_notice_requested(message: String) -> void:
	$StatusLabel.text = message
