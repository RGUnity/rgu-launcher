extends Button

var configManagerPath = "/root/Control/WindowDialog"
export(String) var section
export(String) var value

#	When the ini is loaded, get the value and apply it
func _on_WindowDialog_loaded():
	var configManager = get_node(configManagerPath)
	var config = configManager.config
	
	#	Only enable it if vsync is disabled
	if config.get_value("Enhancements", "vsync") == false:
		set_pressed(config.get_value(section, value))
	else:
		config.set_value(section, value, false)
	#	also if "limitFPS == false", lock the lineEdit field 
	get_child(1).set_editable(config.get_value(section, value))
	
func _toggled(button_pressed):
	var configManager = get_node(configManagerPath)
	var config = configManager.config
	config.set_value(section, value, button_pressed)
	print(section, ", ", value, ", ", "set to ", button_pressed)
	get_child(0).set_pressed(button_pressed)
	# toggle the line edit field
	get_child(1).set_editable(button_pressed)

func _ready():
	global.connect("reloadInterface", self, "_reload_interface")

# on "_reload_interface" get the stored values again, and apply them
func _reload_interface():
	var configManager = get_node(configManagerPath)
	var config = configManager.config
	set_pressed(config.get_value(section, value))

