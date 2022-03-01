/// @description Insert description here
// You can write your code in this editor

x = player_obj.x;
y = player_obj.y;

image_angle = point_direction(x, y, mouse_x, mouse_y)

firingdelay -= 1;
recoil = max(0, recoil - 1);

if(mouse_check_button(mb_left)) && (firingdelay < 0){
	recoil = 4;
	firingdelay = 10;
	with(instance_create_layer(x, y, "bullets", bullet_obj)){
		speed = 25;
		direction = other.image_angle;
		image_angle = direction;
	}
}

x -= lengthdir_x(recoil, image_angle);
y -= lengthdir_y(recoil, image_angle);

if(image_angle > 90) && (image_angle < 270){
	image_yscale = -1;
}else{
	image_yscale = 1;
}
