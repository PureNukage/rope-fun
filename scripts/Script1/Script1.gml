function pathfind(mp_grid, Path, xStart, yStart, xGoal, yGoal, allowdiag) {
	
	if mp_grid_path(mp_grid, Path, xStart, yStart, xGoal, yGoal, allowdiag) {
		return true
	}
	
	else {
		//debug.log("Can't pathfind to the desired goal")	
		return false
	}
	
}