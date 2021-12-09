Scriptname _AA_Stage4FiringScript extends ObjectReference  

ObjectReference Property target auto
Spell Property fireball auto

int Property Var1 Auto
int Property Var2 Auto

Event OnCellAttach()
	RegisterForSingleUpdate(Utility.RandomInt(Var1, Var2))
EndEvent

Event OnUpdate()
	if self.is3DLoaded() && !self.IsDisabled()
		fireball.Cast(self, target)
	endif 
	RegisterForSingleUpdate(Utility.RandomInt(Var1, Var2))
EndEvent

Event OnCellDetach()
	UnregisterforUpdate()
EndEvent