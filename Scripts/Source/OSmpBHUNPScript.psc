Scriptname OSmpBHUNPScript extends Quest

; where female NPCs will be stored
actor[] SceneActors

; where female NPCs who already had SMP applied will be stored
actor[] SceneActorsHadSMP

armor NPCMain48
armor NPCMain50
armor NPCMain51
armor NPCMain60
int bhunpMcmSmpIndex = 0

Armor CurrentSMPArmor

Actor property PlayerRef auto

OSmpBHUNPMCMScript property OsmpMCM auto

BHUNPAddonMCM property MCM auto
BHUNP3BControllerScript property BHUNP3BController auto

OsexIntegrationMain property OStim auto


; ███████╗██╗   ██╗███████╗███╗   ██╗████████╗███████╗
; ██╔════╝██║   ██║██╔════╝████╗  ██║╚══██╔══╝██╔════╝
; █████╗  ██║   ██║█████╗  ██╔██╗ ██║   ██║   ███████╗
; ██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║╚██╗██║   ██║   ╚════██║
; ███████╗ ╚████╔╝ ███████╗██║ ╚████║   ██║   ███████║
; ╚══════╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝


event OnInit()
	OStim = OUtils.GetOStim()
	RegisterForModEvent("ostim_start", "OstimStart")
	RegisterForModEvent("ostim_end", "OstimEnd")

	UpdateNPCSmpArmorForms(OsmpMCM.smpCupIndex)

	PrintToConsole("Installed!")
endevent


function HandleModEvents()
	UnregisterForAllModEvents()

	OStim = OUtils.GetOStim()

	RegisterForModEvent("ostim_start", "OstimStart")
	RegisterForModEvent("ostim_end", "OstimEnd")

	UpdateNPCSmpArmorForms(OsmpMCM.smpCupIndex)

	PrintToConsole("Finished loading")
endfunction


event OstimStart(string eventname, string strarg, float numarg, form sender)
	; if OSmp is disabled, don't run this event
	if OsmpMCM.toggleDisableOSmp
		return
	endif

	PrintToConsole("Starting...")

	SceneActors = PapyrusUtil.ResizeActorArray(SceneActors, 0)
	SceneActorsHadSMP = PapyrusUtil.ResizeActorArray(SceneActorsHadSMP, 0)

	actor[] ActorsInScene = OThread.GetActors(0)

	actor currentActor

	int i = ActorsInScene.Length

	bool currentActorHadSMP

	; Due to OStim scene setup being a somewhat script heavy process
	; SMP may fail to apply if we don't use this wait
	; This doesn't happen in 3BA version because CBBE 3BA resets the bones nodes when SMP is toggled on
	; BHUNP doesn't do the same process for some reason
	; I tested this extensively and the only way to avoid SMP failure is by using this wait
	Utility.Wait(1)

	while i
		i -= 1

		currentActor = ActorsInScene[i]

		if OStim.AppearsFemale(currentActor)
			SceneActors = PapyrusUtil.PushActor(SceneActors, currentActor)
			currentActorHadSMP = isActorSMP(currentActor)

			if currentActorHadSMP
				SceneActorsHadSMP = PapyrusUtil.PushActor(SceneActorsHadSMP, currentActor)
			else
				EquipSmpForActor(currentActor)
			endif
		endif
	endWhile

	PrintToConsole("Finished!")
endevent


event OstimEnd(string eventname, string strarg, float numarg, form sender)
	PrintToConsole("Checking if any actors need SMP cleaning...")

	int i = SceneActors.Length

	actor currentActor

	while i
		i -= 1

		currentActor = SceneActors[i]

		if isActorSMP(currentActor)
			RemoveSmpFromActor(currentActor, SceneActorsHadSMP.Find(currentActor) >= 0)
		endif
	endwhile

	SceneActors = PapyrusUtil.ResizeActorArray(SceneActors, 0)
	SceneActorsHadSMP = PapyrusUtil.ResizeActorArray(SceneActorsHadSMP, 0)
endevent



;  ██████╗██████╗ ██████╗  ██████╗    ███████╗██╗   ██╗███╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗
; ██╔════╝██╔══██╗██╔══██╗██╔════╝    ██╔════╝██║   ██║████╗  ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
; ██║     ██████╔╝██████╔╝██║         █████╗  ██║   ██║██╔██╗ ██║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗
; ██║     ██╔══██╗██╔═══╝ ██║         ██╔══╝  ██║   ██║██║╚██╗██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║
; ╚██████╗██████╔╝██║     ╚██████╗    ██║     ╚██████╔╝██║ ╚████║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║
;  ╚═════╝╚═════╝ ╚═╝      ╚═════╝    ╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝


function StopCbpcForActor(Actor act)
	BHUNP3BController.CBPCBreasts(act, true)
	BHUNP3BController.CBPCButts(act, true)
	BHUNP3BController.CBPCBelly(act, true)
	BHUNP3BController.CBPCVagina(act, true)
	BHUNP3BController.CBPCVaginaCollision(act, true)
	BHUNP3BController.CBPCThigh(act, true)
endfunction


function StopCbpcForPlayer()
	BHUNP3BController.CBPCBreastsPlayer(PlayerRef, true)
	BHUNP3BController.CBPCButtsPlayer(PlayerRef, true)
	BHUNP3BController.CBPCBellyPlayer(PlayerRef, true)
	BHUNP3BController.CBPCVaginaPlayer(PlayerRef, true)
	BHUNP3BController.CBPCVaginaCollisionPlayer(PlayerRef, true)
	BHUNP3BController.CBPCThighPlayer(PlayerRef, true)
endfunction


; ███████╗███╗   ███╗██████╗     ███████╗██╗   ██╗███╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗
; ██╔════╝████╗ ████║██╔══██╗    ██╔════╝██║   ██║████╗  ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
; ███████╗██╔████╔██║██████╔╝    █████╗  ██║   ██║██╔██╗ ██║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗
; ╚════██║██║╚██╔╝██║██╔═══╝     ██╔══╝  ██║   ██║██║╚██╗██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║
; ███████║██║ ╚═╝ ██║██║         ██║     ╚██████╔╝██║ ╚████║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║
; ╚══════╝╚═╝     ╚═╝╚═╝         ╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝


bool function isActorSMP(actor partnerSMP)
	bool isSMP = partnerSMP.IsInFaction(MCM.BHUNPSMPFaction)

	String partnerName = partnerSMP.GetActorBase().GetName()

	if isSMP
		PrintToConsole(partnerName + " is in SMP mode")
	else
		PrintToConsole(partnerName + " is in CBPC mode")
	endif

	return isSMP
endfunction


function EquipSmpForPlayer()
	PrintToConsole("Applying SMP to player character ...")

	int PlayerSMPIndex = MCM.PsTIndex

	PlayerRef.addtofaction(MCM.BHUNPSMPFaction)

	if MCM.PSlotList[PlayerSMPIndex] == MCM.S69
		StopCbpcForPlayer()
		SetCurrentSMPArmor(PlayerRef)
		PlayerRef.EquipItem(CurrentSMPArmor as form, true, true)
		PlayerRef.SetFactionRank(MCM.BHUNPSMPFaction, 5)
	else
		StopCbpcForActor(PlayerRef)

		if MCM.PSlotList[PlayerSMPIndex] == MCM.S48
			PlayerRef.EquipItem(MCM.SMP3BONObjectP48 as form, true, true)
			PlayerRef.SetFactionRank(MCM.BHUNPSMPFaction, 1)

		elseIf MCM.PSlotList[PlayerSMPIndex] == MCM.S50
			PlayerRef.EquipItem(MCM.SMP3BONObjectP50 as form, true, true)
			PlayerRef.SetFactionRank(MCM.BHUNPSMPFaction, 2)

		elseIf MCM.PSlotList[PlayerSMPIndex] == MCM.S51
			PlayerRef.EquipItem(MCM.SMP3BONObjectP51 as form, true, true)
			PlayerRef.SetFactionRank(MCM.BHUNPSMPFaction, 3)

		elseIf MCM.PSlotList[PlayerSMPIndex] == MCM.S60
			PlayerRef.EquipItem(MCM.SMP3BONObjectP60 as form, true, true)
			PlayerRef.SetFactionRank(MCM.BHUNPSMPFaction, 4)

		endif
	endif

	PlayerRef.QueueNiNodeUpdate()

	PrintToConsole("SMP applied to player character")
endfunction


function EquipSmpForActor(Actor act)
	if (act == PlayerRef)
		EquipSmpForPlayer()
		return
	endif

	PrintToConsole("Applying SMP to " + act.GetActorBase().GetName() + "...")

	StopCbpcForActor(act)

	int cupSizeToUse = OSmpMCM.smpCupIndex

	if OsmpMCM.toggleAutomaticCup
		float npcWeight = act.GetActorBase().GetWeight()

		cupSizeToUse = 0

		if npcWeight < OsmpMCM.aCupMaximumWeight
			cupSizeToUse = 0
		elseif npcWeight < OsmpMCM.bCupMaximumWeight
			cupSizeToUse = 1
		elseif npcWeight < OsmpMCM.cCupMaximumWeight
			cupSizeToUse = 2
		else
			cupSizeToUse = 3
		endif
	endif

	UpdateNPCSmpArmorForms(cupSizeToUse)

	act.addtofaction(MCM.BHUNPSMPFaction)

	if MCM.SlotList[bhunpMcmSmpIndex] == MCM.S48
		act.EquipItem(NPCMain48 as form, true, true)
		act.setfactionrank(MCM.BHUNPSMPFaction, 1)
	elseIf MCM.SlotList[bhunpMcmSmpIndex] == MCM.S50
		act.EquipItem(NPCMain50 as form, true, true)
		act.setfactionrank(MCM.BHUNPSMPFaction, 2)
	elseIf MCM.SlotList[bhunpMcmSmpIndex] == MCM.S51
		act.EquipItem(NPCMain51 as form, true, true)
		act.setfactionrank(MCM.BHUNPSMPFaction, 3)
	elseIf MCM.SlotList[bhunpMcmSmpIndex] == MCM.S60
		act.EquipItem(NPCMain60 as form, true, true)
		act.setfactionrank(MCM.BHUNPSMPFaction, 4)
	endIf

	BHUNP3BController.TrackedActorAdd(act)

	act.QueueNiNodeUpdate()

	PrintToConsole("SMP applied to " + act.GetActorBase().GetName() + " with cup size " + cupSizeToUse)
endfunction


function RemoveSmpFromActor(Actor act, bool hadSmp)
	if act == PlayerRef
		if !OsmpMCM.toggleKeepPlayerSMP
			PrintToConsole("Removing SMP from player character...")

			MCM.PlayerSMP()

			if MCM.PSlotList[MCM.PsTIndex] == MCM.S69
				PlayerRef.RemoveItem(CurrentSMPArmor, 99, true, none)
			endif

			PrintToConsole("SMP cleaned from player character")
		endif
	else
		if !OSmpMCM.toggleKeepNPCSMP || !hadSmp
			PrintToConsole("Removing SMP from " + act.GetActorBase().GetName() + "...")
			MCM.NPCSMP(act, OsmpMCM.smpCupIndex)
			PrintToConsole("SMP cleaned from " + act.GetActorBase().GetName())
		endif
	endif
endFunction


; ██╗   ██╗████████╗██╗██╗     ███████╗
; ██║   ██║╚══██╔══╝██║██║     ██╔════╝
; ██║   ██║   ██║   ██║██║     ███████╗
; ██║   ██║   ██║   ██║██║     ╚════██║
; ╚██████╔╝   ██║   ██║███████╗███████║
;  ╚═════╝    ╚═╝   ╚═╝╚══════╝╚══════╝


function PrintToConsole(String In)
	MiscUtil.PrintConsole("OSmp: " + In)
endFunction


function UpdateNPCSmpArmorForms(int cupSize)
	if cupSize == 0
		NPCMain48 = MCM.SMP3BONObjectF148
		NPCMain50 = MCM.SMP3BONObjectF150
		NPCMain51 = MCM.SMP3BONObjectF151
		NPCMain60 = MCM.SMP3BONObjectF160
		bhunpMcmSmpIndex = MCM.FAsTIndex
	elseIf cupSize == 1
		NPCMain48 = MCM.SMP3BONObjectF248
		NPCMain50 = MCM.SMP3BONObjectF250
		NPCMain51 = MCM.SMP3BONObjectF251
		NPCMain60 = MCM.SMP3BONObjectF260
		bhunpMcmSmpIndex = MCM.FBsTIndex
	elseIf cupSize == 2
		NPCMain48 = MCM.SMP3BONObjectF348
		NPCMain50 = MCM.SMP3BONObjectF350
		NPCMain51 = MCM.SMP3BONObjectF351
		NPCMain60 = MCM.SMP3BONObjectF360
		bhunpMcmSmpIndex = MCM.FCsTIndex
	elseIf cupSize == 3
		NPCMain48 = MCM.SMP3BONObjectF448
		NPCMain50 = MCM.SMP3BONObjectF450
		NPCMain51 = MCM.SMP3BONObjectF451
		NPCMain60 = MCM.SMP3BONObjectF460
		bhunpMcmSmpIndex = MCM.FDsTIndex
	endIf
endfunction


function SetCurrentSMPArmor(actor akactor)

	int PlayerSMPCup = BHUNP3BController.PlayerSMPCup

	bool PlayerBreastsSMP = BHUNP3BController.PlayerBreastsSMP
	bool PlayerButtsSMP = BHUNP3BController.PlayerButtsSMP
	bool PlayerVaginaSMP = BHUNP3BController.PlayerVaginaSMP
	bool PlayerBellySMP = BHUNP3BController.PlayerBellySMP

	if PlayerSMPCup == 0; Acup
	
		if PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectAcupFull60
		elseif !PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectAcupBellyVBB60
		elseif PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectAcupBellyBBV60
		elseif PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectAcupBBB60
		elseif PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectAcupBBV60
	
		elseif PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && !PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectAcupBB60
		elseif PlayerBreastsSMP && !PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectAcupBellyB60
		elseif PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectAcupBellyBB60
		elseif !PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectAcupButtsBelly60
		elseif !PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectAcupBellyV60
		elseif !PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectAcupBV60
			
		elseif PlayerBreastsSMP && !PlayerButtsSMP && !PlayerVaginaSMP && !PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectAcupB60
		elseif !PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && !PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectAcupButts60
		elseif !PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectAcupV60
		elseif !PlayerBreastsSMP && !PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectAcupBelly60
		endif
			
	elseif PlayerSMPCup == 1; Bcup
	
		if PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectBcupFull60
		elseif !PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectBcupBellyVBB60
		elseif PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectBcupBellyBBV60
		elseif PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectBcupBBB60
		elseif PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectBcupBBV60
	
		elseif PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && !PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectBcupBB60
		elseif PlayerBreastsSMP && !PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectBcupBellyB60
		elseif PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectBcupBellyBB60
		elseif !PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectBcupButtsBelly60
		elseif !PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectBcupBellyV60
		elseif !PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectBcupBV60
			
		elseif PlayerBreastsSMP && !PlayerButtsSMP && !PlayerVaginaSMP && !PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectBcupB60
		elseif !PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && !PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectBcupButts60
		elseif !PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectBcupV60
		elseif !PlayerBreastsSMP && !PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectBcupBelly60
		endif
	
	elseif PlayerSMPCup == 2; Ccup
	
		if PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectCcupFull60
		elseif !PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectCcupBellyVBB60
		elseif PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectCcupBellyBBV60
		elseif PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectCcupBBB60
		elseif PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectCcupBBV60
	
		elseif PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && !PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectCcupBB60
		elseif PlayerBreastsSMP && !PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectCcupBellyB60
		elseif PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectCcupBellyBB60
		elseif !PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectCcupButtsBelly60
		elseif !PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectCcupBellyV60
		elseif !PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectCcupBV60
			
		elseif PlayerBreastsSMP && !PlayerButtsSMP && !PlayerVaginaSMP && !PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectCcupB60
		elseif !PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && !PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectCcupButts60
		elseif !PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectCcupV60
		elseif !PlayerBreastsSMP && !PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectCcupBelly60
		endif
	
	elseif PlayerSMPCup == 3; Dcup
	
		if PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectDcupFull60;BaseShapeFull.xml
		elseif !PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectDcupBellyVBB60;BaseShape3A.xml
		elseif PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectDcupBellyBBV60;BaseShape3B.xml
		elseif PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectDcupBBB60;BaseShape3C.xml
		elseif PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectDcupBBV60;BaseShape3D.xml
	
		elseif PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && !PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectDcupBB60;BaseShape2A.xml
		elseif PlayerBreastsSMP && !PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectDcupBellyB60;BaseShape2B.xml
		elseif PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectDcupBellyBB60;BaseShape2C.xml
		elseif !PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectDcupButtsBelly60;BaseShape2D.xml
		elseif !PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectDcupBellyV60;BaseShape2E.xml
		elseif !PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectDcupBV60;BaseShape2F.xml
			
		elseif PlayerBreastsSMP && !PlayerButtsSMP && !PlayerVaginaSMP && !PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectDcupB60;BaseShape1A.xml
		elseif !PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && !PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectDcupButts60;BaseShape1B.xml
		elseif !PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectDcupV60;BaseShape1C.xml
		elseif !PlayerBreastsSMP && !PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
			CurrentSMPArmor = BHUNP3BController.SMP3BONObjectDcupBelly60;BaseShape1D.xml
		endif
	endif
EndFunction
