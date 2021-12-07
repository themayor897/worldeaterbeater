Scriptname _AA_Stage2_DetectSwimming extends ObjectReference  

Spell Property acidSpell auto
ObjectReference Property acidWater auto

Actor Property PlayerRef Auto

Event OnLoad()
	RegisterForSingleUpdate(0.5)
EndEvent

Event OnUpdate()

	if(PlayerRef.GetPositionZ() < acidWater.GetPositionZ())
		PlayerRef.AddSpell(acidSpell, false)
	else
		PlayerRef.RemoveSpell(acidSpell)
	endif

	RegisterForSingleUpdate(0.5)
EndEvent

Event OnCellDetach()
	PlayerRef.RemoveSpell(acidSpell)
	UnregisterForUpdate()
EndEvent