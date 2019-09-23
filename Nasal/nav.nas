var transferNav = func(nav){
	if(nav == 1){
	left = getprop("/b733/instrumentation/pedestal/nav1/selecFreqLeft");
	right = getprop("/b733/instrumentation/pedestal/nav1/selecFreqRight");
	setprop("/b733/instrumentation/pedestal/nav1/selecFreqLeft", right);
	setprop("/b733/instrumentation/pedestal/nav1/selecFreqRight", left);
	} else {
		left = getprop("/b733/instrumentation/pedestal/nav2/selecFreqLeft");
		right = getprop("/b733/instrumentation/pedestal/nav2/selecFreqRight");
		setprop("/b733/instrumentation/pedestal/nav2/selecFreqLeft", right);
		setprop("/b733/instrumentation/pedestal/nav2/selecFreqRight", left);
	}
}

var update = func(){
	left1 = getprop("/b733/instrumentation/pedestal/nav1/selecFreqLeft");
	left2 = getprop("/b733/instrumentation/pedestal/nav2/selecFreqLeft");
	setprop("/instrumentation/nav/frequencies/selected-mhz", left1);
	setprop("/instrumentation/nav[1]/frequencies/selected-mhz", left2);

}