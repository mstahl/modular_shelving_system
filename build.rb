#!/usr/bin/env ruby

puts "+--> Building all the things:"
puts "     Building modules"
(1..2).each do |width|
  (1..width).each do |height|
    puts "     Building #{width}x#{height} module..."
    `/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD \
      ./drawer_module.scad \
      -D MODULE_WIDTH=#{width} \
      -D MODULE_HEIGHT=#{height} \
      -D GENERATE_UNIT=1 \
      -D GENERATE_DRAWER=0 \
      -D MODULE_HEIGHT=#{height} \
      -o ./build/module-#{width}x#{height}.stl`
  end
end
puts "+--> Building drawers"
(1..2).each do |width|
  (1..2).each do |height|
    puts "     Building #{width}x#{height} drawer..."
    `/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD \
      ./drawer_module.scad \
      -D MODULE_WIDTH=#{width} \
      -D MODULE_HEIGHT=#{height} \
      -D GENERATE_UNIT=0 \
      -D GENERATE_DRAWER=1 \
      -D MODULE_HEIGHT=#{height} \
      -o ./build/drawer-#{width}x#{height}.stl`
  end
end
puts "+--> All done!"
