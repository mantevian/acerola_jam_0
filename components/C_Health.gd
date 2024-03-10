class_name C_Health
extends Node2D

@export var max_value: float = 50
@export var max_immunity_time: int = 6

var value: float
var immunity_time: int = 0


func damage(amount: float):
	if (immunity_time > 0):
		return
	
	value -= amount
	
	immunity_time = max_immunity_time
	
	if (value <= 0):
		owner.queue_free()


func heal(amount: float):
	value = min(value + amount, max_value)


func _ready():
	value = max_value


func _physics_process(delta):
	immunity_time = max(immunity_time - 1, 0)
	var ratio = float(immunity_time) / max_immunity_time
	get_parent().get_node("Sprite").get_node("WhiteOverlay").modulate = Color(1, 1, 1, ratio * 0.4)
