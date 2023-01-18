Scriptname BHUNPAddonMCM extends SKI_ConfigBase

armor property SMP3BONObjectF148 auto
armor property SMP3BONObjectF151 auto
armor property SMP3BONObjectF150 auto
armor property SMP3BONObjectF160 auto


armor property SMP3BONObjectF251 auto
armor property SMP3BONObjectF250 auto
armor property SMP3BONObjectF260 auto
armor property SMP3BONObjectF248 auto

armor property SMP3BONObjectF350 auto
armor property SMP3BONObjectF351 auto
armor property SMP3BONObjectF360 auto
armor property SMP3BONObjectF348 auto

armor property SMP3BONObjectF451 auto
armor property SMP3BONObjectF448 auto
armor property SMP3BONObjectF450 auto
armor property SMP3BONObjectF460 auto

armor property SMP3BONObjectP48 auto
armor property SMP3BONObjectP51 auto
armor property SMP3BONObjectP60 auto
armor property SMP3BONObjectP50 auto



Int property FBsTIndex = 1 auto hidden
Int property NPCBKEY = 71 auto hidden
Int property FCsTIndex = 1 auto hidden
Int property FAsTIndex = 1 auto hidden
Int property NPCAKEY = 77 auto hidden
Int property NPCDKEY = 73 auto hidden
Int property PKEY = 78 auto hidden
Int property FnumIndex = 0 auto hidden
Int property FDsTIndex = 1 auto hidden

String property S48 = "$SLOT48" auto hidden
String[] property SlotList auto hidden
String[] property PSlotList auto hidden
String property HotkeyInfoFB = "$HOTKEYINFOFB" auto hidden
String property S60 = "$SLOT60" auto hidden
String property S69 = "$SLOTPARTS" auto hidden
String property S51 = "$SLOT51" auto hidden
String property HotkeyInfoFC = "$HOTKEYINFOFC" auto hidden
String property HotkeyInfoFA = "$HOTKEYINFOFA" auto hidden
String property HotkeyInfoP = "$HOTKEYINFOP" auto hidden
String property HotkeyInfoFD = "$HOTKEYINFOFD" auto hidden


Bool property PlayerSpellToggle = false auto hidden

spell property FAspell auto

Bool property NPCSpellToggle = false auto hidden
Bool property ClearNPCSMPToggle = false auto hidden

String property Aslot = "$Fslot_A" auto hidden
String property Bslot = "$Fslot_B" auto hidden
String property Cslot = "$Fslot_C" auto hidden
String property Dslot = "$Fslot_D" auto hidden

Int property PsTIndex = 1 auto hidden
spell property FBspell auto
String[] property FnumString auto hidden


String property PSpellToggleInfo = "$PSPELLTOGGLEINFO" auto hidden
spell property FDspell auto
String property S50 = "$SLOT50" auto hidden
spell property Pspell auto
Int property NPCCKEY = 72 auto hidden
String property FSpellToggleInfo = "$FSPELLTOGGLEINFO" auto hidden

spell property FCspell auto

Actor Property PlayerRef Auto
Faction Property BHUNPSMPFaction Auto

Bool property SMPBreastsApply Auto
Bool property SMPButtsApply Auto
Bool property SMPLegsApply Auto
Bool property SMPBellyApply Auto
Bool property SMPVaginaApply Auto
Bool property SMPVaginaCollisionApply Auto
Quest Property BHUNP3BController Auto

Bool property SMPBreastsPlayer Auto
Bool property SMPButtsPlayer Auto
Bool property SMPLegsPlayer = true Auto
Bool property SMPBellyPlayer Auto
Bool property SMPVaginaPlayer Auto

Bool property CBPCBreastsPlayer Auto
Bool property CBPCButtsPlayer Auto
Bool property CBPCLegsPlayer Auto
Bool property CBPCBellyPlayer Auto
Bool property CBPCVaginaPlayer Auto
Bool property CBPCVaginaCollisionPlayer Auto

Bool property PSMPRESET auto
Bool property PlayerGenderToggle = true auto
Bool property DebugLogging = false auto

function PlayerSMPReset()
	PlayerRef.UnequipItem(SMP3BONObjectP48 as form, false, true)
	PlayerRef.UnequipItem(SMP3BONObjectP50 as form, false, true)
	PlayerRef.UnequipItem(SMP3BONObjectP51 as form, false, true)
	PlayerRef.UnequipItem(SMP3BONObjectP60 as form, false, true)
	
	PlayerRef.RemoveItem(SMP3BONObjectP48 as form, 99, true, none)
	PlayerRef.RemoveItem(SMP3BONObjectP50 as form, 99, true, none)
	PlayerRef.RemoveItem(SMP3BONObjectP51 as form, 99, true, none)
	PlayerRef.RemoveItem(SMP3BONObjectP60 as form, 99, true, none)
	(BHUNP3BController as BHUNP3BControllerscript).EquipSMPArmor(PlayerRef, false)
	PlayerRef.removefromfaction(BHUNPSMPFaction)
endfunction

function PlayerSMP()

if PlayerRef.isinfaction(BHUNPSMPFaction)
	if PlayerRef.getfactionrank(BHUNPSMPFaction) == 1 && PSlotList[PsTIndex] == S48
		PlayerRef.UnequipItem(SMP3BONObjectP48 as form, false, true)
		PlayerRef.RemoveItem(SMP3BONObjectP48 as form, 99, true, none)
	elseIf PlayerRef.getfactionrank(BHUNPSMPFaction) == 2 && PSlotList[PsTIndex] == S50
		PlayerRef.UnequipItem(SMP3BONObjectP50 as form, false, true)
		PlayerRef.RemoveItem(SMP3BONObjectP50 as form, 99, true, none)
	elseIf PlayerRef.getfactionrank(BHUNPSMPFaction) == 3 && PSlotList[PsTIndex] == S51
		PlayerRef.UnequipItem(SMP3BONObjectP51 as form, false, true)
		PlayerRef.RemoveItem(SMP3BONObjectP51 as form, 99, true, none)
	elseIf PlayerRef.getfactionrank(BHUNPSMPFaction) == 4 && PSlotList[PsTIndex] == S60
		PlayerRef.UnequipItem(SMP3BONObjectP60 as form, false, true)
		PlayerRef.RemoveItem(SMP3BONObjectP60 as form, 99, true, none)
	elseIf PlayerRef.getfactionrank(BHUNPSMPFaction) == 5 && PSlotList[PsTIndex] == S69
		(BHUNP3BController as BHUNP3BControllerscript).SMPPartsApply(PlayerRef, false)
		PlayerRef.removefromfaction(BHUNPSMPFaction)
		if DebugLogging
			debug.Notification("$CBPCMODE")
		endif
		return
	else
		PlayerRef.UnequipItem(SMP3BONObjectP48 as form, false, true)
		PlayerRef.RemoveItem(SMP3BONObjectP48 as form, 99, true, none)
		PlayerRef.UnequipItem(SMP3BONObjectP50 as form, false, true)
		PlayerRef.RemoveItem(SMP3BONObjectP50 as form, 99, true, none)
		PlayerRef.UnequipItem(SMP3BONObjectP51 as form, false, true)
		PlayerRef.RemoveItem(SMP3BONObjectP51 as form, 99, true, none)
		PlayerRef.UnequipItem(SMP3BONObjectP60 as form, false, true)
		PlayerRef.RemoveItem(SMP3BONObjectP60 as form, 99, true, none)
	endIf
	PlayerRef.removefromfaction(BHUNPSMPFaction)
	(BHUNP3BController as BHUNP3BControllerscript).CBPCBreasts(PlayerRef, false)
	(BHUNP3BController as BHUNP3BControllerscript).CBPCButts(PlayerRef, false)
	(BHUNP3BController as BHUNP3BControllerscript).CBPCBelly(PlayerRef, false)
	(BHUNP3BController as BHUNP3BControllerscript).CBPCVagina(PlayerRef, false)
	(BHUNP3BController as BHUNP3BControllerscript).CBPCVaginaCollision(PlayerRef, false)
	(BHUNP3BController as BHUNP3BControllerscript).CBPCThigh(PlayerRef, false)
	if DebugLogging
		debug.Notification("$CBPCMODE")
	endif
else
	if PlayerGenderToggle == true
		if PlayerRef.GetActorBase().GetSex() != 1
			if DebugLogging
				debug.Notification("$PLAYERGENDERCHECK")
			endif
			return
		endif
	endif	

	PlayerRef.AddtoFaction(BHUNPSMPFaction)
	
	if PSlotList[PsTIndex] == S69
		(BHUNP3BController as BHUNP3BControllerscript).SMPPartsApply(PlayerRef, true)
		PlayerRef.setfactionrank(BHUNPSMPFaction, 5)
		if DebugLogging
			debug.Notification("$SMPMODE")
		endif
		return
	endif
	
	(BHUNP3BController as BHUNP3BControllerscript).CBPCBreasts(PlayerRef, true)
	(BHUNP3BController as BHUNP3BControllerscript).CBPCButts(PlayerRef, true)
	(BHUNP3BController as BHUNP3BControllerscript).CBPCBelly(PlayerRef, true)
	(BHUNP3BController as BHUNP3BControllerscript).CBPCVagina(PlayerRef, true)
	(BHUNP3BController as BHUNP3BControllerscript).CBPCVaginaCollision(PlayerRef, true)
	(BHUNP3BController as BHUNP3BControllerscript).CBPCThigh(PlayerRef, true)
	if PSlotList[PsTIndex] == S48
		PlayerRef.AddItem(SMP3BONObjectP48 as form, 1, true)
		PlayerRef.EquipItem(SMP3BONObjectP48 as form, true, true)
		PlayerRef.setfactionrank(BHUNPSMPFaction, 1)
	elseIf PSlotList[PsTIndex] == S50
		PlayerRef.AddItem(SMP3BONObjectP50 as form, 1, true)
		PlayerRef.EquipItem(SMP3BONObjectP50 as form, true, true)
		PlayerRef.setfactionrank(BHUNPSMPFaction, 2)
	elseIf PSlotList[PsTIndex] == S51
		PlayerRef.AddItem(SMP3BONObjectP51 as form, 1, true)
		PlayerRef.EquipItem(SMP3BONObjectP51 as form, true, true)
		PlayerRef.setfactionrank(BHUNPSMPFaction, 3)
	elseIf PSlotList[PsTIndex] == S60
		PlayerRef.AddItem(SMP3BONObjectP60 as form, 1, true)
		PlayerRef.EquipItem(SMP3BONObjectP60 as form, true, true)
		PlayerRef.setfactionrank(BHUNPSMPFaction, 4)
	endIf
	if DebugLogging
		debug.Notification("$SMPMODE")
	endif
endif

endFunction

function OnVersionUpdate(Int newVersion)
	debug.Trace(self as String + ": Updating Version [" + CurrentVersion as String + "] -> [" + newVersion as String + "]", 0)
	self.OnConfigInit()
	if CurrentVersion == 2
		self.P_Toggle_Disable()
		self.NPC_Toggle_Disable()
	endIf
endFunction

function VersionCheck()
	debug.Trace(self as String + " : VersionCheck()", 0)
	parent.CheckVersion()
endFunction

function OnPageReset(String pagename)
Int iDisabledFlag = 0

    ;if (page == "")
        ;LoadCustomContent("BHUNP3BBB/Logo.dds", 180, 30)
	if (pagename == "") || pagename == "$PageName_General"
		UnloadCustomContent()
		SetCursorFillMode(TOP_TO_BOTTOM)
		AddHeaderOption("$SMPCONFIGS")
		SetCursorPosition(0)
		self.AddTextOption("BHUNP 3BBB MCM Version", CurrentVersion as String, self.OPTION_FLAG_DISABLED)
		self.AddHeaderOption("$FUSS", 0)
		self.AddToggleOptionST("OPTION_NPC_Spell_Toggle", "$NPCSPELLTOGGLE", NPCSpellToggle, iDisabledFlag)
		self.AddMenuOptionST("OPTION_Follower_A", "$FTSUAS", SlotList[FAsTIndex], iDisabledFlag)
		self.AddKeyMapOptionST("OPTION_Keymap_A", "$NPCAKEYMAP", NPCAKEY, iDisabledFlag)
		self.AddMenuOptionST("OPTION_Follower_B", "$FTSUBS", SlotList[FBsTIndex], iDisabledFlag)
		self.AddKeyMapOptionST("OPTION_Keymap_B", "$NPCBKEYMAP", NPCBKEY, iDisabledFlag)
		self.AddMenuOptionST("OPTION_Follower_C", "$FTSUCS", SlotList[FCsTIndex], iDisabledFlag)
		self.AddKeyMapOptionST("OPTION_Keymap_C", "$NPCCKEYMAP", NPCCKEY, iDisabledFlag)
		self.AddMenuOptionST("OPTION_Follower_D", "$FTSUDS", SlotList[FDsTIndex], iDisabledFlag)
		self.AddKeyMapOptionST("OPTION_Keymap_D", "$NPCDKEYMAP", NPCDKEY, iDisabledFlag)
		self.AddHeaderOption("$FUSSMANAGE", 0)
		self.AddToggleOptionST("OPTION_NPC_ClearSMP_Toggle", "$FUSSCLEAR", ClearNPCSMPToggle, iDisabledFlag)
		self.AddToggleOptionST("OPTION_DEBUGLOGGING_Toggle", "$DEBUGLOGGING", DebugLogging, iDisabledFlag)
		SetCursorPosition(1)
		self.AddToggleOptionST("OPTION_P_Gender_Toggle", "$PGENDERTOGGLE", PlayerGenderToggle, iDisabledFlag)
		AddHeaderOption("$CBPCRESET")
		self.AddToggleOptionST("OPTION_CBPCReset_Toggle", "$CBPCRESETTOGGLE", (BHUNP3BController as BHUNP3BControllerscript).CBPCResetToggle)
		AddHeaderOption("$CBPCBODYPARTS")
		self.AddToggleOptionST("OPTION_CBPC_Breasts_Toggle", "$CBPCBREASTSTOGGLE", SMPBreastsApply, iDisabledFlag)
		self.AddToggleOptionST("OPTION_CBPC_Butts_Toggle", "$CBPCBUTTSTOGGLE", SMPButtsApply, iDisabledFlag)
		self.AddToggleOptionST("OPTION_CBPC_Legs_Toggle", "$CBPCLEGSTOGGLE", SMPLegsApply, iDisabledFlag)
		self.AddToggleOptionST("OPTION_CBPC_Belly_Toggle", "$CBPCBELLYTOGGLE", SMPBellyApply, iDisabledFlag)
		self.AddToggleOptionST("OPTION_CBPC_Vagina_Toggle", "$CBPCVAGINATOGGLE", SMPVaginaApply, iDisabledFlag)
		self.AddToggleOptionST("OPTION_CBPC_VaginaCollision_Toggle", "$CBPCVAGINACOLLISIONTOGGLE", SMPVaginaCollisionApply, iDisabledFlag)
	elseif pagename == "$PageName_Player"
		UnloadCustomContent()
		SetCursorFillMode(TOP_TO_BOTTOM)
		SetCursorPosition(0)
		self.AddHeaderOption("$PUSS", 0)
		self.AddToggleOptionST("OPTION_P_Spell_Toggle", "$PSPELLTOGGLE", PlayerSpellToggle, iDisabledFlag)
		self.AddMenuOptionST("OPTION_PlayerSlot", "$PUSLOT", PSlotList[PsTIndex], iDisabledFlag)
		self.AddKeyMapOptionST("OPTION_Keymap_P", "$PKEYMAP", PKEY, iDisabledFlag)
		self.AddToggleOptionST("OPTION_P_RESET_Toggle", "$PSMPRESET", PSMPRESET, iDisabledFlag)
		SetCursorPosition(1)
		AddHeaderOption("$SMPBODYPARTS")
		if PSlotList[PsTIndex] == S69
			self.AddMenuOptionST("OPTION_SMPCup", "$PCUPSLOT", FnumString[FnumIndex], iDisabledFlag)
			AddEmptyOption()
			self.AddToggleOptionST("OPTION_SMP_Breasts_Toggle", "$SMPBREASTSTOGGLE", SMPBreastsPlayer, iDisabledFlag)
			self.AddToggleOptionST("OPTION_SMP_Butts_Toggle", "$SMPBUTTSTOGGLE", SMPButtsPlayer, iDisabledFlag)
			self.AddToggleOptionST("OPTION_SMP_Belly_Toggle", "$SMPBELLYTOGGLE", SMPBellyPlayer, iDisabledFlag)
			self.AddToggleOptionST("OPTION_SMP_Vagina_Toggle", "$SMPVAGINATOGGLE", SMPVaginaPlayer, iDisabledFlag)
			self.AddToggleOptionST("OPTION_SMP_Legs_Toggle", "$SMPLEGSTOGGLE", SMPLegsPlayer, iDisabledFlag)
			AddEmptyOption()
			self.AddToggleOptionST("OPTION_PLAYERCBPC_Breasts_Toggle", "$CBPCBREASTSTOGGLE", CBPCBreastsPlayer, iDisabledFlag)
			self.AddToggleOptionST("OPTION_PLAYERCBPC_Butts_Toggle", "$CBPCBUTTSTOGGLE", CBPCButtsPlayer, iDisabledFlag)
			self.AddToggleOptionST("OPTION_PLAYERCBPC_Legs_Toggle", "$CBPCLEGSTOGGLE", CBPCLegsPlayer, iDisabledFlag)
			self.AddToggleOptionST("OPTION_PLAYERCBPC_Belly_Toggle", "$CBPCBELLYTOGGLE", CBPCBellyPlayer, iDisabledFlag)
			self.AddToggleOptionST("OPTION_PLAYERCBPC_Vagina_Toggle", "$CBPCVAGINATOGGLE", CBPCVaginaPlayer, iDisabledFlag)
			self.AddToggleOptionST("OPTION_PLAYERCBPC_VaginaCollision_Toggle", "$CBPCVAGINACOLLISIONTOGGLE", CBPCVaginaCollisionPlayer, iDisabledFlag)
		else
			self.AddTextOption("PlayerSMPDisabled", "Player SMP Selection Disabled", self.OPTION_FLAG_DISABLED)
		endif
	elseif pagename == "$PageName_NPCTracking"
		UnloadCustomContent()
		int nActors = 0
		int i = (BHUNP3BController as BHUNP3BControllerscript).TrackedActors.Length
		while (i)
			i -= 1
			
			if ((BHUNP3BController as BHUNP3BControllerscript).TrackedActors[i])
				nActors += 1
			endIf
		endWhile
		
		
		SetCursorFillMode(LEFT_TO_RIGHT)
    	SetCursorPosition(0)
		
		if (_trackingFilterPage > 0)
			AddTextOptionST("$TRACKING_PREV_PAGE", "Previous Page [" + (_trackingFilterPage - 1) + "]", "")
		else
			AddEmptyOption()
		endIf
		
		if (_trackingFilterPage < ((BHUNP3BController as BHUNP3BControllerscript).TrackedActors.Length / _actorsPerPage))
			AddTextOptionST("$TRACKING_NEXT_PAGE", "Next Page [" + (_trackingFilterPage + 1) + "]", "")
		else
			AddEmptyOption()
		endIf
		
		AddHeaderOption("$SMPTRACKINGNPC")
		
		int actorIndex = _actorsPerPage * _trackingFilterPage
		int nListed = 0
		
		while (actorIndex < (BHUNP3BController as BHUNP3BControllerscript).TrackedActors.Length && nListed < _actorsPerPage)
        Actor trackedActor = (BHUNP3BController as BHUNP3BControllerscript).TrackedActorGet(actorIndex)
        	if trackedActor
				AddTextOption(trackedActor.GetDisplayName(), "", self.OPTION_FLAG_DISABLED)
			endIf
        actorIndex += 1
        nListed += 1
		endWhile
	endif
endFunction



int _trackingFilterPage = 0
int _actorsPerPage = 10


function NPC_Toggle_Disable()

	PlayerRef.RemoveSpell(FAspell)
	PlayerRef.RemoveSpell(FBspell)
	PlayerRef.RemoveSpell(FCspell)
	PlayerRef.RemoveSpell(FDspell)
endFunction

function OnConfigInit()
	ModName = "BHUNP 3BBB Addon"
	Pages = new String[3]
	Pages[0] = "$PageName_General"
	Pages[1] = "$PageName_Player"
	Pages[2] = "$PageName_NPCTracking"
endFunction

function OnInit()

	parent.OnInit()
	SlotList = new String[4]
	SlotList[0] = S48
	SlotList[1] = S50
	SlotList[2] = S51
	SlotList[3] = S60
	PSlotList = new String[5]
	PSlotList[0] = S48
	PSlotList[1] = S50
	PSlotList[2] = S51
	PSlotList[3] = S60
	PSlotList[4] = S69
	FnumString = new String[4]
	FnumString[0] = Aslot
	FnumString[1] = Bslot
	FnumString[2] = Cslot
	FnumString[3] = Dslot
endFunction

function NPC_Toggle_Enable()
	PlayerRef.AddSpell(FAspell, true)
	PlayerRef.AddSpell(FBspell, true)
	PlayerRef.AddSpell(FCspell, true)
	PlayerRef.AddSpell(FDspell, true)
endFunction

function OnGameReload()
	parent.OnGameReload()
	debug.Trace(self as String + " OnGameReload() : Check Version [" + CurrentVersion as String + "] / [" + self.GetVersion() as String + "]", 0)
	self.VersionCheck()
	self.UpdateKeyRegistration()
endFunction

function NPCSMP(actor akTarget, Int cup)

	if PlayerGenderToggle == true
		if PlayerRef.GetActorBase().GetSex() != 1
			if DebugLogging
				debug.Notification("$NPCGENDERCHECK")
			endif
			return
		endif
	endif	

	if akTarget.isinfaction(BHUNPSMPFaction)
		akTarget.removefromfaction(BHUNPSMPFaction)
		(BHUNP3BController as BHUNP3BControllerscript).CBPCBreasts(akTarget, false)
		(BHUNP3BController as BHUNP3BControllerscript).CBPCButts(akTarget, false)
		(BHUNP3BController as BHUNP3BControllerscript).CBPCBelly(akTarget, false)
		(BHUNP3BController as BHUNP3BControllerscript).CBPCVagina(akTarget, false)
		(BHUNP3BController as BHUNP3BControllerscript).CBPCVaginaCollision(akTarget, false)
		(BHUNP3BController as BHUNP3BControllerscript).CBPCThigh(akTarget, false)
		unequipSMPAll(akTarget)
		if DebugLogging
			debug.Notification(akTarget.GetActorBase().GetName() + "$NPCCBPCMODE")
		endif
		int actori = (BHUNP3BController as BHUNP3BControllerscript).TrackedActorGetInt(akTarget)
		if actori != -1
			(BHUNP3BController as BHUNP3BControllerscript).TrackedActorRemove(actori)
		endif
		Return
	endif

	armor NPCMain60
	armor NPCMain51
	armor NPCMain50
	armor NPCMain48
	if cup == 0
		NPCMain48 = SMP3BONObjectF148
		NPCMain50 = SMP3BONObjectF150
		NPCMain51 = SMP3BONObjectF151
		NPCMain60 = SMP3BONObjectF160
	elseIf cup == 1
		NPCMain48 = SMP3BONObjectF248
		NPCMain50 = SMP3BONObjectF250
		NPCMain51 = SMP3BONObjectF251
		NPCMain60 = SMP3BONObjectF260
	elseIf cup == 2
		NPCMain48 = SMP3BONObjectF348
		NPCMain50 = SMP3BONObjectF350
		NPCMain51 = SMP3BONObjectF351
		NPCMain60 = SMP3BONObjectF360
	elseIf cup == 3
		NPCMain48 = SMP3BONObjectF448
		NPCMain50 = SMP3BONObjectF450
		NPCMain51 = SMP3BONObjectF451
		NPCMain60 = SMP3BONObjectF460
	endIf

	akTarget.addtofaction(BHUNPSMPFaction)
	
		if cup == 0
			if SlotList[FAsTIndex] == S48
				akTarget.AddItem(NPCMain48 as form, 1, true)
				akTarget.EquipItem(NPCMain48 as form, true, true)
				akTarget.setfactionrank(BHUNPSMPFaction, 1)
				;debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 48")
			elseIf SlotList[FAsTIndex] == S50
				akTarget.AddItem(NPCMain50 as form, 1, true)
				akTarget.EquipItem(NPCMain50 as form, true, true)
				akTarget.setfactionrank(BHUNPSMPFaction, 2)
				;debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 50")
			elseIf SlotList[FAsTIndex] == S51
				akTarget.AddItem(NPCMain51 as form, 1, true)
				akTarget.EquipItem(NPCMain51 as form, true, true)
				akTarget.setfactionrank(BHUNPSMPFaction, 3)
				;debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 51")
			elseIf SlotList[FAsTIndex] == S60
				akTarget.AddItem(NPCMain60 as form, 1, true)
				akTarget.EquipItem(NPCMain60 as form, true, true)
				akTarget.setfactionrank(BHUNPSMPFaction, 4)
				;debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 60")
			endIf
			
		elseIf cup == 1
			if SlotList[FBsTIndex] == S48
				akTarget.AddItem(NPCMain48 as form, 1, true)
				akTarget.EquipItem(NPCMain48 as form, true, true)
				akTarget.setfactionrank(BHUNPSMPFaction, 1)
				;debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 48")
			elseIf SlotList[FBsTIndex] == S50
				akTarget.AddItem(NPCMain50 as form, 1, true)
				akTarget.EquipItem(NPCMain50 as form, true, true)
				akTarget.setfactionrank(BHUNPSMPFaction, 2)
				;debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 50")
			elseIf SlotList[FBsTIndex] == S51
				akTarget.AddItem(NPCMain51 as form, 1, true)
				akTarget.EquipItem(NPCMain51 as form, true, true)
				akTarget.setfactionrank(BHUNPSMPFaction, 3)
				;debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 51")
			elseIf SlotList[FBsTIndex] == S60
				akTarget.AddItem(NPCMain60 as form, 1, true)
				akTarget.EquipItem(NPCMain60 as form, true, true)
				akTarget.setfactionrank(BHUNPSMPFaction, 4)
				;debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 60")
			endIf
		elseIf cup == 2
			if SlotList[FCsTIndex] == S48
				akTarget.AddItem(NPCMain48 as form, 1, true)
				akTarget.EquipItem(NPCMain48 as form, true, true)
				akTarget.setfactionrank(BHUNPSMPFaction, 1)
				;debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 48")
			elseIf SlotList[FCsTIndex] == S50
				akTarget.AddItem(NPCMain50 as form, 1, true)
				akTarget.EquipItem(NPCMain50 as form, true, true)
				akTarget.setfactionrank(BHUNPSMPFaction, 2)
				;debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 50")
			elseIf SlotList[FCsTIndex] == S51
				akTarget.AddItem(NPCMain51 as form, 1, true)
				akTarget.EquipItem(NPCMain51 as form, true, true)
				akTarget.setfactionrank(BHUNPSMPFaction, 3)
				;debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 51")
			elseIf SlotList[FCsTIndex] == S60
				akTarget.AddItem(NPCMain60 as form, 1, true)
				akTarget.EquipItem(NPCMain60 as form, true, true)
				akTarget.setfactionrank(BHUNPSMPFaction, 4)
				;debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 60")
			endIf
		elseIf cup == 3
			if SlotList[FDsTIndex] == S48
				akTarget.AddItem(NPCMain48 as form, 1, true)
				akTarget.EquipItem(NPCMain48 as form, true, true)
				akTarget.setfactionrank(BHUNPSMPFaction, 1)
				;debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 48")
			elseIf SlotList[FDsTIndex] == S50
				akTarget.AddItem(NPCMain50 as form, 1, true)
				akTarget.EquipItem(NPCMain50 as form, true, true)
				akTarget.setfactionrank(BHUNPSMPFaction, 2)
				;debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 50")
			elseIf SlotList[FDsTIndex] == S51
				akTarget.AddItem(NPCMain51 as form, 1, true)
				akTarget.EquipItem(NPCMain51 as form, true, true)
				akTarget.setfactionrank(BHUNPSMPFaction, 3)
				;debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 51")
			elseIf SlotList[FDsTIndex] == S60
				akTarget.AddItem(NPCMain60 as form, 1, true)
				akTarget.EquipItem(NPCMain60 as form, true, true)
				akTarget.setfactionrank(BHUNPSMPFaction, 4)
				;debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 60")
			endIf
		endif
		
		if DebugLogging
			debug.Notification(akTarget.GetActorBase().GetName() + "$NPCSMPMODE")
		endif
	
	(BHUNP3BController as BHUNP3BControllerscript).CBPCBreasts(akTarget, true)
	(BHUNP3BController as BHUNP3BControllerscript).CBPCButts(akTarget, true)
	(BHUNP3BController as BHUNP3BControllerscript).CBPCBelly(akTarget, true)
	(BHUNP3BController as BHUNP3BControllerscript).CBPCVagina(akTarget, true)
	(BHUNP3BController as BHUNP3BControllerscript).CBPCVaginaCollision(akTarget, true)
	(BHUNP3BController as BHUNP3BControllerscript).CBPCThigh(akTarget, true)
	
	(BHUNP3BController as BHUNP3BControllerscript).TrackedActorAdd(akTarget)
	Return
endFunction

function unequipSMPAll(actor akTarget)
	akTarget.UnequipItem(SMP3BONObjectF148 as form, false, true)
	akTarget.RemoveItem(SMP3BONObjectF148 as form, 99, true, none)
	akTarget.UnequipItem(SMP3BONObjectF150 as form, false, true)
	akTarget.RemoveItem(SMP3BONObjectF150 as form, 99, true, none)
	akTarget.UnequipItem(SMP3BONObjectF151 as form, false, true)
	akTarget.RemoveItem(SMP3BONObjectF151 as form, 99, true, none)
	akTarget.UnequipItem(SMP3BONObjectF160 as form, false, true)
	akTarget.RemoveItem(SMP3BONObjectF160 as form, 99, true, none)
	akTarget.UnequipItem(SMP3BONObjectF248 as form, false, true)
	akTarget.RemoveItem(SMP3BONObjectF248 as form, 99, true, none)
	akTarget.UnequipItem(SMP3BONObjectF250 as form, false, true)
	akTarget.RemoveItem(SMP3BONObjectF250 as form, 99, true, none)
	akTarget.UnequipItem(SMP3BONObjectF251 as form, false, true)
	akTarget.RemoveItem(SMP3BONObjectF251 as form, 99, true, none)
	akTarget.UnequipItem(SMP3BONObjectF260 as form, false, true)
	akTarget.RemoveItem(SMP3BONObjectF260 as form, 99, true, none)
	akTarget.UnequipItem(SMP3BONObjectF348 as form, false, true)
	akTarget.RemoveItem(SMP3BONObjectF348 as form, 99, true, none)
	akTarget.UnequipItem(SMP3BONObjectF350 as form, false, true)
	akTarget.RemoveItem(SMP3BONObjectF350 as form, 99, true, none)
	akTarget.UnequipItem(SMP3BONObjectF351 as form, false, true)
	akTarget.RemoveItem(SMP3BONObjectF351 as form, 99, true, none)
	akTarget.UnequipItem(SMP3BONObjectF360 as form, false, true)
	akTarget.RemoveItem(SMP3BONObjectF360 as form, 99, true, none)
	akTarget.UnequipItem(SMP3BONObjectF448 as form, false, true)
	akTarget.RemoveItem(SMP3BONObjectF448 as form, 99, true, none)
	akTarget.UnequipItem(SMP3BONObjectF450 as form, false, true)
	akTarget.RemoveItem(SMP3BONObjectF450 as form, 99, true, none)
	akTarget.UnequipItem(SMP3BONObjectF451 as form, false, true)
	akTarget.RemoveItem(SMP3BONObjectF451 as form, 99, true, none)
	akTarget.UnequipItem(SMP3BONObjectF460 as form, false, true)
	akTarget.RemoveItem(SMP3BONObjectF460 as form, 99, true, none)
EndFunction

Int function GetVersion()
	return 8
endFunction

; Skipped compiler generated GotoState

function OnKeyDown(Int INkeyCode)

	objectreference Target = game.GetCurrentCrosshairRef()
	if INkeyCode == PKEY
		Self.PlayerSMP()
	elseIf Target as actor
		actor akTarget = Target as actor
		if INkeyCode == NPCAKEY
			self.NPCSMP(akTarget, 0)
		elseIf INkeyCode == NPCBKEY
			self.NPCSMP(akTarget, 1)
		elseIf INkeyCode == NPCCKEY
			self.NPCSMP(akTarget, 2)
		elseIf INkeyCode == NPCDKEY
			self.NPCSMP(akTarget, 3)
		endIf
	endIf
endFunction

function UpdateKeyRegistration()
	self.UnregisterForAllKeys()
	self.RegisterForKey(PKEY)
	self.RegisterForKey(NPCAKEY)
	self.RegisterForKey(NPCBKEY)
	self.RegisterForKey(NPCCKEY)
	self.RegisterForKey(NPCDKEY)
endFunction

function P_Toggle_Disable()
	PlayerRef.RemoveSpell(Pspell)
endFunction

function P_Toggle_Enable()
	PlayerRef.AddSpell(Pspell, true)
endFunction

;-- State -------------------------------------------
state OPTION_Follower_B

	function OnMenuOpenST()

		self.SetMenuDialogOptions(SlotList)
		self.SetMenuDialogStartIndex(FBsTIndex)
		self.SetMenuDialogDefaultIndex(1)
	endFunction

	function OnMenuAcceptST(Int index)

		FBsTIndex = index
		self.SetMenuOptionValueST(SlotList[FBsTIndex], false, "")
	endFunction
endState

;-- State -------------------------------------------
state OPTION_Keymap_P

	function OnKeyMapChangeST(Int PkeyCode, String conflictControl, String conflictName)

		if PkeyCode == 1 || PkeyCode == 211
			PkeyCode = 0
			self.SetKeyMapOptionValueST(211, false, "")
		else
			self.SetKeyMapOptionValueST(PkeyCode, false, "")
		endIf
		PKEY = PkeyCode
		self.UpdateKeyRegistration()
	endFunction

	function OnHighlightST()

		self.SetInfoText(HotkeyInfoP)
	endFunction

	function OnDefaultST()

		PKEY = 78
		self.SetKeyMapOptionValueST(78, false, "")
	endFunction
endState


state TRACKING_PREV_PAGE
	event OnSelectST()
		_trackingFilterPage -= 1
        ForcePageReset()
    endEvent
    
    event OnHighlightST()
        SetInfoText("$TRACKINGPREVIOUSPAGE")
    endEvent
endState

state TRACKING_NEXT_PAGE
	event OnSelectST()
		_trackingFilterPage += 1
        ForcePageReset()
    endEvent
    
    event OnHighlightST()
        SetInfoText("$TRACKINGNEXTPAGE")
    endEvent
endState

state OPTION_CBPCReset_Toggle
	function OnSelectST()
		(BHUNP3BController as BHUNP3BControllerscript).CBPCResetToggle = !(BHUNP3BController as BHUNP3BControllerscript).CBPCResetToggle
		SetToggleOptionValueST((BHUNP3BController as BHUNP3BControllerscript).CBPCResetToggle)
	endFunction
	function OnHighlightST()
		SetInfoText("$CBPCRESETTOGGLEINFO")
	endFunction
endState

state OPTION_P_Gender_Toggle
	function OnSelectST()
		if PlayerGenderToggle == false
			PlayerGenderToggle = true
			self.SetToggleOptionValueST(true, false, "")
		else
			PlayerGenderToggle = false
			self.SetToggleOptionValueST(false, false, "")
		endIf
	endFunction
	function OnHighlightST()
		self.SetInfoText("$PGENDERTOGGLEINFO")
	endFunction
endState


state OPTION_CBPC_Breasts_Toggle

	function OnSelectST()

		if SMPBreastsApply == false
			SMPBreastsApply = true
			self.SetToggleOptionValueST(true, false, "")
		else
			SMPBreastsApply = false
			self.SetToggleOptionValueST(false, false, "")
		endIf
		
		(BHUNP3BController as BHUNP3BControllerscript).BreastsSMP = SMPBreastsApply
	endFunction

	function OnHighlightST()
		self.SetInfoText("$CBPCBREASTSTOGGLEINFO")
	endFunction
endState

state OPTION_CBPC_Butts_Toggle

	function OnSelectST()

		if SMPButtsApply == false
			SMPButtsApply = true
			self.SetToggleOptionValueST(true, false, "")
		else
			SMPButtsApply = false
			self.SetToggleOptionValueST(false, false, "")
		endIf
		
		(BHUNP3BController as BHUNP3BControllerscript).ButtsSMP = SMPButtsApply
	endFunction

	function OnHighlightST()
		self.SetInfoText("$CBPCBUTTSTOGGLEINFO")
	endFunction
endState

state OPTION_CBPC_Legs_Toggle

	function OnSelectST()

		if SMPLegsApply == false
			SMPLegsApply = true
			self.SetToggleOptionValueST(true, false, "")
		else
			SMPLegsApply = false
			self.SetToggleOptionValueST(false, false, "")
		endIf
		
		(BHUNP3BController as BHUNP3BControllerscript).LegsSMP = SMPLegsApply
	endFunction

	function OnHighlightST()
		self.SetInfoText("$CBPCLEGSTOGGLEINFO")
	endFunction
endState

state OPTION_CBPC_Belly_Toggle

	function OnSelectST()

		if SMPBellyApply == false
			SMPBellyApply = true
			self.SetToggleOptionValueST(true, false, "")
		else
			SMPBellyApply = false
			self.SetToggleOptionValueST(false, false, "")
		endIf
		
		(BHUNP3BController as BHUNP3BControllerscript).BellySMP = SMPBellyApply
	endFunction

	function OnHighlightST()
		self.SetInfoText("$CBPCBELLYTOGGLEINFO")
	endFunction
endState

state OPTION_CBPC_Vagina_Toggle

	function OnSelectST()

		if SMPVaginaApply == false
			SMPVaginaApply = true
			self.SetToggleOptionValueST(true, false, "")
		else
			SMPVaginaApply = false
			self.SetToggleOptionValueST(false, false, "")
		endIf
		
		(BHUNP3BController as BHUNP3BControllerscript).VaginaSMP = SMPVaginaApply
	endFunction

	function OnHighlightST()
		self.SetInfoText("$CBPCVAGINATOGGLEINFO")
	endFunction
endState

state OPTION_CBPC_VaginaCollision_Toggle

	function OnSelectST()

		if SMPVaginaCollisionApply == false
			SMPVaginaCollisionApply = true
			self.SetToggleOptionValueST(true, false, "")
		else
			SMPVaginaCollisionApply = false
			self.SetToggleOptionValueST(false, false, "")
		endIf
		
		(BHUNP3BController as BHUNP3BControllerscript).VaginaCollisionSMP = SMPVaginaCollisionApply
	endFunction

	function OnHighlightST()
		self.SetInfoText("$CBPCVAGINACOLLISIONTOGGLEINFO")
	endFunction
endState

state OPTION_PLAYERCBPC_Breasts_Toggle

	function OnSelectST()

		if CBPCBreastsPlayer == false
			CBPCBreastsPlayer = true
			self.SetToggleOptionValueST(true, false, "")
		else
			CBPCBreastsPlayer = false
			self.SetToggleOptionValueST(false, false, "")
		endIf
		
		(BHUNP3BController as BHUNP3BControllerscript).BreastsCBPC = CBPCBreastsPlayer
	endFunction

	function OnHighlightST()
		self.SetInfoText("$CBPCBREASTSTOGGLEINFO")
	endFunction
endState

state OPTION_PLAYERCBPC_Butts_Toggle

	function OnSelectST()

		if CBPCButtsPlayer == false
			CBPCButtsPlayer = true
			self.SetToggleOptionValueST(true, false, "")
		else
			CBPCButtsPlayer = false
			self.SetToggleOptionValueST(false, false, "")
		endIf
		
		(BHUNP3BController as BHUNP3BControllerscript).ButtsCBPC = CBPCButtsPlayer
	endFunction

	function OnHighlightST()
		self.SetInfoText("$CBPCBUTTSTOGGLEINFO")
	endFunction
endState

state OPTION_PLAYERCBPC_Legs_Toggle

	function OnSelectST()

		if CBPCLegsPlayer == false
			CBPCLegsPlayer = true
			self.SetToggleOptionValueST(true, false, "")
		else
			CBPCLegsPlayer = false
			self.SetToggleOptionValueST(false, false, "")
		endIf
		
		(BHUNP3BController as BHUNP3BControllerscript).LegsCBPC = CBPCLegsPlayer
	endFunction

	function OnHighlightST()
		self.SetInfoText("$CBPCLEGSTOGGLEINFO")
	endFunction
endState

state OPTION_PLAYERCBPC_Belly_Toggle

	function OnSelectST()

		if CBPCBellyPlayer == false
			CBPCBellyPlayer = true
			self.SetToggleOptionValueST(true, false, "")
		else
			CBPCBellyPlayer = false
			self.SetToggleOptionValueST(false, false, "")
		endIf
		
		(BHUNP3BController as BHUNP3BControllerscript).BellyCBPC = CBPCBellyPlayer
	endFunction

	function OnHighlightST()
		self.SetInfoText("$CBPCBELLYTOGGLEINFO")
	endFunction
endState

state OPTION_PLAYERCBPC_Vagina_Toggle

	function OnSelectST()

		if CBPCVaginaPlayer == false
			CBPCVaginaPlayer = true
			self.SetToggleOptionValueST(true, false, "")
		else
			CBPCVaginaPlayer = false
			self.SetToggleOptionValueST(false, false, "")
		endIf
		
		(BHUNP3BController as BHUNP3BControllerscript).VaginaCBPC = CBPCVaginaPlayer
	endFunction

	function OnHighlightST()
		self.SetInfoText("$CBPCVAGINATOGGLEINFO")
	endFunction
endState

state OPTION_PLAYERCBPC_VaginaCollision_Toggle

	function OnSelectST()

		if CBPCVaginaCollisionPlayer == false
			CBPCVaginaCollisionPlayer = true
			self.SetToggleOptionValueST(true, false, "")
		else
			CBPCVaginaCollisionPlayer = false
			self.SetToggleOptionValueST(false, false, "")
		endIf
		
		(BHUNP3BController as BHUNP3BControllerscript).VaginaCollisionCBPC = CBPCVaginaCollisionPlayer
	endFunction

	function OnHighlightST()
		self.SetInfoText("$CBPCVAGINACOLLISIONTOGGLEINFO")
	endFunction
endState

state OPTION_SMP_Breasts_Toggle

	function OnSelectST()

		if SMPBreastsPlayer == false
			SMPBreastsPlayer = true
			self.SetToggleOptionValueST(true, false, "")
		else
			SMPBreastsPlayer = false
			self.SetToggleOptionValueST(false, false, "")
		endIf
		
		(BHUNP3BController as BHUNP3BControllerscript).PlayerBreastsSMP = SMPBreastsPlayer
	endFunction

	function OnHighlightST()
		self.SetInfoText("$SMPBREASTSTOGGLEINFO")
	endFunction
endState

state OPTION_SMP_Butts_Toggle

	function OnSelectST()

		if SMPButtsPlayer == false
			SMPButtsPlayer = true
			self.SetToggleOptionValueST(true, false, "")
		else
			SMPButtsPlayer = false
			self.SetToggleOptionValueST(false, false, "")
		endIf
		
		(BHUNP3BController as BHUNP3BControllerscript).PlayerButtsSMP = SMPButtsPlayer
	endFunction

	function OnHighlightST()
		self.SetInfoText("$SMPBUTTSTOGGLEINFO")
	endFunction
endState

state OPTION_SMP_Legs_Toggle

	function OnSelectST()

		;if SMPLegsPlayer == false
			SMPLegsPlayer = true
			self.SetToggleOptionValueST(true, false, "")
		;else
		;	SMPLegsPlayer = false
		;	self.SetToggleOptionValueST(false, false, "")
		;endIf
		
		(BHUNP3BController as BHUNP3BControllerscript).PlayerLegsSMP = SMPLegsPlayer
	endFunction

	function OnHighlightST()
		self.SetInfoText("$SMPLEGSTOGGLEINFO")
	endFunction
endState

state OPTION_SMP_Belly_Toggle

	function OnSelectST()

		if SMPBellyPlayer == false
			SMPBellyPlayer = true
			self.SetToggleOptionValueST(true, false, "")
		else
			SMPBellyPlayer = false
			self.SetToggleOptionValueST(false, false, "")
		endIf
		
		(BHUNP3BController as BHUNP3BControllerscript).PlayerBellySMP = SMPBellyPlayer
	endFunction

	function OnHighlightST()
		self.SetInfoText("$SMPBELLYTOGGLEINFO")
	endFunction
endState

state OPTION_SMP_Vagina_Toggle

	function OnSelectST()

		if SMPVaginaPlayer == false
			SMPVaginaPlayer = true
			self.SetToggleOptionValueST(true, false, "")
		else
			SMPVaginaPlayer = false
			self.SetToggleOptionValueST(false, false, "")
		endIf
		
		(BHUNP3BController as BHUNP3BControllerscript).PlayerVaginaSMP = SMPVaginaPlayer
	endFunction

	function OnHighlightST()
		self.SetInfoText("$SMPVAGINATOGGLEINFO")
	endFunction
endState

state OPTION_NPC_Spell_Toggle

	function OnSelectST()

		if NPCSpellToggle == false
			NPCSpellToggle = true
			self.SetToggleOptionValueST(true, false, "")
			self.NPC_Toggle_Enable()
		else
			NPCSpellToggle = false
			self.SetToggleOptionValueST(false, false, "")
			self.NPC_Toggle_Disable()
		endIf
	endFunction

	function OnHighlightST()
		self.SetInfoText(FSpellToggleInfo)
	endFunction
endState

state OPTION_NPC_ClearSMP_Toggle

	function OnSelectST()
		Bool Continue
		string msg
		if ClearNPCSMPToggle == False
			msg = "$FUSSCLEARCONFIRM"
			continue = ShowMessage(msg, true, "$Yes", "$No")
			ShowMessage(msg)
			
			If Continue == True
				(BHUNP3BController as BHUNP3BControllerscript).TrackedActorRemoveall()
			EndIf
		endIf
		ClearNPCSMPToggle != ClearNPCSMPToggle
		self.SetToggleOptionValueST(ClearNPCSMPToggle, false, "")

	endFunction

	function OnHighlightST()
		self.SetInfoText("$FUSSCLEARINFO")
	endFunction
	
endState

state OPTION_DEBUGLOGGING_Toggle

	function OnSelectST()
		if DebugLogging == false
			DebugLogging = true
			(BHUNP3BController as BHUNP3BControllerscript).CheckLogging = true
			self.SetToggleOptionValueST(true, false, "")
		else
			DebugLogging = false
			(BHUNP3BController as BHUNP3BControllerscript).CheckLogging = false
			self.SetToggleOptionValueST(false, false, "")
		endIf
	endFunction

	function OnHighlightST()
		self.SetInfoText("$DEBUGLOGGINGINFO")
	endFunction
	
endState

state OPTION_P_RESET_Toggle

	function OnSelectST()
		if PSMPRESET == false
			PSMPRESET = true
			self.PlayerSMPReset()
			self.SetToggleOptionValueST(true, false, "")
		else
			PSMPRESET = false
			self.SetToggleOptionValueST(false, false, "")
		endIf
	endFunction

	function OnHighlightST()
		self.SetInfoText("$PSMPRESETINFO")
	endFunction
	
endState


;-- State -------------------------------------------
state OPTION_SMPCup

	function OnMenuOpenST()

		self.SetMenuDialogOptions(FnumString)
		self.SetMenuDialogStartIndex(FnumIndex)
		self.SetMenuDialogDefaultIndex(0)
	endFunction

	function OnMenuAcceptST(Int index)

		FnumIndex = index
		(BHUNP3BController as BHUNP3BControllerscript).PlayerSMPCup = index
		self.SetMenuOptionValueST(FnumString[FnumIndex], false, "")
	endFunction
endState

;-- State -------------------------------------------
state OPTION_Keymap_B

	function OnKeyMapChangeST(Int NBkeyCode, String conflictControl, String conflictName)

		self.SetKeyMapOptionValueST(NBkeyCode, false, "")
		if NBkeyCode == 1 || NBkeyCode == 211
			NBkeyCode = 0
			self.SetKeyMapOptionValueST(211, false, "")
		else
			self.SetKeyMapOptionValueST(NBkeyCode, false, "")
		endIf
		NPCBKEY = NBkeyCode
		self.UpdateKeyRegistration()
	endFunction

	function OnHighlightST()

		self.SetInfoText(HotkeyInfoFB)
	endFunction

	function OnDefaultST()

		NPCBKEY = 71
		self.SetKeyMapOptionValueST(71, false, "")
	endFunction
endState

;-- State -------------------------------------------
state OPTION_Keymap_C

	function OnKeyMapChangeST(Int NCkeyCode, String conflictControl, String conflictName)

		self.SetKeyMapOptionValueST(NCkeyCode, false, "")
		if NCkeyCode == 1 || NCkeyCode == 211
			NCkeyCode = 0
			self.SetKeyMapOptionValueST(211, false, "")
		else
			self.SetKeyMapOptionValueST(NCkeyCode, false, "")
		endIf
		NPCCKEY = NCkeyCode
		self.UpdateKeyRegistration()
	endFunction

	function OnHighlightST()

		self.SetInfoText(HotkeyInfoFC)
	endFunction

	function OnDefaultST()

		NPCCKEY = 72
		self.SetKeyMapOptionValueST(72, false, "")
	endFunction
endState

;-- State -------------------------------------------
state OPTION_Keymap_D

	function OnKeyMapChangeST(Int NDkeyCode, String conflictControl, String conflictName)

		self.SetKeyMapOptionValueST(NDkeyCode, false, "")
		if NDkeyCode == 1 || NDkeyCode == 211
			NDkeyCode = 0
			self.SetKeyMapOptionValueST(211, false, "")
		else
			self.SetKeyMapOptionValueST(NDkeyCode, false, "")
		endIf
		NPCDKEY = NDkeyCode
		self.UpdateKeyRegistration()
	endFunction

	function OnHighlightST()

		self.SetInfoText(HotkeyInfoFD)
	endFunction

	function OnDefaultST()

		NPCDKEY = 73
		self.SetKeyMapOptionValueST(73, false, "")
	endFunction
endState

;-- State -------------------------------------------
state OPTION_PlayerSlot

	function OnMenuOpenST()
		self.SetMenuDialogOptions(PSlotList)
		self.SetMenuDialogStartIndex(PsTIndex)
		self.SetMenuDialogDefaultIndex(1)
	endFunction

	function OnMenuAcceptST(Int index)
		PsTIndex = index
		self.SetMenuOptionValueST(PSlotList[PsTIndex], false, "")
		ForcePageReset()
	endFunction
endState

;-- State -------------------------------------------
state OPTION_Keymap_A

	function OnKeyMapChangeST(Int NAkeyCode, String conflictControl, String conflictName)

		self.SetKeyMapOptionValueST(NAkeyCode, false, "")
		if NAkeyCode == 1 || NAkeyCode == 211
			NAkeyCode = 0
			self.SetKeyMapOptionValueST(211, false, "")
		else
			self.SetKeyMapOptionValueST(NAkeyCode, false, "")
		endIf
		NPCAKEY = NAkeyCode
		self.UpdateKeyRegistration()
	endFunction

	function OnHighlightST()

		self.SetInfoText(HotkeyInfoFA)
	endFunction

	function OnDefaultST()

		NPCAKEY = 77
		self.SetKeyMapOptionValueST(77, false, "")
	endFunction
endState

;-- State -------------------------------------------
state OPTION_Follower_D

	function OnMenuOpenST()

		self.SetMenuDialogOptions(SlotList)
		self.SetMenuDialogStartIndex(FDsTIndex)
		self.SetMenuDialogDefaultIndex(1)
	endFunction

	function OnMenuAcceptST(Int index)

		FDsTIndex = index
		self.SetMenuOptionValueST(SlotList[FDsTIndex], false, "")
	endFunction
endState

;-- State -------------------------------------------
state OPTION_Follower_C

	function OnMenuOpenST()

		self.SetMenuDialogOptions(SlotList)
		self.SetMenuDialogStartIndex(FCsTIndex)
		self.SetMenuDialogDefaultIndex(1)
	endFunction

	function OnMenuAcceptST(Int index)

		FCsTIndex = index
		self.SetMenuOptionValueST(SlotList[FCsTIndex], false, "")
	endFunction
endState

;-- State -------------------------------------------

state OPTION_P_Spell_Toggle

	function OnSelectST()

		if PlayerSpellToggle == false
			PlayerSpellToggle = true
			self.SetToggleOptionValueST(true, false, "")
			self.P_Toggle_Enable()
		else
			PlayerSpellToggle = false
			self.SetToggleOptionValueST(false, false, "")
			self.P_Toggle_Disable()
		endIf
	endFunction

	function OnHighlightST()

		self.SetInfoText(PSpellToggleInfo)
	endFunction
endState

;-- State -------------------------------------------
state OPTION_Follower_A

	function OnMenuOpenST()

		self.SetMenuDialogOptions(SlotList)
		self.SetMenuDialogStartIndex(FAsTIndex)
		self.SetMenuDialogDefaultIndex(1)
	endFunction

	function OnMenuAcceptST(Int index)

		FAsTIndex = index
		self.SetMenuOptionValueST(SlotList[FAsTIndex], false, "")
	endFunction
endState