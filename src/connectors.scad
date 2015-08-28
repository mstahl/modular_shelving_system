/*
 * connectors.scad
 *
 * Part of the Modular Drawer System.
 *
 * (c) 2015 max thom stahl. Released under the Creative Commons Share-Alike
 * license. See LICENSE for details.
 */

include <configuration.scad>

module connector(w_top, w_bottom) {
  difference() {
    polyhedron(points=[
      [0, -w_top/2 - WALL_THICKNESS, UNIT_Z],                         // [0]
      [0, w_top/2 + WALL_THICKNESS, UNIT_Z],                          // [1]
      [GROOVE_DEPTH, w_top/2-GROOVE_DEPTH + WALL_THICKNESS, UNIT_Z],  // [2]
      [GROOVE_DEPTH, -w_top/2+GROOVE_DEPTH - WALL_THICKNESS, UNIT_Z], // [3]
      [0, -w_bottom/2 - WALL_THICKNESS, 0],                           // [4]
      [GROOVE_DEPTH, -w_bottom/2+GROOVE_DEPTH - WALL_THICKNESS, 0],   // [5]
      [GROOVE_DEPTH, w_bottom/2-GROOVE_DEPTH + WALL_THICKNESS, 0],    // [6]
      [0, w_bottom/2 + WALL_THICKNESS, 0]                             // [7]
    ], faces=[
      [0,3,5,4], [5,6,7,4], [6,2,1,7], [0,1,2,3], [3,2,6,5], [1,0,4,7]
    ]);
    polyhedron(points=[
      [0, -w_top/2, UNIT_Z],                         // [0]
      [0, w_top/2, UNIT_Z],                          // [1]
      [GROOVE_DEPTH, w_top/2-GROOVE_DEPTH, UNIT_Z],  // [2]
      [GROOVE_DEPTH, -w_top/2+GROOVE_DEPTH, UNIT_Z], // [3]
      [0, -w_bottom/2, 0],                           // [4]
      [GROOVE_DEPTH, -w_bottom/2+GROOVE_DEPTH, 0],   // [5]
      [GROOVE_DEPTH, w_bottom/2-GROOVE_DEPTH, 0],    // [6]
      [0, w_bottom/2, 0]                             // [7]
    ], faces=[
      [0,3,5,4], [5,6,7,4], [6,2,1,7], [0,1,2,3], [3,2,6,5], [1,0,4,7]
    ]);
  }
}

module connector_female() {
  connector(GROOVE_W_TOP, GROOVE_W_BOTTOM, GROOVE_DEPTH);
}

module connector_male() {
  scale([-1,1,1])
    connector(GROOVE_W_TOP - 2*WALL_THICKNESS - 0.5, GROOVE_W_BOTTOM - 2*WALL_THICKNESS - 0.5, GROOVE_DEPTH);
}
