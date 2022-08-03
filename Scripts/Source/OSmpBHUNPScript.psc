Scriptname OSmpBHUNPScript extends Quest

form[] partnerClothes
form[] secondPartnerClothes

actor partner
actor secondPartner

bool partnerIsFemale = false
bool secondPartnerIsFemale = false

bool undressAtAnimStart = true

event oninit()
	ostim = OUtils.GetOStim()
	registerformodevent("ostim_start", "OstimStart")
	registerformodevent("ostim_end", "OstimEnd")
	registerformodevent("ostim_thirdactor_join", "OstimThirdJoin")
	registerformodevent("ostim_thirdactor_leave", "OstimThirdLeave")
endevent

event OstimStart(string eventname, string strarg, float numarg, form sender)
	undressAtAnimStart = ostim.AlwaysUndressAtAnimStart

	partner = ostim.GetSexPartner(PlayerRef)
	secondPartner = ostim.GetThirdActor()

	partnerIsFemale = ostim.isFemale(partner)

	if secondPartner != none
		secondPartnerIsFemale = ostim.isFemale(secondPartner)
	endif

	OUndressScript oundress = ostim.GetUndressScript()

	OsexIntegrationMain.Console("OSmp: Starting...")

	if (partnerIsFemale && !isActorSMP(partner))
		OsexIntegrationMain.Console("OSmp: Applying SMP to " + partner.GetActorBase().GetName() + "...")
		OsexIntegrationMain.Console("OSmp: SMP Cup size in MCM is " + OsmpMCM.smpCupIndex)
		Utility.wait(2)
		MCM.NPCSMP(partner, OsmpMCM.smpCupIndex)

		if undressAtAnimStart
			partnerClothes = oundress.storeequipmentforms(partner, true)
			oundress.UnequipForms(partner, partnerClothes)
		endif
	endif

	if (secondPartner != none && secondPartnerIsFemale && !isActorSMP(secondPartner))
		OsexIntegrationMain.Console("OSmp: Applying SMP to " + secondPartner.GetActorBase().GetName() + "...")
		MCM.NPCSMP(secondPartner, OsmpMCM.smpCupIndex)

		if undressAtAnimStart
			secondPartnerClothes = oundress.storeequipmentforms(secondPartner, true)
			oundress.UnequipForms(secondPartner, secondPartnerClothes)
		endif
	endif

	OsexIntegrationMain.Console("OSmp: Finished applying SMP")
endevent

event OstimThirdJoin(string eventname, string strarg, float numarg, form sender)
	secondPartner = ostim.GetThirdActor()

	secondPartnerIsFemale = ostim.isFemale(secondPartner)

	OUndressScript oundress = ostim.GetUndressScript()

	if (secondPartnerIsFemale && !isActorSMP(secondPartner))
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
	if (secondPartnerIsFemale && isActorSMP(secondPartner))
		OsexIntegrationMain.Console("OSmp: Removing SMP from " + secondPartner.GetActorBase().GetName() + "...")
		MCM.NPCSMP(secondPartner, OsmpMCM.smpCupIndex)
		OsexIntegrationMain.Console("OSmp: SMP cleaned from " + secondPartner.GetActorBase().GetName())
	endif
endevent

event OstimEnd(string eventname, string strarg, float numarg, form sender)
	OsexIntegrationMain.Console("OSmp: Cleaning SMP...")

	if (partnerIsFemale && isActorSMP(partner))
		OsexIntegrationMain.Console("OSmp: Removing SMP from " + partner.GetActorBase().GetName() + "...")
		MCM.NPCSMP(partner, OsmpMCM.smpCupIndex)
	endif

	if (secondPartner != none && secondPartnerIsFemale && isActorSMP(secondPartner))
		OsexIntegrationMain.Console("OSmp: Removing SMP from " + secondPartner.GetActorBase().GetName() + "...")
		MCM.NPCSMP(secondPartner, OsmpMCM.smpCupIndex)
	endif

	OsexIntegrationMain.Console("OSmp: SMP cleaned!")
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
