class_name Red
extends Enemy


func _ready():
	super()


func _physics_process(delta):
	super(delta)
	move_and_slide()


func _on_hurt(amount, direction):
	on_hurt(amount, direction)
