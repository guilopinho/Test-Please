x_scale = 1;
y_scale = 1;
angle = 0;
color = c_white;
alpha = 1;
is_visible = true;

flash_color = c_white;
flash_alpha = 0;

destroy = false;

draw_item = function(){
	
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