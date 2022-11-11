extends Camera2D


# Called when the node enters the scene tree for the first time.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("d"):
		self.position.x += 100
		print("eee")
	if Input.is_action_pressed("a"):
		self.position.x -= 100
	if Input.is_action_pressed("s"):
		self.position.y += 100
	if Input.is_action_pressed("w"):
		self.position.y -= 100
