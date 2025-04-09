// Gmsh project created on Fri Jun  7 15:28:35 2024
// -----------------------------------------------------------------------------
//
//  Gmsh GEO Wedge Maillage statique et écoulement monophasique
//
//  Geometry basics, elementary entities, physical groups
//
// -----------------------------------------------------------------------------


lc = 5e-1; // Création variable, taille autour des points définis.



// Définition des points
				
Point(1) = {0, 0, 0, lc};
Point(2) = {7, 0,  0, lc};
Point(3) = {7, 0,  5, lc};
Point(4) = {10, 0,  5, lc};
Point(5) = {10, 0,  10, lc};
Point(6) = {0 , 0,  10, lc};	
				
				
Line(1) = {1, 2}; 
Line(2) = {2, 3}; 
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 6};
Line(6) = {6, 1};	

Curve Loop(2) = {1,2,3,4,5,6};

				
				
Plane Surface(2) = {2};

Recombine Surface "*";


Field[1] = BoundaryLayer;
Field[1].CurvesList = {1,2,3,4,5,6};
Field[1].SizeFar = 0.01;
Field[1].Size = 0.001;
Field[1].Thickness = 0.2;
Field[1].Ratio = 1.1;
Field[1].Quads = 1;
Field[1].FanPointsList = {3};
BoundaryLayer Field = 1;

Mesh.BoundaryLayerFanElements = 5;


Background Field = 1;				
				
				
// Extrusion de la géométrie et de son maillage.
				
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

