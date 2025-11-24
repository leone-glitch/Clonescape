//Muovimenti 
if keyboard_check(vk_left) x -=5; 
if keyboard_check(vk_right) x+=5; 
if keyboard_check(vk_up) y-=5; 
if keyboard_check(vk_down) y+=5; 

//Creazione dei cloni
if keyboard_check_pressed(vk_space){
	if(global.pos < maxcloni){
		var clone = instance_create_layer(x,y, "Instances", oClone);
		clone.visible = true; 
		cloni[global.pos++] = clone; 
	}

}

//Eliminazione dei cloni
if mouse_check_button_pressed(mb_left){
	var mx = mouse_x; 
	var my = mouse_y; 
	
	for(var j = 0; j<global.pos;j++){
		if collision_rectangle(mx-1, my-1, mx+1, my+1, cloni[j], false, true) != noone{ 
			cloni[j].visible = false;  
			shiftSX(cloni, j, global.pos); 
			global.pos--; 
			break; 
		}
	}
}

//Shift a sx dell'array
function shiftSX(arr, iniz, len){
	for(f=iniz;f<len-1;f++){
		arr[f]= arr[f+1]; 
	} 
}

function testGitHub(){
	var pp = 14; 
}




	

