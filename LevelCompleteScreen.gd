extends Control


@export var level: Level
@onready var player = level.get_node("Player")
@onready var gained_slash_label = $Panel/GainedSlashLabel


func _ready():
	pass


func _process(delta):
	pass


func _on_skip_button_button_down():
	level.start_next_level()


func _on_upgrade_slash_button_down():
	player.slash_level += 1
	
	player.shooter.damage = 2.5 + player.slash_level * 0.5 + player.slash_level * player.slash_level * 0.25
	player.shooter.max_cooldown = max(6, 18 - player.slash_level)
	
	level.start_next_level()


func _on_upgrade_body_button_down():
	player.body_level += 1
	
	player.health.max_value = 20.0 + player.body_level * 2.0 + player.body_level * player.body_level * 0.25
	
	level.start_next_level()


func _on_upgrade_swiftness_button_down():
	player.swiftness_level += 1
	
	player.movement.movement_speed = 2.0 + player.swiftness_level * 0.05
	player.movement.max_movement_velocity = 300.0 + player.swiftness_level * 20.0
	player.shooter.self_knockback = 3.0 + player.swiftness_level * 0.1
	
	level.start_next_level()
