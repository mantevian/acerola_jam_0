class_name Enemies
extends Node2D


var enemies = {
	"rocky": {
		"scene": preload("res://enemy/Rocky.tscn"),
	},
	"spikey": {
		"scene": preload("res://enemy/Spikey.tscn"),
	}
}


var level: Level
var killed_in_this_level = 0


func _ready():
	pass


func spawn_enemy(name: String, pos: Vector2, enemy_push: float):
	var data = enemies[name]
	var enemy: Enemy = data["scene"].instantiate()
	enemy.position = pos
	
	var angle = randf_range(-3.14, 3.14)
	enemy.initial_push = Vector2(cos(angle), sin(angle)) * 100.0 * enemy_push
	enemy.manager = self
	add_child(enemy)


func enemy_killed(enemy: Enemy):
	killed_in_this_level += 1
	level.ui.set_current_progress(killed_in_this_level)


func _process(delta):
	pass
