extends HSlider

var configManagerPath = "/root/Control/WindowDialog"
export(String) var section
export(String) var configValue

#	A function to set values because i dont wanna copy paste this
func SetValues():
	var configManager = get_node(configManagerPath)
	var config = configManager.config
	config.set_value(section, configValue, value)


#	When WindowDialog is ready, load the values and apply it to the slider
func _on_WindowDialog_loaded():
	var configManager = get_node(configManagerPath)
	var config = configManager.config
	set_value(config.get_value(section, configValue))
	
	
#	seperate signals because a generic _value_changed() doesnt work apparently
func _on_Music_Slider_value_changed(value):
	SetValues()

func _on_Effects_Slider_value_changed(value):
	SetValues()

func _on_Voices_Slider_value_changed(value):
	SetValues()


func _ready():
	global.connect("reloadInterface", self, "_reload_interface")

# on "_reload_interface" get the stored values again, and apply them
func _reload_interface():
	var configManager = get_node(configManagerPath)
	var config = configManager.config
	set_value(config.get_value(section, configValue))
