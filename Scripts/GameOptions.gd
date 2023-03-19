extends Button
@export var windowScene: PackedScene

func _pressed():
	
	var popup = windowScene.instantiate()
	var sceneRoot = self.owner
	sceneRoot.add_child(popup)
	popup.popup()



