/*
 * configuration.scad
 *
 * Part of the Modular Drawer System.
 *
 * (c) 2015 max thom stahl. Released under the Creative Commons Share-Alike
 * license. See LICENSE for details.
 */

//--[ Unit sizes ]--------------------------------------------------------------

UNIT_X = 32.0; // These set the width/height/depth of the smallest possible
UNIT_Y = 32.0; // module for this system.
UNIT_Z = 64.0;

//--[ Global wall thickness ]---------------------------------------------------

calculated_extrusion_width = 0.48;
WALL_THICKNESS = calculated_extrusion_width * 3;

//--[ Drawer sizes ]------------------------------------------------------------

DRAWER_GAP = 0.5;
LIP = 1.0;

//--[ Drawer dividers ]---------------------------------------------------------

DIVIDER_WIDTH = 2*calculated_extrusion_width;

//--[ Connector settings ]------------------------------------------------------

GROOVE_W_TOP = UNIT_Y / 2;
GROOVE_W_BOTTOM = UNIT_Y / 3;
GROOVE_DEPTH = 3.0;
