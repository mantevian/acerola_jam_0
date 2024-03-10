extends Node2D


@onready var player: Player = get_parent()

var arc = 0

func _ready():
	pass


func _physics_process(delta):
	var poses = player.ouroboros_positions
	
	if poses.size() > 0:
		arc = poses.size() * PI / 5.5 + 0.1
	else:
		arc = 0
	queue_redraw()


func _draw():
	draw_arc(Vector2(0, 0), 50.0, 0, arc, 64, Color(0.8, 0.7, 0.5, 0.2), 4.0)
