Scriptname _AA_Stage4TimerScript extends ObjectReference  

ObjectReference Property playerMarker auto
Actor Property dragonborn1 auto
Actor Property dragonborn2 auto
Actor Property dragonborn3 auto
ObjectReference Property debrisMarker auto
ObjectReference Property landingMarker auto
Actor Property alduin auto
GlobalVariable Property alduinHealth auto
GlobalVariable Property alduinState auto
Perk Property YoureFucked auto
float alduinsHealth

MusicType Property music1 auto
MusicType Property music2 auto

Event OnLoad()
	RegisterForSingleUpdate(164)
EndEvent

Event OnUpdate()
	;Debug.MessageBox("Stage done!")
	alduinsHealth = (15000 - (alduinHealth.GetValue() * 400))
	if(alduinsHealth < 2000)
		alduinsHealth = 2000
	endif
	music1.Remove()
	Game.GetPlayer().MoveTo(playerMarker)
	debrisMarker.EnableNoWait()
	alduin.SetScale(1)
	alduin.SetAllowFlying(false)
	alduin.SetDontMove(false)
	alduinState.SetValue(100)
	Alduin.AddPerk(YoureFucked)
	alduin.setActorValue("Health", alduinsHealth)
	;alduin.MoveTo(landingMarker)
	dragonborn1.EnableNoWait()
	dragonborn2.EnableNoWait()
	dragonborn3.EnableNoWait()
			
	Alduin.DisableNoWait()
	Utility.Wait(4)
	Alduin.EnableNoWait()
	Utility.Wait(3)
	music2.Add()

	
EndEvent