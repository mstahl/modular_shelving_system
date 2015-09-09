Modular Shelving System
=======================
Building upon ideas I found around Thingiverse but mostly from
[FatalError3141](http://www.thingiverse.com/thing:398548)'s excellent Parts
Tray Drawers, I wanted to be able to print more sets of drawers and interlock
them somehow.

This is still a work in progress. The outer frame modules are pretty much set,
but I'm still experimenting with what the drawers should look like.

## Usage

To make a wide variety of STLs for modules from 1x1 to 3x3,

    $ ruby ./build.sh

...and _shazam!_ now the build directory is filled with STLs you can use. This
is also how the files on Thingiverse are generated for each release.

If you instead want to make your own module STLs, you can do so by using OpenSCAD's
`-D` option,

    $ openscad -D MODULE_WIDTH=5 -D MODULE_HEIGHT=2 -D GENERATE_UNIT=1 ./drawer_module.scad -o 5x2-unit.stl
    $ openscad -D MODULE_WIDTH=3 -D MODULE_HEIGHT=6 -D GENERATE_DRAWER=1 ./drawer_module.scad -o 3x6-drawer.stl

...to make a 5x2 unit and a 3x6 drawer. The allowable options are....

| Option            | Purpose                   | Values allowed |
| ----------------- | ------------------------- | -------------- |
| `MODULE_WIDTH`    | Width in module units     | 1, 2, 3, ...   |
| `MODULE_HEIGHT`   | Height in module units    | 1, 2, 3, ...   |
| `GENERATE_UNIT`   | Set to 1 to make a unit   | 0 or 1         |
| `GENERATE_DRAWER` | Set to 1 to make a drawer | 0 or 1         |

_Important note:_ Don't set both `GENERATE_UNIT` and `GENERATE_DRAWER` at the
same time. Your unit and drawer will be combined into the same thing and they
will look jacked up.
