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

GENERATE_UNIT = 1;
GENERATE_DRAWER = 0;

if (GENERATE_UNIT == 1) {
  unit(w=MODULE_WIDTH, h=MODULE_HEIGHT);
}
if (GENERATE_DRAWER == 1) {
  drawer(w=MODULE_WIDTH, h=MODULE_HEIGHT);
}
