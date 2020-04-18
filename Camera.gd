extends Camera

const MOVE_MARGIN = 20		#Constants can't be changed in the Inspector later
const MOVE_SPEED = 30

onready var cam = $Camera	#An onready var is assigned a value after the node and its siblings entered the tree. 

func _process(delta):
	var m_pos = get_viewport().get_mouse_position()
	calc_move(m_pos, delta)
	
func calc_move(m_pos, delta):
	var v_size = get_viewport().size	#Variables are created when Script is used
	var move_vec = Vector3()
	
	if m_pos.x < MOVE_MARGIN:	#Wenn Mouse links geht
		move_vec.x += 1
		move_vec.z -= 1
	
	if m_pos.y < MOVE_MARGIN:	#Wenn Mouse runter geht
		move_vec.z += 1
		move_vec.x += 1
		
	if m_pos.x > v_size.x - MOVE_MARGIN:	#Wenn Mouse rechts geht
		move_vec.x -= 1
		move_vec.z += 1
	
	if m_pos.y > v_size.y - MOVE_MARGIN:	#Wenn Mouse oben geht
		move_vec.z -= 1
		move_vec.x -= 1
