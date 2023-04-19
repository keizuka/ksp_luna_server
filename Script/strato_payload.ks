wait until ship:altitude >= 15000.
wait 8.
stage.
lock steering to heading (90, 60).
wait until ship:apoapsis >= 200000.
stage.
rcs on.
wait until ship:altitude >= apoapsis.
ag2 on.
lock throttle to 1.
wait until ship:periapsis >= 180000.
lock throttle to 0.