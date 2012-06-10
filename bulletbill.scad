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


module middle()
{
difference()
{
translate([0,0,-14.5])bulletbill();
translate([-50,-50,-20])cube([100,100,20]);
translate([-50,-50,30])cube([100,100,50]);
translate([0,0,-1])difference(){cylinder(r=15,h=40);}
}
}
//base();
middle();
//bulletbill();