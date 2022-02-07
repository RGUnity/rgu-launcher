extends Button

var configManagerPath = "/root/Control/WindowDialog"
export(String) var section
export(String) var value

#	When the ini is loaded, get the value and apply it
func _on_WindowDialog_loaded():
	var configManager = get_node(configManagerPath)
	var config = configManager.config
	set_pressed(config.get_value(section, value))


#	when pressed, toggle the checkbox and save the config value
func _toggled(button_pressed):
	var configManager = get_node(configManagerPath)
	var config = configManager.config
	config.set_value(section, value, button_pressed)
	print(section, ", ", value, ", ", "set to ", button_pressed)
	get_child(0).set_pressed(button_pressed)
	
#	On start, subscribe to the signal "reloadInterface"
func _ready():
	global.connect("reloadInterface", self, "_reload_interface")

# on "_reload_interface" get the stored values again, and apply them
func _reload_interface():
	var configManager = get_node(configManagerPath)
	var config = configManager.config
	set_pressed(config.get_value(section, value))
	get_child(0).set_pressed(config.get_value(section, value))
