/*
 * drawer_dividers.scad
 *
 * Part of the Modular Drawer System.
 *
 * (c) 2015 max thom stahl. Released under the Creative Commons Share-Alike
 * license. See LICENSE for details.
 */

include <configuration.scad>

module divider_slot() {
  difference() {
    hull() {
      cylinder(r=2, h=UNIT_Y/2, $fn=32);
      translate([0, 0, UNIT_Y/2])
        sphere(r=2, $fn=32);
    }
    translate([-UNIT_X*5, 0, 0])
      cube([UNIT_X*10, UNIT_X*10, UNIT_X*10]);
    rotate([180, 0, 0])
      cube([DIVIDER_WIDTH, UNIT_Y*10, UNIT_Y*10], center=true);
  }
}

module dividier(size) {
}

/* !divider_slot(); */
