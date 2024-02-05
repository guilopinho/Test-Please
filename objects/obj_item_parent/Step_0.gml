var _mouse_enter = position_meeting(mouse_x,mouse_y,self);
var _mouse_down_right = mouse_check_button(mb_right);
var _mouse_released_right = mouse_check_button_released(mb_right);

if(_mouse_enter and _mouse_down_right and global.selected_paper == -1 and !destroy){
	global.selected_paper = self;
	flash_alpha = 1;
	x_scale = 0.8;
	y_scale = 0.8;
}else if(_mouse_released_right){
	global.selected_paper = -1;
}

flash_alpha = approach(flash_alpha,0,.07);

x_scale = approach(x_scale,1,.06);
y_scale = approach(y_scale,1,.06);

if(destroy){
	alpha = approach(alpha,0,.02);
	if(alpha <= 0) instance_destroy();
}