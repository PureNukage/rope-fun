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
			
			//	Check z collision
			var ID = collision_point(vertex.x,vertex.y, collisionMap, true,true)
			if ID and vertex.y < (ID.bbox_top + ID.width + 16) {
				if nextVertex.z >= ID.z vertex.z = ID.z
			}
			else {
				vertex.z = 0	
			}
			
			length += point_distance(vertex.x,vertex.y, nextVertex.x,nextVertex.y)
		
		//	The player vertice
		} else if i == 0 {
			vertex.x = ball.x
			vertex.y = ball.y
			vertex.z = ball.z + 16
		}
	}
	//length += point_distance(vertices[| 0].x,vertices[| 0].y, vertices[])
	ropeLength = length
	if reel <= -1 reel = 60
}
