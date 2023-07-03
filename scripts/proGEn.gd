extends Node

@export var num_hills = 2
@export var slice = 25
@export var hill_range = 100

var screensize
var terrain = Array()
var texture = preload("res://resoures/2.png")
var Enemy = preload("res://scens/enemy.tscn")

func _ready():
	randomize()
	screensize = get_viewport().get_visible_rect().size
	terrain = Array()
	var start_y = screensize.y * 1/4 + (-hill_range + randi() % hill_range*2)
	terrain.append(Vector2(0, start_y))
	add_hills()
	
func _process(delta):
	if terrain[-1].x < $Player.position.x + screensize.x:
		add_hills()
func spawn_enemy(position: Vector2):
	var enemy_instance = Enemy.instantiate()  # Create an instance of the Enemy scene
	enemy_instance.position = position     # Set the position of the spawned enemy
	var scale = randf_range(0.2, 1.5)  # Random scaling factor between 0.2 and 1.5
	enemy_instance.scale = Vector2(scale, scale)  # Apply the scaling to the enemy
	add_child(enemy_instance)              # Add the enemy to the scene
func add_hills():
	var hill_width = screensize.x / num_hills
	var hill_slices = hill_width / slice
	var start = terrain[-1]
	var poly = PackedVector2Array()
	for i in range(num_hills):
		var height = randi() % hill_range
		start.y -= height
		for j in range(0, hill_slices):
			var hill_point = Vector2()
			hill_point.x = start.x + j * slice + hill_width * i
			hill_point.y = start.y + height * cos(2 * PI / hill_slices * j)
			#$Line2D.add_point(hill_point)
			terrain.append(hill_point)
			poly.append(hill_point)
			if randf() < 0.1:  # Adjust the probability as desired
				var new_vec = Vector2()
				new_vec.x = hill_point.x
				new_vec.y = 111
				spawn_enemy(new_vec)
		start.y += height
	var shape = CollisionPolygon2D.new()
	var ground = Polygon2D.new()
	$StaticBody2D.add_child(shape)
	poly.append(Vector2(terrain[-1].x, screensize.y))
	poly.append(Vector2(start.x, screensize.y))
	shape.polygon = poly
	ground.polygon = poly
	ground.texture = texture
	add_child(ground)
