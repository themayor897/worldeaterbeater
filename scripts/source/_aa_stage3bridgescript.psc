Scriptname _AA_Stage3BridgeScript extends ObjectReference  

GlobalVariable Property shoutValue auto
GlobalVariable Property platformValue auto
Actor Property alduin auto
Actor Property playerRef auto
float Property thisPlatform auto
int  randomShout

Event OnTriggerEnter(ObjectReference akActionRef)
  if(akActionRef == playerRef)
    platformValue.setValue(thisPlatform) ;What platform are we on?
    randomShout = Utility.RandomInt(1, 4) ;0 is fire, 1 is ice, 2 is unrelenting force, 3 is shout the platform to pieces.
    shoutValue.setValue(randomShout)
    alduin.EvaluatePackage()
  endif
EndEvent