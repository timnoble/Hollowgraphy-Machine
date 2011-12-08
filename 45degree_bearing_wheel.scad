difference(){
	union(){
		cylinder (h = 10,  r1 = 25, r2 = 15, center = "true");
		translate([0,0,-10])cylinder (h = 10,  r1 = 15 , r2 = 25, center = "true");
		}
	translate([0, 0, -5])cylinder (h = 20, r  = 11, center = "true");
	translate([0, 0, -20])cylinder (h = 40, r = 8, center = "true");
}