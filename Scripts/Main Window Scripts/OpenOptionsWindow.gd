extends Button
@export var windowScene: PackedScene

func _pressed():
	
	var window = windowScene.instantiate()
	var sceneRoot = self.owner
	sceneRoot.add_child(window)

	# the proper method to open it would be window.show(). 
	# But if i do that, the window wont be exclusive anymore.
	# So i guess we'll just take this one even if it throws an error
	window.popup()



