extends CharacterBody2D

var dir
var globalMouse
var globalPos
var projectResolution=DisplayServer.screen_get_size()

func getDir(pos):
	globalMouse = get_global_mouse_position()
	dir = (globalMouse - pos).normalized()

func _ready():
#	globalPos = global_position
#
#	dir = (globalMouse - globalPos).normalized()
	pass


func _physics_process(delta):
	velocity = dir * 500 * delta
	global_position += velocity

	globalPos = abs(global_position)
	projectResolution = abs(projectResolution)
	if (globalPos.x >= projectResolution.x or globalPos.y >= projectResolution.y):
		queue_free()
