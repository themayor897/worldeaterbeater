Scriptname _WEB_AlduinMonitor extends ReferenceAlias  

Quest Property WEBUtility Auto
Actor Property Alduin Auto
bool doOnce01 = False
bool doOnce02 = False

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if(doOnce01 == False)
		WEBUtility.SetStage(10)
		doOnce01 = True
	endif
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
    if(Alduin.GetActorValue("health") < 15000 &&  !DoOnce02)
        DoOnce02 = true;
        WEBUtility.SetStage(11)
    endif
EndEvent