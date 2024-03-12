class_name C_ProjectileShooter
extends Node2D


@export var projectile: PackedScene
@export var damage: float = 0
@export var max_prepare_time: int = 6
@export var max_cooldown: int = 6
@export var self_knockback: float = 1.0
@export var amount_per_shot: int = 1
@export var interval_between_shots: float = 0.2
@export var spread: float = 0.0

var shooting = false
var angle: float
var prepare_time: int = -1
var cooldown: int = -1


func _ready():
	cooldown = max_cooldown


func shoot(deg: float):
	if cooldown > 0:
		return
		
	if shooting:
		return
	
	prepare_time = max_prepare_time
	shooting = true
	angle = get_parent().rotation + deg_to_rad(deg)


func tick_shooting():
	if not shooting:
		return
	
	prepare_time -= 1
	
	if prepare_time > 0:
		get_parent().get_node("Sprite").scale.x = 0.5 + lerp(0.0, 0.2, float(prepare_time) / max_prepare_time)
		return
	
	shooting = false
	cooldown = max_cooldown
	prepare_time = -1
	
	get_parent().movement.push(-Vector2(cos(angle), sin(angle)).normalized() * 100 * self_knockback)
	
	var p: Projectile
	for i in range(amount_per_shot):
		p = create_projectile()
		await get_tree().create_timer(interval_between_shots).timeout


func create_projectile():
	var p: Projectile = projectile.instantiate()
	get_parent().get_tree().root.get_node("Level").get_node("Projectiles").add_child(p)
	
	var a = angle + randf_range(-spread, spread)
	p.projectile.shooter = get_parent()
	p.position = get_parent().position
	p.rotation = a
	p.projectile.current_movement = Vector2(cos(a), sin(a))
	p.projectile.damage += damage
	return p


func _physics_process(delta):
	if not shooting:
		cooldown = max(cooldown - 1, 0)
	tick_shooting()
