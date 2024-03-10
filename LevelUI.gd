extends Control


@onready var level_info_label: Label = get_node("LevelInfo/Label")
@onready var level_progress_bar: TextureProgressBar = get_node("LevelInfo/ProgressBar")

var current_progress = 0


func set_level(level: int, total_enemies: int):
	level_info_label.text = "Level " + ("0" if level < 10 else "") + str(level + 1)
	level_progress_bar.max_value = total_enemies
	current_progress = 0
	level_progress_bar.value = 0


func set_current_progress(enemies: int):
	current_progress = enemies


func _ready():
	pass


func _physics_process(delta):
	level_progress_bar.value = level_progress_bar.value * 0.95 + current_progress * 0.05
