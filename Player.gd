extends CharacterBody2D
class_name Player


signal hurt(amount: float, direction: Vector2)

@onready var health = $C_Health
@onready var movement = $C_CharacterMovement
@onready var shooter = $C_ProjectileShooter

@onready var sprite = $Sprite


var slash_level = 0
var body_level = 0
var swiftness_level = 0

var unlocked_burst = false

func _ready():
	sprite.play()

var burst_scene = preload("res://Burst.tscn")

var holding_rmb = false
var ouroboros_positions = []
var ability_timeout = -1


var moving = [false, false, false, false]


func _input(event):
	if event.is_action_pressed("Attack"):
		shooter.shoot(0)
	
	if unlocked_burst:
		if Input.is_action_pressed("Ability"):
			holding_rmb = true
		else:
			if ouroboros_positions.size() == 11:
				var burst: Burst = burst_scene.instantiate()
				burst.shooter = self
				add_child(burst)
				ability_timeout = (300 - swiftness_level * 20)
			
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
	
	moving[0] = Input.is_action_pressed("Up")
	moving[1] = Input.is_action_pressed("Right")
	moving[2] = Input.is_action_pressed("Down")
	moving[3] = Input.is_action_pressed("Left")

	#movement.move_to(get_global_mouse_position())
	var v = Vector2.ZERO
	
	if moving[0]:
		v.y += -1
	if moving[1]:
		v.x += 1
	if moving[2]:
		v.y += 1
	if moving[3]:
		v.x += -1
	
	movement.set_velocity(v * movement.movement_speed * 50.0)
	
	look_at(get_global_mouse_position())
	
	get_node("Sprite").scale.x = 0.5 + velocity.length() * 0.0003
	
	move_and_slide()


func _on_hurt(amount, direction):
	health.damage(amount)
	movement.push(direction)


func _on_character_collision_body_entered(body):
	if body is Enemy:
		emit_signal("hurt", body.contact_damage, (position - body.position).normalized() * movement.max_movement_velocity * 2.0)


func _on_tree_exiting():
	get_tree().paused = true
	get_tree().root.get_node("Level/UILayer/LoseScreen").show()
