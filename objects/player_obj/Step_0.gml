/// @description step
// You can write your code in this editor

// input player
left  = keyboard_check(ord("A")) or keyboard_check(vk_left);
right = keyboard_check(ord("D")) or keyboard_check(vk_right);
jump  = keyboard_check_pressed(vk_space);

var xDirection = left - right;
var onGround   = place_meeting(x, y + 1, ground_obj); 

// wall jump
var onWall = place_meeting(x-5, y, wall_obj) - place_meeting(x + 5, y, wall_obj); 
if (onWall != 0) vsp = min(vsp + 1, 2);

mvtLocked = max(mvtLocked - 1, 0);
// calculating movement
var move = right - left;

// gravity 
vsp += grv;

// jump
if (mvtLocked <= 0){
	if (xDirection != 0) image_xscale = xDirection;
	hsp = move * walkspd;
	if (jump){
		if (onGround){
			vsp = -4;
		}
		if (place_meeting(x, y + vsp, wall_obj)){
			vsp = -4;
		}
		if (onWall != 0){
			vsp = -5;
			hsp = onWall * walkspd;
			mvtLocked = 10;
		}
	}
}
// Wall jump animation
if (onWall != 0){
	image_speed = 0;
	image_xscale = onWall;
	sprite_index = wPlayer;
}

// Horizontal collision 
if (place_meeting(x + hsp, y, wall_obj)){
	while(!place_meeting(x + sign(hsp), y, wall_obj)){
		x += sign(hsp);
	}
	hsp = 0;
	
}
if (place_meeting(x + hsp, y, ground_obj)){
	while(!place_meeting(x + sign(hsp), y, ground_obj)){
		x += sign(hsp);
	}
	hsp = 0;
	
}

x += hsp;

// Vertical collision 
if (place_meeting(x, y + vsp, ground_obj)){
	while(!place_meeting(x, y + sign(vsp), ground_obj)){
		y += sign(vsp);
	}           
	vsp = 0; 
}

if (place_meeting(x, y + vsp, wall_obj)){
	while(!place_meeting(x, y + sign(vsp), wall_obj)){
		y += sign(vsp);
	}           
	vsp = 0; 
}

y += vsp;


// animation
if (!place_meeting(x, y+1, ground_obj)){
	sprite_index = jPlayer;
	image_speed = 0;
	
	if(sign(vsp) > 0 ){ 
	image_index = 1;
	
	}else {
		image_index = 0;
	
	}
		
} else{
	image_speed = 1;
	
	if (hsp == 0){
		sprite_index = iPlayer;
	} else{
		image_xscale = 1;
		sprite_index = rPlayer;
		
		if (sign(hsp) < 0){
			image_xscale = -1;	
		}
	}
}

// Teleport to debug
if(mouse_check_button(mb_right)){
	x = mouse_x;
	y = mouse_y;
}