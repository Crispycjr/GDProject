extends RayCast2D

# Get the mouse position within the viewport, and cast towards it. Integer being max cast length.
func _process(_delta):
	cast_to = get_local_mouse_position().normalized() * 1000
	
	# If the raycast detects collision, move the child node "Term" to the location of the collision.
	# Otherwise, move "Term" to the max length of the raycast.
	if is_colliding():
		$Term.global_position = get_collision_point()
	else:
		$Term.global_position = cast_to
	
	# Rotate the "Beam" child sprite toward the angle of the end point of the raycast.
	# The pivot point of "Beam" must be in the center of the sprite to rotate properly
	$Beam.rotation = cast_to.angle()
	
	# Extend the sprite region of "Beam" to the position of the "Term" node.
	$Beam.region_rect.end.x = $Term.position.length()
