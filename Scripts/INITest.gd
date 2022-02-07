extends Button
#
#var config = ConfigFile.new()
#var drive = OS.get_environment("windir").rstrip("WINDOWS")
#var user = OS.get_environment("USERNAME")
#var path = drive + "/users/" + user + "/APPDATA/LOCALLOW/RGUnity/RedguardUnity/Config.cfg"
#	#error tests
#var loadError = config.load(path)
#var saveError = config.save(path)
#
#export(NodePath) var TestBool
#
#func _ready():
#	#load the config file
#	config.load(path)
#	#if the file exists, load it. If it is missing, create a new one.
#	if loadError == OK:
#		print ("Config loaded Successfully: ", path)
#	if loadError != OK:
#		print ("Failed to load config, creating new: ", path)
#	#set a test value
#	var test = config.set_value("Info", "test", "INI created successfully")
#	config.save(path)	
#
##Save Config File	
#func _pressed():
#	config.save(path)
#	if saveError == OK:
#		print ("Config Saved Successfully")
#	if saveError != OK:
#		print ("Failed to Save")
#
#
##Set TestBool
#func _on_TestBool_toggled(button_pressed):
#	config.set_value("Info", "TestBool", button_pressed)
#	print ("TestBool set to ", button_pressed)
#
##Get TestBool from Disk
#func _on_Get_Value_pressed():
#	print (config.get_value("Info", "TestBool", false))
