/*
 * drawers.scad
 *
 * Part of the Modular Drawer System.
 *
 * (c) 2015 max thom stahl. Released under the Creative Commons Share-Alike
 * license. See LICENSE for details.
 */

include <configuration.scad>
include <connectors.scad>

module single_drawer() {
  difference() {
    cube([UNIT_Z-WALL_THICKNESS, UNIT_Y, UNIT_X]);
    translate([WALL_THICKNESS, WALL_THICKNESS, WALL_THICKNESS])
      cube([UNIT_Z - 3*WALL_THICKNESS, UNIT_Y - 2*WALL_THICKNESS, UNIT_X]);
    translate([UNIT_Z - WALL_THICKNESS, UNIT_Y/2, UNIT_X])
      rotate([0, 270, 0])
      cylinder(d=UNIT_X/2, h=WALL_THICKNESS);
  }
}
