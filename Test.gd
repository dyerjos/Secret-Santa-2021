extends ColorRect


func _on_TestBtn1_pressed():
	WizardSpells.contact_spirits["execute"].call_func()


func _on_TestBtn2_pressed():
	WizardSpells.contact_spirits()


func _on_TestBtn3_pressed():
	WizardSpells.call("contact_spirits")
