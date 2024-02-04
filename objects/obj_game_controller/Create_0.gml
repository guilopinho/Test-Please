randomize();
global.selected_paper = -1;
global.grid_depth = ds_grid_create(2,0);
global.timer = 130;
alarm[0] = global.timer;

depth_system = function(){
	var _grid_depth = global.grid_depth;
	var _papers = instance_number(obj_paper);

	ds_grid_resize(_grid_depth,2,_papers);

	var _i = 0;
	with(obj_paper){
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
	
	var _new_papaer = instance_create_layer(_x,_y,"Papers",obj_paper);
	_new_papaer.hspd = lengthdir_x(_length,_dir);
	_new_papaer.vspd = lengthdir_y(_length,_dir);
	
}