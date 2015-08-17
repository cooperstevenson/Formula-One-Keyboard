// keys
module m_switch(w, h) {
  color([.2,.2,.2,1])
    translate([0, 0, 11.6/2])
      scale([14,14,11.6])
        cube(center=true);
}
module m_small_switch(w, h) {
  color([.2,.2,.2,1])
    translate([0, 0, 11.6/2])
      scale([7,14,11.6])
        cube(center=true);
}

module m_cap(w, h, r = 2) {
  color([.9,.9,.9,1])
      linear_extrude(9,scale=.5/.75) {
        minkowski() {
          scale([w-2*r,h-2*r])
            square(center=true);
          circle(r, $fn=100);
        }
      }
}

module m_small_cap(w, h, r = 2) {
  color([.9,.9,.9,1])
      linear_extrude(9,scale=.5/.75) {
        minkowski() {
          scale([w-6*r,h-2*r])
            square(center=true);
          circle(r, $fn=100);
        }
      }
}

module m_small_surface_cap(w, h, r = 2) {
  color([.9,.9,.9,1])
      linear_extrude(2,scale=.75/.81) {
        minkowski() {
          scale([w-1.75*r,h-5*r])
            square(center=true);
          circle(r, $fn=100);
        }
      }
}

module m_key(w, h) {
  // z fn
  translate([0, 0, -1.8+5+7.5])
    m_cap(w, h);
    m_switch(w, h);
}

module m_small_key(w, h) {
  // z fn
  translate([0, 0,-1.8+5+7.5])
    m_small_cap(w, h);
    m_small_switch(w, h);
}

module m_small_surface_key(w, h) {
  // z fn
  translate([0, 0,-1.8+5+7.5])
    m_small_surface_cap(w, h);
}


module m_row(count) {
  for (i = [0:count]) {
    translate([0, 19*i])
      m_key(18.415, 18.415);
  }
}

module m_small_row(count) {
  for (i = [0:count]) {
    translate([0, 19*i])
      m_small_key(18.415, 18.415);
  }
}

module m_small_surface_row(count) {
  for (i = [0:count]) {
    translate([0, 19*i])
      m_small_surface_key(18.415, 18.415);
  }
}

module m_column(count) {
  for (i = [0:count]) {
    translate([19*i,0])
      m_key(18.415, 18.415);
  }
}

//Alpha left side: :2 is num of columns
color([.72,.47,.47,1])
for (x = [1:5]) {
    rotate([-5,0,00])
  translate([19*(-5.5+x),19*(-.5),-6.5])
    m_row(2); //number of rows
}

// right side: :2 is num of columns
color([.28,.43,.43,1])
for (x = [1:5]) {
  rotate([-5,0,00])
  translate([19*(-.5+x),19*(-.5),-6.5])
    m_row(2); // number of rows
}

//NOTE: Consider making these keys convex like a Go stone & keep them in line with the -5 degree main key plane

//left Meta Row
color([.72,.64,.47,1])
rotate([-30,00,0])
for (y = [1:4]) {
     //14* = key spacing
     translate([20*(-5.35+y),(-30),-17])
    m_small_surface_row(0); //number of rows
}

//right Meta Row
color([.72,.64,.47,1])
rotate([-30,00,0])
for (y = [1:4]) {
     //14* = key spacing
     translate([20*(0.3+y),(-30),-17])
    m_small_surface_row(0); //number of rows
}


// Thumb keys

// NOTE: Use Cherry ML switches for the space Meta & spacebar cluster.
//spacebar
color([.6,.6,.6,1])
translate([0,19*(-2.65),-2])
  m_small_surface_key(27,18.75);

//Left Shift
color([.6,.6,.6,1])
translate([-25.25,19*(-2.65),-2])
  m_small_surface_key(20.415,18.75);

//Right Shift
color([.6,.6,.6,1])
translate([25.25,19*(-2.65),-2])
  m_small_surface_key(20.415,18.75);


// Top plate
color([.9,.9,.9,1])
  translate([-200/2,-40/2,3])
    rotate([-5,0,00])
    linear_extrude(1.5)
      square([200,60]);

// Top Plate/ Spacebar connector plate
color([1,1,1,1])
  translate([-200/2,-78/2,7.4])
  rotate([60,0,00])
     scale([200,6,1.5])
      cube();

// Spacebar, etc. plate
color([1,1,1,1])
  translate([-200/2,-121/2,6.75])
     scale([200,22,1.5])
      cube();

//
// CASE
//

//Front bottom edge
  color([.7,0,0,1])
  rotate([87.35,0,0])
  translate([-200/2,-10.4,-41.35])
    linear_extrude(1.5)
      square([200,11.5]);

// Left Side -- 
// NOTE: upturn the rear edge to partially negates key tilt for desktop use

// Module names are of the form poly_<inkscape-path-id>().  As a result,
// you can associate a polygon in this OpenSCAD program with the corresponding
// SVG element in the Inkscape document by looking for the XML element with
// the attribute id="inkscape-path-id".

// fudge value is used to ensure that subtracted solids are a tad taller
// in the z dimension than the polygon being subtracted from.  This helps
// keep the resulting .stl file manifold.
fudge=0.1;

module poly_path3406(h) 
{ 
  color([.7,0,0,1])
  scale([45.4/90, -45.4/90, 1]) union() 
  { 
    linear_extrude(height=h) 
      polygon([[-39,8],[-73,-12],[-123,-.5],[-123,41],[81,41],[82,18.25]]); 
  } 
} 
translate([-210/2,0,8.5])
rotate([-90,180,270])
poly_path3406(5); 

//Right side
fudge=0.1;

module poly_path3403(h) 
{ 
  color([.7,0,0,1])
  // color([.5,.5,.5,1])
  scale([45.4/90, -45.4/90, 1]) union() 
  { 
    linear_extrude(height=h) 
      polygon([[-39,8],[-73,-12],[-123,-.5],[-123,41],[81,41],[82,18.25]]); 
  } 
} 
translate([200/2,0,8.5])
rotate([-90,180,270])
poly_path3403(5); 

// Rear verticle case plate
  color([.7,0,0,1])
  translate([-200/2,-60.5,-12.25])
    rotate([90,0,00])
    scale([200,21,1.5])
      cube();

// Space bar key cluster verticle case plate
  color([1,1,1,1])
  translate([-200/2,-37.5,13])
    rotate([-30,00,0])
    scale([200,20,1.5])
      cube();

/*
// Rear horizontal case plate
  color([.5,.5,.5,1])
  translate([-75/2,-61.5,12.25])
    scale([75,26,1.5])
      cube();
*/

/*
// CHIP, Rotated
  translate([(40/2), -(100/2), -20])
    rotate([0,0,90])
    linear_extrude(9.6)
    square([60, 40]);
*/

// CHIP
color([.5,.5,0,.5])
  translate([(-160/2), -(120/2), -11])
    rotate([0,0,0])
    linear_extrude(9.6)
    square([60, 40]);
