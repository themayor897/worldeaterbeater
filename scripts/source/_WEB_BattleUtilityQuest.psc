;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 19
Scriptname _WEB_BattleUtilityQuest Extends Quest Hidden

;BEGIN ALIAS PROPERTY Alduin
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alduin Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
playerRef.PushActorAway(FelldirRefNEW, 30)
playerRef.PushActorAway(GormlaithRefNEW, 30)
playerRef.PushActorAway(HakonRefNew, 30)
AlduinScale.SetValue(2)
Alduin.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player has entered the bottom of Alduin's stomach while falling.

acid.TranslateToRef(acidMarker, 30)
acidTrigger.TranslateToRef(acidMarker, 75)
shooter1.EnableNoWait()
walls.DisableNoWait()
Utility.Wait(3)
PlayerRef.SetGhost(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Increase his size

AlduinScale.SetValue(4)
FadeToBlackImod.Apply()
utility.wait(2)
FadeToBlackImod.PopTo(FadeToBlackHoldImod)
Utility.Wait(4)
eatingSound.Play(playerRef)
Music15.Remove()
Utility.Wait(3)
playerRef.MoveTo(wombEntrance)
Utility.Wait(1)
wombThrow.PushActorAway(playerRef, 30)
FadeToBlackHoldImod.PopTo(FadeToBlackBackImod)
FadeToBlackHoldImod.Remove()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
Shooter1.UnregisterForUpdate()
Shooter2.UnregisterForUpdate()
Shooter3.UnregisterForUpdate()
Shooter1.disable()
Shooter2.disable()
Shooter3.disable()
Utility.Wait(5)
Game.ShakeCamera(playerRef, 1, 1)
dragonMadSound.Play(playerRef)
playerRef.TranslateToRef(alduinMouth, 500)
Utility.Wait(5)
playerRef.StopTranslation()
playerRef.MoveTo(outside)
Utility.Wait(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Transition to stage 5 (alduins back to sovngarde)

alduinsHealth = (15000 - (alduinHealth.GetValue() * 400))
if(alduinsHealth < 2000)
	alduinsHealth = 2000
endif
PlayerRef.MoveTo(playerMarker)
debrisMarker.EnableNoWait()
alduin.SetScale(1)
alduin.SetAllowFlying(false)
alduin.SetDontMove(false)
AlduinScale.SetValue(100)
Alduin.AddPerk(YoureFucked)
alduin.setActorValue("Health", alduinsHealth)
;alduin.MoveTo(landingMarker)
FelldirRefNEW.EnableNoWait()
GormlaithRefNEW.EnableNoWait()
HakonRefNew.EnableNoWait()
			
Alduin.DisableNoWait()
Utility.Wait(4)
Alduin.EnableNoWait()
Utility.Wait(3)
music15.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Start of Alduin battle

Music15.add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Disable player's controls and make them invicible
Game.DisablePlayerControls()
playerRef.SetGhost(True)
Alduin.DispelAllSpells()
AlduinScale.SetValue(1)
Alduin.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Player on Alduin's back

Utility.Wait(99)
Int iIndex = S4Firer.GetSize()
	While iIndex
		iIndex -= 1
		ObjectReference kReference = S4Firer.GetAt(iIndex) As ObjectReference
		If kReference.IsEnabled()
			kReference.Disable()
		EndIf
	EndWhile
SetStage(41)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
AlduinScale.SetValue(3)
Alduin.EvaluatePackage()
FelldirRefNEW.DisableNoWait(true)
GormlaithRefNEW.DisableNoWait(true)
HakonRefNew.DisableNoWait(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
playerRef.TranslateToRef(BigAlduin, 700)
Game.ShakeCamera(playerRef, 1, 6)
Utility.Wait(4)
playerRef.StopTranslation()
playerRef.RemoveSpell(unShout)
playerRef.MoveTo(alduinBack)
Utility.Wait(3)
SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

;Global Properties
Actor Property PlayerRef Auto
Actor Property Alduin Auto
Actor Property FelldirRefNEW Auto
Actor Property GormlaithRefNEW Auto
Actor Property HakonRefNew Auto
GlobalVariable Property AlduinScale Auto
GlobalVariable Property alduinHealth auto

;Music
MusicType Property Music15 auto ;Stages 1 and 5
MusicType Property music2 auto ;Stage 2
MusicType Property music3 auto ;Stage 3
MusicType Property music4 auto ;Stage 4

;Stage 1: Sovngarde Start
ImageSpaceModifier Property FadeToBlackImod  Auto  
ImageSpaceModifier Property FadeToBlackHoldImod  Auto  
ImageSpaceModifier Property FadeToBlackBackImod  Auto  
Sound Property eatingSound auto
Package Property AlduinPackage1 auto
Package Property AlduinPackage2 auto
Package Property AlduinPackage3 auto
ObjectReference Property wombEntrance auto
ObjectReference Property wombThrow auto

;Stage 2: Stomach
ObjectReference Property acid auto
ObjectReference Property acidTrigger auto
ObjectReference Property acidMarker auto
ObjectReference Property shooter1 auto
ObjectReference Property shooter2 auto
ObjectReference Property shooter3 auto
ObjectReference Property walls auto
ObjectReference Property outside auto
ObjectReference Property alduinMouth auto
Sound Property dragonMadSound auto


;Stage 3: Destroyed Sovngarde
spell Property unShout auto
ObjectReference Property alduinBack auto
Actor Property BigAlduin auto

;Stage 4: Riding on his back


;Stage 5: Back in Sovngarde
ObjectReference Property playerMarker auto
ObjectReference Property debrisMarker auto
ObjectReference Property landingMarker auto
Perk Property YoureFucked auto
float alduinsHealth

FormList Property S4Firer  Auto  
