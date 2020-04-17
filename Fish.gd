extends RigidBody

var m = Vector3()
var velocity = Vector3()

var gravity = -9.8



const SPEED = 6

const ACCELERATION = 3

const DE_ACCELERATION = 5




func _physics_process(delta):
	velocity.y += delta * gravity
	
	var hv = velocity
	
	hv.y = 0
	
	
	var new_pos = dir * SPEED
	
	var accel = DE_ACCELERATION
	
	
	if (dir.dot(hv) > 0):
		accel = ACCELERATION
	
	
	hv = hv.linear_interpolate(new_pos, accel * delta)
	
	
	velocity.x = hv.x
	
	velocity.z = hv.z
	
	
	velocity = move_and_slide(velocity, Vector3(0,1,0))

