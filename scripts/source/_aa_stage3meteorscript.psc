Scriptname _AA_Stage3MeteorScript extends ObjectReference  

GlobalVariable Property shoutValue auto
Actor Property alduin auto
Actor Property playerRef auto

Event OnTriggerEnter(ObjectReference akActionRef)
  if(shoutValue.GetValue() != 0)
  if(akActionRef == playerRef)
    shoutValue.setValue(5)
    alduin.EvaluatePackage()
  endif
  endif
EndEvent