Scriptname _AA_Stage3HazardScript extends ObjectReference  

ObjectReference Property iceMarker auto
ObjectReference Property fireMarker auto
Spell Property fireSpell auto
Int randomChance 
Event OnTriggerEnter(ObjectReference akActionRef)
	if(akActionRef == Game.GetPlayer())
	if(iceMarker.IsDisabled() == FALSE)
		randomChance = Utility.RandomInt(0, 4)
		if(randomChance == 2)
			self.PushActorAway(Game.GetPlayer(), 15)
		endif
	elseif(fireMarker.IsDisabled() == FALSE)
			Game.GetPlayer().AddSpell(fireSpell)
	endif
	endif
EndEvent


Event OnTriggerLeave(ObjectReference akActionRef)
	if(akActionRef == Game.GetPlayer())
		Game.GetPlayer().RemoveSpell(fireSpell)
	endif
EndEvent