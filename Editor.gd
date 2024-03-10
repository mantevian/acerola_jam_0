extends Node2D


@onready var tilemap: TileMap = get_node("TileMap")

const w = 20
const h = 12


func _ready():
	var result = []
	for y in range(-h, h):
		var row = ""
		for x in range(-w, w):
			var coords = tilemap.get_cell_atlas_coords(0, Vector2(x, y))
			var c = "0"
			
			if coords.x == 0 and coords.y == 0:
				c = "1"
			
			row += c
		result.push_back(row)
	print(result)
