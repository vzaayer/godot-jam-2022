extends Node2D


# Declare member variables here. Examples:
# var a = 2
var rng = RandomNumberGenerator.new()
var how_many = 0
var enemy

# Called when the node enters the scene tree for the first time.
func _ready():
	enemy = load("res://scenes/Enemy.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	
	rng.randomize()
	var count_enemies = 0
	for node in get_children():
		if "Enemy" in node.name:
			count_enemies += 1
	if count_enemies == 0:
		how_many += 1
		for times in range(how_many):
			var new_enemy = enemy.instance()
			new_enemy.position.x += rng.randi_range(-20, 20)
			new_enemy.position.y += rng.randi_range(-20, 20)
			add_child(new_enemy)

			
