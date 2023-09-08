// Simple hook to hang over partition or door.
// This design is parametric:
// turn off View->Hide Customizer to get an editor for these variables.
// All dimensions are in mm.
// Note that parameters are not sanity-checked.


// width of entire strip
width = 15;

// thickness of partition
depth = 8;

// thickness of entire strip
thickness = 2.5;

// how far clip descends behind partition
back_drop = 25;

// how far it drops in front of partition
front_drop = 50;

// inside radius of the hook part
hook_radius = 10;

// how far straight part of hook rises above curved part
hook_rise = 10;

// geometry resolution settings
$fa = 3;
$fs = 0.2;

linear_extrude(width) {
  // the back drop
  translate([-hook_radius-depth-2*thickness, front_drop-back_drop])
    square([thickness, back_drop]);

  // fillet
  translate([-depth-hook_radius-thickness, front_drop])
  rotate(90)
    intersection() {
      circle(r=thickness);
      square(thickness);
    }

  // the top bit
  translate([-hook_radius-thickness-depth, front_drop])
    square([depth, thickness]);

  // fillet
  translate([-hook_radius-thickness, front_drop])
    intersection() {
     circle(r=thickness);
     square(thickness);
    }

  // the front drop
  translate([-hook_radius-thickness, 0])
    square([thickness, front_drop]);

  // the hook
  intersection() {
    translate([-hook_radius-thickness, -2*(hook_radius+thickness)])
      square(2*(hook_radius+thickness));
    difference() {
      circle(r=hook_radius+thickness);
      circle(r=hook_radius);
    }
  }

  // the hook riser
  translate([hook_radius, 0])
    square([thickness, hook_rise]);

  // round its end
  translate([hook_radius+thickness/2, hook_rise])
    circle(r=thickness/2);
}
