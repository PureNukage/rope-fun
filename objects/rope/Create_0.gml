depth = -1

grid = mp_grid_create(0,0,room_width,room_height,1,1)
mp_grid_add_instances(grid, collision, true)

ropeLengthMin = 25

vertices = ds_list_create()

verticeCount = 0

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
	var drag = 0.7
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
	var ID = collision_line(vertex.x, vertex.y, nextVertex.x, nextVertex.y, collision,false,false)
	if ID
    {
		var attempts = 0
        while collision_line(vertex.x, vertex.y, nextVertex.x, nextVertex.y, collision,false,false)
        {
			var X = sign(vertex.x - ID.centerX)
			var Y = sign(vertex.y - ID.centerY)
			vertex.x += X
            vertex.y += Y
			
			var X = sign(nextVertex.x - ID.centerX)
			var Y = sign(nextVertex.y - ID.centerY)
			nextVertex.x += X
            nextVertex.y += Y
			attempts++
			if attempts >= 100 {
				exit	
			}
        }
    }
}

create_vertex(x, y)
create_vertex(x, y)
create_vertex(x, y)