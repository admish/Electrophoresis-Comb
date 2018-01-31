echo(version=version());

tooth_count = 1; // Number of wells
tooth_width = 48.8; // Width of each tooth
tooth_thickness = 1.5; // Thickness of each tooth
tooth_gap = 1.6; // Spacing between teeth.
tooth_length = 17.75;  // Length of teeth (measured perpendicular from bottom of support)
text_label = "Your Text Here"; // Label or name you want to appear on the side
tooth_support = 6;// Height of upper support on teeth

ladder_width = 5.6;
teeth_length = 57; //Width of the overall comb

union() { 
    // Teeth support  
    translate([0, 0, 0])
    linear_extrude(height = 6) 
    square([(tooth_width*tooth_count)+(tooth_gap*(tooth_count-1)), tooth_thickness], center = true);

// Teeth support  
    translate([0, 0, -tooth_length])
    color("Blue")
    linear_extrude(height = tooth_length) 
    square([(tooth_width*tooth_count)+(tooth_gap*(tooth_count-1)), tooth_thickness], center = true);




    
}