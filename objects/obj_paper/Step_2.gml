event_inherited();

surf_x = x - sprite_xoffset + surf_xoff;
surf_y = y - sprite_yoffset + surf_yoff;

hspd = approach(hspd,0,0.2);
vspd = approach(vspd,0,0.2);

x+=hspd;
y+=vspd;