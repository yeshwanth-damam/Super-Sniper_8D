extends Node
## Application composition root.
##
## Autoload managers initialize before this scene. Bootstrap stays intentionally
## small and selects the first presentation scene after the engine is ready.


func _ready() -> void:
	# Changing scenes while this node is entering the tree attempts to remove
	# Bootstrap too early. Deferring completes the initial scene lifecycle first.
	SceneManager.call_deferred(&"go_to_main_menu")
