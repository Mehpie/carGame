extends RigidBody2D

var wheels = []
var bod = []
var power = 1.5
var speed = 600
var backSpeed = -150
var MaxSpeed = 1000
var fuel = 1000

func _ready():
	wheels = get_tree().get_nodes_in_group("wheel")
	bod = get_tree().get_nodes_in_group("Player")
	
func _physics_process(delta):	
	if fuel > 0:
		if Input.is_action_pressed("ui_right"):
			use_fuel(delta)
			for Car in bod:
				Car.set_rotation(Car.rotation + power * delta)
			for wheel in wheels:
				if wheel.angular_velocity < MaxSpeed:
					wheel.apply_torque_impulse(speed*delta*60)

		if Input.is_action_pressed("ui_left"):
			use_fuel(delta)
			for Car in bod:
				Car.set_rotation(Car.rotation - power * delta)
			for wheel in wheels:
				if wheel.angular_velocity < MaxSpeed:
					wheel.apply_torque_impulse(backSpeed*delta*60)

func refuel():
	fuel = 100
func use_fuel(delta):
	fuel -= 10*delta
	fuel = clamp(fuel,0,1000)
