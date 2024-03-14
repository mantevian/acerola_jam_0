class_name Enemies
extends Node2D


var enemies = {
	"rocky": {
		"scene": load("res://enemy/Rocky.tscn"),
	},
	"spikey": {
		"scene": load("res://enemy/Spikey.tscn"),
	},
	"bouldy": {
		"scene": load("res://enemy/Bouldy.tscn")
	},
	"flakey": {
		"scene": load("res://enemy/Flakey.tscn")
	},
	"flowey": {
		"scene": load("res://enemy/Flowey.tscn")
	}
}


@export var level: Level
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
	var particle = preload("res://DeathParticles.tscn").instantiate()
	particle.position = enemy.position
	particle.emitting = true
	level.particle_manager.add_child(particle)
	
	var tween = create_tween()
	tween.tween_property(particle, "position", particle.position, 2.0)
	tween.tween_callback(particle.queue_free)
	
	killed_in_this_level += 1
	level.ui.set_current_progress(killed_in_this_level)


func _process(delta):
	pass
