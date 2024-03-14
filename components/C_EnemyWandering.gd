class_name C_EnemyWandering
extends Node2D


var longterm_target: Vector2
var current_velocity: Vector2
var current_time: int = 0

@export var agility: float = 0.03
@export var target_spread = 30.0
@export var min_interval_between_choosing_targets = 10
@export var max_interval_between_choosing_targets = 30


func _physics_process(delta):
	if current_time <= 0:
		select_target()
	else:
		current_velocity = (current_velocity * (1 - agility) + (longterm_target - current_velocity) * agility).normalized() * 75
		current_time -= 1
	
	get_parent().look_at(current_velocity + get_parent().position)
	get_parent().movement.set_velocity(current_velocity)


func select_target():
	var p = get_parent().position
	var pl = get_tree().root.get_node("Level").get_node("Player").position
	var rand = Vector2(randf_range(-target_spread, target_spread), randf_range(-target_spread, target_spread))
	longterm_target = pl - p + rand
	current_time = randi_range(min_interval_between_choosing_targets, max_interval_between_choosing_targets)
