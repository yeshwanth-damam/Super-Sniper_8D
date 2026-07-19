extends Node
## Central audio settings service.
##
## Scenes ask this service for bus-volume changes; they do not modify audio
## buses individually. This is ready for an AudioStream-player pool later.

const MASTER_BUS := &"Master"
const MUSIC_BUS := &"Music"
const SFX_BUS := &"SFX"


func _ready() -> void:
	apply_saved_volumes()


func apply_saved_volumes() -> void:
	var settings: Dictionary = SaveManager.get_value(&"settings", {})
	set_volume(MASTER_BUS, float(settings.get("master_volume", 1.0)))
	set_volume(MUSIC_BUS, float(settings.get("music_volume", 1.0)))
	set_volume(SFX_BUS, float(settings.get("sfx_volume", 1.0)))


func set_volume(bus_name: StringName, linear_volume: float) -> void:
	var bus_index := AudioServer.get_bus_index(bus_name)
	if bus_index == -1:
		return

	AudioServer.set_bus_volume_db(bus_index, linear_to_db(clampf(linear_volume, 0.0, 1.0)))
