Scriptname _AA_BlackholeScript extends ObjectReference  

Spell Property explosiveSpell auto

Event OnLoad()
	Utility.Wait(5)
	explosiveSpell.cast(self, self)
	self.DisableNoWait()
	self.DeleteWhenAble()
EndEvent