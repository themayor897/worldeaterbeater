Scriptname _AA_Stage3HazardScript extends ObjectReference  

ObjectReference Property iceMarker auto
ObjectReference Property fireMarker auto
Spell Property fireSpell auto
Int randomChance 
Actor Property PlayerRef Auto
Int InTrigger = 0
Location property webLocation auto
Event OnTriggerEnter(ObjectReference akActionRef)
    if(akActionRef == PlayerRef)
    if(iceMarker.IsDisabled() == FALSE)
        randomChance = Utility.RandomInt(0, 4)
        if(randomChance == 2 && playerRef.isInLocation(webLocation)&& inTrigger==0)
                    InTrigger += 1
                    self.PushActorAway(PlayerRef, 15)
        endif
    elseif(fireMarker.IsDisabled() == FALSE)
        if(playerRef.isInLocation(webLocation)&& inTrigger==0)
            InTrigger += 1
            PlayerRef.AddSpell(fireSpell)
        endif
    endif
    endif
EndEvent


Event OnTriggerLeave(ObjectReference akActionRef)
    if(akActionRef == PlayerRef && InTrigger > 0)
                    InTrigger -= 1
        PlayerRef.RemoveSpell(fireSpell)
    endif
EndEvent