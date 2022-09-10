Scriptname OSmpBHUNPScript extends Quest

actor partner
actor secondPartner

bool playerIsFemale = false
bool partnerIsFemale = false
bool secondPartnerIsFemale = false

bool undressAtAnimStart = true

bool partnerHadSMP = false
bool secondPartnerHadSMP = false

armor NPCMain48
armor NPCMain50
armor NPCMain51
armor NPCMain60
int bhunpMcmSmpIndex = 0


event oninit()
	ostim = OUtils.GetOStim()
	registerformodevent("ostim_start", "OstimStart")
	registerformodevent("ostim_thirdactor_join", "OstimThirdJoin")
	registerformodevent("ostim_thirdactor_leave", "OstimThirdLeave")
	registerformodevent("ostim_end", "OstimEnd")
endevent


function HandleModEvents()
	unregisterForAllModEvents()

	ostim = OUtils.GetOStim()

	registerformodevent("ostim_start", "OstimStart")
	registerformodevent("ostim_thirdactor_join", "OstimThirdJoin")
	registerformodevent("ostim_thirdactor_leave", "OstimThirdLeave")
	registerformodevent("ostim_end", "OstimEnd")

	UpdateNPCSmpArmorForms(OsmpMCM.smpCupIndex)
endfunction


event OstimStart(string eventname, string strarg, float numarg, form sender)
	; if OSmp is disabled in MCM or player is not in scene, don't run this event
	; OSmp won't run on NPC scenes
	if !ostim.isPlayerInvolved() || OsmpMCM.toggleDisableOSmp
		return
	endif

	OsexIntegrationMain.Console("OSmp: Starting...")

	actor dom = ostim.GetDomActor()
	actor sub = ostim.GetSubActor()
	secondPartner = ostim.GetThirdActor()

	if dom == PlayerRef
		partner = sub
	else
		partner = dom
	endif

	bool playerHadSMP = isActorSMP(PlayerRef)
	playerIsFemale = ostim.isFemale(PlayerRef)

	partnerIsFemale = ostim.isFemale(partner)
	partnerHadSMP = isActorSMP(partner)

	if secondPartner != none
		secondPartnerIsFemale = ostim.isFemale(secondPartner)
		secondPartnerHadSMP = isActorSMP(secondPartner)
	endif

	OUndressScript oundress = ostim.GetUndressScript()
	undressAtAnimStart = ostim.AlwaysUndressAtAnimStart

	; Due to OStim scene setup being a script heavy process
	; SMP may fail to apply if we don't use this wait
	; This doesn't happen in 3BA version because CBBE 3BA resets the bones nodes when SMP is toggled on
	; BHUNP doesn't do the same process for some reason
	; I tested this extensively and the only way to avoid SMP failure is by using this wait
	Utility.Wait(1)

	if (partnerIsFemale && !partnerHadSMP)
		EquipSmpForActor(partner)

		if undressAtAnimStart
			form[] partnerClothes = oundress.storeequipmentforms(partner, true)
			oundress.UnequipForms(partner, partnerClothes)
		endif
	endif

	if (secondPartner != none && secondPartnerIsFemale && !secondPartnerHadSMP)
		EquipSmpForActor(secondPartner)

		if undressAtAnimStart
			form[] secondPartnerClothes = oundress.storeequipmentforms(secondPartner, true)
			oundress.UnequipForms(secondPartner, secondPartnerClothes)
		endif
	endif

	if (playerIsFemale && !playerHadSMP)
		OsexIntegrationMain.Console("OSmp: Applying SMP to player character ...")

		MCM.PlayerSMP()

		OsexIntegrationMain.Console("OSmp: SMP applied to player character")
	endif

	; we must toggle freecam off and on for SMP to properly apply to player character
	; only if user set the scene to start in freecam in OStim MCM
	; I have no idea why this is needed
	; in my tests, this was also needed outside of OStim scenes, SMP won't apply properly if you're in freecam
	; it is most likely a bug with 3BA/BHUNP SMP application, nothing I can do currently besides this freecam hack
	if playerIsFemale && !playerHadSMP && ostim.UseFreeCam && OSANative.IsFreeCam()
		ostim.ToggleFreeCam(false)
		ostim.ToggleFreeCam(true)
	endif

	OsexIntegrationMain.Console("OSmp: Finished!")
endevent


event OstimThirdJoin(string eventname, string strarg, float numarg, form sender)
	; if OSmp is disabled in MCM or player is not in scene, don't run this event
	; OSmp won't run on NPC scenes
	if !ostim.isPlayerInvolved() || OsmpMCM.toggleDisableOSmp
		return
	endif

	secondPartner = ostim.GetThirdActor()
	secondPartnerIsFemale = ostim.isFemale(secondPartner)
	secondPartnerHadSMP = isActorSMP(secondPartner)

	OUndressScript oundress = ostim.GetUndressScript()

	if (secondPartnerIsFemale && !secondPartnerHadSMP)
		EquipSmpForActor(secondPartner)

		if undressAtAnimStart
			form[] secondPartnerClothes = oundress.storeequipmentforms(secondPartner, true)
			oundress.UnequipForms(secondPartner, secondPartnerClothes)
		endif
	endif

endevent


event OstimThirdLeave(string eventname, string strarg, float numarg, form sender)
	if (secondPartnerIsFemale && (!OSmpMCM.toggleKeepNPCSMP || !secondPartnerHadSMP) && isActorSMP(secondPartner))
		OsexIntegrationMain.Console("OSmp: Removing SMP from " + secondPartner.GetActorBase().GetName() + "...")
		MCM.NPCSMP(secondPartner, OsmpMCM.smpCupIndex)
		OsexIntegrationMain.Console("OSmp: SMP cleaned from " + secondPartner.GetActorBase().GetName())
	endif
endevent


event OstimEnd(string eventname, string strarg, float numarg, form sender)
	; if numArg is not -1, it's a scene running on a subthread, and therefore an NPC scene
	if (numarg != -1)
		; a bug in OStim causes actors in main thread to redress if subthread scene ends
		; so undress them again
		OUndressScript oundress = ostim.GetUndressScript()
		if partner != none
			; wait for the redress to complete
			Utility.wait(2)
			; and then undress
			form[] partnerClothes = oundress.storeequipmentforms(partner, true)
			oundress.UnequipForms(partner, partnerClothes)
		endif
		if secondPartner != none
			form[] secondPartnerClothes = oundress.storeequipmentforms(secondPartner, true)
			oundress.UnequipForms(secondPartner, secondPartnerClothes)
		endif
		return
	endif

	; however, there can be an NPC scene in main thread, so this check is also needed
	; if player is not in scene, skip, OSmp won't run on NPC scenes
	if !ostim.isPlayerInvolved()
		return
	endif

	OsexIntegrationMain.Console("OSmp: Checking if any actors need SMP cleaning...")

	if (playerIsFemale && !OsmpMCM.toggleKeepPlayerSMP && isActorSMP(PlayerRef))
		OsexIntegrationMain.Console("OSmp: Removing SMP from player character...")
		MCM.PlayerSMP()
		OsexIntegrationMain.Console("OSmp: SMP cleaned from player character")
	endif

	if (partnerIsFemale && (!OSmpMCM.toggleKeepNPCSMP || !partnerHadSMP) && isActorSMP(partner))
		OsexIntegrationMain.Console("OSmp: Removing SMP from " + partner.GetActorBase().GetName() + "...")
		MCM.NPCSMP(partner, OsmpMCM.smpCupIndex)
		OsexIntegrationMain.Console("OSmp: SMP cleaned from " + partner.GetActorBase().GetName())
	endif

	if (secondPartner != none && secondPartnerIsFemale && (!OSmpMCM.toggleKeepNPCSMP || !secondPartnerHadSMP) && isActorSMP(secondPartner))
		OsexIntegrationMain.Console("OSmp: Removing SMP from " + secondPartner.GetActorBase().GetName() + "...")
		MCM.NPCSMP(secondPartner, OsmpMCM.smpCupIndex)
		OsexIntegrationMain.Console("OSmp: SMP cleaned from " + secondPartner.GetActorBase().GetName())
	endif
endevent


bool function isActorSMP(actor partnerSMP)
	bool isSMP = partnerSMP.isinfaction(MCM.BHUNPSMPFaction)

	String partnerName = partnerSMP.GetActorBase().GetName()

	if isSMP
		OsexIntegrationMain.Console("OSmp: " + partnerName + " is in SMP mode")
	else
		OsexIntegrationMain.Console("OSmp: " + partnerName + " is in CBPC mode")
	endif

	return isSMP
endfunction


function StopCbpcForActor(Actor act)
	MCM.CBPCBreasts(act, true)
	MCM.CBPCButts(act, true)
	MCM.CBPCBelly(act, true)
	MCM.CBPCVagina(act, true)
	MCM.CBPCThigh(act, true)
endfunction


function EquipSmpForActor(Actor act)
	OsexIntegrationMain.Console("OSmp: Applying SMP to " + act.GetActorBase().GetName() + "...")

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

	if MCM.SlotList[bhunpMcmSmpIndex] == MCM.S48
		act.AddItem(NPCMain48 as form, 1, true)
		act.EquipItem(NPCMain48 as form, true, true)
	elseIf MCM.SlotList[bhunpMcmSmpIndex] == MCM.S50
		act.AddItem(NPCMain50 as form, 1, true)
		act.EquipItem(NPCMain50 as form, true, true)
	elseIf MCM.SlotList[bhunpMcmSmpIndex] == MCM.S51
		act.AddItem(NPCMain51 as form, 1, true)
		act.EquipItem(NPCMain51 as form, true, true)
	elseIf MCM.SlotList[bhunpMcmSmpIndex] == MCM.S60
		act.AddItem(NPCMain60 as form, 1, true)
		act.EquipItem(NPCMain60 as form, true, true)
	endIf

	act.addtofaction(MCM.BHUNPSMPFaction)

	OsexIntegrationMain.Console("OSmp: SMP applied to " + act.GetActorBase().GetName() + " with cup size " + cupSizeToUse)
endfunction


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


OsexIntegrationMain property ostim auto
actor property playerref auto
BHUNPAddonMCM property MCM auto
OSmpBHUNPMCMScript property OsmpMCM auto
