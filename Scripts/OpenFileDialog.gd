extends Button
export(NodePath) var fileWindowPath
var fileWindow

func _pressed():
	fileWindow = get_node(fileWindowPath)
	fileWindow.popup_centered()
