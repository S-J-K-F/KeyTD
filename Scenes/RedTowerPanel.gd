extends Panel


@onready var tower = preload("res://Scenes/Red_Bullet_Tower.tscn")
var currTile

func _on_gui_input(event:InputEvent):
	var tempTower = tower.instantiate()
	if event is InputEventMouseButton and event.button_mask == 1:
		#Left click down
		add_child(tempTower)
		
		tempTower.process_mode = Node.PROCESS_MODE_DISABLED
	elif event is InputEventMouseMotion and event.button_mask == 1:
		#Left click down drag
		get_child(1).global_position = event.global_position

	elif event is InputEventMouseButton and event.button_mask == 0:
		#left click up
		pass
		

