class_name Spike
extends Projectile


@onready var projectile = $C_Projectile


func _ready():
	pass


func _physics_process(delta):
	rotate(0.1)
