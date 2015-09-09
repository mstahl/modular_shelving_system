/*
 * drawers.scad
 *
 * Part of the Modular Drawer System.
 *
 * (c) 2015 max thom stahl. Released under the Creative Commons Share-Alike
 * license. See LICENSE for details.
 */

include <configuration.scad>

module drawer(w, h) {
  difference() {
    union() {
      cube([
        UNIT_Z - WALL_THICKNESS,
        UNIT_X * w - 2*WALL_THICKNESS - DRAWER_GAP,
        UNIT_Y * h - 2*WALL_THICKNESS - DRAWER_GAP - LIP
      ]);
      hull() {
        translate([UNIT_Z - 2*WALL_THICKNESS, 2*UNIT_X * w / 3 - WALL_THICKNESS, UNIT_Y * h / 4])
          rotate([90, 0, 0])
          cylinder(d=WALL_THICKNESS, h=UNIT_X*w/3, $fn=100);
        translate([UNIT_Z + 2*WALL_THICKNESS, 2*UNIT_X * w / 3 - WALL_THICKNESS, UNIT_Y * h / 4 + 3*WALL_THICKNESS])
          rotate([90, 0, 0])
          cylinder(d=WALL_THICKNESS, h=UNIT_X*w/3, $fn=100);
      }
    }
    translate([DRAWER_WALL_THICKNESS, DRAWER_WALL_THICKNESS, DRAWER_WALL_THICKNESS])
      cube([
        UNIT_Z - WALL_THICKNESS - LIP - DRAWER_WALL_THICKNESS,
        UNIT_X*w - 2*WALL_THICKNESS - DRAWER_GAP - 2*DRAWER_WALL_THICKNESS,
        h*UNIT_Y - 2*WALL_THICKNESS - LIP - DRAWER_GAP
      ]);
    translate([UNIT_Z - WALL_THICKNESS, 0, 0])
      rotate([180, 0, 90])
      scale([1,-1,1])
      lip();
  }
}

module lip(w) {
  polyhedron(points=[
    [0,0,-LIP], [0,0,0], [0,LIP,0],
    [(UNIT_X + GROOVE_DEPTH)*w-2*WALL_THICKNESS-GROOVE_DEPTH,0,-LIP],
    [(UNIT_X + GROOVE_DEPTH)*w-2*WALL_THICKNESS-GROOVE_DEPTH,0,0],
    [(UNIT_X + GROOVE_DEPTH)*w-2*WALL_THICKNESS-GROOVE_DEPTH,LIP,0]
  ], faces=[
    [1,4,3,0], [2,5,4,1], [5,2,0,3], [4,5,3], [2,1,0]
  ]);
}
