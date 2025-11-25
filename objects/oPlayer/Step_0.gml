//Muovimenti 
if keyboard_check(vk_left) &&!global.open x -=5; 
if keyboard_check(vk_right)&&!global.open x+=5; 
if keyboard_check(vk_up)&&!global.open y-=5; 
if keyboard_check(vk_down)&&!global.open y+=5; 

//Creazione dei cloni
if keyboard_check_pressed(vk_space){
	if(global.pos < maxcloni && !global.open){
		var clone = instance_create_layer(x,y, "Instances", oClone);
		clone.visible = true; 
		cloni[global.pos++] = clone; 
	}

}

//Eliminazione dei cloni
if mouse_check_button_pressed(mb_left){
	var mx = mouse_x; 
	var my = mouse_y; 
	
	for(var j = 0; j<global.pos && !global.open;j++){
		if collision_rectangle(mx-1, my-1, mx+1, my+1, cloni[j], false, true) != noone{ 
			cloni[j].visible = false;  
			shiftSX(cloni, j, global.pos); 
			global.pos--; 
			break; 
		}
	}
}

if keyboard_check_pressed(ord("E")){
	if(!global.open){
		global.open = true; 
		for(i=0; i<global.pos;i++)
		{
			cloni[i].visible = false; 
		}
		visible = false; 
	}else{
		global.open = false; 
		visible = true; 
		for(i=0; i<global.pos;i++)
		{
			cloni[i].visible = true; 
		}
	}
}

//Shift a sx dell'array
function shiftSX(arr, iniz, len){
	for(f=iniz;f<len-1;f++){
		arr[f]= arr[f+1]; 
	} 
}

