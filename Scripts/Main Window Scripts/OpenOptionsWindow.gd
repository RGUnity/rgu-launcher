extends Button
@export var windowScene: PackedScene

func _pressed():
	
	var window = windowScene.instantiate()
	var sceneRoot = self.owner
	sceneRoot.add_child(window)
	window.show()



