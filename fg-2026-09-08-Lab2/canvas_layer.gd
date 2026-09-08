extends CanvasLayer

@onready var hp_label: Label = $Label2

# Called when the node enters the scene tree for the first time.
func _ready():
	# 2. Find the player node in the scene and connect to its signal
	# Replace %Player with your actual path or Unique Name to the player
	var player = get_node("..") 
	
	if player:
		player.health_changed.connect(_on_player_health_changed)

# 3. This function runs automatically whenever health changes
func _on_player_health_changed(new_health: int):
	hp_label.text = "HP: " + str(new_health)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
