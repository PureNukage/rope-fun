keyUp = keyboard_check(vk_up)
keyDown = keyboard_check(vk_down)

keyUp = true

if keyUp y -= 2
if keyDown y += 2

var jitterFrames = 30
for(var i=0;i<verticeCount;i++) {
	var previousVertex = vertices[| i+1]
	var vertex = vertices[| i]	
	var nextVertex = vertices[| i-1]	
	update_vertices(vertex, nextVertex)
}

reel--
//	Loop through vertices
for(var j=0;j<jitterFrames;j++) {
	var length = 0 
	for(var i=0;i<verticeCount;i++) {
		var previousVertex = vertices[| i+1]
		var vertex = vertices[| i]	
		var nextVertex = vertices[| i-1]
	
	
		//	Vertice other than the first
		if i > 0 {
		
			var reelAmount = 10
			// If this is the last node
			if i == verticeCount - 1 {
				if verticeCount > ropeMaxSegments {
					vertex.x = x
					vertex.y = y
				}
				else 
				//	Create a new node if we're far enough away from the anchor
				if point_distance(vertex.x,vertex.y, x,y) >= ropeLengthMin {
					create_vertex(x, y)	
				}
				else {
					////	Slowly get reeled back in
					//if point_distance(vertex.x,vertex.y, x,y) > (ropeLengthMin - reelAmount) {
					//	vertex.x += lengthdir_x(min(reelAmount, point_distance(vertex.x,vertex.y, x,y)), point_direction(vertex.x,vertex.y, x,y))
					//	vertex.y += lengthdir_y(min(reelAmount, point_distance(vertex.x,vertex.y, x,y)), point_direction(vertex.x,vertex.y, x,y))
					//}
					//else if reel <= -1 {
					//	delete_vertex(i)
						
					//	//	Adjust the next final node
					//	var newFinalNode = vertices[| verticeCount - 1]
					//	newFinalNode.x += lengthdir_x(reelAmount, point_direction(newFinalNode.x,newFinalNode.y, x,y))
					//	newFinalNode.y += lengthdir_y(reelAmount, point_direction(newFinalNode.x,newFinalNode.y, x,y)) 
					//}
				}
				
				if y < 0 {
					delete_vertex(i)
					y = 1
				}
			}
		
			//update_vertices(vertex, nextVertex)
		
			//for(var j=0;j<jitterFrames;j++) {
		
				update_sticks(vertex, nextVertex)
		
				collision_check_stick(vertex, nextVertex)
			
			//}s
			
			length += point_distance(vertex.x,vertex.y, nextVertex.x,nextVertex.y)
		
		//	The player vertice
		} else if i == 0 {
			vertex.x = ball.x
			vertex.y = ball.y
		}
	}
	//length += point_distance(vertices[| 0].x,vertices[| 0].y, vertices[])
	ropeLength = length
	if reel <= -1 reel = 60
}
