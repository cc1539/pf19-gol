uniform sampler2D grid;

vec4 getSample(vec2 coord) {
	return texture(grid,coord/textureSize(grid,0));
}

void main() {
	
	bool alive = false;
	
	// how many live cells does this cell have around it?
	int neighbors = 0;
	for(int i=-1;i<=1;i++) {
	for(int j=-1;j<=1;j++) {
		
		// determine if the cell of interest is alive
		bool cell_alive = false;
		vec2 offset = vec2(float(i),float(j));
		if(getSample(gl_FragCoord.xy+offset).x>0.5) {
			cell_alive = true;
		}
		
		// if it's a center cell, remember if it's alive
		// if it's not, increment the neighbor counter
		if(!(i==0 && j==0)) {
			if(cell_alive) {
				neighbors++;
			}
		} else {
			alive = cell_alive;
		}
	}
	}
	
	// a live cell with more than three neighbors dies, as if by overpopulation
	// a live cell with fewer than two neighbors dies, as if by underpopulation
	// a dead cell with exactly three neighbors comes to life, as if by reproduction
	// a cell with exactly two neighbors undergoes no changes
	
	
	if(neighbors>3 || neighbors<2) {
		gl_FragColor = vec4(vec3(0.0),1.0);
	} else if(neighbors==3) {
		gl_FragColor = vec4(vec3(1.0),1.0);
	} else {
		gl_FragColor = vec4(vec3(alive?1.0:0.0),1.0);
	}
	
	/*
	switch(neighbors) {
		case 0: gl_FragColor = vec4(vec3(0.0,0.0,0.0),1.0); break;
		case 1: gl_FragColor = vec4(vec3(1.0,0.0,0.0),1.0); break;
		case 2: gl_FragColor = vec4(vec3(0.0,1.0,0.0),1.0); break;
		case 3: gl_FragColor = vec4(vec3(0.0,0.0,1.0),1.0); break;
		case 4: gl_FragColor = vec4(vec3(0.0,1.0,1.0),1.0); break;
		case 5: gl_FragColor = vec4(vec3(1.0,0.0,1.0),1.0); break;
		case 6: gl_FragColor = vec4(vec3(1.0,1.0,0.0),1.0); break;
		case 7: gl_FragColor = vec4(vec3(0.5,0.5,0.5),1.0); break;
		case 8: gl_FragColor = vec4(vec3(1.0,1.0,1.0),1.0); break;
	}
	*/
}