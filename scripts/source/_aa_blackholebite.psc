Scriptname _AA_BlackholeBite extends ActiveMagicEffect  

Activator Property blackHole auto
ObjectReference blackHoleRef

Event OnEffectStart(Actor akTarget, Actor akCaster)
  		blackHoleRef = akTarget.placeAtMe(blackhole, 1)
		blackHoleRef.MoveTo(akTarget, 0, 0, 10)

endEvent