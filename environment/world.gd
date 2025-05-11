extends Node2D

var House = preload("res://environment/House.tscn")

var houses = []

const TILEMAP_LEFT = -22
const TILEMAP_RIGHT = 19
const TILEMAP_BOT = 16
const TILEMAP_TOP = -16
const ALPHABET = "ABCDEFGHIJKL"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for x in range(TILEMAP_LEFT,TILEMAP_RIGHT):
		for y in range (TILEMAP_TOP, TILEMAP_BOT):
			if (x > 0 and x % 4 == 3): continue
			if (x < 0 and abs(x) % 4 == 1): continue
			if (x > 0 and x % 4 == 1) or (x < 0 and abs(x) % 4 == 3):
				if (y >= 0 and (y % 4 == 0 or y % 4 == 3)): continue
				if (y < 0 and (abs(y) % 4 == 1 or abs(y) % 4 == 0)): continue
				
			# Add house to TileMap
			var new_house_color = Vector2(randi_range(0,1), randi_range(0,1))
			var new_house_coord = Vector2(x,y)
			$HouseLayer.set_cell(new_house_coord, 0, new_house_color)			
			
			# Instantiate House Scene
			var new_house = House.instantiate()
			new_house.global_position = new_house_coord*32
			new_house.myColor = new_house_color.x + new_house_color.y*2
			new_house.myLot = [ALPHABET[(int(new_house_coord.x+25) / 4)], int(new_house_coord.y+18) / 4]
			new_house.myAddress = randi_range(0,9999)
			self.add_child(new_house)
			
	var letter_index = 0
	var number_index = 0
	for x in range(TILEMAP_LEFT,TILEMAP_RIGHT, 4):
		number_index = 0
		for y in range(TILEMAP_TOP, TILEMAP_BOT+10, 4):
			$NumbersLayer.set_cell(Vector2(x-1, y-1), 0, Vector2(number_index+2, 0))
			$NumbersLayer.set_cell(Vector2(x-1, y), 0, Vector2(letter_index+2,1))
			number_index+=1
		letter_index+=1
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
