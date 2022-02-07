extends Button

var fpslimitPath = "/root/Control/WindowDialog/Enhancements Panel/FPS Limit"
var configManagerPath = "/root/Control/WindowDialog"
export(String) var section
export(String) var value


#	When the ini is loaded, get the value and apply it
func _on_WindowDialog_loaded():
	var configManager = get_node(configManagerPath)
	var config = configManager.config
	var vsync = config.get_value(section, value)
	.set_pressed(vsync)
	
	# check if the FPS limit is in conflict with vsync
	var fpslimitButton = get_node(fpslimitPath)
	var fpslimitCheckbox = fpslimitButton.get_child(0)
	fpslimitButton.set_disabled(vsync)
	fpslimitCheckbox.set_disabled(vsync)


#	when pressed, toggle the checkbox and save the config value
func _toggled(button_pressed):
	var configManager = get_node(configManagerPath)
	var config = configManager.config
	var vsync = config.get_value(section, value)
	config.set_value(section, value, button_pressed)
	
	print(section, ", ", value, ", ", "set to ", button_pressed)
	get_child(0).set_pressed(button_pressed)
	
	#	Disable and lock the FPS limiter
	var limitFPS = config.get_value(section, value)
	var fpslimitButton = get_node(fpslimitPath)
	var fpslimitCheckbox = fpslimitButton.get_child(0)
	var fpslimitLineedit = fpslimitButton.get_child(1)
	fpslimitButton.set_disabled(button_pressed)
	fpslimitCheckbox.set_disabled(button_pressed)
	if button_pressed == true:
		fpslimitLineedit.set_editable(not button_pressed)
	if button_pressed == true:
		fpslimitCheckbox.set_pressed(false)

func _ready():
	global.connect("reloadInterface", self, "_reload_interface")

# on "_reload_interface" get the stored values again, and apply them
func _reload_interface():
	var configManager = get_node(configManagerPath)
	var config = configManager.config
	set_pressed(config.get_value(section, value))
