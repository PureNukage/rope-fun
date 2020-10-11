keyUp = keyboard_check(ord("W"))
keyDown = keyboard_check(ord("S"))
keyRight = keyboard_check(ord("D"))
keyLeft = keyboard_check(ord("A"))

hspd = keyRight - keyLeft
vspd = keyDown - keyUp

if hspd != 0 or vspd != 0 {
	Direction = point_direction(0,0,hspd,vspd)

	xx = lengthdir_x(5, Direction)
	yy = lengthdir_y(5, Direction)
}

if rope.ropeLength >= rope.ropeLengthMax {
	var DDirection = point_direction(x,y, rope.vertices[| 0].x,rope.vertices[| 0].y)
	xx += lengthdir_x(rope.ropeLength - rope.ropeLengthMax, DDirection)
	yy += lengthdir_y(rope.ropeLength - rope.ropeLengthMax, DDirection)
}

for(var X=0;X<abs(xx);X++) {
	x += sign(xx)	
}
for(var Y=0;Y<abs(yy);Y++) {
	y += sign(yy)	
}

xx = 0
yy = 0

if place_meeting(x,y,collisionMap) {
	var ID = instance_place(x,y,collisionMap)
	z = ID.z	
}
else z = 0

if point_in_circle(mouse_x,mouse_y, x,y, 16) and mouse_check_button_pressed(mb_left) {
	attachedToMouse = true
}

if attachedToMouse {
	
	
	
	//	Check where we'll be moving to and if its further than the rope length
	//if rope.ropeLength <= rope.ropeLengthMax {
		x = mouse_x
		y = mouse_y
		if mouse_check_button_released(mb_left) attachedToMouse = false
	//}
	//	Get pulled back to the last vertex
	//else {
	//	var lastVertex = rope.vertices[| 0]
	//	x = lastVertex.x
	//	y = lastVertex.y
	//}
	
}