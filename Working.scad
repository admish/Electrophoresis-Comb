echo(version=version());

// Number of teeth. Tooth width is calculated from tooth count, gap, and available space.
// Taking references from http://gelcombs.com/products/single-gel-combs.php
tooth_count = 8; // Number of wells
tooth_width = 5.6; // Width of each tooth
tooth_thickness = 0; // Thickness of each tooth
tooth_gap = 1.6; // Spacing between teeth.

tooth_length = 17.75;  // Length of teeth (measured perpendicular from comb)
tooth_margin = 14.545; // Width reserved on either end of comb to be free of teeth.

front_tooth_height = 1.5;
rear_tooth_height = 0;

// Upper Body
cube([84.84, 10, 6.5], center = false);

// Support block
    //color("red")
    translate([0, -2.64, 0])
    linear_extrude(height = 2.55)
    square([2.72, 2.64], center = false);
// Support block
    //color("red")
    translate([82.12, -2.64, 0])
    linear_extrude(height = 2.55)
    square([2.72, 2.64], center = false);

echo(tooth_width);

union() {
	Core();
	Teeth(rear_tooth_height);
	rotate([0, 0, 0]) Teeth(front_tooth_height);
}

module Core() {
	union() {
		//translate([0, 0, comb_z/2]) cube([comb_x, comb_y, comb_z], center=false);
		//translate([0, 0, raised_z/2]) cube([raised_x, raised_y, raised_z], center=false);
	}
}

module Teeth(height) {
	translate([0, 0, 0]) union() {
		for(i = [0:tooth_count-1]) {
			translate([i * (tooth_width + tooth_gap), 0, 0]) Tooth(tooth_width, tooth_length, height);
		}
	}
}

module Tooth(width, length, height) {
	translate([tooth_margin, -length, 0]) 
    cube([width, length, height], center=false);
}
