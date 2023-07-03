extends CollisionPolygon2D

# Assuming the CollisionPolygon2D is attached to a node called "my_node"
# Get a reference to the CollisionPolygon2D
var collision_poly = $terrain.get_node("CollisionPolygon2D")

# Create a new set of points for the CollisionPolygon2D
var new_points = PackedVector2Array([
	Vector2(0, 0),
	Vector2(100, 0),
	Vector2(50, 100)
])
func _ready():
# Set the new points for the CollisionPolygon2D
	collision_poly.shape = ConvexPolygonShape2D.new()
	collision_poly.shape.set_points(new_points)
