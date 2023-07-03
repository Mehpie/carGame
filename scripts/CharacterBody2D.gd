extends KinematicBody2D

var terrain_prefabs = [T1, T2, T3, T4, T5, T6]
var current_terrain = 0
var terrain_offset = Vector2()

func _physics_process(delta):
	# Check if the player has reached the end of the current terrain
	if terrain_offset.x > terrain_prefabs[current_terrain].size.x:
		# Create a new terrain and add it to the scene
		current_terrain = (current_terrain + 1) % terrain_prefabs.size()
		terrain_offset = Vector2()
		add_child(terrain_prefabs[current_terrain])

	# Move the terrain along with the player
	terrain_offset.x += delta * speed
	
