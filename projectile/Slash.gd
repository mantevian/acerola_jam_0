class_name Slash
extends Projectile


var lifetime = 0


@onready var projectile = $C_Projectile


func _ready():
	pass


func _physics_process(delta):
	lifetime += 1
	modulate.a *= 0.95
	queue_redraw()


func _draw():
	var arc = float(lifetime + 90) / 360 * PI
	draw_arc(Vector2(-10, 0), 20 + lifetime * 0.3, -arc, arc, 64, Color(0.8, 0.7, 0.5), 8 + lifetime * 0.2)
