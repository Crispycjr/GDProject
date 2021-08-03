
# Find entities on the map (eg. trees). Remove them and replace them with
# real entities (scenes) so that we can have logic (attach scripts) to them.
func _populate_entities(map):
	var possible_tilemaps = map.get_children()
	for tile_map in possible_tilemaps:
		if tile_map is TileMap:
			var tile_set = tile_map.tile_set
			for cell in tile_map.get_used_cells():
				var tile_id = tile_map.get_cellv(cell)
				var tile_name = tile_set.tile_get_name(tile_id)
				if entity_tiles.has(tile_name):
					# Spawn + replace with entity of the same name
					var scene = entity_tiles[tile_name]
					var instance = scene.instance()
					map.add_child(instance)
					instance.position.x = cell.x * Globals.TILE_WIDTH
					instance.position.y = cell.y * Globals.TILE_HEIGHT
					# Remove tile
					tile_map.set_cellv(cell, -1)
