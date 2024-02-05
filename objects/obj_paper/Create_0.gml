event_inherited();
image_index = choose(0,1);

hspd = 0;
vspd = 0;

cur_time = 0;
timer = 90;

surf = noone;
surf_x = x;
surf_y = y;
surf_xoff = 10;
surf_yoff = 5;
surf_width = 94;
surf_height = 136;

mouse_xprevious = mouse_x;
mouse_yprevious = mouse_y;

questions = [false,false,false,false];
questions_length = array_length(questions);

answer_index = irandom_range(0,questions_length - 1);
answers = [false,false,false,false];
answers[answer_index] = true;

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
	
	if(_mouse_enter and _mouse_press_left and !destroy){
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
				cur_time++;
				if(cur_time >= timer and !destroy){
					flash_alpha = 1;
					destroy = true;
					if(check_answer()){
						flash_color = make_color_rgb(99,171,63);
					}else{
						flash_color = make_color_rgb(230, 69, 57);
					}
				}
				questions[_i] = true;
			}
		}
	}
	
}

check_answer = function(){
	
	if(array_equals(questions,answers)){
		return true;
	}
	
	return false;
	
}