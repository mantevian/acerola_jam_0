class_name Enemy
extends CharacterBody2D


signal hurt(amount: float, direction: Vector2)


@onready var health: C_Health = $C_Health
@onready var movement: C_CharacterMovement = $C_CharacterMovement
@onready var wandering: C_EnemyWandering = $C_EnemyWandering
@onready var player = get_tree().root.get_node("Level").get_node("Player")

@export var contact_damage: float = 2.0


var lifetime = 0
var manager: Enemies
var initial_push: Vector2


func _ready():
	scale = Vector2(0.01, 0.01)
	movement.push(initial_push)


func _physics_process(delta):
	if lifetime < 20:
		scale = scale * 0.85 + Vector2(1.0, 1.0) * 0.15
	else:
		scale.x = 1
		scale.y = 1 + sin(0.01 * lifetime) * 0.05
	
	lifetime += 1

	look_at(wandering.current_velocity + position)
	movement.set_velocity(wandering.current_velocity)


func on_hurt(amount: float, direction: Vector2):
	health.damage(amount)
	movement.push(direction)


func _on_tree_exiting():
	manager.enemy_killed(self)
