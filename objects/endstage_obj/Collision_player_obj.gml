 /// @description Movimenta jogador para proxima fase
with(player_obj){
	if(hascontrol){
	hascontrol = false;
	SlideTransition(TRANS_MODE.GOTO, other.target)
	}
} 