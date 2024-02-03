image_index = 0;

surf = noone;
surf_width = sprite_get_width(sprite_index);
surf_height = sprite_get_height(sprite_index);
surf_x = x;
surf_y = y;

x_scale = 1;
y_scale = 1;
angle = 0;
color = c_white;
alpha = 1;
flash_color = c_white;
flash_alpha = 0;
is_visible = true;

mouse_xprevious = mouse_x;
mouse_yprevious = mouse_y;

selected = true;

draw_paper = function(){
	
	if(sprite_index != -1 and is_visible){
		
		draw_sprite_ext(sprite_index,image_index,x,y,
		x_scale,y_scale,angle,color,alpha);
		
		if(flash_alpha > 0){
			gpu_set_fog(true,flash_color,0,0);
			draw_sprite_ext(sprite_index,image_index,x,y,
			x_scale,y_scale,angle,color,flash_alpha);
			gpu_set_fog(false,flash_color,0,0);
		}
		
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
}