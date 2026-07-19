extends Node
## Cross-scene UI event boundary.
##
## Dedicated HUD, dialog, and loading-overlay scenes subscribe to these
## signals as they are introduced. Game systems never need to locate UI nodes.

signal notice_requested(message: String)
signal loading_visibility_changed(is_visible: bool)


func show_notice(message: String) -> void:
	notice_requested.emit(message)


func set_loading_visible(is_visible: bool) -> void:
	loading_visibility_changed.emit(is_visible)
