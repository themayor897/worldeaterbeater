Scriptname _WEB_AlduinMonitor extends ReferenceAlias  

Actor Property Alduin Auto
bool doOnce01 = False
bool doOnce02 = False

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if(doOnce01 == False)
		Alduin.SetActorValue("Health", 20000)
		GetOwningQuest().SetStage(10)
		doOnce01 = True
	endif
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
    if(Alduin.GetActorValue("health") < 18000 && !DoOnce02)
        DoOnce02 = true;
        GetOwningQuest().SetStage(11)
    endif
EndEvent
	
Event OnDeath(Actor akKiller)
	GetOwningQuest().SetStage(50)
EndEvent