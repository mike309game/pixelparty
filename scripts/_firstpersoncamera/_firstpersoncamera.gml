function MatrixViewYawPitch(x, y, z, yaw, pitch){
	if(live_call(x, y, z, yaw, pitch)) then return live_result;
	draw_text(100, 0, "yaw: " + string(yaw) + "\npitch: " + string(pitch) + "\nx: " + string(x) + "\ny: " + string(y) + "\nz: " + string(z));
	yaw = degtorad(yaw);
	pitch = degtorad(pitch);
	var pitchCos = cos(pitch);
	var pitchSin = sin(pitch);
	var yawCos = cos(yaw);
	var yawSin = sin(yaw);
	
	var xaxis = [yawCos, 0, -yawSin];
	var yaxis = [yawSin * pitchSin, pitchCos, yawCos * pitchSin];
	var zaxis = [yawSin * pitchCos, -pitchSin, pitchCos * yawCos];
	var xdot = -dot_product_3d(xaxis[0], xaxis[1], xaxis[2], y, z, x);
	var ydot = -dot_product_3d(yaxis[0], yaxis[1], yaxis[2], y, z, x);
	var zdot = -dot_product_3d(zaxis[0], zaxis[1], zaxis[2], y, z, x);
	
	return [
		
		//LOOKS TO THE LEFT		
		/*xaxis[2], yaxis[2], zaxis[2], 0,
		xaxis[0], yaxis[0], zaxis[0], 0,
		xaxis[1], yaxis[1], zaxis[1], 0,
		xdot, ydot, zdot, 1*/
		xaxis[2], yaxis[2], zaxis[2], 0,
		xaxis[0], yaxis[0], zaxis[0], 0,
		xaxis[1], yaxis[1], zaxis[1], 0,
		
		xdot, ydot, zdot, 1
	];
}