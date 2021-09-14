
scriptName _aa_stomachfiringmodule extends ObjectReference


spell property alduinSpell auto
globalvariable property alduinGlobal auto
actor property playerRef auto
ObjectReference property firingMarker auto

Float randomX
Float randomY
Int randomTime
Float randomZ



function OnLoad()

    self.RegisterForSingleUpdate(2 as Float)
endFunction

function OnUnload()

    self.UnregisterForUpdate()
endFunction


function OnUpdate()

    
    randomTime = utility.RandomInt(0, 3)
    utility.Wait(randomTime as Float)
    randomX = utility.RandomFloat(0 as Float, 100 as Float)
    randomY = utility.RandomFloat(0 as Float, 100 as Float)
    randomZ = utility.RandomFloat(0 as Float, 100 as Float)
    if firingMarker.is3DLoaded()
        firingMarker.MoveTo(playerRef as ObjectReference, randomX, randomY, randomZ, true)
        alduinSpell.Cast(self as ObjectReference, firingMarker)
    endIf
    self.RegisterForSingleUpdate(2 as Float)
endFunction
