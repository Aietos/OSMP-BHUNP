Scriptname OSmpBHUNPScript extends Quest

form[] partnerClothes
form[] secondPartnerClothes

actor partner
actor secondPartner

bool playerIsFemale = false
bool partnerIsFemale = false
bool secondPartnerIsFemale = false

bool undressAtAnimStart = true

bool partnerHadSMP = false
bool secondPartnerHadSMP = false

event oninit()
	ostim = OUtils.GetOStim()
	registerformodevent("ostim_start", "OstimStart")
	registerformodevent("ostim_end", "OstimEnd")
	registerformodevent("ostim_thirdactor_join", "OstimThirdJoin")
	registerformodevent("ostim_thirdactor_leave", "OstimThirdLeave")
endevent

event OstimStart(string eventname, string strarg, float numarg, form sender)
	; if OSmp is disabled in MCM, don't run this event
	if OsmpMCM.toggleDisableOSmp
		return
	endif

	Actor[] actors = ostim.GetActors()

	; if player is not in scene, skip, OSmp won't run on NPC scenes
	if actors[0] != PlayerRef && actors[1] != PlayerRef
		return
	endif

	undressAtAnimStart = ostim.AlwaysUndressAtAnimStart

	partner = ostim.GetSexPartner(PlayerRef)
	secondPartner = ostim.GetThirdActor()

	playerIsFemale = ostim.isFemale(PlayerRef)
	partnerIsFemale = ostim.isFemale(partner)

	partnerHadSMP = isActorSMP(partner)

	if secondPartner != none
		secondPartnerIsFemale = ostim.isFemale(secondPartner)
		secondPartnerHadSMP = isActorSMP(secondPartner)
	endif

	bool appliedSMPToPlayer = false

	OUndressScript oundress = ostim.GetUndressScript()

	OsexIntegrationMain.Console("OSmp: Starting...")

	if (playerIsFemale && !isActorSMP(PlayerRef))
		OsexIntegrationMain.Console("OSmp: Applying SMP to player character ...")

		; if we don't wait, SMP may fail to be applied
		; no idea why...
		Utility.wait(2)
		MCM.PlayerSMP()

		; we must toggle free cam off and on for player character SMP to properly apply
		; only if user set the scene to start in free cam in OStim menu
		; I have no idea why this is needed...
		if ostim.UseFreeCam
			ostim.ToggleFreeCam(false)
			ostim.ToggleFreeCam(true)
		endif

		appliedSMPToPlayer = true
	endif

	if (partnerIsFemale && !partnerHadSMP)
		OsexIntegrationMain.Console("OSmp: Applying SMP to " + partner.GetActorBase().GetName() + "...")
		OsexIntegrationMain.Console("OSmp: SMP Cup size in MCM is " + OsmpMCM.smpCupIndex)

		if !appliedSMPToPlayer
			Utility.wait(2)
		endif

		MCM.NPCSMP(partner, OsmpMCM.smpCupIndex)

		if undressAtAnimStart
			partnerClothes = oundress.storeequipmentforms(partner, true)
			oundress.UnequipForms(partner, partnerClothes)
		endif
	endif

	if (secondPartner != none && secondPartnerIsFemale && !secondPartnerHadSMP)
		OsexIntegrationMain.Console("OSmp: Applying SMP to " + secondPartner.GetActorBase().GetName() + "...")
		MCM.NPCSMP(secondPartner, OsmpMCM.smpCupIndex)

		if undressAtAnimStart
			secondPartnerClothes = oundress.storeequipmentforms(secondPartner, true)
			oundress.UnequipForms(secondPartner, secondPartnerClothes)
		endif
	endif

	OsexIntegrationMain.Console("OSmp: Finished!")
endevent

event OstimThirdJoin(string eventname, string strarg, float numarg, form sender)
	; if OSmp is disabled in MCM, don't run this event
	if OsmpMCM.toggleDisableOSmp
		return
	endif

	Actor[] actors = ostim.GetActors()

	; if player is not in scene, skip, OSmp won't run on NPC scenes
	if actors[0] != PlayerRef && actors[1] != PlayerRef
		return
	endif

	secondPartner = actors[2]

	secondPartnerIsFemale = ostim.isFemale(secondPartner)
	secondPartnerHadSMP = isActorSMP(secondPartner)

	OUndressScript oundress = ostim.GetUndressScript()

	if (secondPartnerIsFemale && !secondPartnerHadSMP)
		OsexIntegrationMain.Console("OSmp: Applying SMP to " + secondPartner.GetActorBase().GetName() + "...")
		MCM.NPCSMP(secondPartner, OsmpMCM.smpCupIndex)
		secondPartnerClothes = oundress.storeequipmentforms(secondPartner, true)

		if undressAtAnimStart
			oundress.UnequipForms(secondPartner, secondPartnerClothes)
		endif

		OsexIntegrationMain.Console("OSmp: SMP applied to " + secondPartner.GetActorBase().GetName())
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
			partnerClothes = oundress.storeequipmentforms(partner, true)
			oundress.UnequipForms(partner, partnerClothes)
		endif
		if secondPartner != none
			secondPartnerClothes = oundress.storeequipmentforms(secondPartner, true)
			oundress.UnequipForms(secondPartner, secondPartnerClothes)
		endif
		return
	endif

	Actor[] actors = ostim.GetActors()

	; however, there can be an NPC scene in main thread, so this check is also needed
	; if player is not in scene, skip, OSmp won't run on NPC scenes
	if actors[0] != PlayerRef && actors[1] != PlayerRef
		return
	endif

	OsexIntegrationMain.Console("OSmp: Checking if any actors need SMP cleaning...")

	if (playerIsFemale && !OsmpMCM.toggleKeepPlayerSMP && isActorSMP(PlayerRef))
		OsexIntegrationMain.Console("OSmp: Removing SMP from player character...")
		MCM.PlayerSMP()
	endif

	if (partnerIsFemale && (!OSmpMCM.toggleKeepNPCSMP || !partnerHadSMP) && isActorSMP(partner))
		OsexIntegrationMain.Console("OSmp: Removing SMP from " + partner.GetActorBase().GetName() + "...")
		MCM.NPCSMP(partner, OsmpMCM.smpCupIndex)
	endif

	if (secondPartner != none && secondPartnerIsFemale && (!OSmpMCM.toggleKeepNPCSMP || !secondPartnerHadSMP) && isActorSMP(secondPartner))
		OsexIntegrationMain.Console("OSmp: Removing SMP from " + secondPartner.GetActorBase().GetName() + "...")
		MCM.NPCSMP(secondPartner, OsmpMCM.smpCupIndex)
	endif
endevent

bool function isActorSMP(actor partnerSMP)
	armor NPCMain48
	armor NPCMain50
	armor NPCMain51
	armor NPCMain60

	bool isSMP = false

	String partnerName = partnerSMP.GetActorBase().GetName()

	if OsmpMCM.smpCupIndex == 0
		NPCMain48 = MCM.SMP3BONObjectF148
		NPCMain50 = MCM.SMP3BONObjectF150
		NPCMain51 = MCM.SMP3BONObjectF151
		NPCMain60 = MCM.SMP3BONObjectF160
	elseIf OsmpMCM.smpCupIndex == 1
		NPCMain48 = MCM.SMP3BONObjectF248
		NPCMain50 = MCM.SMP3BONObjectF250
		NPCMain51 = MCM.SMP3BONObjectF251
		NPCMain60 = MCM.SMP3BONObjectF260
	elseIf OsmpMCM.smpCupIndex == 2
		NPCMain48 = MCM.SMP3BONObjectF348
		NPCMain50 = MCM.SMP3BONObjectF350
		NPCMain51 = MCM.SMP3BONObjectF351
		NPCMain60 = MCM.SMP3BONObjectF360
	elseIf OsmpMCM.smpCupIndex == 3
		NPCMain48 = MCM.SMP3BONObjectF448
		NPCMain50 = MCM.SMP3BONObjectF450
		NPCMain51 = MCM.SMP3BONObjectF451
		NPCMain60 = MCM.SMP3BONObjectF460
	endIf

	if (partnerSMP.GetItemCount(NPCMain48) > 0) || (partnerSMP.GetItemCount(NPCMain50) > 0) || (partnerSMP.GetItemCount(NPCMain51) > 0) || (partnerSMP.GetItemCount(NPCMain60) > 0) || (partnerSMP.isinfaction(MCM.BHUNPSMPFaction))
		isSMP = true
	endif

	if isSMP
		OsexIntegrationMain.Console("OSmp: " + partnerName + " is already in SMP mode")
	else
		OsexIntegrationMain.Console("OSmp: " + partnerName + " is in CBPC mode")
	endif

	return isSMP
endfunction

OsexIntegrationMain property ostim auto
actor property playerref auto
BHUNPAddonMCM property MCM auto
OSmpBHUNPMCMScript property OsmpMCM auto
