function game_set_resolution(){
	
	if(!instance_exists(obj_view_controller)) return;
	//window_set_cursor(cr_none);
	window_set_caption(WINDOW_TITLE);
	window_set_size(WINDOW_WIDTH,WINDOW_HEIGHT);
	surface_resize(application_surface,VIEW_WIDTH,VIEW_HEIGHT);
	display_set_gui_size(GUI_WIDTH,GUI_HEIGHT);
	obj_view_controller.alarm[0] = 1;
	
}

function game_set_camera(){
	
	view_enabled = true;
	view_visible[VIEW] = true;
	camera_set_view_size(VIEW_CAM,VIEW_WIDTH,VIEW_HEIGHT);
	
}

function game_set_fullscreen(){
	
	if(window_get_fullscreen()){
		window_set_fullscreen(false);
	}else{
		window_set_fullscreen(true);
	}
	
}