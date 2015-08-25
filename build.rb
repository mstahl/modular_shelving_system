#!/usr/bin/env ruby

puts "+--> Building all the things:"
(1..4).each do |width|
  (1..width).each do |height|
    puts "     Building #{width}x#{height} module..."
    `/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD ./drawer_module.scad -D MODULE_WIDTH=#{width} -D MODULE_HEIGHT=#{height} -o ./build/module-#{width}x#{height}.stl`
  end
end
puts "+--> All done!"
