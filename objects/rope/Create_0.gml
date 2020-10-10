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
	ds_list_insert(vertices, 0, vertex)
	verticeCount++
}

create_vertex(x, y)
create_vertex(x, y)
create_vertex(x, y)