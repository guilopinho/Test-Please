randomize();

global.selected_paper = -1;
global.grid_depth = ds_grid_create(2,0);
global.timer = 200;
global.timer_min = 100;

global.word = "";

alarm[0] = global.timer;

phone_visible = true;
phone_x = 440;
phone_y = 55;

depth_system = function(){
	
	var _grid_depth = global.grid_depth;
	var _papers = instance_number(obj_item_parent);

	ds_grid_resize(_grid_depth,2,_papers);

	var _i = 0;
	with(obj_item_parent){
		_grid_depth[# 0, _i] = id;
		_grid_depth[# 1, _i] = y;
		_i++;
	}

	ds_grid_sort(_grid_depth,1,true);

	for(var _i = 0; _i < ds_grid_height(_grid_depth); _i++){
		var _inst = _grid_depth[# 0, _i];
		with(_inst){
			event_perform(ev_draw,0);
		}
	}
	
}

create_paper = function(){
	
	var _xoffset = 60;
	var _yoffset = 90;
	var _x = VIEW_WIDTH + _xoffset;
	var _y = VIEW_HEIGHT - _yoffset;
	var _length = 8;
	var _dir = 180;
	
	var _new_papaer = instance_create_layer(_x,_y,"Items",obj_paper);
	_new_papaer.hspd = lengthdir_x(_length,_dir);
	_new_papaer.vspd = lengthdir_y(_length,_dir);
	
	if(_new_papaer.answer_index == 0){
		global.word = "A";
	}else if(_new_papaer.answer_index == 1){
		global.word = "B";
	}else if(_new_papaer.answer_index == 2){
		global.word = "C";
	}else if(_new_papaer.answer_index == 3){
		global.word = "D";
	}
	
}
	
draw_ui = function(){

	draw_sprite(spr_phone,0,phone_x,phone_y);

	var _x = phone_x;
	var _y = phone_y;
	
	var _x1 = _x;
	var _y1 = _y;
	var _scale = 2;
	var _color = make_color_rgb(180, 195, 158);
	
	draw_set_font(fnt_paper);
	draw_set_color(_color);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	draw_text_transformed(_x1,_y1,string(global.word),_scale,_scale,0);
	
	draw_set_font(-1);
	draw_set_color(-1);
	
	draw_set_halign(-1);
	draw_set_valign(-1);
	
}