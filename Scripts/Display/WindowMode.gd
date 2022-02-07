extends OptionButton

var configManagerPath = "/root/Control/WindowDialog"
export(String) var section
export(String) var value
var modes = ["Fullscreen", "Borderless Window", "Window"]




func _on_WindowDialog_loaded():
	var configManager = get_node(configManagerPath)
	var config = configManager.config
	print(modes.find(config.get_value(section, value)))
	#print(config.get_value(section, value))
	._select_int((modes.find(config.get_value(section, value))))


func _on_Window_Mode_item_selected(index):
	var configManager = get_node(configManagerPath)
	var config = configManager.config
	config.set_value(section, value, modes[index])

func _ready():
	global.connect("reloadInterface", self, "_reload_interface")

# on "_reload_interface" get the stored values again, and apply them
func _reload_interface():
	var configManager = get_node(configManagerPath)
	var config = configManager.config
	._select_int(modes.find((config.get_value(section, value))))
