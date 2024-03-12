class_name Level
extends Node2D


const w = 20
const h = 12

var current_level = -1
var current_wave = -1
var timeout = 180
var spawning = false

@onready var tilemap: TileMap = $TileMap
@onready var enemy_manager: Enemies = $Enemies

@onready var ui: Control = $UILayer/LevelUI
@onready var pause_menu: Control = $UILayer/PauseMenu
@onready var level_complete_screen: Control = $LevelComplete/LevelCompleteScreen
@onready var player: Player = $Player
var paused = false
var is_level_completed = false


var portal_scene = preload("res://Portal.tscn")


func wait(sec: float):
	await get_tree().create_timer(sec).timeout


func start_next_level():
	is_level_completed = false
	current_wave = -1
	current_level += 1
	
	player.health.heal(player.health.max_value)
	player.position = Vector2.ZERO
	
	player.shooter.amount_per_shot = int(current_level / 4) + 1
	player.shooter.spread = float(int(current_level / 4)) * 0.03
	
	get_tree().paused = false
	level_complete_screen.hide()
	
	for y in range(-h, h):
		for x in range(-w, w):
			var c = LevelData.LEVELS[current_level].tiles[y + h][x + w]
			
			match c:
				'0':
					tilemap.set_cell(0, Vector2(x, y), -1)
				'1':
					tilemap.set_cell(0, Vector2(x, y), 0, Vector2(0, 0))
	
	var total_enemy_count = 0
	
	for wave in LevelData.LEVELS[current_level].waves:
		for enemy in wave.enemies:
			total_enemy_count += wave.enemies[enemy]
	
	enemy_manager.killed_in_this_level = 0
	ui.set_level(current_level, total_enemy_count)


func spawn_next_wave():
	current_wave += 1
	var wave_data = LevelData.LEVELS[current_level].waves[current_wave]
	
	spawning = true
	
	var portal: Portal = portal_scene.instantiate()
	portal.position = Vector2(wave_data.spawn_position.x, wave_data.spawn_position.y)
	$Portals.add_child(portal)
	await wait(1.0 + wave_data.start_wait_time)
	
	for e in wave_data.enemies:
		for i in range(wave_data.enemies[e]):
			var pos = Vector2(wave_data.spawn_position.x, wave_data.spawn_position.y)
			enemy_manager.spawn_enemy(e, pos, wave_data.enemy_push)
			await wait(wave_data.wait_time_between_enemies)
	
	spawning = false
	await wait(1.5)
	portal.lifetime = -60


func get_remaining_enemy_amount():
	return enemy_manager.get_child_count()


func level_complete():
	is_level_completed = true
	get_tree().paused = true
	level_complete_screen.show()
	
	if (current_level + 1) % 4 == 0:
		level_complete_screen.gained_slash_label.show()
	else:
		level_complete_screen.gained_slash_label.hide()


func _ready():
	enemy_manager.level = self
	start_next_level()


func _physics_process(delta):
	if get_remaining_enemy_amount() == 0 and not spawning:
		if timeout == -1:
			timeout = 180
		
		if timeout > 0:
			timeout -= 1
		
		if timeout == 0:
			if current_wave == LevelData.LEVELS[current_level].waves.size() - 1:
				level_complete()
			else:
				spawn_next_wave()
			timeout = -1


func _input(event):
	if event.is_action_pressed("Pause") and not is_level_completed:
		paused = not paused
		get_tree().paused = paused
		if paused:
			pause_menu.show()
		else:
			pause_menu.hide()
