extends CharacterBody2D

@export var max_health: int = 100
var current_health: int
signal health_changed(new_health: int)

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready():
	# Set health to max when the game starts
	current_health = max_health
	health_changed.emit(current_health)

func take_damage(amount: int):
	current_health -= amount
	print("Player took damage! Current HP: ", current_health)
	health_changed.emit(current_health)
	
	if current_health <= 0:
		die()

func die():
	queue_free()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
