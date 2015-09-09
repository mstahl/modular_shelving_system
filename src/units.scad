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

module unit(w, h) {
  difference() {
    cube([(UNIT_X+GROOVE_DEPTH)*w-GROOVE_DEPTH, (UNIT_Y+GROOVE_DEPTH)*h-GROOVE_DEPTH, UNIT_Z]);
    translate([WALL_THICKNESS, WALL_THICKNESS, WALL_THICKNESS])
      cube([w*(UNIT_X+GROOVE_DEPTH)-2*WALL_THICKNESS-GROOVE_DEPTH, h*(UNIT_Y+GROOVE_DEPTH)-2*WALL_THICKNESS-GROOVE_DEPTH, UNIT_Z]);
  }
  for(i = [0:w-1]) {
    translate([i*(UNIT_X + GROOVE_DEPTH) + UNIT_X/2, h*(UNIT_Y+GROOVE_DEPTH)-GROOVE_DEPTH, 0])
      rotate([0,0,90])
      connector_female();
    translate([i*(UNIT_X + GROOVE_DEPTH) + UNIT_X/2, -GROOVE_DEPTH, 0])
      rotate([0,0,270])
      connector_male();
  }
  for(j = [0:h-1]) {
    translate([w*(UNIT_X + GROOVE_DEPTH) - GROOVE_DEPTH, j*(UNIT_Y + GROOVE_DEPTH) + UNIT_Y/2, 0])
      rotate([0,0,0])
      connector_female();
    translate([-GROOVE_DEPTH, j*UNIT_Y + UNIT_Y/2, 0])
      rotate([0,0,180])
      connector_male();
  }
  // Lip
  translate([WALL_THICKNESS, WALL_THICKNESS, UNIT_Z])
    lip(w);
}
