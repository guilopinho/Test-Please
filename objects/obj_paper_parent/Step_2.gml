var _mouse_enter = position_meeting(mouse_x,mouse_y,self);
var _mouse_down_right = mouse_check_button(mb_right);
var _mouse_released_right = mouse_check_button_released(mb_right);

if(_mouse_enter and _mouse_down_right and global.selected_paper == -1){
	global.selected_paper = self;
}else if(_mouse_released_right){
	global.selected_paper = -1;
}

surf_x = x - (surf_width / 2);
surf_y = y - (surf_height / 2);