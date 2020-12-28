Scriptname _AA_Stage4FiringScript extends ObjectReference  

ObjectReference Property target auto
Spell Property fireball auto

Event OnLoad()
	RegisterForSingleUpdate(Utility.RandomInt(1, 3))
EndEvent

Event OnUpdate()
	fireball.Cast(self, target)
	RegisterForSingleUpdate(Utility.RandomInt(1, 3))
EndEvent

Event OnUnload()
	UnregisterForUpdate()
EndEvent