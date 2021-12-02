Scriptname _AA_Stage2_AcidHurt extends ObjectReference  

Spell Property fireSpell auto
ObjectReference Property acid auto
ObjectReference Property acidMarker1 auto
ObjectReference Property acidMarker2 auto
Actor Property PlayerRef Auto
int upState = 0;

Event OnTranslationComplete()
	if(upState == 0)
		Utility.Wait(1)
		acid.translateToRef(acidMarker2, 30)
		upState = 1
	else
		Utility.Wait(1)
		acid.translateToRef(acidMarker1, 30)
		upState = 0
	endif
 
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
	if(akActionRef == Game.GetPlayer())
		PlayerRef.AddSpell(fireSpell, false)
	endif
EndEvent


Event OnTriggerLeave(ObjectReference akActionRef)
	if(akActionRef == Game.GetPlayer())
		PlayerRef.RemoveSpell(fireSpell)
	endif
EndEvent