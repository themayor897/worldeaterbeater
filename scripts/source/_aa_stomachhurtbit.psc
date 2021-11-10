Scriptname _AA_StomachHurtBit extends ObjectReference  

GlobalVariable Property alduinHealth auto
ObjectReference Property alduinHurtBit1 auto
ObjectReference Property alduinHurtBit2 auto
ObjectReference Property alduinHurtBit3 auto
ObjectReference Property alduinMouth auto
ObjectReference Property outside auto
MusicType Property thisMusic auto
MusicType Property thisMusic2 auto
MusicType Property thisMusic3 auto
Sound Property dragonMadSound auto
int random
bool doOnce = False
actor property playerRef auto
Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack,bool abBashAttack, bool abHitBlocked)
    if(akAggressor == playerRef)
    if(doOnce == False)
    alduinHealth.setValue(alduinHealth.getValue() + 1)
    ;Play a roar sound?
    doOnce = True
    if(alduinHealth.getValue() == 5)
        thisMusic.Remove()
        ;thisMusic.Remove()
        ;thisMusic.Remove()
        ;thisMusic.Remove()
        ;thisMusic3.Add()
        Utility.Wait(5)
        Game.ShakeCamera(playerRef, 1, 1)
        dragonMadSound.Play(playerRef)
        playerRef.TranslateToRef(alduinMouth, 500)
        Utility.Wait(5)
        playerRef.StopTranslation()
        playerRef.MoveTo(outside)
        Utility.Wait(3)
        thisMusic2.Add()
    endif
    random = Utility.RandomInt(0, 2)
    self.DisableNoWait(true)
    if(random == 0)
        alduinHurtBit1.EnableNoWait(true); 
        alduinHurtBit2.DisableNoWait(true);
        alduinHurtBit3.DisableNoWait(true);


    elseif(random == 1)
        alduinHurtBit2.EnableNoWait(true); 
        alduinHurtBit1.DisableNoWait(true);
        alduinHurtBit3.DisableNoWait(true);


    elseif(random == 2)
        alduinHurtBit3.EnableNoWait(true); 
        alduinHurtBit2.DisableNoWait(true);
        alduinHurtBit1.DisableNoWait(true);
    endif
    dragonMadSound.Play(playerRef)
    Utility.Wait(6)
    doOnce = False
    endif
    endif
EndEvent

