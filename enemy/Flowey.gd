class_name Flowey
extends Enemy


func _ready():
	super()


func choose_target():
	var pl = get_tree().root.get_node("Level").get_node("Player").position
	
	var rotation_tween = create_tween()
	rotation_tween.set_ease(Tween.EASE_IN_OUT)
	rotation_tween.set_trans(Tween.TRANS_BACK)
	rotation_tween.tween_property(self, "rotation", PI * 4, 1.6)
	
	
	var velocity_tween = create_tween()
	velocity_tween.set_ease(Tween.EASE_IN_OUT)
	velocity_tween.set_trans(Tween.TRANS_QUAD)
	velocity_tween.tween_property(self, "velocity", Vector2((pl - position).normalized()) * 900.0, 0.8)
	velocity_tween.tween_property(self, "velocity", Vector2((pl - position).normalized()) * 200.0, 0.4)
	velocity_tween.tween_property(self, "velocity", Vector2.ZERO, 0.6)
	velocity_tween.tween_property(self, "velocity", Vector2(randf_range(-200, 200), randf_range(-200, 200)), 0.9)
	velocity_tween.tween_property(self, "velocity", Vector2(randf_range(-200, 200), randf_range(-200, 200)), 0.6)
	velocity_tween.tween_property(self, "velocity", Vector2.ZERO, 1.8)



func _physics_process(delta):
	super(delta)
	
	rotate(0.06)
	
	if lifetime % 360 == 90:
		choose_target()
	
	move_and_slide()


func _on_hurt(amount, direction):
	on_hurt(amount, direction)
