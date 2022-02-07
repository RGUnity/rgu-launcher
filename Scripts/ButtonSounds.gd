extends AudioStreamPlayer

var cooldown = 0
export var cooldownTime = 15


func _process(_delta):
	if cooldown > 0:
		cooldown = cooldown - 1

# Play a random sound
func hoverSound():
	if cooldown == 0: 
		get_node("RandomAudioStreamPlayer").play()
		print("Played hover sound")
		cooldown = cooldownTime
		
# Play scrape2.wav on click
func clickSound():
	if cooldown == 0: 
		self.set_stream(load("res://Sounds/SCRAPE2.wav"))
		self.play()
		print("Played click sound")
		cooldown = 30

#	Hover Sounds
func _on_Play_Redguard_mouse_entered():
	hoverSound()

func _on_Game_Options_mouse_entered():
	hoverSound()

func _on_Technical_Support_mouse_entered():
	hoverSound()

func _on_Bethsoft_mouse_entered():
	hoverSound()

func _on_Uninstall_mouse_entered():
	hoverSound()

func _on_Quit_mouse_entered():
	hoverSound()

#	Click Sounds
func _on_Play_Redguard_pressed():
	clickSound()

func _on_Game_Options_pressed():
	clickSound()

func _on_Technical_Support_pressed():
	clickSound()

func _on_Bethsoft_pressed():
	clickSound()

func _on_Uninstall_pressed():
	clickSound()

func _on_Quit_pressed():
	pass
	#clickSound()
	#wont play for some reason, and instead of adding a timer lets just keep it off for now
