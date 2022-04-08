Scriptname _AA_Stage2_DetectSwimming extends ObjectReference  

Spell Property acidSpell auto
ObjectReference Property acidWater auto

Actor Property PlayerRef Auto
location property webLocation auto
Event OnLoad()
    RegisterForSingleUpdate(0.5)
EndEvent

Event OnUpdate()

    if(PlayerRef.GetPositionZ() < acidWater.GetPositionZ())
        PlayerRef.AddSpell(acidSpell, false)
    else
        PlayerRef.RemoveSpell(acidSpell)
    endif
    if(playerRef.isInLocation(webLocation))
    RegisterForSingleUpdate(0.5)
else 
     PlayerRef.RemoveSpell(acidSpell)
endif
EndEvent

Event OnCellDetach()
    PlayerRef.RemoveSpell(acidSpell)
    UnregisterForUpdate()
EndEvent