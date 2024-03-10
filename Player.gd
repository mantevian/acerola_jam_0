extends CharacterBody2D
class_name Player


signal hurt(amount: float, direction: Vector2)


@onready var health = $C_Health
@onready var movement = $C_CharacterMovement
@onready var shooter = $C_ProjectileShooter

@onready var sprite = $Sprite


func _ready():
	sprite.play()


var burst_scene = preload("res://Burst.tscn")

var holding_rmb = false
var ouroboros_positions = []
var ability_timeout = -1


func _input(event):
	if event.is_action_pressed("Attack"):
		shooter.shoot(0)
		
	if Input.is_action_pressed("Ability"):
		holding_rmb = true
	else:
		if ouroboros_positions.size() == 11:
			var burst: Burst = burst_scene.instantiate()
			burst.shooter = self
			add_child(burst)
			ability_timeout = 300
		
		ouroboros_positions = []
		holding_rmb = false


func _physics_process(delta):
	if ability_timeout == -1:
		if holding_rmb:
			var r = int(rotation_degrees) / 30 + 5
			
			if ouroboros_positions.size() == 0 or r == (ouroboros_positions[-1] + 1) % 11:
				if ouroboros_positions.size() < 11:
					ouroboros_positions.push_back(r)
	else:
		ability_timeout -= 1
	
	movement.move_to(get_global_mouse_position())
	look_at(get_global_mouse_position())
	
	get_node("Sprite").scale.x = 0.5 + velocity.length() * 0.0003
	
	move_and_slide()


func _on_hurt(amount, direction):
	health.damage(amount)
	movement.push(direction)
