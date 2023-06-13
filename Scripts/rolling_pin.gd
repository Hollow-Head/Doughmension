extends Area2D


@onready var bullet = preload("res://Scenes/Bullet.tscn")
var canShoot
var looking

func _ready():
	canShoot = true

func shoot():
	if canShoot:	
		var instBullet = bullet.instantiate()
		instBullet.position = $Sprite2D/Marker2D.global_position
		instBullet.scale = Vector2(0.3, 0.3)
		get_tree().root.get_child(0).add_child(instBullet)
		instBullet.getDir(global_position)
		canShoot = false
		$BulletDelay.start()
		
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	looking = global_position.direction_to(get_global_mouse_position()).normalized()
	if (looking.x < 0):
		scale.y = -1
		pass
	else:
		scale.y = 1
		
	look_at(get_global_mouse_position())
	
	print(looking)


func _on_bullet_delay_timeout():
	canShoot = true
	
	
