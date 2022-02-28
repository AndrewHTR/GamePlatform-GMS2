/// @description Insert description here
// You can write your code in this editor

// atualização da localização
if (instance_exists(follow)){
	xTo = follow.x;
	yTo = follow.y;
}

// atualização de posição
x += (xTo - x) / 13;
y += (yTo - y) / 15;

// atualiza vizualização da camera
camera_set_view_pos(cam, x - view_w_half, y - view_h_half);
