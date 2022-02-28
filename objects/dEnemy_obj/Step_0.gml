/// @description Insert description here
// You can write your code in this editor

if(done == 0){
	vsp += grv;

	// Horizontal collision
	if (place_meeting(x+hsp, y, ground_obj)){
		while(!place_meeting(x+sign(hsp),y,ground_obj)){
			x += sign(hsp)
		}
		hsp = 0;
	}

	x += hsp;

	// Vertical collision
	if (place_meeting(x, y+vsp, ground_obj)){
		if (vsp > 0) {
			done = 1;
			image_index = 1;
		}
		while(!place_meeting(x,y+sign(vsp),ground_obj)){
			y += sign(vsp)
			jp = 0;
		}
		vsp = 0;
	}

	y += vsp;
}