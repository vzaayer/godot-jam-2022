extends KinematicBody2D


var health = 300
var rng = RandomNumberGenerator.new()
var char_node


# Called when the node enters the scene tree for the first time.
func _ready():
	$ProgressBar.max_value = health
	$ProgressBar.value = health
	
	char_node = get_parent().get_node("Player")
	#char_node.connect("body_entered", self, "_on_Charachter_body_entered")



func _process(delta):
	if health <= 0:
		self.free()
		return
		
		
	for node in get_parent().get_children():
		if node == self:
			break
		if node.name != "Enemy":
			break
		if position.distance_to(node.position) > 50:
			break
		
		position -= (position - node.position).normalized() * rng.randi_range(0, 10) # vector to other enemy
		
				
			
	
	var direction_to_char = position.direction_to(char_node.position).normalized()
	var distance_to_char = position.distance_to(char_node.position)
	
	if distance_to_char > 150:
		position.x += direction_to_char.x
		position.y += direction_to_char.y
		
	elif distance_to_char < 120:
		position.x -= direction_to_char.x
		position.y -= direction_to_char.y
	
	else:
		var rand_dist = rng.randi_range(-5, 5)
		position += direction_to_char.tangent() * rand_dist


func _on_Charachter_body_entered(body):
	if body != self:
		return

	health -= abs(get_parent().get_node("Charachter").linear_velocity.length())
	$ProgressBar.value = health
