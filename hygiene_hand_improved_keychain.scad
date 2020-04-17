$fn=50;
// chamfercyl - create a cylinder with round chamfered ends
// created by enif - https://reprap.org/forum/profile.php?313,35931
// as seen in this thread - https://reprap.org/forum/read.php?313,859885,859885
module chamfercyl(
   r,              // cylinder radius
   h,              // cylinder height
   b=0,            // bottom chamfer radius (=0 none, >0 outside, <0 inside)
   t=0,            // top chamfer radius (=0 none, >0 outside, <0 inside)
   offset=[[0,0]], // optional offsets in X and Y to create
                   // convex hulls at slice level
   slices=10,      // number of slices used for chamfering
   eps=0.01,       // tiny overlap of slices
){
    astep=90/slices;
    hull()for(o = offset)
       translate([o[0],o[1],abs(b)-eps])cylinder(r=r,h=h-abs(b)-abs(t)+2*eps);
    if(b)for(a=[0:astep:89.999])hull()for(o = offset)
       translate([o[0],o[1],abs(b)-abs(b)*sin(a+astep)-eps])
          cylinder(r2=r+(1-cos(a))*b,r1=r+(1-cos(a+astep))*b,h=(sin(a+astep)-sin(a))*abs(b)+2*eps);
    if(t)for(a=[0:astep:89.999])hull()for(o = offset)
       translate([o[0],o[1],h-abs(t)+abs(t)*sin(a)-eps])
          cylinder(r1=r+(1-cos(a))*t,r2=r+(1-cos(a+astep))*t,h=(sin(a+astep)-sin(a))*abs(t)+2*eps);
}
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
        translate([13.5, 13.5, 0])
            chamfercyl(9,10,4,4);
            //cylinder( h=20, r=10 );
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
