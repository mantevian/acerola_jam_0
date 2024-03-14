class_name Bouldy
extends Enemy


@onready var shooter = $C_ProjectileShooter


func _ready():
	super()


func _physics_process(delta):
	super(delta)
	if (shooter.cooldown == 0):
		shooter.shoot(0)
	
	move_and_slide()
	
	rotate(0.01)


func _on_hurt(amount, direction):
	on_hurt(amount, direction)
