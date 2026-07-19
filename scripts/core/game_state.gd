extends Node
## Session-scoped state shared by game systems.
##
## Persistent player data belongs to SaveManager. This service intentionally
## holds only state that should be reset when a session ends.

signal mission_selected(mission_id: StringName)

var selected_mission_id: StringName = &""


func select_mission(mission_id: StringName) -> void:
	if selected_mission_id == mission_id:
		return

	selected_mission_id = mission_id
	mission_selected.emit(selected_mission_id)


func clear_session() -> void:
	selected_mission_id = &""
