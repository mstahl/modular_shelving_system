/*
 * units.scad
 *
 * Part of the Modular Drawer System.
 *
 * (c) 2015 max thom stahl. Released under the Creative Commons Share-Alike
 * license. See LICENSE for details.
 */

include <configuration.scad>
include <connectors.scad>

module single_frame() {
  difference() {
    cube([UNIT_X, UNIT_Y, UNIT_Z]);
    translate([WALL_THICKNESS, WALL_THICKNESS, WALL_THICKNESS])
      cube([UNIT_X - wall_thickness - 2*drawer_gap, UNIT_Y - wall_thickness - 2*drawer_gap, UNIT_Z]);
  }
  translate([UNIT_X, UNIT_Y/2, 0])
    rotate([0,0,0])
    connector_female();
  translate([UNIT_X/2, UNIT_Y, 0])
    rotate([0,0,90])
    connector_female();
  translate([UNIT_X/2, -GROOVE_DEPTH, 0])
    rotate([0,0,270])
    connector_male();
  translate([-GROOVE_DEPTH, UNIT_Y/2, 0])
    rotate([0,0,180])
    connector_male();
}

module single_drawer_cutout() {
  translate([WALL_THICKNESS, WALL_THICKNESS, WALL_THICKNESS])
    cube([UNIT_X - 2*WALL_THICKNESS, UNIT_Y - 2*WALL_THICKNESS, UNIT_Z]);
}

module single_unit() {
  difference() {
    single_frame();
    single_drawer_cutout();
  }
}

single_unit();
