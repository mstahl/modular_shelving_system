/*
 * frame.scad
 *
 * Part of the Modular Drawer System.
 *
 * (c) 2015 max thom stahl. Released under the Creative Commons Share-Alike
 * license. See LICENSE for details.
 */

//-[ Connector settings ]------------------------------------------------------

/* old_tolerance = tolerance; */
/* tolerance = 0.5; */

connector_thickness = 5.0;
groove_top_width    = frame_outer/2;
groove_bottom_width = frame_outer/3;
groove_depth        = 3.0;
tongue_top_width    = frame_outer/2 - 2*tolerance;
tongue_bottom_width = frame_outer/3 - 2*tolerance;
tongue_depth        = 3.0;

groove_top_y0    = (frame_outer - groove_top_width)/2;
groove_top_y1    = groove_top_y0 + groove_top_width;
groove_bottom_y0 = (frame_outer - groove_bottom_width)/2;
groove_bottom_y1 = groove_bottom_y0 + groove_bottom_width;

tongue_top_y0    = (frame_outer - tongue_top_width)/2;
tongue_top_y1    = tongue_top_y0 + tongue_top_width;
tongue_bottom_y0 = (frame_outer - tongue_bottom_width)/2;
tongue_bottom_y1 = tongue_bottom_y0 + tongue_bottom_width;

module groove_cutout() {
  polyhedron(points=[
    [0, -groove_bottom_width/2, 0],                                          // [0]
    [0, -groove_top_width/2, frame_outer],                                   // [1]
    [0, groove_top_width/2, frame_outer],                                    // [2]
    [0, groove_bottom_width/2, 0],                                           // [3]
    [connector_thickness, -groove_bottom_width/2 + groove_depth, 0],         // [4]
    [connector_thickness, -groove_top_width/2 + groove_depth, frame_outer],  // [5]
    [connector_thickness, groove_top_width/2 - groove_depth, frame_outer],   // [6]
    [connector_thickness, groove_bottom_width/2 - groove_depth, 0]           // [7]
  ], faces=[
    [5,6,7,4], [1,2,6,5], [2,1,0,3], [4,7,3,0], [1,5,4,0], [6,2,3,7]
  ]);
}

module tongue() {
  polyhedron(points=[
    [connector_thickness - wall_thickness, -tongue_top_width/2, frame_outer], // [0]
    [connector_thickness - wall_thickness, tongue_top_width/2, frame_outer],  // [1]
    [connector_thickness - wall_thickness, tongue_bottom_width/2, 0],         // [2]
    [connector_thickness - wall_thickness, -tongue_bottom_width/2, 0],        // [3]
    [0, -tongue_top_width/2 + groove_depth, frame_outer],                     // [4]
    [0, tongue_top_width/2 - groove_depth, frame_outer],                      // [5]
    [0, tongue_bottom_width/2 - groove_depth, 0],                             // [6]
    [0, -tongue_bottom_width/2 + groove_depth, 0]                             // [7]
  ], faces=[
    [0,1,2,3], [5,4,7,6], [4,5,1,0], [4,0,3,7], [1,5,6,2], [3,2,6,7]
  ]);
}

module connector_female() {
  difference() {
    cube([connector_thickness, frame_outer, frame_outer]);
    translate([wall_thickness, frame_outer/2, 0]) groove_cutout();
  }
}

module connector_male() {
  union() {
    cube([wall_thickness, frame_outer, frame_outer]);
    translate([wall_thickness, frame_outer/2, 0]) tongue();
  }
}

module outer_frame() {
  cube([frame_outer, frame_outer, frame_outer]);
}

module whole_frame() {
  outer_frame();

  translate([wall_thickness, frame_outer, 0])
    rotate([0, 0, 180])
    connector_male();

  translate([frame_outer, frame_outer - wall_thickness, 0])
    rotate([0, 0, 90])
    connector_male();

  translate([frame_outer - wall_thickness, 0, 0])
    rotate([0, 0, 0])
    connector_female();

  translate([0, wall_thickness, 0])
    rotate([0, 0, 270])
    connector_female();
  translate([frame_outer, -connector_thickness + wall_thickness, 0])
    cube([connector_thickness - wall_thickness, connector_thickness, frame_outer]);
}
