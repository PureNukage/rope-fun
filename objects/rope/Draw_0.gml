////	Draw the node path
draw_set_color(c_white)	
draw_path(Rope, x,y, true)

//	Create straight path to ball
draw_set_color(c_yellow)
var straightPath = path_add()
var shortLength = point_distance(nodes[| 0].x,nodes[| 0].y, ball.x,ball.y)
var segmentLength = shortLength / nodeCount
var XX = nodes[| 0].x
var YY = nodes[| 0].y
var Direction = point_direction(XX,YY, ball.x,ball.y)
for(var i=0;i<nodeCount;i++) {
	path_add_point(straightPath, XX,YY, 100)
	XX += lengthdir_x(segmentLength, Direction)
	YY += lengthdir_y(segmentLength, Direction)
	draw_circle(XX,YY, 4, false)
}
path_add_point(straightPath, ball.x,ball.y, 100)
draw_path(straightPath, x,y, true)
path_delete(straightPath)



////	Draw the helmet path
//draw_set_color(c_purple)
//var path = path_add()
//path_set_closed(path, false)
//path_set_kind(path, 1)
//path_set_precision(path, 8)
//path_add_point(path, ball.x,ball.y, 100)
//path_add_point(path, nodes[0, nodeIndex-1],nodes[1, nodeIndex-1], 100)
//draw_path(path, x,y, true)
//path_delete(path)

////	DEBUG Draw nodes
draw_set_color(c_green)
for(var p=0;p<nodeCount;p++) {
	var Node = nodes[| p]
	draw_circle(Node.x,Node.y, 4, false)
}

////	DEBUG Path length
draw_set_color(c_black)
//ropeLength = path_get_length(Rope) //+ helmetPathLength //nodePathLength + helmetPathLength
draw_text(15,15, "path_length: "+string(ropeLength))
draw_text(15,30, "short_length: "+string(shortLength))