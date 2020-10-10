//	Loop through vertices
for(var i=0;i<verticeCount;i++) {
	var previousVertex = vertices[| i+1]
	var vertex = vertices[| i]	
	var nextVertex = vertices[| i-1]
	
	
	//	Vertice other than the first
	if i > 0 {
		
		//	Create a new node if we're far enough away from the anchor
		if i == verticeCount-1 and point_distance(vertex.x,vertex.y, x,y) >= ropeLengthMin {
			create_vertex(x, y)	
		}
		
		//	Slowly get reeled back in
		if i == 0 and point_distance(vertex.x,vertex.y, x,y) > 75 {
			vertex.x += lengthdir_x(5, point_direction(vertex.x,vertex.y, x,y))
			vertex.y += lengthdir_y(5, point_direction(vertex.x,vertex.y, x,y))
		}
		
		update_vertices(vertex, nextVertex)
		
		var jitterFrames = 10
		for(var j=0;j<jitterFrames;j++) {
		
			update_sticks(vertex, nextVertex)
		
			collision_check_stick(vertex, nextVertex)
			
		}
		
	//	The player vertice
	} else if i == 0 {
		vertex.x = ball.x
		vertex.y = ball.y
	}
}