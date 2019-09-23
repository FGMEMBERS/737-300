controls.gearDown = func(v) {
    if (v < 0) {
         if(!getprop("gear/gear[0]/wow")) setprop("controls/gear/gear-down", 0);
    } elsif (v > 0) {
        setprop("/controls/gear/gear-down", 1);
    }
}