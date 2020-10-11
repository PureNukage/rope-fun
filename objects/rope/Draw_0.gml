//	Draw vertices
draw_set_color(c_green)
for(var i=0;i<verticeCount;i++) {
	var vX = vertices[| i].x
	var vY = vertices[| i].y
	draw_circle(vX,vY, 4, false)
}

//	Draw sticks
for(var i=0;i<verticeCount-1;i++) {
	var x1 = vertices[| i].x
	var y1 = vertices[| i].y
	var x2 = vertices[| i+1].x
	var y2 = vertices[| i+1].y
	draw_line(x1,y1, x2,y2)
}

//	Draw rope
draw_set_color(c_red)
var path = path_add()
path_set_kind(path, 1)
path_set_closed(path, false)
for(var i=0;i<verticeCount;i++) {
	path_add_point(path, vertices[| i].x,vertices[| i].y, 100)	
}
path_add_point(path, x,y, 100)
draw_path(path, x,y, true)
path_delete(path)

//	Draw text
draw_set_color(c_black)
draw_text(15,15,"ropeLength: "+string(ropeLength))