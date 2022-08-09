Scriptname OSmpBHUNPMCMScript extends SKI_ConfigBase

; List
string[] smpCupList

; OID
int smpCupOID_M
int toggleDisableOSmpOID_B
int toggleKeepPlayerSMPOID_B
int toggleKeepNPCSMPOID_B

; State
Int property smpCupIndex = 0 auto
bool property toggleDisableOSmp = false auto
bool property toggleKeepPlayerSMP = true auto
bool property toggleKeepNPCSMP = true auto


event OnInit()
	parent.OnInit()

	Modname = "OSmp BHUNP"

	smpCupList = new string[4]
	smpCupList[0] = "A Cup"
	smpCupList[1] = "B Cup"
	smpCupList[2] = "C Cup"
	smpCupList[3] = "D Cup"
endEvent


event OnPageReset(string page)
	SetCursorFillMode(TOP_TO_BOTTOM)
	smpCupOID_M = AddMenuOption("Cup Size", smpCupList[smpCupIndex])
	toggleKeepPlayerSMPOID_B = AddToggleOption("Keep SMP in Player Character", toggleKeepPlayerSMP)
	toggleKeepNPCSMPOID_B = AddToggleOption("Keep SMP in NPCs who had SMP previously", toggleKeepNPCSMP)
	toggleDisableOSmpOID_B = AddToggleOption("Disable OSmp", toggleDisableOSmp)
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
	endIf
endEvent

event OnOptionHighlight(int option)
	if (option == smpCupOID_M)
		SetInfoText("Select how much jiggle you want. A Cup is least jiggle, D Cup is most jiggle. This does NOT affect breast size!")
	elseif (option == toggleDisableOSmpOID_B)
		SetInfoText("Turn on this option to prevent SMP from being applied at OStim scene start.")
	elseif (option == toggleKeepPlayerSMPOID_B)
		SetInfoText("Turn on this option to keep SMP on Player Character even after OStim scene ends.")
	elseif (option == toggleKeepNPCSMPOID_B)
		SetInfoText("Turn on this option to keep SMP on NPCs that had SMP manually applied by you even after OStim scene ends.")
	endif
endEvent
