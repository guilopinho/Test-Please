global.grid_depth = ds_grid_create(2,0);

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