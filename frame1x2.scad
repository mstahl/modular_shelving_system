/*
 * frame1x2.scad
 *
 * Use this frame with `drawer1x2`.
 *
 * Part of the Modular Drawer System.
 *
 * (c) 2015 max thom stahl. Released under the Creative Commons Share-Alike
 * license. See LICENSE for details.
 */

include <configuration.scad>;

difference() {
  outer_frame();
  translate([wall_thickness, wall_thickness, wall_thickness])
    cube([(frame_inner - wall_thickness)/2, frame_inner, frame_outer]);
  translate([3*wall_thickness/2 + frame_inner/2, wall_thickness, wall_thickness])
    cube([(frame_inner - wall_thickness)/2, frame_inner, frame_outer]);
}
