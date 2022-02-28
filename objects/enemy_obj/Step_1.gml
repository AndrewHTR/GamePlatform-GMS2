/// @description Insert description here
// You can write your code in this editor
if (hp <= 0){
	with(instance_create_layer(x, y, "Enemy", dEnemy_obj)){
		direction = other.hitfrom;
		hsp = lengthdir_x(3, direction);
		vsp = lengthdir_y(4, direction) - 2;
		image_xscale = sign(hsp);
	}
	
	
	instance_destroy();
}