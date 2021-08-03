extends TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	for tile in get_used_cells_by_id(0):
		create_active_area(tile, 'carpet')
	
	for tile in get_used_cells_by_id(1):
		create_active_area(tile, 'stone')
		
	for tile in get_used_cells_by_id(2):
		create_active_area(tile, 'wood')
		
	for tile in get_used_cells_by_id(3):
		create_active_area(tile, '')
		
func create_active_area(tile, name):
	var a2d = Area2D.new()
	var cs = CollisionShape2D.new()
	cs.shape = RectangleShape2D.new()
	cs.shape.extents.x = cell_size.x/2
	cs.shape.extents.y = cell_size.y/2
	cs.position = map_to_world(tile)+cell_size/2
	
	# adjust position for non-full height areas
	#cs.position.y += (1)*cell_size.y
	
	# connect signals
	a2d.connect('body_entered', self, '_on_area_entered', [name])
	a2d.connect('body_exited', self, '_on_area_exited', [name])
	
	# append nodes
	a2d.add_child(cs)
	add_child(a2d)
	
func _on_area_entered(body, tile_name):
	if body.is_in_group("player"):
		body.zone_entered(tile_name)
	
func _on_area_exited(body, tile_name):
	if body.is_in_group("player"):
		body.zone_exited(tile_name)
