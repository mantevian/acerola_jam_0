class_name Burst
extends Area2D


var shooter: CharacterBody2D
@onready var lifetime: int = 0

var damage: float = 8.0
var speed: float = 1.0
var is_friendly: bool = true
var knockback: float = 8.0


func _ready():
	modulate = Color(1.0, 1.0, 1.0, 0.4)
	scale = Vector2(0.01, 0.01)


func _physics_process(delta):
	lifetime += 1
	
	var total_lifetime = 30.0 / speed
	
	modulate.a *= 0.9
	var s = (float(lifetime) / total_lifetime) ** 0.4
	scale = Vector2(s, s)
	
	if (lifetime > total_lifetime):
		queue_free()


func _on_body_entered(body: CharacterBody2D):
	if not(body is CharacterBody2D):
		return
	
	if body == shooter:
		return
	
	body.emit_signal("hurt", damage, (body.position - shooter.position).normalized() * 100.0 * knockback)
