extends Node
## Owns high-level scene navigation.
##
## Gameplay systems request navigation here instead of loading scenes directly,
## keeping scene paths centralized and making transitions replaceable later.

const MAIN_MENU_SCENE := "res://scenes/menu/MainMenu.tscn"

var _is_transitioning := false


func go_to_main_menu() -> void:
	change_scene(MAIN_MENU_SCENE)


func change_scene(scene_path: String) -> void:
	if _is_transitioning:
		return

	if not ResourceLoader.exists(scene_path):
		push_error("SceneManager: scene does not exist: %s" % scene_path)
		return

	_is_transitioning = true
	get_tree().change_scene_to_file(scene_path)
	_is_transitioning = false
