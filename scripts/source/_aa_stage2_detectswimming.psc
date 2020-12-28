Scriptname _AA_Stage2_DetectSwimming extends ObjectReference  

Spell Property acidSpell auto
ObjectReference Property acidWater auto
Event OnLoad()
	RegisterForSingleUpdate(0.5)
EndEvent

Event OnUpdate()

	if(Game.GetPlayer().GetPositionZ() < acidWater.GetPositionZ())
		Game.GetPlayer().AddSpell(acidSpell)
	else
		Game.GetPlayer().RemoveSpell(acidSpell)
	endif

	RegisterForSingleUpdate(0.5)
EndEvent

Event OnCellDetach()
	Game.GetPlayer().RemoveSpell(acidSpell)
	UnregisterForUpdate()
EndEvent