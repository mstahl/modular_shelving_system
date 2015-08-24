/*
 * frame2x2.scad
 *
 * Use this frame with `drawer2x2`.
 *
 * Part of the Modular Drawer System.
 *
 * (c) 2015 max thom stahl. Released under the Creative Commons Share-Alike
 * license. See LICENSE for details.
 */

include <configuration.scad>;
include <lib/frame.scad>;

cavity_width = (frame_inner - wall_thickness)/2;
cavity_height = (frame_inner - wall_thickness)/2;
cavity_depth = frame_outer;

difference() {
  whole_frame();
  translate([wall_thickness, wall_thickness, wall_thickness])
    cube([cavity_width, cavity_height, cavity_depth]);
  translate([2*wall_thickness + cavity_width, wall_thickness, wall_thickness])
    cube([cavity_width, cavity_height, cavity_depth]);
  translate([wall_thickness, 2*wall_thickness + cavity_height, wall_thickness])
    cube([cavity_width, cavity_height, cavity_depth]);
  translate([2*wall_thickness + cavity_width, 2*wall_thickness + cavity_height, wall_thickness])
    cube([cavity_width, cavity_height, cavity_depth]);
}
