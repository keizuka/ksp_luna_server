chargerFichier("1:/", "system.ks").

wait 3.

print("Engine start up").

wait 3.

launch().
wait until airspeed > 10.
print("Lift off").

gravityturn().

wait until ship:apoapsis > 10000.
print("Gratity turn").

wait until ship:altitude >= 80000.
print("Eject abort systeme").
ejectAbort().

circu().
print("Orbital circularisation").