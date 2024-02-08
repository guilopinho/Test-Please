create_paper();
if(global.timer > global.timer_min){
	global.timer-=5;
}else{
	global.timer = global.timer_min;
}
alarm[0] = global.timer;