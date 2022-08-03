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
String property Dslot = "$Fslot_D" auto hidden
String[] property SlotList auto hidden
String property HotkeyInfoFB = "$HOTKEYINFOFB" auto hidden
String property S60 = "$SLOT60" auto hidden
String property S51 = "$SLOT51" auto hidden
String property HotkeyInfoFC = "$HOTKEYINFOFC" auto hidden
String property HotkeyInfoFA = "$HOTKEYINFOFA" auto hidden
String property HotkeyInfoP = "$HOTKEYINFOP" auto hidden
String property HotkeyInfoFD = "$HOTKEYINFOFD" auto hidden
String property Bslot = "$Fslot_B" auto hidden

Bool property PlayerSpellToggle = false auto hidden

Bool property SMPBreastsApply Auto
Bool property SMPButtsApply Auto
Bool property SMPLegsApply Auto
Bool property SMPVaginaApply Auto
Bool property SMPBellyApply Auto


spell property FAspell auto

Bool property NPCSpellToggle = false auto hidden


String property Cslot = "$Fslot_C" auto hidden

Int property PsTIndex = 1 auto hidden
spell property FBspell auto
String[] property FnumString auto hidden

String property Aslot = "$Fslot_A" auto hidden
String property PSpellToggleInfo = "$PSPELLTOGGLEINFO" auto hidden
spell property FDspell auto
String property S50 = "$SLOT50" auto hidden
spell property Pspell auto
Int property NPCCKEY = 72 auto hidden
String property FSpellToggleInfo = "$FSPELLTOGGLEINFO" auto hidden

spell property FCspell auto

Actor Property PlayerRef Auto
Faction Property BHUNPSMPFaction Auto

function PlayerSMP()
if PlayerRef.isinfaction(BHUNPSMPFaction)
	if PlayerRef.GetItemCount(SMP3BONObjectP48 as form) != 0 && SlotList[PsTIndex] == S48
		PlayerRef.UnequipItem(SMP3BONObjectP48 as form, false, true)
		PlayerRef.RemoveItem(SMP3BONObjectP48 as form, 99, true, none)
	elseIf PlayerRef.GetItemCount(SMP3BONObjectP50 as form) != 0 && SlotList[PsTIndex] == S50
		PlayerRef.UnequipItem(SMP3BONObjectP50 as form, false, true)
		PlayerRef.RemoveItem(SMP3BONObjectP50 as form, 99, true, none)
	elseIf PlayerRef.GetItemCount(SMP3BONObjectP51 as form) != 0 && SlotList[PsTIndex] == S51
		PlayerRef.UnequipItem(SMP3BONObjectP51 as form, false, true)
		PlayerRef.RemoveItem(SMP3BONObjectP51 as form, 99, true, none)
	elseIf PlayerRef.GetItemCount(SMP3BONObjectP60 as form) != 0 && SlotList[PsTIndex] == S60
		PlayerRef.UnequipItem(SMP3BONObjectP60 as form, false, true)
		PlayerRef.RemoveItem(SMP3BONObjectP60 as form, 99, true, none)
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
	CBPCBreasts(PlayerRef, false)
	CBPCButts(PlayerRef, false)
	CBPCBelly(PlayerRef, false)
	CBPCVagina(PlayerRef, false)
	CBPCThigh(PlayerRef, false)
	debug.Notification("Player 3BBB CBPC Mode")
else
	PlayerRef.AddtoFaction(BHUNPSMPFaction)
	CBPCBreasts(PlayerRef, true)
	CBPCButts(PlayerRef, true)
	CBPCBelly(PlayerRef, true)
	CBPCVagina(PlayerRef, true)
	CBPCThigh(PlayerRef, true)
	if SlotList[PsTIndex] == S48
		PlayerRef.AddItem(SMP3BONObjectP48 as form, 1, true)
		PlayerRef.EquipItem(SMP3BONObjectP48 as form, true, true)
		debug.Notification("Player 3BBB SMP Mode")
	elseIf SlotList[PsTIndex] == S50
		PlayerRef.AddItem(SMP3BONObjectP50 as form, 1, true)
		PlayerRef.EquipItem(SMP3BONObjectP50 as form, true, true)
		debug.Notification("Player 3BBB SMP Mode")
	elseIf SlotList[PsTIndex] == S51
		PlayerRef.AddItem(SMP3BONObjectP51 as form, 1, true)
		PlayerRef.EquipItem(SMP3BONObjectP51 as form, true, true)
		debug.Notification("Player 3BBB SMP Mode")
	elseIf SlotList[PsTIndex] == S60
		PlayerRef.AddItem(SMP3BONObjectP60 as form, 1, true)
		PlayerRef.EquipItem(SMP3BONObjectP60 as form, true, true)
		debug.Notification("Player 3BBB SMP Mode")
	endIf
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
SetCursorFillMode(TOP_TO_BOTTOM)
	if pagename == "" || pagename == "$PageName_General"
		AddHeaderOption("$SMPCONFIGS")
		Int iDisabledFlag = 0
		SetCursorPosition(0)
		self.AddTextOption("BHUNP 3BBB MCM Version", CurrentVersion as String, self.OPTION_FLAG_DISABLED)
		self.AddHeaderOption("$PUSS", 0)
		self.AddToggleOptionST("OPTION_P_Spell_Toggle", "$PSPELLTOGGLE", PlayerSpellToggle, iDisabledFlag)
		self.AddMenuOptionST("OPTION_PlayerSlot", "$PUSLOT", SlotList[PsTIndex], iDisabledFlag)
		self.AddKeyMapOptionST("OPTION_Keymap_P", "$PKEYMAP", PKEY, iDisabledFlag)
		self.AddEmptyOption()
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
		SetCursorPosition(1)
		AddHeaderOption("$SMPBODYPARTS")
		self.AddToggleOptionST("OPTION_SMP_Breasts_Toggle", "$SMPBREASTSTOGGLE", SMPBreastsApply, iDisabledFlag)
		self.AddToggleOptionST("OPTION_SMP_Butts_Toggle", "$SMPBUTTSTOGGLE", SMPButtsApply, iDisabledFlag)
		self.AddToggleOptionST("OPTION_SMP_Legs_Toggle", "$SMPLEGSTOGGLE", SMPLegsApply, iDisabledFlag)
		self.AddToggleOptionST("OPTION_SMP_Belly_Toggle", "$SMPBELLYTOGGLE", SMPBellyApply, iDisabledFlag)
		self.AddToggleOptionST("OPTION_SMP_Vagina_Toggle", "$SMPVAGINATOGGLE", SMPVaginaApply, iDisabledFlag)
		
	endIf
endFunction

function NPC_Toggle_Disable()

	PlayerRef.RemoveSpell(FAspell)
	PlayerRef.RemoveSpell(FBspell)
	PlayerRef.RemoveSpell(FCspell)
	PlayerRef.RemoveSpell(FDspell)
endFunction

function OnConfigInit()

	ModName = "BHUNP 3BBB Addon"
	Pages = new String[1]
	Pages[0] = "$PageName_General"
endFunction

function OnInit()

	parent.OnInit()
	SlotList = new String[4]
	SlotList[0] = S48
	SlotList[1] = S50
	SlotList[2] = S51
	SlotList[3] = S60
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
	
	if (akTarget.GetItemCount(NPCMain48) > 0) || (akTarget.GetItemCount(NPCMain50) > 0) || (akTarget.GetItemCount(NPCMain51) > 0) || (akTarget.GetItemCount(NPCMain60) > 0) || (akTarget.isinfaction(BHUNPSMPFaction))
		akTarget.removefromfaction(BHUNPSMPFaction)
		CBPCBreasts(akTarget, false)
		CBPCButts(akTarget, false)
		CBPCBelly(akTarget, false)
		CBPCVagina(akTarget, false)
		CBPCThigh(akTarget, false)
		unequipSMPAll(akTarget)
		debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB CBPC Mode")
		Return
	endif
	
		if cup == 0
			if SlotList[FAsTIndex] == S48
				akTarget.AddItem(NPCMain48 as form, 1, true)
				akTarget.EquipItem(NPCMain48 as form, true, true)
				debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 48")
			elseIf SlotList[FAsTIndex] == S50
				akTarget.AddItem(NPCMain50 as form, 1, true)
				akTarget.EquipItem(NPCMain50 as form, true, true)
				debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 50")
			elseIf SlotList[FAsTIndex] == S51
				akTarget.AddItem(NPCMain51 as form, 1, true)
				akTarget.EquipItem(NPCMain51 as form, true, true)
				debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 51")
			elseIf SlotList[FAsTIndex] == S60
				akTarget.AddItem(NPCMain60 as form, 1, true)
				akTarget.EquipItem(NPCMain60 as form, true, true)
				debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 60")
			endIf
		elseIf cup == 1
			if SlotList[FBsTIndex] == S48
				akTarget.AddItem(NPCMain48 as form, 1, true)
				akTarget.EquipItem(NPCMain48 as form, true, true)
				debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 48")
			elseIf SlotList[FBsTIndex] == S50
				akTarget.AddItem(NPCMain50 as form, 1, true)
				akTarget.EquipItem(NPCMain50 as form, true, true)
				debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 50")
			elseIf SlotList[FBsTIndex] == S51
				akTarget.AddItem(NPCMain51 as form, 1, true)
				akTarget.EquipItem(NPCMain51 as form, true, true)
				debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 51")
			elseIf SlotList[FBsTIndex] == S60
				akTarget.AddItem(NPCMain60 as form, 1, true)
				akTarget.EquipItem(NPCMain60 as form, true, true)
				debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 60")
			endIf
		elseIf cup == 2
			if SlotList[FCsTIndex] == S48
				akTarget.AddItem(NPCMain48 as form, 1, true)
				akTarget.EquipItem(NPCMain48 as form, true, true)
				debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 48")
			elseIf SlotList[FCsTIndex] == S50
				akTarget.AddItem(NPCMain50 as form, 1, true)
				akTarget.EquipItem(NPCMain50 as form, true, true)
				debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 50")
			elseIf SlotList[FCsTIndex] == S51
				akTarget.AddItem(NPCMain51 as form, 1, true)
				akTarget.EquipItem(NPCMain51 as form, true, true)
				debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 51")
			elseIf SlotList[FCsTIndex] == S60
				akTarget.AddItem(NPCMain60 as form, 1, true)
				akTarget.EquipItem(NPCMain60 as form, true, true)
				debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 60")
			endIf
		elseIf cup == 3
			if SlotList[FDsTIndex] == S48
				akTarget.AddItem(NPCMain48 as form, 1, true)
				akTarget.EquipItem(NPCMain48 as form, true, true)
				debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 48")
			elseIf SlotList[FDsTIndex] == S50
				akTarget.AddItem(NPCMain50 as form, 1, true)
				akTarget.EquipItem(NPCMain50 as form, true, true)
				debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 50")
			elseIf SlotList[FDsTIndex] == S51
				akTarget.AddItem(NPCMain51 as form, 1, true)
				akTarget.EquipItem(NPCMain51 as form, true, true)
				debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 51")
			elseIf SlotList[FDsTIndex] == S60
				akTarget.AddItem(NPCMain60 as form, 1, true)
				akTarget.EquipItem(NPCMain60 as form, true, true)
				debug.Notification(akTarget.GetActorBase().GetName() + " 3BBB SMP Mode Slot 60")
			endIf
		endif

	akTarget.addtofaction(BHUNPSMPFaction)
	CBPCBreasts(akTarget, true)
	CBPCButts(akTarget, true)
	CBPCBelly(akTarget, true)
	CBPCVagina(akTarget, true)
	CBPCThigh(akTarget, true)
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
	return 7
endFunction

; Skipped compiler generated GotoState

function OnKeyDown(Int INkeyCode)

	objectreference Target = game.GetCurrentCrosshairRef()
	if INkeyCode == PKEY
		self.PlayerSMP()
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


function CBPCBreasts(actor target, bool Pstop = false)
if SMPBreastsApply
	if !Pstop
		CBPCPluginScript.StartPhysics(target, "L Breast01")
		CBPCPluginScript.StartPhysics(target, "L Breast02")
		CBPCPluginScript.StartPhysics(target, "L Breast03")
		CBPCPluginScript.StartPhysics(target, "R Breast01")
		CBPCPluginScript.StartPhysics(target, "R Breast02")
		CBPCPluginScript.StartPhysics(target, "R Breast03")
	else
		CBPCPluginScript.StopPhysics(target, "L Breast01")
		CBPCPluginScript.StopPhysics(target, "L Breast02")
		CBPCPluginScript.StopPhysics(target, "L Breast03")
		CBPCPluginScript.StopPhysics(target, "R Breast01")
		CBPCPluginScript.StopPhysics(target, "R Breast02")
		CBPCPluginScript.StopPhysics(target, "R Breast03")
	endif
endif
endFunction

function CBPCButts(actor target, bool Pstop = false)
if SMPButtsApply
	if !Pstop
		CBPCPluginScript.StartPhysics(target, "NPC L Butt")
		CBPCPluginScript.StartPhysics(target, "NPC R Butt")
	else
		CBPCPluginScript.StopPhysics(target, "NPC L Butt")
		CBPCPluginScript.StopPhysics(target, "NPC R Butt")
	endif
endif
endFunction

function CBPCThigh(actor target, bool Pstop = false)
if SMPLegsApply
	if !Pstop
		CBPCPluginScript.StartPhysics(target, "NPC L FrontThigh")
		CBPCPluginScript.StartPhysics(target, "NPC R FrontThigh")
		CBPCPluginScript.StartPhysics(target, "NPC L RearThigh")
		CBPCPluginScript.StartPhysics(target, "NPC R RearThigh")
		CBPCPluginScript.StartPhysics(target, "NPC L RearCalf [LrClf]")
		CBPCPluginScript.StartPhysics(target, "NPC R RearCalf [LrClf]")
	else
		CBPCPluginScript.StopPhysics(target, "NPC L FrontThigh")
		CBPCPluginScript.StopPhysics(target, "NPC R FrontThigh")
		CBPCPluginScript.StopPhysics(target, "NPC L RearThigh")
		CBPCPluginScript.StopPhysics(target, "NPC R RearThigh")
		CBPCPluginScript.StopPhysics(target, "NPC L RearCalf [LrClf]")
		CBPCPluginScript.StopPhysics(target, "NPC R RearCalf [LrClf]")
	endif
endif
endFunction

function CBPCVagina(actor target, bool Pstop = false)
if SMPVaginaApply
	if !Pstop
		CBPCPluginScript.StartPhysics(target, "NPC L Pussy02")
		CBPCPluginScript.StartPhysics(target, "NPC R Pussy02")
		CBPCPluginScript.StartPhysics(target, "NPC Pelvis [Pelv]")
		CBPCPluginScript.StartPhysics(target, "VaginaB1")
		CBPCPluginScript.StartPhysics(target, "Clitoral1")
	else
		CBPCPluginScript.StopPhysics(target, "NPC L Pussy02")
		CBPCPluginScript.StopPhysics(target, "NPC R Pussy02")
		CBPCPluginScript.StopPhysics(target, "NPC Pelvis [Pelv]")
		CBPCPluginScript.StopPhysics(target, "VaginaB1")
		CBPCPluginScript.StopPhysics(target, "Clitoral1")
	endif
endif
endFunction

function CBPCBelly(actor target, bool Pstop = false)
if SMPBellyApply
	if !Pstop
		CBPCPluginScript.StartPhysics(target, "NPC Belly")
	else
		CBPCPluginScript.StopPhysics(target, "NPC Belly")
	endif
endif
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

;-- State -------------------------------------------
state OPTION_SMP_Breasts_Toggle

	function OnSelectST()

		if SMPBreastsApply == false
			SMPBreastsApply = true
			self.SetToggleOptionValueST(true, false, "")
		else
			SMPBreastsApply = false
			self.SetToggleOptionValueST(false, false, "")
		endIf
	endFunction

	function OnHighlightST()
		self.SetInfoText("$SMPBREASTSTOGGLEINFO")
	endFunction
endState

state OPTION_SMP_Butts_Toggle

	function OnSelectST()

		if SMPButtsApply == false
			SMPButtsApply = true
			self.SetToggleOptionValueST(true, false, "")
		else
			SMPButtsApply = false
			self.SetToggleOptionValueST(false, false, "")
		endIf
	endFunction

	function OnHighlightST()
		self.SetInfoText("$SMPBUTTSTOGGLEINFO")
	endFunction
endState

state OPTION_SMP_Legs_Toggle

	function OnSelectST()

		if SMPLegsApply == false
			SMPLegsApply = true
			self.SetToggleOptionValueST(true, false, "")
		else
			SMPLegsApply = false
			self.SetToggleOptionValueST(false, false, "")
		endIf
	endFunction

	function OnHighlightST()
		self.SetInfoText("$SMPLEGSTOGGLEINFO")
	endFunction
endState

state OPTION_SMP_Belly_Toggle

	function OnSelectST()

		if SMPBellyApply == false
			SMPBellyApply = true
			self.SetToggleOptionValueST(true, false, "")
		else
			SMPBellyApply = false
			self.SetToggleOptionValueST(false, false, "")
		endIf
	endFunction

	function OnHighlightST()
		self.SetInfoText("$SMPBELLYTOGGLEINFO")
	endFunction
endState

state OPTION_SMP_Vagina_Toggle

	function OnSelectST()

		if SMPVaginaApply == false
			SMPVaginaApply = true
			self.SetToggleOptionValueST(true, false, "")
		else
			SMPVaginaApply = false
			self.SetToggleOptionValueST(false, false, "")
		endIf
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

;-- State -------------------------------------------
state option_use_object

	function OnMenuOpenST()

		self.SetMenuDialogOptions(FnumString)
		self.SetMenuDialogStartIndex(FnumIndex)
		self.SetMenuDialogDefaultIndex(2)
	endFunction

	function OnMenuAcceptST(Int index)

		FnumIndex = index
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

		self.SetMenuDialogOptions(SlotList)
		self.SetMenuDialogStartIndex(PsTIndex)
		self.SetMenuDialogDefaultIndex(1)
	endFunction

	function OnMenuAcceptST(Int index)

		PsTIndex = index
		self.SetMenuOptionValueST(SlotList[PsTIndex], false, "")
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