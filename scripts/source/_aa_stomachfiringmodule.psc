Scriptname _AA_StomachFiringModule extends ObjectReference  

Spell Property alduinSpell auto
ObjectReference Property firingMarker auto
GlobalVariable Property alduinGlobal auto
int randomTime
float randomX
float randomY
float randomZ

Event OnLoad()
	RegisterForSingleUpdate(2)
EndEvent

Event OnUpdate()
	randomTime = Utility.RandomInt(0, 3)
	Utility.Wait(randomTime)
	randomX = Utility.RandomFloat(0, 100)
	randomY = Utility.RandomFloat(0, 100)
	randomZ = Utility. RandomFloat(0, 100)
	firingMarker.MoveTo(Game.GetPlayer(), randomX, randomY, randomZ)
	alduinSpell.Cast(self, firingMarker)
	RegisterForSingleUpdate(2)
EndEvent