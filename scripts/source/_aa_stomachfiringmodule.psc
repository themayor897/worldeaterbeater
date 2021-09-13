Scriptname _AA_StomachFiringModule extends ObjectReference  

Spell Property alduinSpell auto
ObjectReference Property firingMarker auto
GlobalVariable Property alduinGlobal auto
int randomTime
float randomX
float randomY
float randomZ
Actor Property playerRef auto
Event OnLoad()
    RegisterForSingleUpdate(2)
EndEvent

Event OnUpdate()
    if firingMarker.is3DLoaded()
        randomTime = Utility.RandomInt(0, 3)
        Utility.Wait(randomTime)
        randomX = Utility.RandomFloat(0, 100)
        randomY = Utility.RandomFloat(0, 100)
        randomZ = Utility. RandomFloat(0, 100)
        firingMarker.MoveTo(playerRef, randomX, randomY, randomZ)
        alduinSpell.Cast(self, firingMarker)
    Endif
    RegisterForSingleUpdate(2)
EndEvent


Event OnUnload()
    UnregisterForUpdate()
EndEvent
