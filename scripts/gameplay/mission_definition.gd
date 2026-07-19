class_name MissionDefinition
extends Resource
## Data definition for a campaign mission.
##
## Mission flow reads this resource rather than embedding objectives, rewards,
## and target numbers in scenes. Instances are authored in
## `resources/missions/`.

@export_category("Identity")
@export var mission_id: StringName
@export var display_name: String
@export_multiline var briefing: String

@export_category("Scene")
@export_file("*.tscn") var gameplay_scene_path: String

@export_category("Objectives")
@export_range(1, 100, 1) var required_target_count := 1
@export_range(0.0, 3_600.0, 1.0, "suffix:s") var time_limit_seconds := 0.0

@export_category("Rewards")
@export_range(0, 1_000_000, 1, "suffix:coins") var coin_reward := 0
@export_range(0, 100_000, 1, "suffix:xp") var experience_reward := 0
