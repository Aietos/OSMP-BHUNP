Scriptname OSmpBHUNPMCMScript extends SKI_ConfigBase

; List
string[] smpCupList

; OID
int smpCupOID_M
int toggleDisableOSmpOID_B
int toggleKeepPlayerSMPOID_B
int toggleKeepNPCSMPOID_B
int toggleAutomaticCupOID_B
int aCupMaximumWeightOID_S
int bCupMaximumWeightOID_S
int cCupMaximumWeightOID_S
int dCupMaximumWeightOID_S

; State
Int property smpCupIndex = 0 auto
bool property toggleDisableOSmp = false auto
bool property toggleKeepPlayerSMP = true auto
bool property toggleKeepNPCSMP = true auto
bool property toggleAutomaticCup = true auto
float property aCupMaximumWeight = 25.0 auto
float property bCupMaximumWeight = 50.0 auto
float property cCupMaximumWeight = 75.0 auto
float property dCupMaximumWeight = 100.0 auto


event OnInit()
	parent.OnInit()

	Modname = "OSmp BHUNP"

	smpCupList = new string[4]
	smpCupList[0] = "A Cup"
	smpCupList[1] = "B Cup"
	smpCupList[2] = "C Cup"
	smpCupList[3] = "D Cup"
endEvent


event OnGameReload()
	parent.onGameReload()

	OSmp.HandleModEvents()
endevent


event OnPageReset(string page)
	SetCursorFillMode(TOP_TO_BOTTOM)

	smpCupOID_M = AddMenuOption("NPC Cup Size (Jiggle Amount)", smpCupList[smpCupIndex])
	toggleKeepPlayerSMPOID_B = AddToggleOption("Keep SMP in Player Character", toggleKeepPlayerSMP)
	toggleKeepNPCSMPOID_B = AddToggleOption("Keep SMP in NPCs who had SMP previously", toggleKeepNPCSMP)
	toggleDisableOSmpOID_B = AddToggleOption("Disable OSmp", toggleDisableOSmp)

	SetCursorPosition(1)

	AddHeaderOption("Automatic NPC Cup Size Configuration")
	AddEmptyOption()
	toggleAutomaticCupOID_B = AddToggleOption("Automatic NPC Cup Size", toggleAutomaticCup)
	AddEmptyOption()
	aCupMaximumWeightOID_S = AddSliderOption("A Cup Maximum Weight", aCupMaximumWeight, "{0}")
	bCupMaximumWeightOID_S = AddSliderOption("B Cup Maximum Weight", bCupMaximumWeight, "{0}")
	cCupMaximumWeightOID_S = AddSliderOption("C Cup Maximum Weight", cCupMaximumWeight, "{0}")
	dCupMaximumWeightOID_S = AddSliderOption("D Cup Maximum Weight", dCupMaximumWeight, "{0}")
	AddEmptyOption()
	AddTextOption("Here you can configure at which weight cups apply", "", OPTION_FLAG_DISABLED)
	AddTextOption("Example:", "", OPTION_FLAG_DISABLED)
	AddTextOption("If A Cup maximum weight is 25", "", OPTION_FLAG_DISABLED)
	AddTextOption("And if B Cup maximum weight is 50", "", OPTION_FLAG_DISABLED)
	AddTextOption("Then, NPCs between 0-25 weight will get A Cup", "", OPTION_FLAG_DISABLED)
	AddTextOption("And NPCs between 26-50 weight will get B Cup", "", OPTION_FLAG_DISABLED)
	AddEmptyOption()
	AddTextOption("To prevent a given Cup size from being applied", "", OPTION_FLAG_DISABLED)
	AddTextOption("set it to -1.", "", OPTION_FLAG_DISABLED)
	AddEmptyOption()
	AddTextOption("Check mod page for more details and examples!", "", OPTION_FLAG_DISABLED)
	AddEmptyOption()
endEvent


event OnOptionSliderOpen(int option)
	if (option == aCupMaximumWeightOID_S)
		SetSliderDialogStartValue(aCupMaximumWeight)
		SetSliderDialogDefaultValue(25.0)
		SetSliderDialogRange(-1.0, 100.0)
		SetSliderDialogInterval(1.0)
	elseIf (option == bCupMaximumWeightOID_S)
		SetSliderDialogStartValue(bCupMaximumWeight)
		SetSliderDialogDefaultValue(50.0)
		SetSliderDialogRange(-1.0, 100.0)
		SetSliderDialogInterval(1.0)
	elseIf (option == cCupMaximumWeightOID_S)
		SetSliderDialogStartValue(cCupMaximumWeight)
		SetSliderDialogDefaultValue(75.0)
		SetSliderDialogRange(-1.0, 100.0)
		SetSliderDialogInterval(1.0)
	elseIf (option == dCupMaximumWeightOID_S)
		SetSliderDialogStartValue(dCupMaximumWeight)
		SetSliderDialogDefaultValue(100.0)
		SetSliderDialogRange(-1.0, 100.0)
		SetSliderDialogInterval(1.0)
	endIf
endEvent

event OnOptionSliderAccept(int option, float value)
	if (option == aCupMaximumWeightOID_S)
		aCupMaximumWeight = value
		SetSliderOptionValue(aCupMaximumWeightOID_S, aCupMaximumWeight, "{0}")
	elseIf (option == bCupMaximumWeightOID_S)
		bCupMaximumWeight = value
		SetSliderOptionValue(bCupMaximumWeightOID_S, bCupMaximumWeight, "{0}")
	elseIf (option == cCupMaximumWeightOID_S)
		cCupMaximumWeight = value
		SetSliderOptionValue(cCupMaximumWeightOID_S, cCupMaximumWeight, "{0}")
	elseIf (option == dCupMaximumWeightOID_S)
		dCupMaximumWeight = value
		SetSliderOptionValue(dCupMaximumWeightOID_S, dCupMaximumWeight, "{0}")
	endIf
endEvent


event OnOptionMenuOpen(int option)
	if (option == smpCupOID_M)
		SetMenuDialogOptions(smpCupList)
		SetMenuDialogStartIndex(smpCupIndex)
		SetMenuDialogDefaultIndex(1)
	endIf
endEvent


event OnOptionMenuAccept(int option, int index)
	if (option == smpCupOID_M)
		smpCupIndex = index
		SetMenuOptionValue(smpCupOID_M, smpCupList[smpCupIndex])
		OSmp.UpdateNPCSmpArmorForms(smpCupIndex)
	endIf
endEvent

event OnOptionSelect(int option)
	if (option == toggleDisableOSmpOID_B)
		toggleDisableOSmp = !toggleDisableOSmp
		SetToggleOptionValue(toggleDisableOSmpOID_B, toggleDisableOSmp)
	elseif (option == toggleKeepPlayerSMPOID_B)
		toggleKeepPlayerSMP = !toggleKeepPlayerSMP
		SetToggleOptionValue(toggleKeepPlayerSMPOID_B, toggleKeepPlayerSMP)
	elseif (option == toggleKeepNPCSMPOID_B)
		toggleKeepNPCSMP = !toggleKeepNPCSMP
		SetToggleOptionValue(toggleKeepNPCSMPOID_B, toggleKeepNPCSMP)
	elseif (option == toggleAutomaticCupOID_B)
		toggleAutomaticCup = !toggleAutomaticCup
		SetToggleOptionValue(toggleAutomaticCupOID_B, toggleAutomaticCup)
	endIf
endEvent

event OnOptionHighlight(int option)
	if (option == smpCupOID_M)
		SetInfoText("Select how much jiggle you want for NPCs.\nA Cup is very little jiggle, C cup is most jiggle, and D cup the breasts will have a lot of weight and gravity on them.\nThis does NOT affect breast size!\nIf you enable Automatic Cup Size, this selection will obviously be ignored.")
	elseif (option == toggleDisableOSmpOID_B)
		SetInfoText("Turn on this option to prevent SMP from being applied at OStim scene start.")
	elseif (option == toggleKeepPlayerSMPOID_B)
		SetInfoText("Turn on this option to keep SMP on Player Character even after OStim scene ends.")
	elseif (option == toggleKeepNPCSMPOID_B)
		SetInfoText("Turn on this option to keep SMP on NPCs that had SMP manually applied by you even after OStim scene ends.")
	elseif (option == toggleAutomaticCupOID_B)
		SetInfoText("Turn on this option to choose cup size based on the NPC's weight. A Cup is least jiggle, C cup is most jiggle, and D cup the breasts will have a lot of weight and gravity. This does NOT affect breast size!\nThis option works best if your Bodyslide presets vary a lot between 0 and 100 weight.\nYou can configure Cups weight distributions in the options below.")
	endif
endEvent


OSmpBHUNPScript property OSmp auto
