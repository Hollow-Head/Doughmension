extends Camera2D

@onready var player = get_node("/root/Main/Player") # pega o node do player
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = global_position.lerp(player.global_position, 10 * delta) # serve pra acompanhar o player
	pass
