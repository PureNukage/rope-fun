//	Loop through vertices
for(var i=0;i<verticeCount;i++) {
	var previousVertex = vertices[| i-1]
	var vertex = vertices[| i]	
	var nextVertex = vertices[| i+1]
	
	
	//	Less than last vertice
	if i < verticeCount-1 {
		
		//	Create a new node if we're far enough away from the anchor
		if i == 0 and point_distance(vertex.x,vertex.y, x,y) >= ropeLengthMin {
			create_vertex(x, y)	
		}
		
		//	Slowly get reeled back in
		if i == 0 and point_distance(vertex.x,vertex.y, x,y) > 75 {
			vertex.x += lengthdir_x(5, point_direction(vertex.x,vertex.y, x,y))
			vertex.y += lengthdir_y(5, point_direction(vertex.x,vertex.y, x,y))
		}
		
		//	Update our vertices
		var pX = vertex.x
		var pY = vertex.y
		var dx = pX - nextVertex.x
		var dy = pY - nextVertex.y
		var vX = pX - vertex.xOld
		var vY = pY - vertex.yOld
		var drag = 0.90
		var fric = 0.5
		
		//	x movements
		vertex.xOld = vertex.x
		pX += vX * drag
		
		//	Keep the point in the room
		if pX > room_width {
			pX = room_width
			vertex.xOld = vertex.x + (vX * fric)
		}
		else if pX < 0 {
			pX = 0
			vertex.xOld = vertex.x + (vX * fric)
		}
		
		vertex.x = pX
		
		//	y movements
		vertex.yOld = vertex.y
		pY += vY * drag
		
		if pY > room_height {
			pY = room_height
			vertex.yOld = vertex.y + (vY * fric)
		}
		else if pY < 0 {
			pY = 0 
			vertex.yOld = vertex.y + (vY * fric)
		}
		
		vertex.y = pY
		
		//	Update sticks
		var dx = pX - nextVertex.x
		var dy = pY - nextVertex.y
		var d2 = sqrt((dx * dx) + (dy * dy))
		var diff = d2 - ropeLengthMin
		var percent = (diff/d2)/2
		var offX = dx*percent
		var offY = dy*percent
		
		//	Update the next stick
		nextVertex.x += offX
		vertex.x -= offX
		nextVertex.y += offY
		vertex.y -= offY
		
	//	The last vertex
	} else if i == verticeCount-1 {
		vertex.x = ball.x
		vertex.y = ball.y
	}
}