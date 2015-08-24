/*
 * frame1x1.scad
 *
 * Use this frame with `drawer1x1`.
 *
 * Part of the Modular Drawer System.
 *
 * (c) 2015 max thom stahl. Released under the Creative Commons Share-Alike
 * license. See LICENSE for details.
 */

include <configuration.scad>;
include <lib/frame.scad>;

difference() {
  whole_frame();
  translate([wall_thickness, wall_thickness, wall_thickness])
    cube([frame_inner, frame_inner, frame_outer]);
}
