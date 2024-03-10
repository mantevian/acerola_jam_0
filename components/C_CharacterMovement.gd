class_name C_CharacterMovement
extends Node2D


@export var movement_speed: float
@export var max_movement_velocity: float

var movement_vector: Vector2
var knockback_vector: Vector2


func set_velocity(vec: Vector2):
	var v = vec * movement_speed
	if v.length() < max_movement_velocity:
		movement_vector = v
	else:
		movement_vector = v.normalized() * max_movement_velocity


func push(vec: Vector2):
	knockback_vector = vec


func move_to(vec: Vector2):
	set_velocity(vec - get_parent().position)


func _physics_process(delta):
	knockback_vector = knockback_vector * 0.97
	get_parent().velocity = movement_vector + knockback_vector
