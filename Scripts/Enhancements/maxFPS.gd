extends SpinBox

var configManagerPath = "/root/Control/WindowDialog"
export(String) var section
export(String) var configValue


func _on_WindowDialog_loaded():
	var configManager = get_node(configManagerPath)
	var config = configManager.config
	set_value(config.get_value(section, configValue))



func _on_maxFPS_value_changed(value):
	var configManager = get_node(configManagerPath)
	var config = configManager.config
	config.set_value(section, configValue, int(value))

func _ready():
	global.connect("reloadInterface", self, "_reload_interface")

# on "_reload_interface" get the stored values again, and apply them
func _reload_interface():
	var configManager = get_node(configManagerPath)
	var config = configManager.config
	set_value(config.get_value(section, configValue))

