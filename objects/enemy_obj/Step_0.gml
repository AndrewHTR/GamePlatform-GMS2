/// @description step
// You can write your code in this editor


// gravity 
vsp += grv;

// jump

// Horizontal collision
if (place_meeting(x+hsp, y, wall_obj)){
	while(!place_meeting(x+sign(hsp),y,wall_obj)){
		x += sign(hsp)
	}
	hsp = -hsp;
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
	sprite_index = jEnemy;
	image_speed = 0;
	
	if(sign(vsp) > 0 ){ 
	image_index = 1;
	
	}else {
		image_index = 0;
	
	}
		
} else{
	image_speed = 1;
	
	if (hsp == 0){
		sprite_index = iEnemy;
	} else{
		image_xscale = 1;
		sprite_index = rEnemy;
		
		if (sign(hsp) < 0){
			image_xscale = -1;		
		}
	}
}

