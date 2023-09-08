all: hook.stl hook.png

hook.stl: hook.scad
	openscad $< -o $@

hook.png: hook.scad
	openscad $< -o $@
