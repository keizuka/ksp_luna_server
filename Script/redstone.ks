sas off.
rcs off.
wait 3.
lock steering to heading (90, 90).
lock throttle to 1.
stage.
wait 3.
stage.
wait until ship:apoapsis >= 1500.
lock steering to heading (90, 75).
wait until ship:apoapsis >= 100000.
lock throttle to 0.
ag1 on.
wait until ship:altitude >= apoapsis.
stage.
ag2 on.
rcs on.
lock steering to retrograde.
wait until ship:airspeed < 380.
stage.