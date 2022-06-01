extends RigidBody2D

func _ready():
	pass

func _physics_process(delta):
	
	# this is all done so diagonal movement isnt faster then vertical or horizontal
	var direction = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		direction.x = -1
	if Input.is_action_pressed("ui_right"):
		direction.x = 1
	# up is -1
	if Input.is_action_pressed("ui_up"):
		direction.y = -1
	if Input.is_action_pressed("ui_down"):
		direction.y = 1
	
	if direction != Vector2.ZERO:	
		direction = direction.normalized() * 3
	apply_central_impulse(direction)
	
func level_up():
	$CollisionShape2D.scale.x += .2
	$CollisionShape2D.scale.y += .2

	
