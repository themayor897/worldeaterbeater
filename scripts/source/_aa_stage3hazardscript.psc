Scriptname _AA_Stage3HazardScript extends ObjectReference  

ObjectReference Property iceMarker auto
ObjectReference Property fireMarker auto
Spell Property fireSpell auto
Int randomChance 
Actor Property PlayerRef Auto

Event OnTriggerEnter(ObjectReference akActionRef)
	if(akActionRef == PlayerRef)
	if(iceMarker.IsDisabled() == FALSE)
		randomChance = Utility.RandomInt(0, 4)
		if(randomChance == 2)
			self.PushActorAway(PlayerRef, 15)
		endif
	elseif(fireMarker.IsDisabled() == FALSE)
			PlayerRef.AddSpell(fireSpell)
	endif
	endif
EndEvent


Event OnTriggerLeave(ObjectReference akActionRef)
	if(akActionRef == PlayerRef)
		PlayerRef.RemoveSpell(fireSpell)
	endif
EndEvent