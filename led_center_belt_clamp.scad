
difference(){
	union(){
		cylinder (r = 15, h = 30, center = true);
		}
	translate ([15, 25, 0])cylinder (r = 20, h = 30, center = true);
	translate ([15, -25, 0])cylinder (r = 20, h = 30, center = true);
	translate ([-30, 0, 0])rotate([0, 0, 45])cube ([40, 40, 30], center = true);
	cube([40, 4, 10], center = true);
	translate([0, 0, 10])rotate([0, 90, 0])cylinder (r = 3.5/2, h = 30, center = true);
	translate([0, 0, -10])rotate([0, 90, 0])cylinder (r = 3.5/2, h = 30, center = true);
	translate([8, 0, 10])cube([3,6,10], center = true);
	translate([8, 0, -10])cube([3,6,10], center = true);

};

translate([-25, 0, 0])
difference(){
	intersection(){
		union(){
			cylinder (r = 15, h = 30, center = true);
			}
		translate ([-30, 0, 0])rotate([0, 0, 45])cube ([40, 40, 30], center = true);

	}
	translate([0, 0, 10])rotate([0, 90, 0])cylinder (r = 3.5/2, h = 30, center = true);
	translate([0, 0, -10])rotate([0, 90, 0])cylinder (r = 3.5/2, h = 30, center = true);
	translate([-15, 0, 10])rotate([0, 90, 0])cylinder (r = 4, h = 10, center = true);
	translate([-15, 0, -10])rotate([0, 90, 0])cylinder (r = 4, h = 10, center = true);
	translate([-5, 0, 0])rotate([0, 90, 0])cylinder (r = 3, h = 20, center = true);

};