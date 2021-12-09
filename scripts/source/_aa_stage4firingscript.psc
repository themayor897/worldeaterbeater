Scriptname _AA_Stage4FiringScript extends ObjectReference  

ObjectReference Property target auto
Spell Property fireball auto
Event OnLoad()
	RegisterForSingleUpdate(Utility.RandomInt(1, 3))
EndEvent

Event OnUpdate()
	if self.is3DLoaded()
		fireball.Cast(self, target)
	endif 
	RegisterForSingleUpdate(Utility.RandomInt(1, 3))
EndEvent

Event OnUnload()
	UnregisterForUpdate()
EndEvent

Event OnCellDetach()
	UnregisterForUpdate()
EndEvent