/*
 * drawer_module.scad
 *
 * Part of the Modular Drawer System.
 *
 * See comments for how to customize.
 *
 * (c) 2015 max thom stahl. Released under the Creative Commons Share-Alike
 * license. See LICENSE for details.
 */

include <src/configuration.scad>
include <src/connectors.scad>
include <src/drawers.scad>
include <src/drawer_dividers.scad>
include <src/units.scad>

MODULE_WIDTH = 1;
MODULE_HEIGHT = 1;

GENERATE_UNIT = 0;
GENERATE_DRAWER = 0;

DEMO = 0;

if (GENERATE_UNIT == 1) {
  unit(w=MODULE_WIDTH, h=MODULE_HEIGHT);
}
if (GENERATE_DRAWER == 1) {
  drawer(w=MODULE_WIDTH, h=MODULE_HEIGHT);
}

module demo() {
  unit(1,1);
  translate([UNIT_X + GROOVE_DEPTH, 0, 0])
    unit(1,1);
  translate([0, UNIT_Y + GROOVE_DEPTH, 0])
    unit(2,2);

  translate([2*UNIT_X + 2*GROOVE_DEPTH, UNIT_Y + GROOVE_DEPTH, 0])
    unit(1,1);
  translate([2*UNIT_X + 2*GROOVE_DEPTH, 2*(UNIT_Y + GROOVE_DEPTH), 0])
    unit(1,1);
}

if (DEMO == 1) {
  demo();
}
