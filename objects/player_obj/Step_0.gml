/// @description step
// You can write your code in this editor

// input player
left  = keyboard_check(ord("A")) or keyboard_check(vk_left);
right = keyboard_check(ord("D")) or keyboard_check(vk_right);
jump  = keyboard_check_pressed(vk_space);

// calculating movement
var move = right - left;

hsp = move * walkspd;

// gravity 
vsp += grv;

// jump
if (place_meeting(x,y+1,ground_obj)) && (jump) or jp == 1 and (jump){
	vsp = -4;
}

// Wall jump
if (!left and place_meeting(x + hsp, y, ground_obj) or (right < left) and place_meeting(x + hsp, y, ground_obj)){
	jp = 1;
}else if(!place_meeting(x + sign(hsp), y, ground_obj)){
	jp = 0;
}

// Horizontal collision
if (place_meeting(x+hsp, y, ground_obj)){
	while(!place_meeting(x+sign(hsp),y,ground_obj)){
		x += sign(hsp);
	}
	hsp = 0;
}

x += hsp;

// Vertical collision
if (place_meeting(x, y+vsp, ground_obj)){
	while(!place_meeting(x,y+sign(vsp),ground_obj)){
		y += sign(vsp)
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

