Scriptname _AA_BossfightMusicScript extends ReferenceAlias  

MusicType Property bossMusic auto
bool doOnce = False
Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if(doOnce == False)
		bossMusic.Add()
		doOnce = True
	endif
EndEvent