class_name Portal
extends Node2D


var lifetime = 0


func _ready():
	z_index = 2
	visible = false


func _physics_process(delta):
	queue_redraw()
	
	lifetime += 1
	visible = true
	
	if lifetime < 60:
		var s = (float(lifetime) / 60) ** 3
		scale = Vector2(s, s)
		modulate.a = abs(s)
	else:
		var s = (cos(float(lifetime) / 30) / 5 + 1)
		scale = Vector2(s, s)
		modulate.a = 1
	
	if lifetime == -1:
		queue_free()
