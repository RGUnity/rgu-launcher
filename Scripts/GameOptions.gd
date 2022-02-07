extends Button
export(NodePath) var windowPath
var window

func _pressed():
	window = get_node(windowPath)
	window.popup_centered()
