/*
 * frame1x1.scad
 *
 * Use this frame with `drawer1x1`.
 *
 * Part of the Modular Drawer System.
 *
 * (c) 2015 max thom stahl. Released under the Creative Commons Share-Alike
 * license. See LICENSE for details.
 */

// These settings will move into a header file soon
frame_outer = 35.0;
wall_thickness = 0.48 * 3;
frame_inner = frame_outer - 2*wall_thickness;

module tab1x1() {
  difference() {
    cube([2*wall_thickness, 2*wall_thickness, frame_outer]);
    translate([-1, -1, -1]) cube([wall_thickness + 1, wall_thickness + 1, frame_outer + 2]);
  }
}

module frame1x1() {
  difference() {
    cube([frame_outer, frame_outer, frame_outer]);
    translate([wall_thickness, wall_thickness, wall_thickness])
      cube([frame_inner, frame_inner, frame_outer]);
  }
  translate([frame_outer, frame_outer - 2*wall_thickness, 0])
    tab1x1();
  translate([frame_outer, 0 + wall_thickness, 0])
    tab1x1();

  translate([0, 2*wall_thickness, 0])
    rotate([0, 0, 180])
    tab1x1();
  translate([0, frame_outer - wall_thickness, 0])
    rotate([0, 0, 180])
    tab1x1();

  translate([2*wall_thickness, frame_outer, 0])
    rotate([0, 0, 90])
    tab1x1();
  translate([frame_outer - wall_thickness, frame_outer, 0])
    rotate([0, 0, 90])
    tab1x1();

  translate([wall_thickness, 0, 0])
    rotate([0, 0, 270])
    tab1x1();
  translate([frame_outer - 2*wall_thickness, 0, 0])
    rotate([0, 0, 270])
    tab1x1();
}

frame1x1();
