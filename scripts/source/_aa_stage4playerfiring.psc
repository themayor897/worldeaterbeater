Scriptname _AA_Stage4PlayerFiring extends ObjectReference  


Spell Property fireball auto
ObjectReference Property target auto

Event OnLoad()
	RegisterForSingleUpdate(Utility.RandomInt(4, 7))
EndEvent

Event OnUpdate()
	fireball.Cast(self, target)
	RegisterForSingleUpdate(Utility.RandomInt(4, 7))
EndEvent

Event OnUnload()
	UnregisterForUpdate()
EndEvent