extends CharacterBody2D


@export var SPEED = 50
@export var MAXHP = 5
@export var HP = 5


@onready var player = get_parent().get_node("Player")

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction*SPEED
	move_and_slide()



func _on_hitbox_area_entered(area):
	pass
