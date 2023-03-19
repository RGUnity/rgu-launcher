extends Node

@export_group("Display Category")
@export var windowModeDropdown: OptionButton
@export var vsyncCheckbox: CheckBox
@export var limitFPSCheckbox: CheckBox
@export var maxFPSSpinbox: SpinBox

@export_group("Graphics Category")
@export var antiAliasingCheckbox: CheckBox
@export var shadowsCheckbox: CheckBox

@export_group("Audio Category")
@export var musicSlider: Slider
@export var effectsSlider: Slider
@export var voicesSlider: Slider

@export_group("Gameplay Category")
@export var subtitlesCheckbox: CheckBox
@export var autodefendCheckbox: CheckBox

@export_group("")

# PATH
@export var redguardPathLineEdit: LineEdit


var config = ConfigFile.new()


func _on_options_window_about_to_popup():
	_load_config_and_set_values()


func _load_config_and_set_values():
	
	%ConfigLoader.load_config()
	
	# DISPLAY CATEGORY GETTERS
	windowModeDropdown.selected = config.get_value("Display", "windowMode")
	vsyncCheckbox.button_pressed = config.get_value("Display", "vsync")
	limitFPSCheckbox.button_pressed = config.get_value("Display", "limitFPS")
	maxFPSSpinbox.value = config.get_value("Display", "maxFPS")
	
	# GRAPHICS CATEGORY GETTERS
	antiAliasingCheckbox.button_pressed = config.get_value("Graphics", "antiAliasing")
	shadowsCheckbox.button_pressed = config.get_value("Graphics", "shadows")
	
	# AUDIO CATEGORY GETTERS
	musicSlider.value = config.get_value("Audio", "music")
	effectsSlider.value = config.get_value("Audio", "effects")
	voicesSlider.value = config.get_value("Audio", "voices")
	
	# GAMEPLAY CATEGORY GETTERS
	subtitlesCheckbox.button_pressed = config.get_value("Gameplay", "subtitles")
	autodefendCheckbox.button_pressed = config.get_value("Gameplay", "autoDefend")
	
	# FILEPATHS CATEGORY GETTERS
	redguardPathLineEdit.text = config.get_value("FilePaths", "redguardPath")
	
	%DependencyManager.update_vsync_dependencies()
	%DependencyManager.update_fpslimit_dependencies()


func set_values_and_save_config():
	
	# DISPLAY CATEGORY SETTERS
	config.set_value("Display", "windowMode", windowModeDropdown.selected)
	config.set_value("Display", "vsync", vsyncCheckbox.button_pressed)
	config.set_value("Display", "limitFPS", limitFPSCheckbox.button_pressed)
	config.set_value("Display", "maxFPS", maxFPSSpinbox.value)

	# GRAPHICS CATEGORY SETTERS
	config.set_value("Graphics", "antiAliasing", antiAliasingCheckbox.button_pressed)
	config.set_value("Graphics", "shadows", shadowsCheckbox.button_pressed)
	
	# AUDIO CATEGORY SETTERS
	config.set_value("Audio", "music", musicSlider.value)
	config.set_value("Audio", "effects", effectsSlider.value)
	config.set_value("Audio", "voices", voicesSlider.value)
	
	# GAMEPLAY CATEGORY SETTERS
	config.set_value("Gameplay", "subtitles", subtitlesCheckbox.button_pressed)
	config.set_value("Gameplay", "autoDefend", autodefendCheckbox.button_pressed)
	
	# FILEPATHS CATEGORY SETTERS
	config.set_value("FilePaths", "redguardPath", redguardPathLineEdit.text)
	
	%ConfigSaver.save_config()
