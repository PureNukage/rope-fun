depth = -1

grid = mp_grid_create(0,0,room_width,room_height,1,1)
mp_grid_add_instances(grid, collision, true)

ropeLengthMin = 50

vertices = ds_list_create()
stick = ds_list_create()

verticeCount = 0
stickCount = 0

function create_vertex_struct(_x, _y) constructor {
	x = _x
	y = _y
	xOld = _x + irandom_range(-2,2)
	yOld = _y + irandom_range(-2,2)
}

function create_vertex(x, y) {
	var vertex = new create_vertex_struct(x, y)
	ds_list_add(vertices, vertex)
	verticeCount++
}

function update_vertices(vertex, nextVertex) {
	//	Update our vertices
	var pX = vertex.x
	var pY = vertex.y
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
}

function update_sticks(vertex, nextVertex) {
	//	Update sticks
	var dx = vertex.x - nextVertex.x
	var dy = vertex.y - nextVertex.y
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
}

function collision_check_stick(vertex, nextVertex) {
	//	Collision checking the stick
	if collision_line(vertex.x, vertex.y, nextVertex.x, nextVertex.y, collision,false,false)
    {
        while collision_line(vertex.x, vertex.y, nextVertex.x, nextVertex.y, collision,false,false)
        {
			//	Find direction from center of collision to this vertex
			var ID = collision_line(vertex.x, vertex.y, nextVertex.x, nextVertex.y, collision,false,false)
            vertex.x += 1
            vertex.y += 1
            nextVertex.x += 1
            nextVertex.y += 1
        }
    }
}

create_vertex(x, y)
create_vertex(x, y)
create_vertex(x, y)