Scriptname _AA_Stage2_DetectSwimming extends ObjectReference  

Spell Property acidSpell auto
ObjectReference Property acidWater auto

Actor Property PlayerRef Auto
location property webLocation auto

Event OnLoad()
	RegisterForSingleUpdate(0.5)
EndEvent

Event OnUpdate()
	if(playerRef.isInLocation(webLocation))
		if(PlayerRef.GetPositionZ() < acidWater.GetPositionZ())
			PlayerRef.AddSpell(acidSpell, false)
		else
			PlayerRef.RemoveSpell(acidSpell)
		endif
		RegisterForSingleUpdate(0.5)
	else 
		PlayerRef.RemoveSpell(acidSpell)
		UnregisterForUpdate()
	endif
EndEvent

Event OnCellDetach()
	PlayerRef.RemoveSpell(acidSpell)
	UnregisterForUpdate()
EndEvent