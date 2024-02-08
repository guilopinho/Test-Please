if(collision){

	var _spr_w = sprite_get_width(sprite_index);
	var _spr_h = sprite_get_height(sprite_index);

	x = clamp(x,_spr_w / 2,room_width - (_spr_w / 2));
	y = clamp(y,_spr_h / 2,room_height - (_spr_h / 2));

}