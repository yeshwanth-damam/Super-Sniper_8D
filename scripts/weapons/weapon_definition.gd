class_name WeaponDefinition
extends Resource
## Data definition for an original rifle.
##
## Weapon behavior reads this data and must not hard-code per-rifle balance.
## Instances are authored as .tres files under `resources/weapons/`.

@export_category("Identity")
@export var weapon_id: StringName
@export var display_name: String
@export_multiline var description: String

@export_category("Ballistics")
@export_range(1.0, 500.0, 0.1, "suffix:m") var effective_range_meters := 100.0
@export_range(1.0, 200.0, 0.1, "suffix:damage") var base_damage := 50.0
@export_range(1.0, 2_000.0, 1.0, "suffix:m/s") var muzzle_velocity := 800.0
@export_range(0.0, 10.0, 0.01, "suffix:°") var base_spread_degrees := 0.2

@export_category("Progression")
@export_range(0, 1_000_000, 1, "suffix:coins") var unlock_cost := 0
@export_range(1, 100, 1) var max_upgrade_level := 10
