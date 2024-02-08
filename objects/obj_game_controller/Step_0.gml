if(global.selected_paper != -1){
	global.selected_paper.x = mouse_x;
	global.selected_paper.y = mouse_y;
}

if(phone_visible){
	phone_y = approach(phone_y,55,4);
}else{
	phone_y = approach(phone_y,-40,4);
}