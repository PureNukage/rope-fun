if point_in_circle(mouse_x,mouse_y, x,y, 16) and mouse_check_button_pressed(mb_left) {
	attachedToMouse = true
}

if attachedToMouse {
	
	//	Check where we'll be moving to and if its further than the rope length
	//var secondToLastNode = rope.nodes[| rope.nodeCount-2]
	//if rope.ropeLength >= rope.ropeLengthMax - rope.ropeLengthMin {
			
	//}
		x = mouse_x
		y = mouse_y
		if mouse_check_button_released(mb_left) attachedToMouse = false
	
}