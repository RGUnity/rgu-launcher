extends WindowDialog

var config = ConfigFile.new()
var directory = Directory.new()
#	Path for the template config file that gets copied if no config file exists
var defaultPath = OS.get_executable_path().get_base_dir() + "/Config_Default.cfg"
var defaultPathEditor = ProjectSettings.globalize_path("res://Config_Default.cfg")
#	These crate the path for the new file in /LocalLow
var drive = OS.get_environment("windir").rstrip("WINDOWS")
var user = OS.get_environment("USERNAME")
var path = drive + "/users/" + user + "/APPDATA/LOCALLOW/RGUnity/RedguardUnity/Config.cfg"
signal loaded



func _ready():
	
	#	Try to load the config file
	var loadConfig = config.load(path)
	
	#	if the file exists, load it. If it is missing, create a new one.
	if loadConfig == OK:
		print ("Config loaded Successfully: ", path)
	if loadConfig != OK:
		print ("Failed to load config, trying to create new one here: ", path)
		
		#	Check if we are running in Editor or Build, then load the available DefaultConfig
		if OS.has_feature("editor"):
			print("Running in Editor, looking for config here: ", defaultPathEditor)
			directory.copy(defaultPathEditor, path)

		#	Same thing, but in Build mode
		else: 
			print("Running as Build, looking for default config here: ", defaultPath)
			directory.copy(defaultPathEditor, path)
			
		#	After the config file has been restored, finally load its data
		config.load(path)

		#	Now Add a timestamp to mark the creation date and load it again
		var time = OS.get_datetime()
		var timestamp = String(time.year)+"-"+String(time.month)+"-"+String(time.day)+ " "+String(time.hour) +":"+String(time.minute)+":"+String(time.second)
		config.set_value("Info", "test", timestamp)
		config.save(path)	
		config.load(path)
	emit_signal("loaded")


#	Buttons signals: Load Defaults, Save & Close, Save

func _on_Save_pressed():
	config.save(path)
	print("Config saved to ", path)
	

func _on_Save__Quit_pressed():
	config.save(path)
	print("Config saved to ", path)
	.set_visible(false)
	

func _on_Defaults_pressed():
	directory.copy(defaultPathEditor, path)
	config.load(path)
	print("Defaults restored")
	global.emit_signal("reloadInterface")

