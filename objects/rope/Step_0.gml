//	Loop through nodes except first and last
var length = 0
//var collisionPath = path_add()
for(var i=1;i<nodeCount-1;i++) {
	var previousNode = nodes[| i-1]
	var node = nodes[| i]
	var nextNode = nodes[| i+1]
	
	var Lerp = 0.2 //* i/nodeCount
	
	//	distance to the next node
	var distanceToNextNode = point_distance(node.x,node.y, nextNode.x,nextNode.y)
	var distanceToPreviousNode = point_distance(node.x,node.y, previousNode.x,previousNode.y)
	
	//	This node isn't close enough to the next node
	if distanceToNextNode > ropeLengthMin {
		var nodeDirection = point_direction(node.x,node.y, nextNode.x,nextNode.y)
		var newX = node.x
		var newY = node.y
		var NewX = lerp(node.x, nextNode.x, Lerp)
		var NewY = lerp(node.y, nextNode.y, Lerp)
		var XX = NewX - node.x
		var YY = NewY - node.y
		for(var X=0;X<abs(XX);X++) {
			if !collision_line(newX + sign(XX), newY, nextNode.x,nextNode.y, collision, false, true)
			and !collision_line(newX + sign(XX), newY, previousNode.x,previousNode.y, collision, false, true) {
				newX += sign(XX)	
			}
			else {
				show_debug_message(string(delta_time) + " " + string(i))
				if !collision_point(newX, newY + sign(XX), collision, false, true) newY += sign(XX)
			}
		}
		for(var Y=0;Y<abs(YY);Y++) {
			if !collision_line(newX,newY + sign(YY), nextNode.x,nextNode.y, collision, false, true)
			and !collision_line(newX,newY + sign(YY), previousNode.x,previousNode.y, collision, false, true) {
				newY += sign(YY)
			} 
			else {
				show_debug_message(string(delta_time) + " " + string(i))	
				if !collision_point(newX + sign(YY), newY, collision, false, true) newX += sign(YY)
			}
		}
		//node.x = lerp(node.x, nextNode.x, Lerp)
		//node.y = lerp(node.y, nextNode.y, Lerp)
		node.x = newX
		node.y = newY
		nodes[| i] = node
	}
	
	length += distanceToPreviousNode
}
ropeLength = length + distanceToNextNode

//	Check the second to last node
var secondToLastNode = nodes[| 1]
if point_distance(secondToLastNode.x,secondToLastNode.y, nodes[| 0].x,nodes[| 0].y) >= ropeLengthMin {
	//if nodeCount < ropeSegments
	create_node(x,y, 0)	
}


//	Fix the last node onto the player
var Node = nodes[| nodeCount-1]
Node.x = ball.x
Node.y = ball.y
nodes[| nodeCount-1] = Node

////	Build rope
path_clear_points(Rope)
for(var p=0;p<nodeCount;p++) {
	var Node = nodes[| p]
	path_add_point(Rope, Node.x,Node.y-Node.z, 100)	
}