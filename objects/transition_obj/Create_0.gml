/// @description Insert description here
// You can write your code in this editor
w = display_get_gui_width();
h = display_get_gui_height();

h_half = h * 0.5;
w_half = w * 0.5;

enum TRANS_MODE{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}
mode = TRANS_MODE.INTRO; // 0 é equivalente a OFF e 1 = NEXT
percent = 1;
target = room;

