image_index = choose(0,1);

hspd = 0;
vspd = 0;

surf = noone;
surf_x = x;
surf_y = y;
surf_xoff = 10;
surf_yoff = 5;
surf_width = 94;
surf_height = 136;

x_scale = 1;
y_scale = 1;
angle = 0;
color = c_white;
alpha = 1;
is_visible = true;

flash_color = c_white;
flash_alpha = 0;

mouse_xprevious = mouse_x;
mouse_yprevious = mouse_y;

destroy = false;

questions = [false,false,false,false];
questions_length = array_length(questions);

answer_index = irandom_range(0,questions_length - 1);
answers = [false,false,false,false];
answers[answer_index] = true;

update_pos = function(){
	
	var _mouse_enter = position_meeting(mouse_x,mouse_y,self);
	var _mouse_down_right = mouse_check_button(mb_right);
	var _mouse_released_right = mouse_check_button_released(mb_right);

	if(_mouse_enter and _mouse_down_right and global.selected_paper == -1){
		global.selected_paper = self;
		flash_alpha = 1;
		x_scale = 0.8;
		y_scale = 0.8;
	}else if(_mouse_released_right){
		global.selected_paper = -1;
	}
	
	surf_x = x - sprite_xoffset + surf_xoff;
	surf_y = y - sprite_yoffset + surf_yoff;
	
}

draw_paper = function(){
	
	if(sprite_index != -1 and is_visible){
		draw_sprite_ext(sprite_index,image_index,x,y,
		x_scale,y_scale,angle,color,alpha);
	}
	
}

draw_flash = function(){
	
	if(flash_alpha > 0 and sprite_index != -1 and is_visible){
		gpu_set_fog(true,flash_color,0,0);
		draw_sprite_ext(sprite_index,image_index,x,y,
		x_scale,y_scale,angle,color,flash_alpha);
		gpu_set_fog(false,flash_color,0,0);
	}
	
}

draw_surf = function(){
	
	if(!surface_exists(surf)){
		surf = surface_create(surf_width,surf_height);
	}

	var _mouse_enter = position_meeting(mouse_x,mouse_y,self);
	var _mouse_press_left = mouse_check_button(mb_left);

	var _line_color = make_color_rgb(94, 108, 146);
	var _line_size = 2;
	
	var _m_x = mouse_x;
	var _m_y = mouse_y;
	
	var _x1 = mouse_xprevious - surf_x;
	var _y1 = mouse_yprevious - surf_y;
	
	var _x2 = _m_x - surf_x;
	var _y2 = _m_y - surf_y;

	surface_set_target(surf);
	
	if(_mouse_enter and _mouse_press_left){
		draw_set_color(_line_color);
		draw_line_width(_x1,_y1,_x2,_y2,_line_size);
		draw_set_color(-1);
	}
	
	surface_reset_target();
	draw_surface_ext(surf,surf_x,surf_y,x_scale,y_scale,angle,color,alpha);
	
	mouse_xprevious = mouse_x;
	mouse_yprevious = mouse_y;
	
	var _x1 = surf_x + 13;
	var _y1 = surf_y + 74;
	var _offset = 16;
	var _m_x = device_mouse_x_to_gui(0);
	var _m_y = device_mouse_y_to_gui(0);
	var _spr_w = sprite_get_width(spr_mask);
	var _spr_h = sprite_get_height(spr_mask);
	
	for(var _i = 0; _i < questions_length; _i++){
		var _y2 = _y1 + (_offset * _i);
		if(point_in_rectangle(_m_x,_m_y,_x1 - _spr_w / 2,_y2 - _spr_h / 2,_x1 + _spr_w / 2,_y2 + _spr_h / 2)){
			if(_mouse_press_left){
				questions[_i] = true;
			}
		}
	}
	
}

check_question = function(){
	
	if(array_equals(questions,answers)){
		return true;
	}
	
	return false;
	
}