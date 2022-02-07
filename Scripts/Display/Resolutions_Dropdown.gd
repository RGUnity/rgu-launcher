extends OptionButton

var configManagerPath = "/root/Control/WindowDialog"

#	
func _on_WindowDialog_loaded():
	var configManager = get_node(configManagerPath)
	var config = configManager.config
	var resolutions = config.get_value("Display", "resolutions")

	#	Disable the Dropdown if useDesktopResolution is enabled
	.set_disabled (config.get_value("Display", "useDesktopResolution"))
	
		# Add the options
	for q in resolutions:
		.add_item(str(q))
#		print(resolutions.find(q)) #This resurns the current index
#		.set_item_text(resolutions.find(q), q)	#Just in case you wondered how to manually set an item


	var resolution = config.get_value("Display", "resolution")
	._select_int(resolution)
	
#	This returns the X and Y resolution seperately
#	var array = resolutions[int(resolution)].rsplit("x")
#	print (array)
	
	#  set the text on the dropdown	when the WindowDialog first loads
	if (config.get_value("Display", "useDesktopResolution")) == true:
		.set_text(str(OS.get_screen_size().x) + "x"+ str(OS.get_screen_size().y)+ " (Display)")
	else:
		.set_text(.get_item_text(.get_selected()))


#  set the text on the dropdown	when useDesktopResolution is toogled
func _on_useDesktop_toggled(button_pressed):
	.set_disabled(button_pressed)
	if button_pressed == true:
		.set_text(str(OS.get_screen_size().x) + "x"+ str(OS.get_screen_size().y)+ " (Display)")
	else:
		.set_text(.get_item_text(.get_selected()))
		

#	when a dropdown item is selected, save that int as "resolution" in the config
func _on_Resolutions_item_selected(index):
	var configManager = get_node(configManagerPath)
	var config = configManager.config
	config.set_value("Display", "resolution", index)

#	On start, subscribe to the signal "reloadInterface"
func _ready():
	global.connect("reloadInterface", self, "_reload_interface")

# on "_reload_interface" get the stored values again, and apply them
func _reload_interface():
	var configManager = get_node(configManagerPath)
	var config = configManager.config
	._select_int(config.get_value("Display", "resolution"))
