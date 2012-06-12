include <pins.scad>

module eyecutter()
{
	difference()
	{
		cylinder(r=12,h=20);
		rotate([0,0,-135])translate([-20,-20,-1])cube([40,20,30]);
	}

}

module bulletbill()
{
difference()
{
	scale(0.8/4)rotate_extrude() import("/home/james/Downloads/bullet2.dxf");
	translate([0,46,30])rotate([90,0,0])cylinder(r=8,h=20);
	translate([0,-26,30])rotate([90,0,0])cylinder(r=8,h=20);
	translate([0,26,30])rotate([90,0,0])pinhole(h=10);
	rotate([0,0,180])translate([0,26,30])rotate([90,0,0])pinhole(h=10);
	rotate([0,0,20])translate([0,40,65])rotate([110,0,0])eyecutter();
	mirror([0,1,0])rotate([0,0,20])translate([0,40,65])rotate([110,0,0])eyecutter();

}

}
module base()
{
difference()
{
bulletbill();
translate([-50,-50,14.5])cube([100,100,100]);
}
}

module sleeves()
{
	difference()
	{
		cylinder(r1=7,r2=5,h=3);
		translate([0,0,-1])cylinder(r=4,h=10);
	}
}

module middle()
{
difference()
{
translate([0,0,-14.5])bulletbill();
translate([-50,-50,-20])cube([100,100,20]);
translate([-50,-50,28.7])cube([100,100,50]);
translate([0,0,-1])difference(){cylinder(r=15,h=40);}
}
}
//28.7
module top()
{
difference()
{
translate([0,0,-43.2])bulletbill();
translate([-50,-50,-100])cube([100,100,100]);
}
}
//base();
//middle();
//bulletbill();
//top();

//sleeves();
module larm()
{
difference()
{
union()
{
//cube([10,33,10]);
rotate([0,90,0])scale(6)import("arm.stl");
translate([-18,24.3,0])rotate([0,-90,10])rotate([0,0,90])pin();
}

translate([-50,-50,-20])cube([100,100,20]);
}
}

//mirror([1,0,0])larm();

module eye()
{
	difference()
	{
		scale([1,1,0.3])sphere(r=9);
		translate([-10,0,-1])cube([20,20,10]);
		translate([-20,-20,-10])cube([40,40,10]);
		translate([-2,1,-10])rotate([0,0,-30])scale([1,1.5,0])cylinder(r=3,h=20,$fn=30);

	}
}

//eye();
//translate([20,0,0])mirror([1,0,0])eye();

module pupil()
{
	difference()
	{
		scale([1,1,1.3])sphere(3);
		translate([-10,-10,-10])cube([50,50,10]);
		translate([0,-10,-1])cube([50,50,10]);
	}
}
pupil();

translate([40,0,0])pupil();