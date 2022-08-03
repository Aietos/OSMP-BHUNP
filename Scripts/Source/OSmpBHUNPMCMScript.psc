Scriptname OSmpBHUNPMCMScript extends SKI_ConfigBase

; List
string[] smpCupList

; OID
int smpCupOID_M

; State
Int property smpCupIndex = 0 auto


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
	smpCupOID_M = AddMenuOption("Cup Size", smpCupList[smpCupIndex])
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
