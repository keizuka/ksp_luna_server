global abortSystem is list().
global abortCrew is list().
global capsuleDecoupleur is list().
global antenna is list().
global stage1Decoupleur is list().
global stage2Decoupleur is list().
global LR is list().
global LV is list().
global atlasEng is list().

for part in ship:parts {
    if part:tag = "tourSauvetage" {abortCrew:add(part).}
    if part:tag = "tourSauvetage" {abortSystem:add(part).}
    if part:tag = "noseCone" {abortSystem:add(part).}
    if part:tag = "capsuleDecoupleur" {abortCrew:add(part).}
    if part:tag = "capsuleDecoupleur" {capsuleDecoupleur:add(part).}
    if part:tag = "antenna" {antenna:add(part).}
    if part:tag = "stage1Decoupleur" {stage1Decoupleur:add(part).}
    if part:tag = "stage2Decoupleur" {stage2Decoupleur:add(part).}
    if part:tag = "LR" {stage2Decoupleur:add(part).}
    if part:tag = "LR" {LR:add(part).}
    if part:tag = "LV" {LV:add(part).}
    if part:tag = "atlasEng" {atlasEng:add(part).}
}

global function ejectAbort{
    for part in abortSystem {
        part:getModule("ModuleDecouple"):doEvent("découpler").
        part:getModule("ModuleEngineFX"):doEvent("activer propulseur").
    }
}

global function crewAbort{
    for part in abortCrew {
        part:getModule("ModuleEngineFX"):doEvent("activer propulseur").
        part:getModule("ModuleDecouple"):doEvent("Découpler").
    }
}

global function stage1Séparation{
    for part in stage1Decoupleur{
        part:getModule("ModuleDecouple"):doEvent("Découpler").
        part:getModule("ModuleEnginesFX"):doEvent("activer propulseur").
    }
    
}

global function stage2Séparation{
    for part in stage2Decoupleur{
        part:getModule("ModuleDecouple"):doEvent("Découpler").
        part:getModule("ModuleEnginesFX"):doEvent("activer propulseur").
    }
}

global function launch {
    for part in atlasEng{
        part:getModule("ModuleEnginesFX"):doEvent("activer propulseur").
    }
    lock steering to heading(90, 90).
    lock throttle to 1.
    
}

global function  gravityturn {
    when ship:altitude > 1000 and airspeed > 150
    then lock steering to heading (90, 75).
    wait until ship:apoapsis > 10000.
    lock steering to srfPrograde.
    
}

global function circu {
   
    lock throttle to 0.
    stage1Séparation(). 
    wait until ship:altitude >= ship:apoapsis.
    lock throttle to 1.
    wait until ship:periapsis >= 75000.
    lock throttle to 0.
    }