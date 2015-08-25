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
      cube([UNIT_Z - WALL_THICKNESS, UNIT_X * w, UNIT_Y * h]);
      hull() {
        translate([UNIT_Z - 2*WALL_THICKNESS, UNIT_X * w / 3, UNIT_Y * h / 2])
          cube([WALL_THICKNESS, UNIT_X*w/3, WALL_THICKNESS]);
        translate([UNIT_Z + 2*WALL_THICKNESS, UNIT_X * w / 3, UNIT_Y * h / 2 + 3*WALL_THICKNESS])
          cube([WALL_THICKNESS, UNIT_X*w/3, WALL_THICKNESS]);
      }
    }
    translate([WALL_THICKNESS, WALL_THICKNESS, WALL_THICKNESS])
      cube([UNIT_Z - 3*WALL_THICKNESS, w*UNIT_Y - 2*WALL_THICKNESS, h*UNIT_X]);
  }
}

