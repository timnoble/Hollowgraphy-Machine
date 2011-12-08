include <MCAD/motors.scad>
include <MCAD/metric_fastners.scad>
include <MCAD/math.scad>

//motor (Nema17);

//cylinder (r=4, h=10);
mount_thickness = 15;
slot_width = 3;
slot_depth = 4;
tolerance = .02;
hole_offset = -30;
axle_spacing = 60;
bolt_hole_size = 3.5;
bolt_hole_distance = 1.220*mm_per_inch;
slide_distance = 0;
pilot_diameter = 29;

module axle_mount ()
{
difference(){
	translate([0, -5, -7.5])cube([20, 70, mount_thickness], center = true);
 	translate([0, hole_offset, 1]) rotate (a = [0, 180, 90]) flat_nut(8+tolerance);
	%translate([0, hole_offset, 0])cylinder(r = (4 + tolerance), h = 50, center = true);
	}
}
module double_axle_side ()
{
difference(){
	union(){
		translate ([axle_spacing/2, hole_offset, mount_thickness])axle_mount ();
		translate ([-axle_spacing/2, hole_offset, mount_thickness])axle_mount ();	
		translate ([0,-20,7.5])cube ([40, 40, 15], center = true);
		}
	translate([0, -75, 0])rotate(a = [0,0,45])cube ([40,40, 17], center = false);
	translate([0, -5, 15 - (slot_depth-tolerance)/2]) cube([100, slot_width, slot_depth+tolerance], center = true);
	translate([0, -5, (slot_depth-tolerance)/2]) cube([100, slot_width, slot_depth+tolerance], center = true);

	}
}



module nema17_mount_holes(){
for (x = [-1,1])
	{
		for (y = [-1,1])
		{
			translate([x*bolt_hole_distance/2,y*bolt_hole_distance/2,0])
			{
				translate([0,slide_distance/2,0]) cylinder(r =(bolt_hole_size/2 + tolerance), h = 30, center = true);
				translate([0,-slide_distance/2,0]) cylinder(r =(bolt_hole_size/2 + tolerance), h = 30, center = true);
				translate([0,0,6]) cylinder(r =(4), h = 10, center = true);

			}
		}
	}

translate([0,0,0]) cylinder(r = (pilot_diameter/2 + tolerance), h = 30, center = true);
}


//build the object below from modules above
//

//tension block left
/*
difference(){
union(){
translate([0, 12.5, 10])cube ([12, 55, 50], center = true);
translate([0, 27.5, -5])cube([12, 25, 40], center = true);	
}
	translate([0, -5, 0])double_axle_side();
	translate ([0, mount_thickness, -5])rotate(a = [90,0,0])double_axle_side();
	translate([0, 25, 5])rotate(a = [0, 0, 0])union(){
		translate([0, 0, 12.5])rotate(a = [0, 90, 0])cylinder(r = 4.1, h = 30, center = true);
		cube([30, 8.2, 25], center = true);
		translate([5, 0, 0])cube([10, 13.3, 40], center = true);
		translate([0, 0, -12.5])rotate(a = [0, 90, 0])cylinder(r = 4.1, h = 30, center = true);
	}
}
*/
//tension block right
/*
difference(){
union(){
translate([0, 12.5, 10])cube ([12, 55, 50], center = true);
translate([0, 27.5, -5])cube([12, 25, 40], center = true);	
}
	translate([0, -5, 0])double_axle_side();
	translate ([0, mount_thickness, -5])rotate(a = [90,0,0])double_axle_side();
	translate([0, 25, 5])rotate(a = [0, 0, 180])union(){
		translate([0, 0, 12.5])rotate(a = [0, 90, 0])cylinder(r = 4.1, h = 30, center = true);
		cube([30, 8.2, 25], center = true);
		translate([5, 0, 0])cube([10, 13.3, 40], center = true);
		translate([0, 0, -12.5])rotate(a = [0, 90, 0])cylinder(r = 4.1, h = 30, center = true);
	}
}
*/

//side axle piece
/*
double_axle_side();
*/

//belt clamp (reversible)
/*
difference(){
	union(){
		translate([0,0,50])cube ([80, 30, 15], center = true);
		translate([0,-2,41])rotate([-45, 0, 0])cube ([10, 20, 15], center = true);
		}
	translate([0,12,55])rotate([-45, 0, 0])cube ([80, 30, 15], center = true);
	translate([30,-8,50])cylinder(r = 4.1, h = 30, center = true);
	translate([-30,-8,50])cylinder(r = 4.1, h = 30, center = true);
	translate([0, 0, 45])rotate([-45, 0, 0])cube([3, 12, 65], center = true);
//	translate([0,0, 32.5])rotate([0, 0, 0])cube([3, 60, 20], center = true);
//	translate([0, 0, 35])rotate([0, 90, 0])cylinder(r = bolt_hole_size/2, h = 20, center = true);
	};
*/

//belt clip
difference(){
	union(){
		cube ([8, 15, 25], center = true);
	}
	translate([0, 0, 8])rotate([0, 90, 0])cylinder(r = bolt_hole_size/2, h = 20, center = true);
	translate([0,0,5])cube ([1.5, 20, 25], center = true);	
	translate([-4,0, -13]) rotate([0, 45, 0]) cube([4, 20, 4], center = true);
	translate([4,0, -13]) rotate([0, 45, 0]) cube([4, 20, 4], center = true);

}
//motor mount block
/*
translate([-40, 0, 0])
difference(){
	union(){
		translate([0, 20, 20])cube ([8, 70, 70], center = true);
		translate([15, -5, 2.5])cube([30, 20, 35], center = true);
		translate([15, 2.5, -5])cube([30, 35, 20], center = true);
		}
	translate([0, -5, 0])double_axle_side();
	translate ([0, mount_thickness, -5])rotate(a = [90,0,0])double_axle_side();
	translate([0, 27, 27])rotate(a = [45, 0, 0])rotate(a = [0, 90, 0])nema17_mount_holes();
}
*/