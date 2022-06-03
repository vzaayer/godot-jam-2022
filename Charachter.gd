extends KinematicBody2D

enum State {Walking, Dashing}

var direction
var dashTime
var currState = State.Walking

func _ready():
	direction = Vector2.ZERO

func _physics_process(delta):
	print(currState)
	
	if currState == State.Walking:
		if Input.is_action_just_pressed("ui_accept"):
			print(123)
			currState = State.Dashing
			startDash()
			dash(delta)
		else:
			walk()
	
	if currState == State.Dashing:
		
		dash(delta)
		
	move_and_slide(direction, Vector2.DOWN)
	
func walk():
	direction = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		direction.x = -1
	if Input.is_action_pressed("ui_right"):
		direction.x = 1
	# up is -1
	if Input.is_action_pressed("ui_up"):
		direction.y = -1
	if Input.is_action_pressed("ui_down"):
		direction.y = 1
	direction = direction.normalized() 
	direction *= 300
	
func dash(time):
	dashTime += time
	if dashTime >= .5:
		currState = State.Walking
		walk()
	
func startDash():
	direction = (get_global_mouse_position() - position).normalized() * 600
	dashTime = 0
	
	

	
