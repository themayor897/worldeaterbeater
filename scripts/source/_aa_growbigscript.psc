Scriptname _AA_GrowBigScript extends ActiveMagicEffect  

Actor Property PlayerRef Auto
Actor Property alduin auto
Sound Property growSound auto
Spell Property explosionSpell auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
  alduin.setScale(alduin.getScale() + 0.1)
  Utility.Wait(0.1)
  alduin.setScale(alduin.getScale() + 0.1)
  Utility.Wait(0.1)
  alduin.setScale(alduin.getScale() + 0.1)
  Utility.Wait(0.1)
  alduin.setScale(alduin.getScale() + 0.1)
  Utility.Wait(0.1)
  alduin.setScale(alduin.getScale() + 0.1)
  Utility.Wait(0.1)
  alduin.setScale(alduin.getScale() + 0.1)
  Utility.Wait(0.1)
  alduin.setScale(alduin.getScale() + 0.1)
  Utility.Wait(0.1)
  alduin.setScale(alduin.getScale() + 0.1)
	Game.ShakeCamera(PlayerRef, 0.5, 2)
	growSound.Play(PlayerRef)
	explosionSpell.cast(Alduin, Alduin)
endEvent