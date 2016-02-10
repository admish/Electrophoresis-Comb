echo(version=version());

// Electrophoresis Comb
// http://gelcombs.com/products/single-gel-combs.php
// cubeMain([84.84, 17.2, 37.75], center = true);
// 

frame_length = 84.84; // length of frame in mm
frame_width = 4; // width of frame in mm
frame_height = 15; // height of frame in mm
frame_end_tooth_radius = frame_width / 2; // radius of first and last tooth in mm

// tooth radius calculated later
tooth_radius = 1.5; // radius of a tooth in mm
tooth_length = 25; // length of a tooth in mm
tooth_amount = 32; // number of teeth
factor = 0.75; // tooth tip / tooth base factor

z = frame_height - 1;
y = tooth_radius + (frame_width - tooth_radius - tooth_radius) / 2;
// x in for loop

module tooth(radius, length, x, y, z){
	translate ( [x, y, z] )
	cylinder (h=length, r1=radius, r2=radius*factor, $fn=60);
	translate ( [x, y, z+length] )
	sphere (r=radius*factor, $fn=60);
	}

module frame(length, width, height){
	cube ( [length, width, height] );
	}

union(){
	frame(frame_length, frame_width, frame_height);
	tooth(frame_end_tooth_radius, tooth_length+frame_height-1, 0, y, 0);
	tooth(frame_end_tooth_radius, tooth_length+frame_height-1, frame_length, y, 0);

	for (i = [0:frame_length/tooth_amount:frame_length]) {
		tooth(tooth_radius,tooth_length, i, y, z );
		}
	}