SRCS = frame1x1.scad frame2x2.scad
OBJS = $(SRCS:.scad=.stl)

.scad.stl:
	openscad $< -o $@

all: $(OBJS)
	@echo "Done"

clean:
	rm -f *.stl *.gco *.gcode
