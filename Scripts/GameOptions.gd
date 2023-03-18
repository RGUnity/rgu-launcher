extends Button
@export var windowPath: NodePath
var window

func _pressed():
	window = get_node(windowPath)
	window.popup_centered()

