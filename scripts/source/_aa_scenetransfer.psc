Scriptname _AA_SceneTransfer extends ReferenceAlias  
{Transfer To Stage 2}

Actor Property dragonborn1 auto
Actor Property dragonborn2 auto
Actor Property dragonborn3 auto
Actor Property Alduin auto
GlobalVariable property AlduinVariable auto
ImageSpaceModifier Property blackScreen auto
Sound Property eatingSound auto
Package Property AlduinPackage1 auto
Package Property AlduinPackage2 auto
Package Property AlduinPackage3 auto
ObjectReference Property wombEntrance auto
ObjectReference Property wombThrow auto
bool DoOnce = False
MusicType Property myType auto

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if(Alduin.GetActorValue("health") < 15000 &&  !DoOnce)
		DoOnce = true;
		;Disable player's controls and make them invicible
		Game.DisablePlayerControls()
		Game.GetPlayer().SetGhost(True)
		Alduin.DispelAllSpells()
		AlduinVariable.SetValue(1)
		Alduin.EvaluatePackage()

	endif

EndEvent


Event OnPackageEnd(Package akOldPackage)

		if(akOldPackage == AlduinPackage1)

			Game.GetPlayer().PushActorAway(dragonborn1, 30)
			Game.GetPlayer().PushActorAway(dragonborn2, 30)
			Game.GetPlayer().PushActorAway(dragonborn3, 30)
			AlduinVariable.SetValue(2)
			Alduin.EvaluatePackage()
		
		elseif(akOldPackage == AlduinPackage2)
			AlduinVariable.SetValue(3)
			Alduin.EvaluatePackage()
			dragonborn1.DisableNoWait(true)
			dragonborn2.DisableNoWait(true)
			dragonborn3.DisableNoWait(true)
		elseif(akOldPackage == AlduinPackage3)
		;Increase his size
			AlduinVariable.SetValue(4)
			blackScreen.Apply()
			Utility.Wait(10)
			eatingSound.Play(Game.GetPlayer())
			myType.Remove()
			Utility.Wait(3)
			Game.GetPlayer().MoveTo(wombEntrance)
			Utility.Wait(1)
			wombThrow.PushActorAway(Game.GetPlayer(), 30)
			blackScreen.Remove()
		endif
endEvent