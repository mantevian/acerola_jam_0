class_name Level
extends Node2D


const LEVELS = [
	{
		"tiles": ["1111111111110000000000000000111111111111", "1111111111110000000000000000111111111111", "1111111111110000000000000000111111111111", "1111111111110000000000000000111111111111", "1111111111110000000000000000111111111111", "1111111111110000000000000000111111111111", "1111111111110000000000000000111111111111", "1111111111110000000000000000111111111111", "1111111111110000000000000000111111111111", "1111111111110000000000000000111111111111", "1111111111110000000000000000111111111111", "1111111111110000000000000000111111111111", "1111111111110000000000000000111111111111", "1111111111110000000000000000111111111111", "1111111111110000000000000000111111111111", "1111111111110000000000000000111111111111", "1111111111110000000000000000111111111111", "1111111111110000000000000000111111111111", "1111111111110000000000000000111111111111", "1111111111110000000000000000111111111111", "1111111111110000000000000000111111111111", "1111111111110000000000000000111111111111", "1111111111110000000000000000111111111111", "1111111111110000000000000000111111111111"],
		"waves": [
			{
				"start_wait_time": 0.5,
				"wait_time_between_enemies": 0.5,
				"enemy_push": 1.0,
				"spawn_position": {
					"x": 0,
					"y": -200
				},
				"enemies": {
					"red": 1
				}
			},
			{
				"start_wait_time": 0.5,
				"wait_time_between_enemies": 0.5,
				"enemy_push": 1.0,
				"spawn_position": {
					"x": 0,
					"y": -200
				},
				"enemies": {
					"red": 2
				}
			},
			{
				"start_wait_time": 0.5,
				"wait_time_between_enemies": 0.5,
				"enemy_push": 1.0,
				"spawn_position": {
					"x": 0,
					"y": -200
				},
				"enemies": {
					"yellow": 1
				}
			},
			{
				"start_wait_time": 0.5,
				"wait_time_between_enemies": 0.5,
				"enemy_push": 1.0,
				"spawn_position": {
					"x": 0,
					"y": -200
				},
				"enemies": {
					"yellow": 2
				}
			}
		]
	},
	{
		"tiles": ["1111111100000000000000000000000011111111", "1111111100000000000000000000000011111111", "1111111100000000000000000000000011111111", "1111111100000000000000000000000011111111", "1111111100000000000000000000000011111111", "1111111100000000000000000000000011111111", "1111111100000000000000000000000011111111", "1111111100000000000000000000000011111111", "1111111100000000000000000000000011111111", "1111111100000000000000000000000011111111", "1111111100000000000000000000000011111111", "1111111100000000000000000000000011111111", "1111111100000000000000000000000011111111", "1111111100000000000000000000000011111111", "1111111100000000000000000000000011111111", "1111111100000000000000000000000011111111", "1111111100000000000000000000000011111111", "1111111100000000000000000000000011111111", "1111111100000000000000000000000011111111", "1111111100000000000000000000000011111111", "1111111100000000000000000000000011111111", "1111111100000000000000000000000011111111", "1111111100000000000000000000000011111111", "1111111100000000000000000000000011111111"],
		"waves": [
			{
				"start_wait_time": 0.5,
				"wait_time_between_enemies": 0.5,
				"enemy_push": 1.0,
				"spawn_position": {
					"x": 0,
					"y": 200
				},
				"enemies": {
					"red": 2
				}
			},
			{
				"start_wait_time": 0.5,
				"wait_time_between_enemies": 0.5,
				"enemy_push": 1.0,
				"spawn_position": {
					"x": 0,
					"y": -200
				},
				"enemies": {
					"yellow": 2
				}
			},
			{
				"start_wait_time": 0.5,
				"wait_time_between_enemies": 0.5,
				"enemy_push": 1.0,
				"spawn_position": {
					"x": 0,
					"y": 0
				},
				"enemies": {
					"red": 1,
					"yellow": 2
				}
			},
			{
				"start_wait_time": 0.5,
				"wait_time_between_enemies": 0.5,
				"enemy_push": 1.0,
				"spawn_position": {
					"x": 100,
					"y": 100
				},
				"enemies": {
					"red": 2,
					"yellow": 2
				}
			},
			{
				"start_wait_time": 0.5,
				"wait_time_between_enemies": 0.5,
				"enemy_push": 2.0,
				"spawn_position": {
					"x": -100,
					"y": -100
				},
				"enemies": {
					"yellow": 4
				}
			}
		]
	},
	{
		"tiles": ["1111100000000000000000000000000000011111", "1111100000000000000000000000000000011111", "1111100000000000000000000000000000011111", "1111100000000000000000000000000000011111", "1111100000000000000000000000000000011111", "1111100000000000000000000000000000011111", "1111100000000000000000000000000000011111", "1111100000000000000000000000000000011111", "1111100000000000000000000000000000011111", "1111100000000000000000000000000000011111", "1111100000000000000000000000000000011111", "1111100000000000000000000000000000011111", "1111100000000000000000000000000000011111", "1111100000000000000000000000000000011111", "1111100000000000000000000000000000011111", "1111100000000000000000000000000000011111", "1111100000000000000000000000000000011111", "1111100000000000000000000000000000011111", "1111100000000000000000000000000000011111", "1111100000000000000000000000000000011111", "1111100000000000000000000000000000011111", "1111100000000000000000000000000000011111", "1111100000000000000000000000000000011111", "1111100000000000000000000000000000011111"],
		"waves": [
			{
				"start_wait_time": 0.5,
				"wait_time_between_enemies": 0.5,
				"enemy_push": 2.0,
				"spawn_position": {
					"x": 200,
					"y": 0
				},
				"enemies": {
					"red": 1,
					"yellow": 1
				}
			},
			{
				"start_wait_time": 0.5,
				"wait_time_between_enemies": 0.5,
				"enemy_push": 2.0,
				"spawn_position": {
					"x": -200,
					"y": 0
				},
				"enemies": {
					"red": 1,
					"yellow": 2
				}
			},
			{
				"start_wait_time": 0.5,
				"wait_time_between_enemies": 0.5,
				"enemy_push": 2.0,
				"spawn_position": {
					"x": 0,
					"y": 200
				},
				"enemies": {
					"red": 2,
					"yellow": 2
				}
			},
			{
				"start_wait_time": 0.5,
				"wait_time_between_enemies": 0.2,
				"enemy_push": 3.0,
				"spawn_position": {
					"x": 0,
					"y": -200
				},
				"enemies": {
					"red": 2,
					"yellow": 3
				}
			},
			{
				"start_wait_time": 0.5,
				"wait_time_between_enemies": 0.5,
				"enemy_push": 1.0,
				"spawn_position": {
					"x": 200,
					"y": -200
				},
				"enemies": {
					"red": 2,
					"yellow": 4
				}
			},
			{
				"start_wait_time": 0.5,
				"wait_time_between_enemies": 0.5,
				"enemy_push": 1.0,
				"spawn_position": {
					"x": -200,
					"y": 200
				},
				"enemies": {
					"red": 5,
					"yellow": 2
				}
			},
			{
				"start_wait_time": 0.5,
				"wait_time_between_enemies": 0.01,
				"enemy_push": 5.0,
				"spawn_position": {
					"x": 0,
					"y": 0
				},
				"enemies": {
					"red": 8
				}
			}
		]
	},
	{
		"tiles": ["0000000000000000000000000000000000000000", "0000000000000000000000000000000000000000", "0001111111100000000000000000011111111000", "0001111111100000000000000000011111111000", "0001111111100000000000000000011111111000", "0001111111100000000000000000011111111000", "0000000000000000000000000000000000000000", "0000000000000000000000000000000000000000", "0000000000000000000000000000000000000000", "0000000000000000000000000000000000000000", "0000000000000000000000000000000000000000", "0000000000000000000000000000000000000000", "0000000000000000000000000000000000000000", "0000000000000000000000000000000000000000", "0000000000000000000000000000000000000000", "0000000000000000000000000000000000000000", "0000000000000000000000000000000000000000", "0001111111100000000000000000011111111000", "0001111111100000000000000000011111111000", "0001111111100000000000000000011111111000", "0001111111100000000000000000011111111000", "0000000000000000000000000000000000000000", "0000000000000000000000000000000000000000", "0000000000000000000000000000000000000000"],
		"waves": [
			{
				"start_wait_time": 0.0,
				"wait_time_between_enemies": 0.01,
				"enemy_push": 4.0,
				"spawn_position": {
					"x": 0,
					"y": 0
				},
				"enemies": {
					"red": 2
				}
			},
			{
				"start_wait_time": 0.0,
				"wait_time_between_enemies": 0.01,
				"enemy_push": 4.0,
				"spawn_position": {
					"x": 0,
					"y": 0
				},
				"enemies": {
					"red": 3
				}
			},
			{
				"start_wait_time": 0.0,
				"wait_time_between_enemies": 0.01,
				"enemy_push": 4.0,
				"spawn_position": {
					"x": 0,
					"y": 0
				},
				"enemies": {
					"red": 1,
					"yellow": 2
				}
			},
			{
				"start_wait_time": 0.0,
				"wait_time_between_enemies": 0.01,
				"enemy_push": 4.0,
				"spawn_position": {
					"x": 0,
					"y": 0
				},
				"enemies": {
					"red": 2,
					"yellow": 2
				}
			},
			{
				"start_wait_time": 0.0,
				"wait_time_between_enemies": 0.01,
				"enemy_push": 4.0,
				"spawn_position": {
					"x": 0,
					"y": 0
				},
				"enemies": {
					"yellow": 4
				}
			},
			{
				"start_wait_time": 0.0,
				"wait_time_between_enemies": 0.01,
				"enemy_push": 4.0,
				"spawn_position": {
					"x": 0,
					"y": 0
				},
				"enemies": {
					"red": 3
				}
			},
			{
				"start_wait_time": 0.0,
				"wait_time_between_enemies": 0.01,
				"enemy_push": 4.0,
				"spawn_position": {
					"x": 0,
					"y": 0
				},
				"enemies": {
					"red": 4
				}
			},
			{
				"start_wait_time": 0.0,
				"wait_time_between_enemies": 0.01,
				"enemy_push": 4.0,
				"spawn_position": {
					"x": 0,
					"y": 0
				},
				"enemies": {
					"red": 2,
					"yellow": 4
				}
			}
		]
	}
]


const w = 20
const h = 12

var current_level = -1
var current_wave = -1
var timeout = 180
var spawning = false

@onready var tilemap: TileMap = $TileMap
@onready var enemy_manager: Enemies = $Enemies

@onready var ui: Control = $LevelUI

@onready var pause_menu: Control = $PauseMenu
var paused = false


var portal_scene = preload("res://Portal.tscn")


func wait(sec: float):
	await get_tree().create_timer(sec).timeout


func start_next_level():
	current_wave = -1
	current_level += 1
	
	for y in range(-h, h):
		for x in range(-w, w):
			var c = LEVELS[current_level].tiles[y + h][x + w]
			
			match c:
				'0':
					tilemap.set_cell(0, Vector2(x, y), -1)
				'1':
					tilemap.set_cell(0, Vector2(x, y), 0, Vector2(0, 0))
	
	var total_enemy_count = 0
	
	for wave in LEVELS[current_level].waves:
		for enemy in wave.enemies:
			total_enemy_count += wave.enemies[enemy]
	
	enemy_manager.killed_in_this_level = 0
	ui.set_level(current_level, total_enemy_count)


func spawn_next_wave():
	current_wave += 1
	var wave_data = LEVELS[current_level].waves[current_wave]
	
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


func _ready():
	enemy_manager.level = self
	start_next_level()


func _physics_process(delta):
	if get_remaining_enemy_amount() == 0 and not spawning:
		if timeout == -1:
			timeout = 60
		
		if timeout > 0:
			timeout -= 1
		
		if timeout == 0:
			if current_wave == LEVELS[current_level].waves.size() - 1:
				start_next_level()
			else:
				spawn_next_wave()
			timeout = -1


func _input(event):
	if event.is_action_pressed("Pause"):
		paused = not paused
		get_tree().paused = paused
		if paused:
			pause_menu.show()
		else:
			pause_menu.hide()
