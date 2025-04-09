// Gmsh project created on Fri Jun  7 15:28:35 2024
// -----------------------------------------------------------------------------
//
//  Gmsh GEO Wedge Maillage statique et écoulement monophasique
//
//  Geometry basics, elementary entities, physical groups
//
// -----------------------------------------------------------------------------


lc = 5e-1; // Création variable, taille autour des points définis.



// Points definition
				
Point(1) = {0, 0, 0, lc};
Point(2) = {10, 0,  0, lc};
Point(3) = {10, 0,  10, lc};
Point(4) = {0 , 0,  10, lc};
					
				
// Lines definition

Line(1) = {1, 2}; 
Line(2) = {2, 3}; 
Line(3) = {3, 4};
Line(4) = {4, 1};


// Curve loop definition
Curve Loop(2) = {1,2,3,4};

				
				
Plane Surface(2) = {2};


// Definition of the box function, ot refine the mesh in a specific zone
Field[1] = Box;

Field[1].Thickness = 0.3;
Field[1].VIn = 0.1;
Field[1].VOut = 0.5;
Field[1].XMax = 10;
Field[1].XMin = 0;
Field[1].YMax = 0.5;
Field[1].YMin = -0.5;
Field[1].ZMin = 3;
Background Field = 1;	
				
				
// Mesh extrusion
				
h = 1;

Extrude {0,h,0} {
  Surface{2}; Layers{ {1}, {1} };Recombine;
}	

Physical Surface("movingWallTop") = {21};	
Physical Surface("front") = {26};	
Physical Surface("back") = {2};	
Physical Surface("wall") = {17,25};	
Physical Surface("bottom") = {13};	

Physical Volume("internal")={1};
//+

