echo(version=version());

/*
* Customizable Electrophoresis Comb
* 
* Copyright (c) 2016 Adm Chrysler
* www.admchrysler.com
* Licensed under the MIT (MIT-LICENSE.txt) license.
* 
* All values are in millimeters.  Comment or uncomment desired settings.
*
*/

/* Manual settings
tooth_count = 8; // Number of wells
tooth_width = 5.6; // Width of each tooth
tooth_thickness = 1.5; // Thickness of each tooth
tooth_gap = 1.6; // Spacing between teeth.

tooth_length = 17.75;  // Length of teeth (measured perpendicular from comb)
tooth_margin = 14.545; // Width reserved on either end of comb to be free of teeth.
 */
/*8 Tooth settings
tooth_count = 8; tooth_width = 5.8; tooth_thickness = 1.5; tooth_gap = 1.6; tooth_length = 17.75; tooth_margin = 14.545;*/

/*15 Tooth settings*/
 tooth_count = 15; tooth_width = 2.8; tooth_thickness = 1.5; tooth_gap = 1.0; tooth_length = 17.75; tooth_margin = 14.545;
 
// Compatible with Bio-RAD baths.  Do not modify the following settings  
// unless you are using another manufacture.
// Upper Body
    body_x = 84.84;
    body_z = 5;
    body_y = 5;
// Handle
    handle_x = 25;
    handle_z = 5;
    handle_y = 10;
// Support blocks
    support_x = 2.72;
    support_y = 2.55;
    support_z = 2.64;


/* Translating and building dimensions */ 

// Upper body
    cube([body_x, body_y, body_z], center = false);
// Handle
    translate([(body_x-handle_x)/2, body_y, 0])
    linear_extrude(height = handle_z)
    square([handle_x, handle_y], center = false);
// Support block left
    translate([0, -support_z, 0])
    linear_extrude(height = support_z)
    square([support_x, support_y], center = false);
// Support block right
    translate([body_x-support_x, -support_z, 0])
    linear_extrude(height = support_z)
    square([support_x, support_y], center = false);


// Teeth

union() {
	Core();
	Teeth();
}

module Core() {
	union() {
	}
}

module Teeth(height) {
	translate([0, 0, 0]) union() {
		for(i = [0:tooth_count-1]) {
			translate([i * (tooth_width + tooth_gap), 0, 0]) Tooth(tooth_width, tooth_length, tooth_thickness);
		}
	}
} 

module Tooth(width, length, height) {
	translate([tooth_margin, -length, 0]) 
    cube([width, length, height], center=false);
}

module Margin(length) {
	translate([0, 0, 0]) union() {
		for(i = [0:tooth_count-1]) {
			translate([i * (tooth_width + tooth_gap), 0, 0]) Tooth(tooth_width, tooth_length, height);
		}
	}
}


// references from http://gelcombs.com/products/single-gel-combs.php