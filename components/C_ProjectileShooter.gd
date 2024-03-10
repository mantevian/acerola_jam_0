class_name C_ProjectileShooter
extends Node2D


@export var projectile: PackedScene
@export var damage: float
@export var max_prepare_time: int = 6
@export var max_cooldown: int = 6
@export var self_knockback: float = 1.0

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
	
	var p: Projectile = projectile.instantiate()
	get_parent().get_tree().root.get_node("Level").get_node("Projectiles").add_child(p)
	
	p.projectile.shooter = get_parent()
	p.position = get_parent().position
	p.rotation = angle
	p.projectile.current_movement = Vector2(cos(angle), sin(angle))
	p.projectile.damage = damage
	
	cooldown = max_cooldown
	prepare_time = -1
	shooting = false
	
	get_parent().movement.push(-p.projectile.current_movement.normalized() * 100 * self_knockback)


func _physics_process(delta):
	if not shooting:
		cooldown = max(cooldown - 1, 0)
	tick_shooting()
