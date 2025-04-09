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
Point(2) = {10, 0,  0, lc};
Point(3) = {10, 0,  10, lc};
Point(4) = {0 , 0,  10, lc};
		
		
				
				
Line(1) = {1, 2}; 
Line(2) = {2, 3}; 
Line(3) = {3, 4};
Line(4) = {4, 1};


Curve Loop(2) = {1,2,3,4};
				
				
Plane Surface(2) = {2};

// Etape permettant de spécifier que les maillages doivent être structurés
Transfinite Line {1, 3} = 50 Using Progression 1;
Transfinite Line {2, 4} = 50 Using Progression 1;

				
Transfinite Surface {2};
// Les formes de mailles seront donc des quadrilatères.
Recombine Surface "*";

		
				
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



