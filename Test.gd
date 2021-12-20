extends ColorRect


func _on_TestBtn1_pressed():
#	arguments must go in the call_func(targets, reckless=false, player_weapon_used=null)
#	Moves.hack_and_slash["execute"].call_func()
	print("testbtn1")


func _on_TestBtn2_pressed():
#	WizardSpells.contact_spirits()
	print("testbtn2")


func _on_TestBtn3_pressed():
#	WizardSpells.call("contact_spirits")
	print("testbtn3")
