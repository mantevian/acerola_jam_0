class_name C_EnemyWandering
extends Node2D


var longterm_target: Vector2
var current_velocity: Vector2
var current_time: int = 0

var rng = RandomNumberGenerator.new()


func _physics_process(delta):
	if current_time <= 0:
		select_target()
	else:
		current_velocity = (current_velocity * 0.97 + (longterm_target - current_velocity) * 0.03).normalized() * 75
		current_time -= 1


func select_target():
	var p = get_parent().position
	var pl = get_tree().root.get_node("Level").get_node("Player").position
	var rand = Vector2(rng.randf_range(-30, 30), rng.randf_range(-30, 30))
	longterm_target = pl - p + rand
	current_time = rng.randi_range(10, 30)
