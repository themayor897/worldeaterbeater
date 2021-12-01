;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname _WEB_BattleUtilityQuest Extends Quest Hidden

;BEGIN ALIAS PROPERTY Alduin
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alduin Auto
;END ALIAS PROPERTY

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

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player has entered the bottom of Alduin's stomach while falling.

PlayerRef.SetGhost(false)
acid.TranslateToRef(acidMarker, 30)
acidTrigger.TranslateToRef(acidMarker, 75)
shooter1.EnableNoWait()
walls.DisableNoWait()
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

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Player on Alduin's back

Utility.Wait(164)
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

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Transition to stage 5 (alduins back to sovngarde)

alduinsHealth = (15000 - (alduinHealth.GetValue() * 400))
if(alduinsHealth < 2000)
	alduinsHealth = 2000
endif
;music1.Remove()
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
;music2.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Increase his size

AlduinScale.SetValue(4)
blackScreen.Apply()
Utility.Wait(10)
eatingSound.Play(playerRef)
Music15.Remove()
Utility.Wait(3)
playerRef.MoveTo(wombEntrance)
Utility.Wait(1)
wombThrow.PushActorAway(playerRef, 30)
blackScreen.Remove()
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
MusicType Property Music15 auto
MusicType Property music2 auto
MusicType Property music3 auto
MusicType Property music4 auto

;Stage 1: Sovngarde Start
ImageSpaceModifier Property blackScreen auto
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


;Stage 4: Riding on his back


;Stage 5: Back in Sovngarde
ObjectReference Property playerMarker auto
ObjectReference Property debrisMarker auto
ObjectReference Property landingMarker auto
Perk Property YoureFucked auto
float alduinsHealth
