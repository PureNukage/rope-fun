depth = -1

grid = mp_grid_create(0,0,room_width,room_height,1,1)
mp_grid_add_instances(grid, collision, true)

Rope = path_add()
path_set_closed(Rope, false)
path_set_kind(Rope, 1)
path_set_precision(Rope, 8)
ropeLengthMax = 500
ropeLengthMin = 100
ropeSegments = floor(ropeLengthMax / ropeLengthMin) + 1
ropeSegmentLengthMax = ropeLengthMax / ropeSegments
nodes = ds_list_create()
nodesLerp = ds_list_create()
nodeCount = 0
ropeLength = 0

function create_node_struct(_x, _y, _z) constructor {
	x = _x
	y = _y
	z = _z
}

function create_node(x, y, z) {
	var Node = new create_node_struct(x, y, z)
	if ds_list_empty(nodes) ds_list_add(nodes, Node)
	else ds_list_insert(nodes, 1, Node)
	nodeCount++
}

function delete_node(index) {
	ds_list_delete(nodes, index)
	nodeCount--
}

create_node(x,y, 0)
create_node(ball.x,ball.y, 0)
create_node(ball.x,ball.y, 0)