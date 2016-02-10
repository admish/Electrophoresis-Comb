echo(version=version());

// Number of teeth. Tooth width is calculated from tooth count, gap, and available space.
// Taking references from http://gelcombs.com/products/single-gel-combs.php
tooth_count = 8; // Number of wells
tooth_width = 5.8; // Width of each tooth
tooth_thickness = 0; // Thickness of each tooth
tooth_gap = 1.6; // Spacing between teeth.

tooth_length = 17.75;  // Length of teeth (measured perpendicular from comb)
tooth_margin = 0; // Width reserved on either end of comb to be free of teeth.

front_tooth_height = 1.5;
rear_tooth_height = 0;

/* Upper Body */

cube([84.84, 6.45, 20], center = true);

comb_x = 55.75; // Width of lower section of comb core.
comb_y = 17.2; // Length (narrow dimension) or lower section of comb core, not counting teeth.
comb_z = 3.0; // Height of lower section of comb core (from base).
raised_x = 84.84;// Width of raised section of comb core (centered in lower section).
raised_y = 5;// Length (narrow dimension) of raised section of comb core (centered in lower section).
raised_z = 7.25;// Height of raised section of comb core (from base).

/* [Hidden] */

// Width available for teeth (comb width minus margins).
tooth_span = comb_x - (2 * tooth_margin);

// Individual tooth width (maximum to fill span with count teeth with gap betwen each).
// tooth_width = (tooth_span - (tooth_count - 1) * tooth_gap) / tooth_count;

echo(tooth_width);

union() {
	Core();
	Teeth(rear_tooth_height);
	rotate([0, 0, 180]) Teeth(front_tooth_height);
}

module Core() {
	union() {
		translate([0, 0, comb_z/2]) cube([comb_x, comb_y, comb_z], center=true);
		translate([0, 0, raised_z/2]) cube([raised_x, raised_y, raised_z], center=true);
	}
}

module Teeth(height) {
	translate([-tooth_span/2 + tooth_width/2, comb_y/2, 0]) union() {
		for(i = [0:tooth_count-1]) {
			translate([i * (tooth_width + tooth_gap), 0, 0]) Tooth(tooth_width, tooth_length, height);
		}
	}
}

module Tooth(width, length, height) {
	translate([0, length/2, height/2]) cube([width, length, height], center=true);
}
