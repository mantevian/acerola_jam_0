class_name C_Projectile
extends Node2D


@export var damage: float = 2.5
@export var speed: float = 10.0
@export var is_friendly: bool = true
@export var knockback: float = 1.0
@export var character_collision: Area2D
@export var tile_collision: Area2D

var current_movement: Vector2
var shooter: CharacterBody2D


func _ready():
	pass


func _physics_process(delta):
	get_parent().position += current_movement * speed


func _on_character_collision_body_entered(body: CharacterBody2D):
	if not(body is CharacterBody2D):
		return
	
	if body == shooter:
		return
	
	body.emit_signal("hurt", damage, current_movement.normalized() * 300.0 * knockback)
	get_parent().queue_free()


func _on_tile_collision_body_entered(body):
	get_parent().queue_free()
