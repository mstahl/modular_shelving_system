/*
 * drawers.scad
 *
 * Part of the Modular Drawer System.
 *
 * (c) 2015 max thom stahl. Released under the Creative Commons Share-Alike
 * license. See LICENSE for details.
 */

include <configuration.scad>

module drawer(w, h) {
  difference() {
    union() {
      cube([
        UNIT_Z - WALL_THICKNESS - LIP,
        UNIT_X * w - 2*WALL_THICKNESS - DRAWER_GAP,
        UNIT_Y * h - 2*WALL_THICKNESS - DRAWER_GAP - LIP
      ]);
      hull() {
        translate([UNIT_Z - 2*WALL_THICKNESS, 2*UNIT_X * w / 3, UNIT_Y * h / 2])
          rotate([90, 0, 0])
          cylinder(d=WALL_THICKNESS, h=UNIT_X*w/3, $fn=100);
        translate([UNIT_Z + 2*WALL_THICKNESS, 2*UNIT_X * w / 3, UNIT_Y * h / 2 + 3*WALL_THICKNESS])
          rotate([90, 0, 0])
          cylinder(d=WALL_THICKNESS, h=UNIT_X*w/3, $fn=100);
      }
    }
    translate([WALL_THICKNESS, WALL_THICKNESS, WALL_THICKNESS])
      cube([
        UNIT_Z - 3*WALL_THICKNESS - LIP,
        UNIT_X*w - 4*WALL_THICKNESS - DRAWER_GAP,
        h*UNIT_Y - 2*WALL_THICKNESS - LIP - DRAWER_GAP
      ]);
  }
}

