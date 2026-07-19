extends Node
## Owns the local player-profile boundary.
##
## The first release stores a small JSON profile in `user://`. Gameplay code
## must use this API rather than touching files directly. A SQLite-backed
## repository can replace this internal implementation later without changing
## callers, once the chosen Android-compatible SQLite integration is added.

const SAVE_PATH := "user://player_profile.json"
const CURRENT_SCHEMA_VERSION := 1

var _profile: Dictionary = {}


func _ready() -> void:
	load_profile()


func load_profile() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		_profile = _make_default_profile()
		return

	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file == null:
		push_warning("SaveManager: could not open local profile; using defaults.")
		_profile = _make_default_profile()
		return

	var parsed: Variant = JSON.parse_string(file.get_as_text())
	if parsed is Dictionary:
		_profile = parsed
		_ensure_profile_defaults()
	else:
		push_warning("SaveManager: local profile is invalid; using defaults.")
		_profile = _make_default_profile()


func save_profile() -> Error:
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file == null:
		push_error("SaveManager: could not write local profile.")
		return FileAccess.get_open_error()

	file.store_string(JSON.stringify(_profile, "\t"))
	return OK


func get_value(key: StringName, default_value: Variant = null) -> Variant:
	return _profile.get(key, default_value)


func set_value(key: StringName, value: Variant) -> void:
	_profile[key] = value


func _make_default_profile() -> Dictionary:
	return {
		"schema_version": CURRENT_SCHEMA_VERSION,
		"coins": 0,
		"diamonds": 0,
		"completed_missions": [],
		"settings": {
			"master_volume": 1.0,
			"music_volume": 1.0,
			"sfx_volume": 1.0,
		},
	}


func _ensure_profile_defaults() -> void:
	var defaults := _make_default_profile()
	for key: StringName in defaults:
		if not _profile.has(key):
			_profile[key] = defaults[key]
