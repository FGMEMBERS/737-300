setlistener("/sim/signals/fdm-initialized", func {
    com.init();
});

	var init = func() { 
        setprop("instrumentation/comm/frequencies/selected-mhz",118.3);
		setprop("instrumentation/comm[1]/frequencies/selected-mhz",128.55);
        print("COM ready"); 
    }


var radioControlKhz = func(dir, radio){
	if(radio == 1){
	if(getprop("/b733/instrumentation/pedestal/com1/internal_switch") == -1){
		radioKhzUp(dir,radio);
	} else {
		radioKhzDown(dir,radio);
	}
	setprop("/b733/instrumentation/pedestal/com1/internal_switch", 0);
	} else {
			if(getprop("/b733/instrumentation/pedestal/com2/internal_switch") == -1){
		radioKhzUp(dir,radio);
	} else {
		radioKhzDown(dir,radio);
	}
	setprop("/b733/instrumentation/pedestal/com2/internal_switch", 0);
	}


}

var radioControlMhz = func(dir, radio){
	if(radio == 1){
	if(getprop("/b733/instrumentation/pedestal/com1/internal_switch") == -1){
		radioMhzUp(dir, radio);
	} else {
		radioMhzDown(dir,radio);
	}
	setprop("/b733/instrumentation/pedestal/com1/internal_switch", 0);
	} else {
			if(getprop("/b733/instrumentation/pedestal/com2/internal_switch") == -1){
		radioMhzUp(dir, radio);
	} else {
		radioMhzDown(dir,radio);
	}
	setprop("/b733/instrumentation/pedestal/com2/internal_switch", 0);
	}


}

var radioMhzUp = func(dir, radio){
    for(var i = 0; i < 160; i = i+1){
	radioKhzUp(dir, radio);
	}
}

var radioMhzDown = func(dir, radio){
    for(var i = 0; i < 160; i = i+1){
		radioKhzDown(dir, radio);
	}
}


var radioKhzUp = func(dir, radio){
	if(radio == 1){
	if(dir == "l"){
	var curKhz= getprop("/b733/instrumentation/pedestal/com1/selecFreqLeftKhz");
	var curMhz= getprop("/b733/instrumentation/pedestal/com1/selecFreqLeftMhz");
	} else if(dir == "r"){
	var curKhz= getprop("/b733/instrumentation/pedestal/com1/selecFreqRightKhz");
	var curMhz= getprop("/b733/instrumentation/pedestal/com1/selecFreqRightMhz");
	}
	} else {
		if(dir == "l"){
	var curKhz= getprop("/b733/instrumentation/pedestal/com2/selecFreqLeftKhz");
	var curMhz= getprop("/b733/instrumentation/pedestal/com2/selecFreqLeftMhz");
	} else if(dir == "r"){
	var curKhz= getprop("/b733/instrumentation/pedestal/com2/selecFreqRightKhz");
	var curMhz= getprop("/b733/instrumentation/pedestal/com2/selecFreqRightMhz");
	}
	}
	
    
	if(curMhz < 137){
	if(curKhz == 15 or curKhz == 40 or curKhz == 65 or curKhz == 90){
	    curKhz = curKhz + 10;
		} else if(curKhz == 115 or curKhz == 140 or curKhz == 165 or curKhz == 190){
			curKhz = curKhz + 10;
		} else if(curKhz == 215 or curKhz == 240 or curKhz == 265 or curKhz == 290){
			curKhz = curKhz + 10;
		} else if(curKhz == 315 or curKhz == 340 or curKhz == 365 or curKhz == 390){
			curKhz = curKhz + 10;
		} else if(curKhz == 415 or curKhz == 440 or curKhz == 465 or curKhz == 490){
			curKhz = curKhz + 10;
		} else if(curKhz == 515 or curKhz == 540 or curKhz == 565 or curKhz == 590){
			curKhz = curKhz + 10;
		} else if(curKhz == 615 or curKhz == 640 or curKhz == 665 or curKhz == 690){
			curKhz = curKhz + 10;
		} else if(curKhz == 715 or curKhz == 740 or curKhz == 765 or curKhz == 790){
			curKhz = curKhz + 10;
		} else if(curKhz == 815 or curKhz == 840 or curKhz == 865 or curKhz == 890){
			curKhz = curKhz + 10;
		} else if(curKhz == 915 or curKhz == 940 or curKhz == 965){
			curKhz = curKhz + 10;
		} else if(curKhz == 990){
			curKhz = 0;
			curMhz = curMhz + 1;
		} else {
	   curKhz = curKhz + 5;
	}}

	if(radio == 1){
	if(dir == "l"){
	setprop("/b733/instrumentation/pedestal/com1/selecFreqLeftKhz", curKhz);
	setprop("/b733/instrumentation/pedestal/com1/selecFreqLeftMhz", curMhz);
	setprop("/b733/instrumentation/pedestal/com1/selecFreqLeft", curMhz+(curKhz/1000));
	} else if(dir == "r"){
	setprop("/b733/instrumentation/pedestal/com1/selecFreqRightKhz", curKhz);
	setprop("/b733/instrumentation/pedestal/com1/selecFreqRightMhz", curMhz);
	setprop("/b733/instrumentation/pedestal/com1/selecFreqRight", curMhz+(curKhz/1000));
	}
	} else {
			if(dir == "l"){
	setprop("/b733/instrumentation/pedestal/com2/selecFreqLeftKhz", curKhz);
	setprop("/b733/instrumentation/pedestal/com2/selecFreqLeftMhz", curMhz);
	setprop("/b733/instrumentation/pedestal/com2/selecFreqLeft", curMhz+(curKhz/1000));
	} else if(dir == "r"){
	setprop("/b733/instrumentation/pedestal/com2/selecFreqRightKhz", curKhz);
	setprop("/b733/instrumentation/pedestal/com2/selecFreqRightMhz", curMhz);
	setprop("/b733/instrumentation/pedestal/com2/selecFreqRight", curMhz+(curKhz/1000));
	}
	}
	
}

var radioKhzDown = func(dir, radio){
	if(radio ==1){
	if(dir == "l"){
		var curKhz = getprop("/b733/instrumentation/pedestal/com1/selecFreqLeftKhz");
		var curMhz = getprop("/b733/instrumentation/pedestal/com1/selecFreqLeftMhz");
	} else if(dir == "r"){
		var curKhz = getprop("/b733/instrumentation/pedestal/com1/selecFreqRightKhz");
		var curMhz = getprop("/b733/instrumentation/pedestal/com1/selecFreqRightMhz");
	}
	} else {
		if(dir == "l"){
		var curKhz = getprop("/b733/instrumentation/pedestal/com2/selecFreqLeftKhz");
		var curMhz = getprop("/b733/instrumentation/pedestal/com2/selecFreqLeftMhz");
	} else if(dir == "r"){
		var curKhz = getprop("/b733/instrumentation/pedestal/com2/selecFreqRightKhz");
		var curMhz = getprop("/b733/instrumentation/pedestal/com2/selecFreqRightMhz");
	}
	}

	
	var limit = 0;
	if(curMhz == 117 and curKhz == 975){
		limit = 1;
	} else {
		limit = 0;
	}

	if(!limit){
	if(curKhz == 25 or curKhz == 50 or curKhz == 75){
	    curKhz = curKhz - 10;
	} else if(curKhz == 125 or curKhz == 150 or curKhz == 175 or curKhz == 100){
	    curKhz = curKhz - 10;
	} else if(curKhz == 225 or curKhz == 250 or curKhz == 275 or curKhz == 200){
	    curKhz = curKhz - 10;
	} else if(curKhz == 325 or curKhz == 350 or curKhz == 375 or curKhz == 300){
	    curKhz = curKhz - 10;
	} else if(curKhz == 425 or curKhz == 450 or curKhz == 475 or curKhz == 400){
	    curKhz = curKhz - 10;
	} else if(curKhz == 525 or curKhz == 550 or curKhz == 575 or curKhz == 500){
	    curKhz = curKhz - 10;
	} else if(curKhz == 625 or curKhz == 650 or curKhz == 675 or curKhz == 600){
	    curKhz = curKhz - 10;
	} else if(curKhz == 725 or curKhz == 750 or curKhz == 775 or curKhz == 700){
	    curKhz = curKhz - 10;
	} else if(curKhz == 825 or curKhz == 850 or curKhz == 875 or curKhz == 800){
	    curKhz = curKhz - 10;
	} else if(curKhz == 925 or curKhz == 950 or curKhz == 975 or curKhz == 900){
	    curKhz = curKhz - 10;
	} else if(curKhz == 0){
		curKhz = 990;
		curMhz = curMhz - 1;
	} else {
		curKhz = curKhz - 5;
	}}
	

	if(radio == 1){
	if(dir == "l"){
		setprop("/b733/instrumentation/pedestal/com1/selecFreqLeftKhz", curKhz);
		setprop("/b733/instrumentation/pedestal/com1/selecFreqLeftMhz", curMhz);
		setprop("/b733/instrumentation/pedestal/com1/selecFreqLeft", curMhz+(curKhz/1000));
	} else if(dir == "r"){
		setprop("/b733/instrumentation/pedestal/com1/selecFreqRightKhz", curKhz);
		setprop("/b733/instrumentation/pedestal/com1/selecFreqRightMhz", curMhz);
		setprop("/b733/instrumentation/pedestal/com1/selecFreqRight", curMhz+(curKhz/1000));
	}
	} else {
			if(dir == "l"){
		setprop("/b733/instrumentation/pedestal/com2/selecFreqLeftKhz", curKhz);
		setprop("/b733/instrumentation/pedestal/com2/selecFreqLeftMhz", curMhz);
		setprop("/b733/instrumentation/pedestal/com2/selecFreqLeft", curMhz+(curKhz/1000));
	} else if(dir == "r"){
		setprop("/b733/instrumentation/pedestal/com2/selecFreqRightKhz", curKhz);
		setprop("/b733/instrumentation/pedestal/com2/selecFreqRightMhz", curMhz);
		setprop("/b733/instrumentation/pedestal/com2/selecFreqRight", curMhz+(curKhz/1000));
	}
	}

}

var changeActive = func(radio){
	if(radio == 1){
		pos = getprop("/b733/instrumentation/pedestal/com1/switch");
		if(pos == 1){
		setprop("instrumentation/comm/frequencies/selected-mhz", getprop("/b733/instrumentation/pedestal/com1/selecFreqRight"));
		} else if(pos == 0){
		setprop("instrumentation/comm/frequencies/selected-mhz", getprop("/b733/instrumentation/pedestal/com1/selecFreqLeft"));
		}
	} else {
		pos = getprop("/b733/instrumentation/pedestal/com2/switch");
		if(pos == 1){
		setprop("instrumentation/comm[1]/frequencies/selected-mhz", getprop("/b733/instrumentation/pedestal/com2/selecFreqRight"));
		} else if(pos == 0){
		setprop("instrumentation/comm[1]/frequencies/selected-mhz", getprop("/b733/instrumentation/pedestal/com2/selecFreqLeft"));
		}
	}
}
