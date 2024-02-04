update_pos();

flash_alpha = approach(flash_alpha,0,.07);

x_scale = approach(x_scale,1,.06);
y_scale = approach(y_scale,1,.06);

hspd = approach(hspd,0,0.2);
vspd = approach(vspd,0,0.2);

if(destroy){
	alpha = approach(alpha,0,.02);
	if(alpha <= 0) instance_destroy();
}

x+=hspd;
y+=vspd;