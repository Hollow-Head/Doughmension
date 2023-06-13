extends CharacterBody2D

var knockbackDistance
var hurt = false
const SPEED = 200.0
var mouse_pos
@export var MAXHP = 10
@export var HP = 10

@onready var marker = $Marker2D
@onready var weapon = $Alien_gun
@onready var timer = $Timer
@onready var hpText = $Label

		
func _ready():	
	hpText.set_text(str(HP)) # vidinha pra debug

func walk(direction):
	if (direction):
		### se o vetor que recebe o input for diferente de (0,0) ele anda e começa a animação de andar
		$AnimationTree.get("parameters/playback").travel("Walk")
		$AnimationTree.set("parameters/Walk/blend_position", mouse_pos)
		velocity = direction * SPEED
		move_and_slide()
	else:
		### senao, começa a animação idle
		$AnimationTree.get("parameters/playback").travel("Idle")
	

func get_input():
	### recebe o input de direções em um vetor chamado dir
	var dir = Input.get_vector("left", "right", "up", "down")
	
	### pega posição do mouse em um vetor normalizado pra direcionar o sprite durante a animação
	mouse_pos = (get_global_mouse_position() - position).normalized()
	
	### direciona o sprite de acordo com o mouse
	$AnimationTree.set("parameters/Idle/blend_position", mouse_pos)
	
	walk(dir)
	

func _physics_process(delta):
	get_input()
	
	### se pressionou o botao de ataque da tiro
	### obs: provavelmente refatora aqui pra fica mio de bao
	if (Input.is_action_pressed("attack")):
		weapon.shoot()
	
	
	### se levar hit	
	if (hurt):
		print("ai meu cu")
		###global_position = global_position.move_toward(knockbackDistance, 75*delta)
		hurt = false
		
func _on_hurtbox_area_entered(area):
	print("yep")
	HP -= area.DAMAGE
	
	### provavelmente mudar o código a seguir, protótipo de knockback
	if (area.global_position > global_position):
		print("veio pela direita")
		knockbackDistance = global_position - Vector2(25, 0)
	elif (area.global_position < global_position):
		knockbackDistance = global_position + Vector2(25, 0)
		print("veio pela esquerda")
	hpText.set_text(str(HP))
	hurt = true
	
