Scriptname _AA_StomachFiringModule extends ObjectReference  

Spell Property alduinSpell auto
ObjectReference Property firingMarker auto
GlobalVariable Property alduinGlobal auto
Actor Property playerRef auto

int randomTime
float randomX
float randomY
float randomZ

Event OnLoad()
	RegisterForSingleUpdate(2)
EndEvent

Event OnUnload()
	UnregisterForUpdate()
EndEvent

Event OnUpdate()
	randomTime = Utility.RandomInt(0, 3)
	Utility.Wait(randomTime)
	randomX = Utility.RandomFloat(0, 100)
	randomY = Utility.RandomFloat(0, 100)
	randomZ = Utility.RandomFloat(0, 100)

	if firingMarker.is3DLoaded()
		firingMarker.MoveTo(playerRef, randomX, randomY, randomZ)
		alduinSpell.Cast(self, firingMarker)
	Endif
	
	RegisterForSingleUpdate(2)

EndEvent