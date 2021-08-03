extends TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	for tile in get_used_cells_by_id(0):
		create_active_area(tile, 'carpet')
	
	for tile in get_used_cells_by_id(1):
		create_active_area(tile, 'stone')
		
	for tile in get_used_cells_by_id(2):
		create_active_area(tile, 'wood')

func create_active_area(tile, name):

