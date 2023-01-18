Scriptname BHUNP3BControllerScript extends Quest  

Formlist Property ActorSMPList auto

Bool Property CBPCResetToggle = true Auto Hidden Conditional

float[] EmptyPoint
float[] LBreast01Pos
float[] LBreast02Pos
float[] LBreast03Pos
float[] RBreast01Pos
float[] RBreast02Pos
float[] RBreast03Pos
float[] FrontThighPos
float[] RearThighPos
float[] RearCalfPos
float[] LPussy1Pos
float[] RPussy1Pos
float[] LPussy2Pos
float[] RPussy2Pos
float[] ClitoralPos
float[] VaginaBPos
float[] NPCBellyPos

string Property LPreBreast01Name = "L PreBreast01" autoReadOnly
string Property LPreBreast02Name = "L PreBreast02" autoReadOnly
string Property LPreBreast03Name = "L PreBreast03" autoReadOnly
string Property RPreBreast01Name = "R PreBreast01" autoReadOnly
string Property RPreBreast02Name = "R PreBreast02" autoReadOnly
string Property RPreBreast03Name = "R PreBreast03" autoReadOnly

string Property LBreast01Name = "L Breast01" autoReadOnly
string Property LBreast02Name = "L Breast02" autoReadOnly
string Property LBreast03Name = "L Breast03" autoReadOnly
string Property RBreast01Name = "R Breast01" autoReadOnly
string Property RBreast02Name = "R Breast02" autoReadOnly
string Property RBreast03Name = "R Breast03" autoReadOnly

string Property ButtLName = "NPC L Butt" autoReadOnly
string Property ButtRName = "NPC R Butt" autoReadOnly

string Property LFrontThighName = "NPC L FrontThigh" autoReadOnly
string Property RFrontThighName = "NPC R FrontThigh" autoReadOnly
string Property LRearThighName = "NPC L RearThigh" autoReadOnly
string Property RRearThighName = "NPC R RearThigh" autoReadOnly
string Property LRearCalfName = "NPC L RearCalf [LrClf]" autoReadOnly
string Property RRearCalfName = "NPC R RearCalf [RrClf]" autoReadOnly

string Property LPussy2Name = "NPC L Pussy02" autoReadOnly
string Property LPussy1Name = "NPC L Pussy01" autoReadOnly
string Property RPussy2Name = "NPC R Pussy02" autoReadOnly
string Property RPussy1Name = "NPC R Pussy01" autoReadOnly

string Property PelvisName = "NPC Pelvis [Pelv]" autoReadOnly

string Property VaginaB1Name = "VaginaB1" autoReadOnly
string Property Clitoral1Name = "Clitoral1" autoReadOnly

string Property NPCBellyName = "NPC Belly" autoReadOnly
string Property HDTBellyName = "HDT Belly" autoReadOnly

Bool property CheckLogging Auto Hidden Conditional

Bool property BreastsSMP Auto Hidden Conditional
Bool property ButtsSMP Auto Hidden Conditional
Bool property LegsSMP Auto Hidden Conditional
Bool property VaginaSMP Auto Hidden Conditional
Bool property BellySMP Auto Hidden Conditional
Bool property VaginaCollisionSMP Auto Hidden Conditional

Bool property BreastsCBPC Auto Hidden Conditional
Bool property ButtsCBPC Auto Hidden Conditional
Bool property LegsCBPC Auto Hidden Conditional
Bool property VaginaCBPC Auto Hidden Conditional
Bool property BellyCBPC Auto Hidden Conditional
Bool property VaginaCollisionCBPC Auto Hidden Conditional

Bool property PlayerBreastsSMP = true Auto Hidden Conditional
Bool property PlayerButtsSMP = true Auto Hidden Conditional
Bool property PlayerLegsSMP = true Auto Hidden Conditional
Bool property PlayerVaginaSMP = true Auto Hidden Conditional
Bool property PlayerBellySMP = true Auto Hidden Conditional

int property PlayerSMPCup Auto Hidden Conditional

Quest Property BHUNP3BAddon Auto

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

Armor Property SMP3BONObjectDcupBase60 Auto;Base

Armor Property SMP3BONObjectAcupB60 Auto;Only Breasts
Armor Property SMP3BONObjectAcupBelly60 Auto;Only Belly
Armor Property SMP3BONObjectAcupButts60 Auto;Only Butt
Armor Property SMP3BONObjectAcupV60 Auto;Only Vagina

Armor Property SMP3BONObjectBcupB60 Auto;Only Breasts
Armor Property SMP3BONObjectBcupBelly60 Auto;Only Belly
Armor Property SMP3BONObjectBcupButts60 Auto;Only Butt
Armor Property SMP3BONObjectBcupV60 Auto;Only Vagina

Armor Property SMP3BONObjectCcupB60 Auto;Only Breasts
Armor Property SMP3BONObjectCcupBelly60 Auto;Only Belly
Armor Property SMP3BONObjectCcupButts60 Auto;Only Butt
Armor Property SMP3BONObjectCcupV60 Auto;Only Vagina

Armor Property SMP3BONObjectDcupB60 Auto;Only Breasts
Armor Property SMP3BONObjectDcupBelly60 Auto;Only Belly
Armor Property SMP3BONObjectDcupButts60 Auto;Only Butt
Armor Property SMP3BONObjectDcupV60 Auto;Only Vagina

Armor Property SMP3BONObjectAcupBBB60 Auto;Breasts + Butts + Belly
Armor Property SMP3BONObjectAcupBBV60 Auto;Breasts + Vagina + Butts
Armor Property SMP3BONObjectAcupBellyBBV60 Auto;Breasts + Vagina + Belly
Armor Property SMP3BONObjectAcupBellyVBB60 Auto;Vagina + Belly + Butts

Armor Property SMP3BONObjectAcupBB60 Auto;Breasts + Butts
Armor Property SMP3BONObjectAcupBellyB60 Auto;Breasts + Belly
Armor Property SMP3BONObjectAcupBellyBB60 Auto;Breasts + Vagina
Armor Property SMP3BONObjectAcupButtsBelly60 Auto; Butts + Belly
Armor Property SMP3BONObjectAcupBellyV60 Auto;Belly + Vagina
Armor Property SMP3BONObjectAcupBV60 Auto;Butts + Vagina

Armor Property SMP3BONObjectBcupBBB60 Auto;Breasts + Butts + Belly
Armor Property SMP3BONObjectBcupBBV60 Auto;Breasts + Vagina + Butts
Armor Property SMP3BONObjectBcupBellyBBV60 Auto;Breasts + Vagina + Belly
Armor Property SMP3BONObjectBcupBellyVBB60 Auto;Vagina + Belly + Butts

Armor Property SMP3BONObjectBcupBB60 Auto;Breasts + Butts
Armor Property SMP3BONObjectBcupBellyB60 Auto;Breasts + Belly
Armor Property SMP3BONObjectBcupBellyBB60 Auto;Breasts + Vagina
Armor Property SMP3BONObjectBcupButtsBelly60 Auto; Butts + Belly
Armor Property SMP3BONObjectBcupBellyV60 Auto;Belly + Vagina
Armor Property SMP3BONObjectBcupBV60 Auto;Butts + Vagina

Armor Property SMP3BONObjectCcupBBB60 Auto;Breasts + Butts + Belly
Armor Property SMP3BONObjectCcupBBV60 Auto;Breasts + Vagina + Butts
Armor Property SMP3BONObjectCcupBellyBBV60 Auto;Breasts + Vagina + Belly
Armor Property SMP3BONObjectCcupBellyVBB60 Auto;Vagina + Belly + Butts

Armor Property SMP3BONObjectCcupBB60 Auto;Breasts + Butts
Armor Property SMP3BONObjectCcupBellyB60 Auto;Breasts + Belly
Armor Property SMP3BONObjectCcupBellyBB60 Auto;Breasts + Vagina
Armor Property SMP3BONObjectCcupButtsBelly60 Auto; Butts + Belly
Armor Property SMP3BONObjectCcupBellyV60 Auto;Belly + Vagina
Armor Property SMP3BONObjectCcupBV60 Auto;Butts + Vagina

Armor Property SMP3BONObjectDcupBBB60 Auto;Breasts + Butts + Belly
Armor Property SMP3BONObjectDcupBBV60 Auto;Breasts + Vagina + Butts
Armor Property SMP3BONObjectDcupBellyBBV60 Auto;Breasts + Vagina + Belly
Armor Property SMP3BONObjectDcupBellyVBB60 Auto;Vagina + Belly + Butts

Armor Property SMP3BONObjectDcupBB60 Auto;Breasts + Butts
Armor Property SMP3BONObjectDcupBellyB60 Auto;Breasts + Belly
Armor Property SMP3BONObjectDcupBellyBB60 Auto;Breasts + Vagina
Armor Property SMP3BONObjectDcupButtsBelly60 Auto; Butts + Belly
Armor Property SMP3BONObjectDcupBellyV60 Auto;Belly + Vagina
Armor Property SMP3BONObjectDcupBV60 Auto;Butts + Vagina

Armor Property SMP3BONObjectAcupFull60 Auto
Armor Property SMP3BONObjectBcupFull60 Auto
Armor Property SMP3BONObjectCcupFull60 Auto
Armor Property SMP3BONObjectDcupFull60 Auto

Armor CurrentSMPArmor

Form[] Property TrackedActors  Auto; Currently tracked female actors

Faction Property BHUNPSMPFaction Auto

Event OnInit()
	InitialArrays()
	InitialPos()
	;(BHUNP3BAddon as BHUNPAddonMCM).OnConfigInit()
	ResetMCM()
EndEvent

Function ResetMCM()
	BHUNP3BAddon.stop()
	BHUNP3BAddon.start()
EndFunction

function InitialArrays()
	EmptyPoint		= new Float[3]
	LBreast01Pos	= new Float[3]
	LBreast02Pos	= new Float[3]
	LBreast03Pos	= new Float[3]
	RBreast01Pos	= new Float[3]
	RBreast02Pos	= new Float[3]
	RBreast03Pos	= new Float[3]
	FrontThighPos	= new Float[3]
	RearThighPos	= new Float[3]
	RearCalfPos		= new Float[3]
	LPussy1Pos		= new Float[3]
	RPussy1Pos		= new Float[3]
	LPussy2Pos		= new Float[3]
	RPussy2Pos		= new Float[3]
	ClitoralPos		= new Float[3]
	VaginaBPos		= new Float[3]
	NPCBellyPos		= new Float[3]
endFunction

function InitialPos()
	EmptyPoint[0] = 0.0
	EmptyPoint[1] = 0.0
	EmptyPoint[2] = 0.0
	
	LBreast01Pos[0] = -1.120057
	LBreast01Pos[1] = 3.090759
	LBreast01Pos[2] = -0.538383
	
	LBreast02Pos[0] = -1.330020
	LBreast02Pos[1] = 3.670190
	LBreast02Pos[2] = -0.524490
	
	LBreast03Pos[0] = -1.314233
	LBreast03Pos[1] = 3.626562
	LBreast03Pos[2] = 0.583305
	
	RBreast01Pos[0] = 1.120055
	RBreast01Pos[1] = 3.090774
	RBreast01Pos[2] = -0.538383
	
	RBreast02Pos[0] = 1.330017
	RBreast02Pos[1] = 3.670176
	RBreast02Pos[2] = -0.524536
	
	RBreast03Pos[0] = 1.314238
	RBreast03Pos[1] = 3.626567
	RBreast03Pos[2] = 0.583328
	
	FrontThighPos[0] = 0.0
	FrontThighPos[1] = 3.438000
	FrontThighPos[2] = 0.0

	RearThighPos[0] = 0.0
	RearThighPos[1] = -2.309000
	RearThighPos[2] = 0.0

	RearCalfPos[0] = 0.0
	RearCalfPos[1] = -2.832000
	RearCalfPos[2] = 0.0
	
	LPussy1Pos[0] = -2.000000
	LPussy1Pos[1] = 0.0
	LPussy1Pos[2] = -1.000008
	
	RPussy1Pos[0] = 2.000000
	RPussy1Pos[1] = 0.0
	RPussy1Pos[2] = -1.000008
	
	LPussy2Pos[0] = -1.0
	LPussy2Pos[1] = -0.000001
	LPussy2Pos[2] = -3.0
	
	RPussy2Pos[0] = 1.0
	RPussy2Pos[1] = -0.000001
	RPussy2Pos[2] = -3.0
	
	ClitoralPos[0] = 0.000582
	ClitoralPos[1] = -1.390759
	ClitoralPos[2] = -2.095268
	
	VaginaBPos[0] = 0.000735
	VaginaBPos[1] = -2.475235
	VaginaBPos[2] = -1.987076
	
	NPCBellyPos[0] = 0.0
	NPCBellyPos[1] = 7.0
	NPCBellyPos[2] = 0.0
endFunction

int function TrackedActorGetInt(actor akactor)
	int index = TrackedActors.Find(akActor)
	return index
Endfunction

Actor function TrackedActorGet(int index)
{Get the tracked actor at the specified index}
    return TrackedActors[index] as Actor
endFunction

int function TrackedActorAdd(Actor akActor)
{Try to add the specified actor to the tracking list}
    int index = TrackedActors.Find(akActor)
    
    ; Don't add if the actor is already being tracked
    if (index != -1)
        return index
    endIf
    
    index = TrackedActors.Find(none)
    
    if (index == -1)
        TrackedActors = Utility.ResizeFormArray(TrackedActors, TrackedActors.Length + 1, none)
		index = TrackedActors.Find(none)
	endif
	TrackedActors[index] = akActor
	return index
endfunction

bool function TrackedActorRemove(int index)
{Remove the tracked actor at the specified index}
    if (index >= 0 && index < TrackedActors.Length)
		RemoveSMP(TrackedActors[index] as actor)
        TrackedActors[index] = none
        return true
    endIf
    return false
endFunction

function TrackedActorRemoveall()
	int i = TrackedActors.Length
	while (i)
		i -= 1
		TrackedActorRemove(i)
	endWhile
EndFunction

function RemoveSMP(actor akTarget)
	if akTarget.getfactionrank(BHUNPSMPFaction) == 1
		akTarget.UnequipItem(SMP3BONObjectF148 as form, false, true)
		akTarget.RemoveItem(SMP3BONObjectF148 as form, 99, true, none)
		akTarget.UnequipItem(SMP3BONObjectF248 as form, false, true)
		akTarget.RemoveItem(SMP3BONObjectF248 as form, 99, true, none)
		akTarget.UnequipItem(SMP3BONObjectF348 as form, false, true)
		akTarget.RemoveItem(SMP3BONObjectF348 as form, 99, true, none)
		akTarget.UnequipItem(SMP3BONObjectF448 as form, false, true)
		akTarget.RemoveItem(SMP3BONObjectF448 as form, 99, true, none)
	elseif akTarget.getfactionrank(BHUNPSMPFaction) == 2
		akTarget.UnequipItem(SMP3BONObjectF150 as form, false, true)
		akTarget.RemoveItem(SMP3BONObjectF150 as form, 99, true, none)
		akTarget.UnequipItem(SMP3BONObjectF250 as form, false, true)
		akTarget.RemoveItem(SMP3BONObjectF250 as form, 99, true, none)
		akTarget.UnequipItem(SMP3BONObjectF350 as form, false, true)
		akTarget.RemoveItem(SMP3BONObjectF350 as form, 99, true, none)
		akTarget.UnequipItem(SMP3BONObjectF450 as form, false, true)
		akTarget.RemoveItem(SMP3BONObjectF450 as form, 99, true, none)
	elseif akTarget.getfactionrank(BHUNPSMPFaction) == 3
		akTarget.UnequipItem(SMP3BONObjectF151 as form, false, true)
		akTarget.RemoveItem(SMP3BONObjectF151 as form, 99, true, none)
		akTarget.UnequipItem(SMP3BONObjectF251 as form, false, true)
		akTarget.RemoveItem(SMP3BONObjectF251 as form, 99, true, none)
		akTarget.UnequipItem(SMP3BONObjectF351 as form, false, true)
		akTarget.RemoveItem(SMP3BONObjectF351 as form, 99, true, none)
		akTarget.UnequipItem(SMP3BONObjectF451 as form, false, true)
		akTarget.RemoveItem(SMP3BONObjectF451 as form, 99, true, none)
	elseif akTarget.getfactionrank(BHUNPSMPFaction) == 4
		akTarget.UnequipItem(SMP3BONObjectF160 as form, false, true)
		akTarget.RemoveItem(SMP3BONObjectF160 as form, 99, true, none)
		akTarget.UnequipItem(SMP3BONObjectF260 as form, false, true)
		akTarget.RemoveItem(SMP3BONObjectF260 as form, 99, true, none)
		akTarget.UnequipItem(SMP3BONObjectF360 as form, false, true)
		akTarget.RemoveItem(SMP3BONObjectF360 as form, 99, true, none)
		akTarget.UnequipItem(SMP3BONObjectF460 as form, false, true)
		akTarget.RemoveItem(SMP3BONObjectF460 as form, 99, true, none)
	endif

EndFunction

function CBPCBreastsReset(actor target)
	if !CBPCResetToggle
		return
	endif
	
	if NetImmerse.HasNode(target as ObjectReference, LPreBreast01Name, false)
		NetImmerse.SetNodeLocalPosition(target as ObjectReference, LBreast01Name, EmptyPoint, false)
	else
		NetImmerse.SetNodeLocalPosition(target as ObjectReference, LBreast01Name, LBreast01Pos, false)
	endif
	NetImmerse.SetNodeLocalRotationEuler(target as ObjectReference, LBreast01Name, EmptyPoint, false)

	if NetImmerse.HasNode(target as ObjectReference, RPreBreast01Name, false)
		NetImmerse.SetNodeLocalPosition(target as ObjectReference, RBreast01Name, EmptyPoint, false)
	else
		NetImmerse.SetNodeLocalPosition(target as ObjectReference, RBreast01Name, RBreast01Pos, false)
	endif
	NetImmerse.SetNodeLocalRotationEuler(target as ObjectReference, RBreast01Name, EmptyPoint, false)
	
	if NetImmerse.HasNode(target as ObjectReference, LPreBreast02Name, false)
		NetImmerse.SetNodeLocalPosition(target as ObjectReference, LBreast02Name, EmptyPoint, false)
	else
		NetImmerse.SetNodeLocalPosition(target as ObjectReference, LBreast02Name, LBreast02Pos, false)
	endif
	NetImmerse.SetNodeLocalRotationEuler(target as ObjectReference, LBreast02Name, EmptyPoint, false)
	
	
	if NetImmerse.HasNode(target as ObjectReference, RPreBreast02Name, false)
		NetImmerse.SetNodeLocalPosition(target as ObjectReference, RBreast02Name, EmptyPoint, false)
	else
		NetImmerse.SetNodeLocalPosition(target as ObjectReference, RBreast02Name, RBreast02Pos, false)
	endif
	NetImmerse.SetNodeLocalRotationEuler(target as ObjectReference, RBreast02Name, EmptyPoint, false)
	
	
	if NetImmerse.HasNode(target as ObjectReference, LPreBreast03Name, false)
		NetImmerse.SetNodeLocalPosition(target as ObjectReference, LBreast03Name, EmptyPoint, false)
	else
		NetImmerse.SetNodeLocalPosition(target as ObjectReference, LBreast03Name, LBreast03Pos, false)
	endif
	NetImmerse.SetNodeLocalRotationEuler(target as ObjectReference, LBreast03Name, EmptyPoint, false)
	
	
	if NetImmerse.HasNode(target as ObjectReference, RPreBreast03Name, false)
		NetImmerse.SetNodeLocalPosition(target as ObjectReference, RBreast03Name, EmptyPoint, false)
	else
		NetImmerse.SetNodeLocalPosition(target as ObjectReference, RBreast03Name, RBreast03Pos, false)
	endif
	NetImmerse.SetNodeLocalRotationEuler(target as ObjectReference, RBreast03Name, EmptyPoint, false)
	
endFunction

function CBPCButtsReset(actor target)
	if !CBPCResetToggle
		return
	endif

	NetImmerse.SetNodeLocalPosition(target as ObjectReference, ButtLName, EmptyPoint, false)
	NetImmerse.SetNodeLocalRotationEuler(target as ObjectReference, ButtLName, EmptyPoint, false)
	
	NetImmerse.SetNodeLocalPosition(target as ObjectReference, ButtRName, EmptyPoint, false)
	NetImmerse.SetNodeLocalRotationEuler(target as ObjectReference, ButtRName, EmptyPoint, false)
endFunction

function CBPCBellyReset(actor target)
	if !CBPCResetToggle
		return
	endif

	NetImmerse.SetNodeLocalPosition(target as ObjectReference, NPCBellyName, NPCBellyPos, false)
	NetImmerse.SetNodeLocalRotationEuler(target as ObjectReference, NPCBellyName, EmptyPoint, false)
	
	NetImmerse.SetNodeLocalPosition(target as ObjectReference, HDTBellyName, EmptyPoint, false)
	NetImmerse.SetNodeLocalRotationEuler(target as ObjectReference, HDTBellyName, EmptyPoint, false)
endFunction


function CBPCVaginaReset(actor target)
	if !CBPCResetToggle
		return
	endif

	NetImmerse.SetNodeLocalPosition(target as ObjectReference, LPussy1Name, LPussy1Pos, false)
	NetImmerse.SetNodeLocalRotationEuler(target as ObjectReference, LPussy1Name, EmptyPoint, false)
	
	NetImmerse.SetNodeLocalPosition(target as ObjectReference, RPussy1Name, RPussy1Pos, false)
	NetImmerse.SetNodeLocalRotationEuler(target as ObjectReference, RPussy1Name, EmptyPoint, false)
	
	NetImmerse.SetNodeLocalPosition(target as ObjectReference, VaginaB1Name, VaginaBPos, false)
	NetImmerse.SetNodeLocalRotationEuler(target as ObjectReference, VaginaB1Name, EmptyPoint, false)
	
	NetImmerse.SetNodeLocalPosition(target as ObjectReference, Clitoral1Name, ClitoralPos, false)
	NetImmerse.SetNodeLocalRotationEuler(target as ObjectReference, Clitoral1Name, EmptyPoint, false)
endFunction

function CBPCVaginaCollisionReset(actor target)
	if !CBPCResetToggle
		return
	endif

	NetImmerse.SetNodeLocalPosition(target as ObjectReference, LPussy2Name, LPussy2Pos, false)
	NetImmerse.SetNodeLocalRotationEuler(target as ObjectReference, LPussy2Name, EmptyPoint, false)
	
	NetImmerse.SetNodeLocalPosition(target as ObjectReference, RPussy2Name, RPussy2Pos, false)
	NetImmerse.SetNodeLocalRotationEuler(target as ObjectReference, RPussy2Name, EmptyPoint, false)
endFunction

function CBPCThighReset(actor target)
	if !CBPCResetToggle
		return
	endif

	NetImmerse.SetNodeLocalPosition(target as ObjectReference, LFrontThighName, FrontThighPos, false)
	NetImmerse.SetNodeLocalRotationEuler(target as ObjectReference, LFrontThighName, EmptyPoint, false)
	
	NetImmerse.SetNodeLocalPosition(target as ObjectReference, RFrontThighName, FrontThighPos, false)
	NetImmerse.SetNodeLocalRotationEuler(target as ObjectReference, RFrontThighName, EmptyPoint, false)
	
	NetImmerse.SetNodeLocalPosition(target as ObjectReference, LRearThighName, RearThighPos, false)
	NetImmerse.SetNodeLocalRotationEuler(target as ObjectReference, LRearThighName, EmptyPoint, false)
	
	NetImmerse.SetNodeLocalPosition(target as ObjectReference, RRearThighName, RearThighPos, false)
	NetImmerse.SetNodeLocalRotationEuler(target as ObjectReference, RRearThighName, EmptyPoint, false)
	
	NetImmerse.SetNodeLocalPosition(target as ObjectReference, LRearCalfName, RearCalfPos, false)
	NetImmerse.SetNodeLocalRotationEuler(target as ObjectReference, LRearCalfName, EmptyPoint, false)
	
	NetImmerse.SetNodeLocalPosition(target as ObjectReference, RRearCalfName, RearCalfPos, false)
	NetImmerse.SetNodeLocalRotationEuler(target as ObjectReference, RRearCalfName, EmptyPoint, false)
endFunction

function ActorListAccess(actor target, bool IsRemovethis = false)
	if IsRemovethis
		MiscUtil.PrintConsole("Added " + target.GetActorBase().GetName() + " in ActorSMPPhysicsList")
		TrackedActorAdd(target)
		;ActorSMPList.AddForm(target)
	else
		MiscUtil.PrintConsole("Removed " + target.GetActorBase().GetName() + " in ActorSMPPhysicsList")
		int index = TrackedActorGetInt(target)
		TrackedActorRemove(index)
		;ActorSMPList.RemoveAddedForm(target)
	endif
endFunction

function ApplyActorList()
	int index = 0
	;int ValidCount = ActorPhysicsList.GetSize()
	int ValidCount = TrackedActors.Length
	
	while index < ValidCount
		;actor target = ActorPhysicsList.GetAt(index) as actor
		actor target = TrackedActors[index] as actor
		MiscUtil.PrintConsole("Switch Physics CBPC to SMP : " + target.GetActorBase().GetName() + "(" + target.GetFormID() + ")")
		CBPCPhysicsAccess(target, true, true)
		index += 1
	endWhile
	
	if CheckLogging == true
		Debug.Notification("Apply Actor SMP Physics List done")
	endif
endFunction

function CancleActorList()
	int index = 0
	;int ValidCount = ActorPhysicsList.GetSize()
	int ValidCount = TrackedActors.Length
	
	while index < ValidCount
		;actor target = ActorPhysicsList.GetAt(index) as actor
		actor target = TrackedActors[index] as actor
		MiscUtil.PrintConsole("Switch Physics SMP to CBPC : " + target.GetActorBase().GetName() + "(" + target.GetFormID() + ")")
		CBPCPhysicsAccess(target, false, true)
		index += 1
	endWhile
endFunction

function CBPCPhysicsAccess(actor target, bool Pstop = false, bool initial = false)
	if !initial
		ActorListAccess(target, Pstop)
	endif
	CBPCBreasts(target, Pstop)
	CBPCButts(target, Pstop)
	CBPCBelly(target, Pstop)
	CBPCVaginaCollision(target, Pstop)
	CBPCVagina(target, Pstop)
	CBPCThigh(target, Pstop)
endFunction

function CBPCBreastsSet(actor target, bool Pstop)
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
		CBPCBreastsReset(target)
	endif
endfunction

function CBPCButtsSet(actor target, bool Pstop)
	if !Pstop
		CBPCPluginScript.StartPhysics(target, "NPC L Butt")
		CBPCPluginScript.StartPhysics(target, "NPC R Butt")
	else
		CBPCPluginScript.StopPhysics(target, "NPC L Butt")
		CBPCPluginScript.StopPhysics(target, "NPC R Butt")
		
		CBPCButtsReset(target)
	endif
endfunction

function CBPCBellySet(actor target, bool Pstop)
	if !Pstop
		CBPCPluginScript.StartPhysics(target, NPCBellyName)
		CBPCPluginScript.StartPhysics(target, HDTBellyName)
	else
		CBPCPluginScript.StopPhysics(target, NPCBellyName)
		CBPCPluginScript.StopPhysics(target, HDTBellyName)
		
		CBPCButtsReset(target)
	endif
endfunction

function CBPCThighSet(actor target, bool Pstop)
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
		
		CBPCThighReset(target)
	endif
endfunction

function CBPCVaginaSet(actor target, bool Pstop)
	if !Pstop
		CBPCPluginScript.StartPhysics(target, "NPC L Pussy01")
		CBPCPluginScript.StartPhysics(target, "NPC R Pussy01")
		CBPCPluginScript.StartPhysics(target, "VaginaB1")
		CBPCPluginScript.StartPhysics(target, "Clitoral1")
	else
		CBPCPluginScript.StopPhysics(target, "NPC L Pussy01")
		CBPCPluginScript.StopPhysics(target, "NPC R Pussy01")
		CBPCPluginScript.StopPhysics(target, "VaginaB1")
		CBPCPluginScript.StopPhysics(target, "Clitoral1")
		CBPCVaginaReset(target)
	endif
endfunction

function CBPCVaginaCollisionSet(actor target, bool Pstop)
	if !Pstop
		CBPCPluginScript.StartPhysics(target, "NPC L Pussy02")
		CBPCPluginScript.StartPhysics(target, "NPC R Pussy02")
		CBPCPluginScript.StartPhysics(target, "NPC Pelvis [Pelv]")
	else
		CBPCPluginScript.StopPhysics(target, "NPC L Pussy02")
		CBPCPluginScript.StopPhysics(target, "NPC R Pussy02")
		CBPCPluginScript.StopPhysics(target, "NPC Pelvis [Pelv]")
		
		CBPCVaginaCollisionReset(target)
	endif
endfunction

function CBPCBreasts(actor target, bool Pstop = false)
if BreastsSMP
	CBPCBreastsSet(target, Pstop)
endif
endFunction

function CBPCButts(actor target, bool Pstop = false)
if ButtsSMP
	CBPCButtsSet(target, Pstop)
endif
endFunction

function CBPCBelly(actor target, bool Pstop = false)
if BellySMP
	CBPCBellySet(target, Pstop)
endif
endFunction

function CBPCThigh(actor target, bool Pstop = false)
if LegsSMP
	CBPCThighSet(target, Pstop)
endif
endFunction

function CBPCVagina(actor target, bool Pstop = false)
if VaginaSMP
	CBPCVaginaSet(target, Pstop)
endif
endFunction

function CBPCVaginaCollision(actor target, bool Pstop = false)
if VaginaCollisionSMP
	CBPCVaginaCollisionSet(target, Pstop)
endif
endFunction


function CBPCBreastsPlayer(actor target, bool Pstop = false)
if BreastsCBPC
	CBPCBreastsSet(target, Pstop)
endif
endFunction

function CBPCButtsPlayer(actor target, bool Pstop = false)
if ButtsCBPC
	CBPCButtsSet(target, Pstop)
endif
endFunction

function CBPCBellyPlayer(actor target, bool Pstop = false)
if BellyCBPC
	CBPCBellySet(target, Pstop)
endif
endFunction

function CBPCThighPlayer(actor target, bool Pstop = false)
if LegsCBPC
	CBPCThighSet(target, Pstop)
endif
endFunction

function CBPCVaginaPlayer(actor target, bool Pstop = false)
if VaginaCBPC
	CBPCVaginaSet(target, Pstop)
endif
endFunction

function CBPCVaginaCollisionPlayer(actor target, bool Pstop = false)
if VaginaCollisionCBPC
	CBPCVaginaCollisionSet(target, Pstop)
endif
endFunction

function SMPPartsApply(actor akactor, Bool BEquip)

;debug.notification(PlayerSMPCup)

if BEquip

	CBPCBreastsPlayer(akactor, true)
	CBPCButtsPlayer(akactor, true)
	CBPCBellyPlayer(akactor, true)
	CBPCVaginaPlayer(akactor, true)
	CBPCVaginaCollisionPlayer(akactor, true)
	CBPCThighPlayer(akactor, true)

if PlayerSMPCup == 0; Acup

	if PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectAcupFull60
	elseif !PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectAcupBellyVBB60
	elseif PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectAcupBellyBBV60
	elseif PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectAcupBBB60
	elseif PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectAcupBBV60

	elseif PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && !PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectAcupBB60
	elseif PlayerBreastsSMP && !PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectAcupBellyB60
	elseif PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectAcupBellyBB60
	elseif !PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectAcupButtsBelly60
	elseif !PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectAcupBellyV60
	elseif !PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectAcupBV60
		
	elseif PlayerBreastsSMP && !PlayerButtsSMP && !PlayerVaginaSMP && !PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectAcupB60
	elseif !PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && !PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectAcupButts60
	elseif !PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectAcupV60
	elseif !PlayerBreastsSMP && !PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectAcupBelly60
	endif
		
elseif PlayerSMPCup == 1; Bcup

	if PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectBcupFull60
	elseif !PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectBcupBellyVBB60
	elseif PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectBcupBellyBBV60
	elseif PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectBcupBBB60
	elseif PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectBcupBBV60

	elseif PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && !PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectBcupBB60
	elseif PlayerBreastsSMP && !PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectBcupBellyB60
	elseif PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectBcupBellyBB60
	elseif !PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectBcupButtsBelly60
	elseif !PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectBcupBellyV60
	elseif !PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectBcupBV60
		
	elseif PlayerBreastsSMP && !PlayerButtsSMP && !PlayerVaginaSMP && !PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectBcupB60
	elseif !PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && !PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectBcupButts60
	elseif !PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectBcupV60
	elseif !PlayerBreastsSMP && !PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectBcupBelly60
	endif

elseif PlayerSMPCup == 2; Ccup

	if PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectCcupFull60
	elseif !PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectCcupBellyVBB60
	elseif PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectCcupBellyBBV60
	elseif PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectCcupBBB60
	elseif PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectCcupBBV60

	elseif PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && !PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectCcupBB60
	elseif PlayerBreastsSMP && !PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectCcupBellyB60
	elseif PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectCcupBellyBB60
	elseif !PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectCcupButtsBelly60
	elseif !PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectCcupBellyV60
	elseif !PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectCcupBV60
		
	elseif PlayerBreastsSMP && !PlayerButtsSMP && !PlayerVaginaSMP && !PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectCcupB60
	elseif !PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && !PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectCcupButts60
	elseif !PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectCcupV60
	elseif !PlayerBreastsSMP && !PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectCcupBelly60
	endif

elseif PlayerSMPCup == 3; Dcup

	if PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectDcupFull60;BaseShapeFull.xml
	elseif !PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectDcupBellyVBB60;BaseShape3A.xml
	elseif PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectDcupBellyBBV60;BaseShape3B.xml
	elseif PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectDcupBBB60;BaseShape3C.xml
	elseif PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectDcupBBV60;BaseShape3D.xml

	elseif PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && !PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectDcupBB60;BaseShape2A.xml
	elseif PlayerBreastsSMP && !PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectDcupBellyB60;BaseShape2B.xml
	elseif PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectDcupBellyBB60;BaseShape2C.xml
	elseif !PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectDcupButtsBelly60;BaseShape2D.xml
	elseif !PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectDcupBellyV60;BaseShape2E.xml
	elseif !PlayerBreastsSMP && PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectDcupBV60;BaseShape2F.xml
		
	elseif PlayerBreastsSMP && !PlayerButtsSMP && !PlayerVaginaSMP && !PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectDcupB60;BaseShape1A.xml
	elseif !PlayerBreastsSMP && PlayerButtsSMP && !PlayerVaginaSMP && !PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectDcupButts60;BaseShape1B.xml
	elseif !PlayerBreastsSMP && !PlayerButtsSMP && PlayerVaginaSMP && !PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectDcupV60;BaseShape1C.xml
	elseif !PlayerBreastsSMP && !PlayerButtsSMP && !PlayerVaginaSMP && PlayerBellySMP
		CurrentSMPArmor = SMP3BONObjectDcupBelly60;BaseShape1D.xml
	endif

endif
	EquipSMPArmor(akactor, true)
else
	EquipSMPArmor(akactor, false)
	
	CBPCBreastsPlayer(akactor, false)
	CBPCButtsPlayer(akactor, false)
	CBPCBellyPlayer(akactor, false)
	CBPCVaginaPlayer(akactor, false)
	CBPCVaginaCollisionPlayer(akactor, false)
	CBPCThighPlayer(akactor, false)
endif

EndFunction


Function EquipSMPArmor(actor akactor, bool equip)
if equip
	akactor.AddItem(CurrentSMPArmor, 1, true)
	akactor.EquipItem(CurrentSMPArmor, true, true)
else
	akactor.UnequipItem(CurrentSMPArmor, false, true)
	akactor.RemoveItem(CurrentSMPArmor, 99, true, none)
endif
EndFunction
