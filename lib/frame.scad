/*
 * frame.scad
 *
 * Part of the Modular Drawer System.
 *
 * (c) 2015 max thom stahl. Released under the Creative Commons Share-Alike
 * license. See LICENSE for details.
 */

module tab1x1() {
  difference() {
    cube([2*wall_thickness, 2*wall_thickness, frame_outer]);
    translate([-1, -1, -1]) cube([wall_thickness + 1, wall_thickness + 1, frame_outer + 2]);
  }
}

module outer_frame() {
  cube([frame_outer, frame_outer, frame_outer]);
  translate([frame_outer, frame_outer - 2*wall_thickness, 0])
     tab1x1();
  translate([frame_outer, 2*wall_thickness, 0])
    scale([1.0, -1.0, 1.0])
    tab1x1();

  translate([0, wall_thickness + tolerance, 0])
    rotate([0, 0, 180])
    scale([1.0, -1.0, 1.0])
    tab1x1();
  translate([0, frame_outer - wall_thickness - tolerance, 0])
    rotate([0, 0, 180])
    tab1x1();

  translate([wall_thickness + tolerance, frame_outer, 0])
    scale([-1.0, 1.0, 1.0])
    rotate([0, 0, 90])
    tab1x1();
  translate([frame_outer - wall_thickness - tolerance, frame_outer, 0])
    rotate([0, 0, 90])
    tab1x1();

  translate([2*wall_thickness, 0, 0])
    scale([-1.0, 1.0, 1.0])
    rotate([0, 0, 270])
    tab1x1();
  translate([frame_outer - 2*wall_thickness, 0, 0])
    rotate([0, 0, 270])
    tab1x1();
}
