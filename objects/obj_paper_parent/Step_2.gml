update_pos();

flash_alpha = approach(flash_alpha,0,.08);

if(destroy){
	alpha = approach(alpha,0,.02);
	if(alpha <= 0) instance_destroy();
}