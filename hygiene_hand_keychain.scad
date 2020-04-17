$fn=50;
union () {
    difference() {
        minkowski() {
            cube( size = [30,90,9] );
            cylinder(r=2);
        }
        translate([-2, 30, -5])
            minkowski() {
                cube( size = [20,50,20] );
                cylinder(r=2);
            }
        translate([13.5, 13.5, -5])
            cylinder( h=20, r=10 );
    }
    translate([20, 85, 0])
            minkowski() {
                cube( size = [10,10,9] );
                cylinder(r=2);
            }
    difference () {
    translate([20, -6, 0])
            minkowski() {
                cube( size = [10,7,9] );
                cylinder(r=2);
            }
            translate ([21,-5,-3])
            cube(size = [8,6,20] );
        }
        
}
