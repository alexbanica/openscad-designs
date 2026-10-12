// Five independently dimensioned, all-printed nested bank safes.
// Integral hinges, direct retained cams, integral lettering and two-stage reveal.
// Adjustable Parameters
// Selection and motion
render_mode = "printable_layout";
safe_index = 1;
print_group = "body";
print_scope = "selected_group"; // Opt in to complete_set for all five inventories.
plate_index = 1; // Complete-set physical plate; 0 is inspection-only overview.
part_id = "";
assembly_view = "single";
door_angle_deg = 0;
latch_angle_deg = 90;
snap_released = false; // Deliberate inner snap release in assembly only.
secret_cover_removed = false;
secret_cover_rail_clearance_mm = 0.35;
secret_cover_detent_clearance_mm = 0.15;
secret_cover_detent_engagement_mm = 0.30;
secret_cover_release_travel_mm = 0.45;
extraction_distance_mm = 0;
// Dimensions: complete installed W/H/D, manually selected CAD dimensions.
safe_envelopes_mm = [[85,100,75],[71,90,54],[59,81,39],[49,73,27],[40,65,17]];
primary_wall_mm = 2;
nest_clearance_mm = 0.5;
moving_clearance_mm = 0.35;
// Rigid front grip beams, not primary chamber walls or flexible hinges.
retrieval_cap_depths_mm = [2,2,2,1.2,2];
cam_clip_radial_clearance_mm = 0.15; // Snap neck exception, not a bearing.
cam_stack_axial_clearance_mm = 0.05; // Keyed stack shoulder exception.
cam_key_fit_clearance_mm = 0.05; // Static D-key fit; not a running bearing.
$fn = 32;

// Derived Values
// Named inner-snap construction reserve above the literal .35 mm minimum.
snap_running_clearance_mm = max(0.36,moving_clearance_mm);
snap_release_travel_mm = 0.30+snap_running_clearance_mm;
cam_rear_recess_mm = 1; // Retained collar/clip allocation; 1 mm keyed hub remains.

frame_front_depths_mm = [65.6,46.35,34.35,24.35,12.85];
door_back_depths_mm = [63.6,44.35,32.35,22.35,10.85];
function safe_envelope_mm(i) = safe_envelopes_mm[i-1];
function safe_width_mm(i) = safe_envelope_mm(i)[0];
function safe_height_mm(i) = safe_envelope_mm(i)[1];
function safe_depth_mm(i) = safe_envelope_mm(i)[2];
function frame_front_mm(i) = frame_front_depths_mm[i-1];
function door_back_mm(i) = door_back_depths_mm[i-1];
function chamber_size_mm(i) = i<5 ? [safe_width_mm(i+1)+2*nest_clearance_mm,safe_height_mm(i+1)+2*nest_clearance_mm,safe_depth_mm(i+1)+2*nest_clearance_mm] : [36,61,8.85];
function chamber_left_mm(i) = i<5 ? safe_width_mm(i)-chamber_size_mm(i)[0]-primary_wall_mm : primary_wall_mm;
function chamber_bottom_mm(i) = i<5 ? (safe_height_mm(i)-chamber_size_mm(i)[1])/2 : primary_wall_mm;
function chamber_origin_mm(i) = [chamber_left_mm(i),chamber_bottom_mm(i),primary_wall_mm];
function child_placement_mm(i) = chamber_origin_mm(i)+[nest_clearance_mm,nest_clearance_mm,nest_clearance_mm];
// Records: [origin, size]. Throat includes the entire straight extraction prism.
function chamber_record_mm(i) = [chamber_origin_mm(i),chamber_size_mm(i)];
function throat_record_mm(i) = [chamber_origin_mm(i),[chamber_size_mm(i)[0],chamber_size_mm(i)[1],safe_depth_mm(i)+safe_depth_mm(i<5?i+1:5)]];
function front_record_mm(i) = [[0,0,primary_wall_mm+chamber_size_mm(i)[2]],[safe_width_mm(i),safe_height_mm(i),safe_depth_mm(i)-primary_wall_mm-chamber_size_mm(i)[2]]];
function hinge_axis_mm(i) = [[5.5,4.5,3.5,3,2.30][i-1],0,[65.85,46.60,34.60,24.60,13.50][i-1]];
function hinge_radius_mm(i) = 2.30;
function captive_stations_mm(i) = [hinge_start_mm(i)+(i==5?12.4:11),hinge_end_mm(i)-4];
function captive_root_segments_mm(i) = [for(y=captive_stations_mm(i)) [y-6.41-(i==5?1.4:0),1.05]];
function hinge_start_mm(i) = i==5?3:chamber_bottom_mm(i);
function hinge_end_mm(i) = i==5?63:safe_height_mm(i)-chamber_bottom_mm(i);
function hinge_record_mm(i) = [hinge_axis_mm(i),hinge_radius_mm(i),hinge_start_mm(i),hinge_end_mm(i)];
function fixed_hinge_segments_mm(i) = i==5?[[3,11],[31,9],[55,8]]:let(y=hinge_start_mm(i),l=hinge_end_mm(i)-y) [[y,l*0.1742424242],[y+l*0.4318181818,l*0.1363636364],[y+l*0.8257575758,l*0.1742424242]];
function moving_hinge_segments_mm(i) = i==5?[[14.35,16.3],[40.35,14.3]]:let(y=hinge_start_mm(i),l=hinge_end_mm(i)-y,s=fixed_hinge_segments_mm(i)) [[s[0][0]+s[0][1]+moving_clearance_mm,s[1][0]-s[0][0]-s[0][1]-2*moving_clearance_mm],[s[1][0]+s[1][1]+moving_clearance_mm,s[2][0]-s[1][0]-s[1][1]-2*moving_clearance_mm]];
function door_left_mm(i) = hinge_axis_mm(i)[0]+hinge_radius_mm(i)+moving_clearance_mm;
function door_bottom_mm(i) = i==5?3:chamber_bottom_mm(i)+moving_clearance_mm;
// The whole rear corner sweeps outward by its radius about the hinge axis.
// Preserve stronger existing margins; trim only the derived panel edge.
function door_right_limit_mm(i) = let(a=hinge_axis_mm(i),frame_inner_right=safe_width_mm(i)-primary_wall_mm)
 a[0]+sqrt(pow(frame_inner_right-a[0]-moving_clearance_mm,2)-pow(a[2]-door_back_mm(i),2));
function door_right_mm(i) = min(i==5?37:safe_width_mm(i)-primary_wall_mm-moving_clearance_mm,door_right_limit_mm(i));
function door_width_mm(i) = door_right_mm(i)-door_left_mm(i);
function door_height_mm(i) = i==5?57.5:chamber_size_mm(i)[1]-2*moving_clearance_mm;
function retrieval_roof_mm(i) = i==5?63:safe_height_mm(i)-chamber_bottom_mm(i);
function retrieval_cap_depth_mm(i) = retrieval_cap_depths_mm[i-1];
// Exact accessible recess, [origin,size]; roof slot connects to the door notch.
function finger_recess_record_mm(i) = i==5 ? [[14,55,9],[12,6,6]] : [[safe_width_mm(i)/2-6,retrieval_roof_mm(i)-6,safe_depth_mm(i)-retrieval_cap_depth_mm(i)-6],[12,6,6]];
function cam_axis_mm(i) = [[48,36],[63,34],[51,34],[41.6,34],[32,31]][i-1];
// Exact circle/rectangular tongue radius, including all square corners.
function cam_profile_radius_mm(i) = max(4.8,sqrt(pow(cam_tip_mm(i)-cam_axis_mm(i)[0],2)+pow(1.6,2)));
// Five-degree endpoint hulls: secant expansion bounds the continuous arc
// of the complete profile plus its running allowance.
function cam_receiver_offset_mm(i) = moving_clearance_mm+(cam_profile_radius_mm(i)+moving_clearance_mm)*(1/cos(2.5)-1);
function cam_back_mm(i) = door_back_mm(i)-primary_wall_mm-moving_clearance_mm;
function cam_tip_mm(i) = safe_width_mm(i)-primary_wall_mm+0.65;
function cam_knob_height_mm(i) = [5,4,2.5,2,2][i-1];
function cam_knob_radius_mm(i) = [6,7,5.5,4.5,3.5][i-1];
function cam_knob_back_mm(i) = door_back_mm(i)+primary_wall_mm+moving_clearance_mm;
function cam_knob_front_mm(i) = cam_knob_back_mm(i)+cam_knob_height_mm(i);
// Exterior records: plaque [x,y,width,height]; frame has separate colourable stock.
function exterior_plaque_record_mm(i) = [[26,76.5,44,12],[16,60,38,12],[13,53,40,12],[12,48,30,14]][i-1];
function exterior_frame_record_mm(i) = [[17,12,62,77],[14,57,42,18],[11,50,44,18],[10,12,35,51]][i-1];
function exterior_lines(i) = [["PRIVATE —","DO NOT OPEN"],["NOT YOURS"],["SERIOUSLY?"],["LAST","WARNING"]][i-1];

function exterior_front_mm(i) = door_back_mm(i)+primary_wall_mm;
function safe_text_width_mm(s) = len(s)==0?0:(len(s)-1)*3.6+2.82;
function sweep_point(p,a) = [cos(a)*p[0]-sin(a)*p[1],sin(a)*p[0]+cos(a)*p[1]];


assert(len(safe_envelopes_mm)==5 && len(retrieval_cap_depths_mm)==5,"Five complete safe allocations required");
assert(cam_key_fit_clearance_mm==0.05,"Approved static keyed fit allowance");
assert(len(complete_set_occurrences())==9,"Completed-object part budget");
assert(primary_wall_mm>=2,"Primary shell walls must be at least 2 mm");
assert(nest_clearance_mm>=0.5 && moving_clearance_mm>=0.3 && moving_clearance_mm<=0.4,"Clearance budget");
assert(safe_index>=1 && safe_index<=5 && floor(safe_index)==safe_index,"Unsupported safe index");
assert(render_mode=="printable_layout" || render_mode=="assembly" || render_mode=="individual_part","Unsupported render mode");
assert(render_mode!="printable_layout" || print_scope=="selected_group" || print_scope=="complete_set","Unsupported print scope");
assert(render_mode!="printable_layout" || print_scope!="complete_set" || part_id=="","Complete-set printing requires empty part_id");
assert(render_mode=="assembly" || print_group=="body" || print_group=="door" || print_group=="mechanism" || print_group=="details","Unsupported print group");
assert(render_mode=="assembly" || part_id=="" || len([for(r=printed_inventory(safe_index)) if(r[0]==part_id) r])==1,"Part unavailable for selected safe");
assert(render_mode!="assembly" || (assembly_view=="single" || assembly_view=="nested"),"Unsupported assembly view");
assert(render_mode!="assembly" || (latch_angle_deg>=0 && latch_angle_deg<=90),"Quarter-turn latch travel");
assert(render_mode!="assembly" || (door_angle_deg>=0 && door_angle_deg<=110),"Door travel");
assert(render_mode!="assembly" || door_angle_deg==0 || (safe_index==1?latch_angle_deg==90:snap_released),"Release the active closure before opening door");
assert(render_mode!="assembly" || (extraction_distance_mm>=0),"Extraction cannot move rearward");
assert(render_mode!="assembly" || (safe_index<5 || extraction_distance_mm==0),"Safe 5 has no child to extract");
assert(render_mode!="assembly" || extraction_distance_mm==0 || (assembly_view=="nested" && door_angle_deg==110 && (safe_index==1?latch_angle_deg==90:snap_released)),"Extraction requires nested view and fully clear door");
assert(render_mode!="assembly" || !secret_cover_removed || (safe_index==5 && door_angle_deg>0 && snap_released),"Secret reveal requires active Safe 5 with open door");
for(i=[1:5]) {
 assert(retrieval_cap_depth_mm(i)>0,"Positive rigid grip beam depth");
 if(i<5) {
  r=finger_recess_record_mm(i);
  assert(r[0][2]>=child_placement_mm(i)[2]+safe_depth_mm(i+1),"Retrieval recess excludes complete closed child");
  // In its parent, the front approach occupies the child's door notch, below
  // the rigid cap and inside the parent's full open extraction throat.
  if(i>1) assert(child_placement_mm(i-1)[1]+r[0][1]>=chamber_bottom_mm(i-1) && child_placement_mm(i-1)[1]+r[0][1]+6<=safe_height_mm(i-1)-chamber_bottom_mm(i-1),"Parent front finger access");
 }
 assert(safe_width_mm(i)>0 && safe_height_mm(i)>0 && safe_depth_mm(i)>0,"Positive complete bounds");
 assert(hinge_axis_mm(i)[0]-hinge_radius_mm(i)>=0 && (i==5 || hinge_axis_mm(i)[0]+hinge_radius_mm(i)<=chamber_left_mm(i)),"Hinge outside extraction throat");
 assert(hinge_axis_mm(i)[2]+hinge_radius_mm(i)<=safe_depth_mm(i),"Complete hinge depth");
 assert(frame_front_mm(i)==door_back_mm(i)+primary_wall_mm,"Adjacent recessed frame/door");
 assert(safe_width_mm(i)<=246 && safe_height_mm(i)<=246 && safe_depth_mm(i)<=246,"Body printable bounds");
 if(i<5) {
  assert(chamber_left_mm(i)>=primary_wall_mm && chamber_bottom_mm(i)>=primary_wall_mm,"Primary frame stock");
  assert(primary_wall_mm+chamber_size_mm(i)[2]<=door_back_mm(i)-moving_clearance_mm,"Child rear/front clearance");
  assert(safe_width_mm(i+1)+2*nest_clearance_mm<=chamber_size_mm(i)[0] && safe_height_mm(i+1)+2*nest_clearance_mm<=chamber_size_mm(i)[1],"Complete child passes throat");
 }
}

module block_mm(origin,size) { translate(origin) cube(size); }
// A7 rigid head meridian. The receiving profile uses a true round Euclidean
// offset, so every conical face has 0.35 mm normal separation, including corners.
// Head radius 1.10; neck 0.50; 45-degree cones are 0.60 mm long.
module captive_head_profile(i=1) {
 low=i==5?-7.81:-6.41;
 polygon([[0,low],[0.5,low],[0.5,-0.6],[1.1,0],[0.5,0.6],[0.5,1.0],[0,1.0]]);
}
module captive_receiver_profile() {
 intersection() {
  offset(r=moving_clearance_mm+0.01,$fn=64)
   polygon([[-2,-8],[0.5,-8],[0.5,-0.6],[1.1,0],[0.5,0.6],[0.5,8],[-2,8]]);
  translate([0,-8]) square([4,16]);
 }
}
module captive_axis_solid(i,y) {
 a=hinge_axis_mm(i);
 translate([a[0],y,a[2]]) rotate([-90,0,0]) rotate_extrude($fn=64) children();
}
module body_hinges(i) {
 // Full cup stock joins the saddle before the one canonical receiver cut.
 // Lower and upper exterior shoulders retain their 45-degree tapers.
 for(y=captive_stations_mm(i)) captive_axis_solid(i,y)
  polygon([[0,-1.95],[1.80,-1.95],[2.30,-1.45],[2.30,1.45],[1.80,1.95],[0,1.95]]);
}
module hinge_segment_relief(i,moving=true) {
 // Sweep cuts occur only in root stations, separated 0.35 mm axially from cups.
 if(moving) moving_hinge_root_sweep_relief(i);
}
module retrieval_lip(i) {
 w=safe_width_mm(i); h=safe_height_mm(i); d=safe_depth_mm(i);
 roof_y=retrieval_roof_mm(i); cap=retrieval_cap_depth_mm(i);
 if(i==5) {
  // Accepted gate allocation: preserve its slide passage and y61..65 grip.
  block_mm([w/2-6,roof_y,frame_front_mm(i)-0.5],[12,h-roof_y,d-frame_front_mm(i)+0.5]);
  block_mm([w/2-6,61,d-2],[12,4,2]);
 } else {
  // Roof-mounted rigid beam and two flanking legs. No retained material enters
  // this safe's own child throat; the 12 mm span is a bounded print bridge.
  block_mm([w/2-6,roof_y,d-cap],[12,h-roof_y,cap]);
  for(x=[w/2-8,w/2+6]) block_mm([x,roof_y,frame_front_mm(i)-0.5],[2,h-roof_y,d-frame_front_mm(i)+0.5]);
 }
}
module retrieval_recess(i) {
 r=finger_recess_record_mm(i);
 // Safes 1..4 open the roof over the exact recess and meet the front-door
 // notch. Safe 5 keeps its separately accepted gate recess allocation.
 block_mm(r[0],[r[1][0],i==5?r[1][1]:safe_height_mm(i)-r[0][1]+0.1,r[1][2]]);
}
// The panel and integral roots share the broad rear datum. Remove the full
// front pocket, then restore only the alternating fixed barrels.
module door_panel_pocket(i) {
 left=max(primary_wall_mm,door_left_mm(i)-moving_clearance_mm);
 if(left<chamber_left_mm(i)+moving_clearance_mm)
  block_mm([left,chamber_bottom_mm(i),door_back_mm(i)-moving_clearance_mm],
   [chamber_left_mm(i)+moving_clearance_mm-left,chamber_size_mm(i)[1],safe_depth_mm(i)-door_back_mm(i)+moving_clearance_mm+0.1]);
}
// Actual manufactured roots: finite overlap with both panel and barrel, with
// no shelf below the door's stable rear face.
// A8: panel-seeded, fully supported lower neck and rigid root.
module captive_root_blocks(i,y,expand_mm=0) {
 a=hinge_axis_mm(i); e=expand_mm; shift=i==5?1.4:0;
 block_mm([door_left_mm(i)-e,y-10.01-shift-e,door_back_mm(i)-e],
  [1+2*e,0.10+2*e,primary_wall_mm+2*e]);
 block_mm([a[0]-0.5-e,y-6.41-shift-e,min(a[2]-0.5,frame_front_mm(i)-0.25)-e],
  [door_left_mm(i)+1-a[0]+0.5+2*e,1.05+2*e,
   a[2]+0.5-min(a[2]-0.5,frame_front_mm(i)-0.25)+2*e]);
}
module moving_hinge_roots(i) {
 for(y=captive_stations_mm(i)) {
  captive_axis_solid(i,y) captive_head_profile(i);
  hull() captive_root_blocks(i,y);
 }
}
// Conservative convex XZ hull of the actual seed and target root sections.
// Keeping the planar hull avoids inventing the rear-left bounding-box corner.
function captive_root_xz_points(i) = let(a=hinge_axis_mm(i),left=door_left_mm(i),
 rear=door_back_mm(i),front=frame_front_mm(i),target_rear=min(a[2]-0.5,front-0.25))
 [[left-a[0],rear-a[2]],[left+1-a[0],rear-a[2]],
  [left+1-a[0],front-a[2]],[left-a[0],front-a[2]],
  [-0.5,target_rear-a[2]],[left+1-a[0],target_rear-a[2]],
  [left+1-a[0],0.5],[-0.5,0.5]];
module moving_hinge_root_sweep_relief(i) {
 a=hinge_axis_mm(i); points=captive_root_xz_points(i);
 radius=max([for(p=points) norm(p)]);
 // The endpoint chords miss the continuous sweep by at most this sagitta.
 // The secant factor keeps the 64-facet offset's face-normal gap >= e.
 e=moving_clearance_mm+radius*(1-cos(2.5));
 for(y=captive_stations_mm(i))
  translate([a[0],y-5.36-(i==5?1.4:0)+e,a[2]]) rotate([90,0,0])
   linear_extrude(height=4.65+2*e,convexity=10)
    offset(r=e/cos(180/64),$fn=64) union() {
     for(ang=[0:5:105]) hull() {
      rotate(ang) hull() polygon(points);
      rotate(ang+5) hull() polygon(points);
     }
    }
}
// Single annular mesh. Branch sectors follow X=+/-0.86 and Z=-0.65;
// front/rear ridges are explicit, and every radial step is 0.094 mm.
function saddle_d_mm(x,z) = z<=0 || abs(x)>=0.86 ? max(0,z+0.65) :
 0.65+0.86*(atan2(z,abs(x))-acos(min(1,0.86/sqrt(x*x+z*z))))*PI/180
 +sqrt(max(0,x*x+z*z-0.86*0.86));
function saddle_angles_deg(r) = [0,acos(min(1,0.86/r)),90,180-acos(min(1,0.86/r)),
 180,180+asin(0.65/r),270,360-asin(0.65/r),360];
function saddle_sector_counts() = [23,32,32,23,19,32,32,19];
function saddle_ring_points(r) = let(a=saddle_angles_deg(r),ns=saddle_sector_counts())
 [for(j=[0:7]) for(k=[0:ns[j]-1]) let(t=a[j]+(a[j+1]-a[j])*k/ns[j])
  let(xx=r*cos(t),zz=r*sin(t),
   x=abs(abs(xx)-0.86)<1e-10 ? (xx<0?-0.86:0.86) : abs(xx)<1e-10?0:xx,
   z=abs(zz+0.65)<1e-10?-0.65:abs(zz)<1e-10?0:zz)
  [x,-5+1.10*saddle_d_mm(x,z),z]];
function saddle_vertex_id(k,n,m) = k>=2*m ? k : let(top=k>=m,b=k%m,row=floor(b/n),col=b%n,
 fixed=row==0 ? (col<=23 ? 0 : col>=87 && col<=110 ? 87 : col) : col)
 row*n+fixed+(top?m:0);
function saddle_xz_orientation(a,b,c) = (b[0]-a[0])*(c[2]-a[2])-(b[2]-a[2])*(c[0]-a[0]);
function saddle_face_area(points,f) = norm(cross(points[f[1]]-points[f[0]],points[f[2]]-points[f[0]]));
module captive_saddle() {
 rings=11; n=212;
 bottom=[for(j=[0:rings-1]) each saddle_ring_points(0.86+0.94*j/(rings-1))];
 // Interior fill is removed by the single final receiver cutter.
 // It avoids coincident independently faceted bore walls.
 points=concat(bottom,[for(p=bottom) [p[0],-1.94,p[2]]],[[0,-6,0],[0,-1.94,0]]);
 m=len(bottom);
 raw=concat(
  [for(j=[0:rings-2]) for(k=[0:n-1]) each
   let(a=j*n+k,b=(j+1)*n+k,c=(j+1)*n+(k+1)%n,d=j*n+(k+1)%n)
   // Branch-aligned cells can be concave beside the collapsed inner ring.
   // Keep the diagonal inside each lower-surface XZ cell.
   let(flipped=saddle_xz_orientation(bottom[a],bottom[b],bottom[c])*
               saddle_xz_orientation(bottom[a],bottom[c],bottom[d])<0)
   flipped ? [[a,d,b],[b,d,c]] : [[a,c,b],[a,d,c]]],
  // The upper surface is planar: only its exact inner/outer boundaries matter.
  // The same inside-cell diagonal rule avoids crossing a concave cell.
  [for(k=[0:n-1]) each
   let(a=k,b=(rings-1)*n+k,c=(rings-1)*n+(k+1)%n,d=(k+1)%n)
   let(flipped=saddle_xz_orientation(bottom[a],bottom[b],bottom[c])*
               saddle_xz_orientation(bottom[a],bottom[c],bottom[d])<0)
   flipped ? [[a+m,b+m,d+m],[b+m,c+m,d+m]] :
             [[a+m,b+m,c+m],[a+m,c+m,d+m]]],
  [for(k=[0:n-1]) each let(a=k,b=(k+1)%n)
   [[2*m,b,a],[2*m+1,a+m,b+m]]],
  [for(k=[0:n-1]) each
   let(a=(rings-1)*n+k,b=(rings-1)*n+(k+1)%n)
   [[a,b,b+m],[a,b+m,a+m]]]);
 faces=[for(f=raw) let(g=[for(k=f) saddle_vertex_id(k,n,m)])
  if(saddle_face_area(points,g)>1e-10) [g[2],g[1],g[0]]];
 polyhedron(points=points,faces=faces,convexity=10);
}
// A10 Safe 5 geodesic growth from the actual continuous left-wall arc.
function safe5_saddle_angles_deg() = [0,71.56994366120335,242.7339555492672,260.4059317731395,360];
function safe5_saddle_counts() = [for(j=[0:3]) ceil((safe5_saddle_angles_deg()[j+1]-safe5_saddle_angles_deg()[j])/2.8125)];
function safe5_saddle_delta_deg(t) = t>=242.7339555492672 && t<=260.4059317731395 ? 0 :
 min(abs(t-242.7339555492672),360-abs(t-242.7339555492672),
     abs(t-260.4059317731395),360-abs(t-260.4059317731395));
function safe5_saddle_d_mm(r,t) = let(delta=safe5_saddle_delta_deg(t),
 a=acos(0.86/1.8),b=acos(min(1,0.86/r)))
 delta<=a+b ? sqrt(max(0,1.8*1.8+r*r-2*1.8*r*cos(delta))) :
 sqrt(1.8*1.8-0.86*0.86)+sqrt(max(0,r*r-0.86*0.86))+0.86*(delta-a-b)*PI/180;
function safe5_saddle_ring_points(r) = let(a=safe5_saddle_angles_deg(),ns=safe5_saddle_counts())
 [for(j=[0:3]) for(k=[0:ns[j]-1]) let(t=a[j]+(a[j+1]-a[j])*k/ns[j])
  [r*cos(t),-6.4+1.12*safe5_saddle_d_mm(r,t),r*sin(t)]];
function saddle_facet_gradient(p,a,b,c) = let(n=cross(p[b]-p[a],p[c]-p[a]))
 sqrt(n[0]*n[0]+n[2]*n[2])/abs(n[1]);
function safe5_saddle_flipped(p,a,b,c,d) =
 min(saddle_facet_gradient(p,a,c,b),saddle_facet_gradient(p,a,d,c)) <
 min(saddle_facet_gradient(p,a,d,b),saddle_facet_gradient(p,b,d,c));
module safe5_captive_saddle() {
 rings=11; n=130;
 bottom=[for(j=[0:rings-1]) each safe5_saddle_ring_points(0.86+0.094*j)];
 m=len(bottom);
 points=concat(bottom,[for(p=bottom) [p[0],-1.94,p[2]]],[[0,-7.4,0],[0,-1.94,0]]);
 raw=concat(
  [for(j=[0:rings-2]) for(k=[0:n-1]) each
   let(a=j*n+k,b=(j+1)*n+k,c=(j+1)*n+(k+1)%n,d=j*n+(k+1)%n)
   safe5_saddle_flipped(bottom,a,b,c,d) ? [[a,d,b],[b,d,c]] : [[a,c,b],[a,d,c]]],
  [for(k=[0:n-1]) each let(a=k,b=(rings-1)*n+k,c=(rings-1)*n+(k+1)%n,d=(k+1)%n)
   [[a+m,b+m,c+m],[a+m,c+m,d+m]]],
  [for(k=[0:n-1]) each let(a=k,b=(k+1)%n)
   [[2*m,b,a],[2*m+1,a+m,b+m]]],
  [for(k=[0:n-1]) each let(a=(rings-1)*n+k,b=(rings-1)*n+(k+1)%n)
   [[a,b,b+m],[a,b+m,a+m]]]);
 faces=[for(f=raw) if(saddle_face_area(points,f)>1e-10) [f[2],f[1],f[0]]];
 polyhedron(points=points,faces=faces,convexity=10);
}
module body_hinge_saddles(i) {
 a=hinge_axis_mm(i);
 for(y=captive_stations_mm(i)) translate([a[0],y,a[2]])
  if(i==5) safe5_captive_saddle(); else captive_saddle();
}
module door_bottom_band(i) {
 // Forward bed stock is separate from the taper: convex tapering below the
 // panel lower datum would cut back through the unchanged primary floor.
 block_mm([door_left_mm(i)+1,0,frame_front_mm(i)+0.35],
  [door_width_mm(i)-2,door_bottom_mm(i)+1,2]);
 hull() {
  block_mm([door_left_mm(i)+1,door_bottom_mm(i),frame_front_mm(i)+0.35],
   [door_width_mm(i)-2,1,2]);
  block_mm([door_left_mm(i)+1,door_bottom_mm(i),door_back_mm(i)],
   [door_width_mm(i)-2,2,primary_wall_mm]);
 }
}

module safe_body(i) {
 difference() {
  union() {
   difference() {
    cube([safe_width_mm(i),safe_height_mm(i),frame_front_mm(i)]);
    block_mm(chamber_origin_mm(i),[chamber_size_mm(i)[0],chamber_size_mm(i)[1],safe_depth_mm(i)+0.1]);
    door_panel_pocket(i);
    moving_hinge_root_sweep_relief(i);
    if(i==1) cam_receiver_cutters(i);
    // Safe 5 slide passage keeps its rails and captive stop clear.
    if(i==5) block_mm([2,60,5.25],[36,6,3.25]);
   }
   body_hinges(i);
   body_hinge_saddles(i);
   retrieval_lip(i);
   if(i>1) inner_snap_catch(i);
   if(i==5) { secret_cover_rails(); fixed_second_message(); }
  }
  retrieval_recess(i);
  if(i>1) inner_snap_receiver(i);
  // Cut after the full shell/cup union so frame stock cannot refill running gaps.
  for(y=captive_stations_mm(i)) captive_axis_solid(i,y) captive_receiver_profile();

 }
}
module safe_door_closed(i,released=false) {
 difference() {
  union() {
   difference() {
    block_mm([door_left_mm(i),door_bottom_mm(i),door_back_mm(i)],[door_width_mm(i),door_height_mm(i),primary_wall_mm]);
    if(i>1) inner_snap_panel_cut(i);
   }
   if(i>1) { inner_snap(i,released); inner_fixed_knob(i); }
   moving_hinge_roots(i);
   door_bottom_band(i);
   if(i==1) cam_fixed_stop(i);
   if(i==1) fixed_safe1_dial();
   if(i<5) difference() {
    integral_exterior_details(i);
    if(i==4) inner_pad_decor_clearance(i);
   }
  }

  if(i==1) let(a=cam_axis_mm(i)) translate([a[0],a[1],door_back_mm(i)-.1]) cylinder(d=2+2*moving_clearance_mm,h=primary_wall_mm+.2);
  block_mm([safe_width_mm(i)/2-6,safe_height_mm(i)-(i==5?10:chamber_bottom_mm(i)+6),door_back_mm(i)-.1],[12,6,primary_wall_mm+.2]);
 }
}
module door_transform(i,angle_deg=door_angle_deg) {
 a=hinge_axis_mm(i); translate(a) rotate([0,-angle_deg,0]) translate(-a) children();
}
module safe_door(i,angle_deg=door_angle_deg,released=false) { door_transform(i,angle_deg) safe_door_closed(i,released); }
module cam_key_profile(clearance_mm=0) {
 intersection() { circle(d=2+2*clearance_mm); translate([-2-clearance_mm,-2-clearance_mm]) square([4+2*clearance_mm,2.65+2*clearance_mm]); }
}
module cam_fixed_stop(i) {
 a=cam_axis_mm(i);
 translate([a[0]-2.75,a[1],exterior_front_mm(i)-.01]) cylinder(d=1.6,h=1.16);
}
module fixed_safe1_dial() {
 translate([48,65,exterior_front_mm(1)-.01]) union() {
  cylinder(r=9,h=.81);
  for(a=[0:30:330]) rotate([0,0,a]) translate([6.8,-.4,.8]) cube([1.6,.8,.5]);
 }
}
module cam_tongue_profile(i,clearance_mm=0) {
 offset(delta=clearance_mm) union() { circle(r=4.8); translate([0,-1.6]) square([cam_tip_mm(i)-cam_axis_mm(i)[0],3.2]); }
}
module cam_receiver_cutters(i) {
 a=cam_axis_mm(i);
 translate([a[0],a[1],cam_back_mm(i)-moving_clearance_mm]) linear_extrude(primary_wall_mm+2*moving_clearance_mm)
  union() { for(ang=[0:5:85]) hull() {
   rotate(ang) cam_tongue_profile(i,cam_receiver_offset_mm(i));
   rotate(ang+5) cam_tongue_profile(i,cam_receiver_offset_mm(i));
  } }
}
module cam_latch(i) {
 difference() {
  linear_extrude(primary_wall_mm) cam_tongue_profile(i);
  translate([0,0,-.1]) linear_extrude(primary_wall_mm+.2) cam_key_profile(cam_key_fit_clearance_mm);
  // Rear-open side insertion corridor, leaving the upper keyed hub intact.
  translate([0,0,-.1]) cylinder(r=2.15,h=cam_rear_recess_mm+.1);
  translate([-4.9,-2.15,-.1]) cube([4.9,4.3,cam_rear_recess_mm+.1]);
 }
}
module cam_axle_clip(i) {
 linear_extrude(.5) difference() { circle(d=3.6); circle(d=1.2+2*cam_clip_radial_clearance_mm); translate([-2,-.3]) square([2,.6]); }
}
module cam_handle_recess(i,z_origin_mm=0) {
 translate([0,0,cam_knob_back_mm(i)-z_origin_mm-.01]) linear_extrude(1.16) intersection() {
  difference() { circle(r=cam_knob_radius_mm(i)+.1); circle(r=1.60); }
  translate([-cam_knob_radius_mm(i)-.1,-.80]) square([cam_knob_radius_mm(i)+.90,2*cam_knob_radius_mm(i)+.2]);
 }
}
module combined_handle_axle(i,z_origin_mm=0) {
 b=cam_knob_back_mm(i)-z_origin_mm; c=cam_back_mm(i)-z_origin_mm;
 difference() {
  union() {
   translate([0,0,c]) intersection() {
    cylinder(r1=1,r2=.8,h=.40);
    linear_extrude(.40) cam_key_profile();
   }
   translate([0,0,c+.39]) cylinder(d=1.2,h=.62);
   translate([0,0,c+1]) linear_extrude(b-c-1+.01) cam_key_profile();
   translate([0,0,b]) cylinder(r=cam_knob_radius_mm(i),h=cam_knob_height_mm(i));
   if(i==1) for(a=[0,120,240]) rotate([0,0,a]) hull() {
    translate([4,0,b+2.5]) cylinder(r=2.5,h=2.5);
    translate([15,0,b+2.5]) cylinder(r=2.5,h=2.5);
   }
  }
  cam_handle_recess(i,z_origin_mm);
 }
}
module installed_cam_closure(i,angle_deg=latch_angle_deg) {
 a=cam_axis_mm(i);
 translate([a[0],a[1],0]) rotate([0,0,angle_deg]) {
  translate([0,0,cam_back_mm(i)]) cam_latch(i);
  combined_handle_axle(i);
  translate([0,0,cam_back_mm(i)+.45]) rotate([0,0,180]) cam_axle_clip(i);
 }
}
module printable_cam_part(i,id) {
 if(id=="cam") translate([4.8,4.8,primary_wall_mm]) rotate([180,0,0]) cam_latch(i);
 else if(id=="handle_axle") translate([i==1?17.5:cam_knob_radius_mm(i),i==1?17.5:cam_knob_radius_mm(i),0]) rotate([180,0,0]) combined_handle_axle(i,cam_knob_front_mm(i));
 else if(id=="cam_clip") translate([1.8,1.8,0]) cam_axle_clip(i);
}
for(i=[1]) {
 assert(cam_back_mm(i)>=8.5,"Retained rotating surfaces stay above Safe5 cover allocation");
 assert(cam_knob_front_mm(i)<=safe_depth_mm(i),"Complete front handle bounds");
 assert(cam_knob_height_mm(i)-1.15>=.85,"Continuous front handle disk");
 if(i<5) assert(cam_back_mm(i)>=primary_wall_mm+chamber_size_mm(i)[2],"Retained cam excludes child");
}
function safe_glyph_segments(c)=c=="P"?[[[.4,.4],[.4,3.6]],[[.4,3.6],[2.4,3.6]],[[2.4,3.6],[2.4,2]],[[2.4,2],[.4,2]]]:c=="D"?[[[.4,.4],[.4,3.6]],[[.4,3.6],[1.8,3.6]],[[1.8,3.6],[2.4,3]],[[2.4,3],[2.4,1]],[[2.4,1],[1.8,.4]],[[1.8,.4],[.4,.4]]]:c=="W"?[[[.4,3.6],[.7,.4]],[[.7,.4],[1.4,2]],[[1.4,2],[2.1,.4]],[[2.1,.4],[2.4,3.6]]]:c=="—"?[[[.4,2],[2.4,2]]]:c==" "?[]:c=="F"?[[[.4,.4],[.4,3.6]],[[.4,3.6],[2.4,3.6]],[[.4,2],[2,2]]]:c=="U"?[[[.4,3.6],[.4,.4]],[[.4,.4],[2.4,.4]],[[2.4,.4],[2.4,3.6]]]:c=="C"?[[[2.4,3.6],[.4,3.6]],[[.4,3.6],[.4,.4]],[[.4,.4],[2.4,.4]]]:c=="K"?[[[.4,.4],[.4,3.6]],[[.4,2],[2.4,3.6]],[[.4,2],[2.4,.4]]]:c=="I"?[[[.4,3.6],[2.4,3.6]],[[1.4,.4],[1.4,3.6]],[[.4,.4],[2.4,.4]]]:c=="N"?[[[.4,.4],[.4,3.6]],[[.4,3.6],[2.4,.4]],[[2.4,.4],[2.4,3.6]]]:c=="G"?[[[2.4,3.6],[.4,3.6]],[[.4,3.6],[.4,.4]],[[.4,.4],[2.4,.4]],[[2.4,.4],[2.4,2]],[[1.4,2],[2.4,2]]]:c=="O"?[[[.4,.4],[.4,3.6]],[[.4,3.6],[2.4,3.6]],[[2.4,3.6],[2.4,.4]],[[2.4,.4],[.4,.4]]]:c=="S"?[[[2.4,3.6],[.4,3.6]],[[.4,3.6],[.4,2]],[[.4,2],[2.4,2]],[[2.4,2],[2.4,.4]],[[2.4,.4],[.4,.4]]]:c=="Y"?[[[.4,3.6],[1.4,2]],[[2.4,3.6],[1.4,2]],[[1.4,2],[1.4,.4]]]:c=="A"?[[[.4,.4],[1.4,3.6]],[[1.4,3.6],[2.4,.4]],[[.8,1.7],[2,1.7]]]:c=="R"?[[[.4,.4],[.4,3.6]],[[.4,3.6],[2.4,3.6]],[[2.4,3.6],[2.4,2]],[[2.4,2],[.4,2]],[[1.4,2],[2.4,.4]]]:c=="E"?[[[.4,.4],[.4,3.6]],[[.4,3.6],[2.4,3.6]],[[.4,2],[2,2]],[[.4,.4],[2.4,.4]]]:c=="T"?[[[.4,3.6],[2.4,3.6]],[[1.4,3.6],[1.4,.4]]]:c=="B"?[[[.4,.4],[.4,3.6]],[[.4,3.6],[2.4,3.6]],[[.4,2],[2.4,2]],[[.4,.4],[2.4,.4]],[[2.4,.4],[2.4,3.6]]]:c=="L"?[[[.4,.4],[.4,3.6]],[[.4,.4],[2.4,.4]]]:c=="V"?[[[.4,3.6],[1.4,.4]],[[1.4,.4],[2.4,3.6]]]:c=="?"?[[[.4,3.6],[2.4,3.6]],[[2.4,3.6],[2.4,2.5]],[[2.4,2.5],[1.4,2]],[[1.4,2],[1.4,1.6]],[[1.4,.4],[1.4,.4]]]:c=="'"?[[[1.4,3.6],[1.4,3]]]:c==","?[[[1.4,.8],[1.1,.4]]]:c=="."?[[[1.4,.4],[1.4,.4]]]:[];
module safe_glyph(c){assert(c==" " || len(safe_glyph_segments(c))>0,str("Unsupported glyph: ",c));for(s=safe_glyph_segments(c))hull(){translate(s[0])circle(d=.82,$fn=16);translate(s[1])circle(d=.82,$fn=16);}}
module safe_text_line(s){for(i=[0:len(s)-1])translate([i*3.6,0])safe_glyph(s[i]);}

module first_message_letters() {
 translate([7,23,7.55]) linear_extrude(0.6)
  for(i=[0:3]) translate([0,(3-i)*6]) safe_text_line(["FUCKING","NOSY,","AREN'T","YOU?"][i]);
}
module second_message_letters() {
 translate([7,17,2.8]) linear_extrude(0.6)
  for(i=[0:1]) translate([0,(1-i)*6]) safe_text_line(["UNBELI","EVABLE."][i]);
}
// Rear-face-down rails have 45-degree supported undersides and matching ears.
// Only the local cover tongue flexes; the body and primary walls stay rigid.
assert(secret_cover_rail_clearance_mm==.35 && secret_cover_detent_clearance_mm==.15 && secret_cover_detent_engagement_mm==.30 && secret_cover_release_travel_mm==.45,"Approved cover allowances");
function cover_release_dx_mm(y,release_mm)= y>=58 ? 0 : -release_mm*min(1,(58-y)/6);
module cover_ear(y0,y1,right=false,release_mm=0) {
 // Four longitudinal stations bound the piecewise-linear release deformation.
 for(s=[[y0,min(y1,52)], [max(y0,52),min(y1,58)],[max(y0,58),y1]])
  if(s[1]>s[0]) hull() for(y=[s[0]+.001,s[1]])
   translate([right?cover_release_dx_mm(y,release_mm):0,y,0])
    rotate([90,0,0]) linear_extrude(.001)
     polygon(right?[[36.99,6.75],[37.65,6.75],[37.65,6.95],[37,7.60],[36.99,7.60]]:
      [[2.35,6.75],[3.01,6.75],[3.01,7.60],[3,7.60],[2.35,6.95]]);
}
module cover_release_tongue(release_mm=0) {
 translate([0,0,6.75]) linear_extrude(.8) polygon([
 [34+cover_release_dx_mm(46.35,release_mm),46.35],[37+cover_release_dx_mm(46.35,release_mm),46.35],
 [37+cover_release_dx_mm(52,release_mm),52],[37,58.05],[34,58.05]]);
 cover_ear(46.35,58.05,true,release_mm);
 // Broad exposed pad, supported directly by the widened local tongue.
 translate([0,0,7.54]) linear_extrude(.61) polygon([
 [34+cover_release_dx_mm(50,release_mm),50],[37+cover_release_dx_mm(50,release_mm),50],
 [37+cover_release_dx_mm(56,release_mm),56],[34+cover_release_dx_mm(56,release_mm),56]]);
 // Raised tooth underside rises 45 degrees out from the tongue edge.
 translate([cover_release_dx_mm(50,release_mm),52,0]) rotate([90,0,0]) linear_extrude(2)
  polygon([[36.99,6.88],[37.65,7.54],[37.65,8.15],[36.99,8.15]]);
}
module secret_cover(release_mm=0) {
 union() {
  difference() {
   block_mm([3,5,6.75],[34,55,.8]);
   block_mm([33.2,46,6.65],[3.9,12,.999]);
  }
  cover_ear(5,60);
  cover_ear(5,46,true);
  cover_ear(58,60,true);
  cover_release_tongue(release_mm);
  first_message_letters();
 }
}
module fixed_second_message() {
 block_mm([4,4,2],[32,42,.8]); second_message_letters();
}
module cover_pad_clearance_sweep() {
 // Contains the clearance-expanded actual pad/tooth through 0..0.45 release,
 // and all 0..60 mm removal translations; only upper rails are relieved.
 block_mm([33.2,49.65,7.19],[4.8,70.7,1.31]);
}
// A9 upright rail roots: wall-seeded stock stays entirely below mating Y=5.
module secret_cover_rail_roots() {
 for(right=[false,true]) translate([right?40:0,0,0]) scale([right?-1:1,1,1])
  for(profile=[[[1.8,4.5],[3.7,6.4],[1.8,6.4]],
               [[1.8,6.895],[3.255,8.35],[1.8,8.35]]]) hull() {
   z0=min([for(p=profile) p[1]]); z1=max([for(p=profile) p[1]]);
   block_mm([1.8,2,z0],[.2,.1,z1-z0]);
   translate([0,5,0]) rotate([90,0,0]) linear_extrude(.1) polygon(profile);
  }
}
module secret_cover_rails() {
 difference() {
  union() {
   secret_cover_rail_roots();
   for(x=[1.8,38]) block_mm([x,5,1.9],[.2,55,6.45]);
   for(right=[false,true]) {
    translate([right?40:0,60,0]) scale([right?-1:1,1,1]) rotate([90,0,0]) linear_extrude(55)
     polygon([[1.8,4.5],[3.7,6.4],[1.8,6.4]]);
    difference() {
     translate([right?40:0,60,0]) scale([right?-1:1,1,1]) rotate([90,0,0]) linear_extrude(55)
      polygon([[1.8,6.895],[3.255,8.35],[1.8,8.35]]);
     cover_pad_clearance_sweep();
    }
   }
   // Supported raised catch retains the tooth without fouling the tapered ear.
   translate([0,53,0]) rotate([90,0,0]) linear_extrude(.85)
    polygon([[37.35,7.7],[38.2,6.85],[38.2,8.35],[37.35,8.35]]);
   // Secondary seat buttress joins the bottom primary wall without cutting it.
   // Its rear-face-down underside is z=y+1: a continuous 45-degree rise.
   translate([1.8,0,0]) rotate([0,90,0]) linear_extrude(36.4)
    polygon([[-2.8,1.8],[-7.55,1.8],[-7.55,5],[-6,5]]);
   block_mm([1.8,4,6.0],[36.4,1,1.55]);
  }
  // Inner rotary hardware is retired; the cover keeps its own reliefs.
 }
}
module safe5_secret_assembly(removed=secret_cover_removed) {
 if(removed) translate([43,0,0]) secret_cover(); else secret_cover();
}
module printable_secret_cover() { translate([-2.35,-5,-6.75]) secret_cover(); }
module integral_exterior_details(i) {
 r=exterior_plaque_record_mm(i); lines=exterior_lines(i); f=exterior_front_mm(i);
 // Broad panels and restrained frame are integral with the door face.
 block_mm([r[0]-.5,r[1]-.5,f-.01],[r[2]+1,r[3]+1,.81]);
 exterior_frame_ring(i); exterior_panel_ribs(i);
 if(i==1 || i==4) exterior_decorative_bolts(i);
 for(k=[0:len(lines)-1]) {
  w=safe_text_width_mm(lines[k]); assert(w+4<=r[2],"Exact lettering fit");
  translate([r[0]+(r[2]-w)/2+.01,r[1]+(r[3]-(len(lines)-1)*6-4.02)/2+(len(lines)-1-k)*6,f+.8]) linear_extrude(.6) safe_text_line(lines[k]);
 }
}
module exterior_frame_ring(i,inset_mm=0,rail_mm=1.6,height_mm=0.8,z_offset_mm=0) {
 r=exterior_frame_record_mm(i);
 translate([r[0]+inset_mm,r[1]+inset_mm,exterior_front_mm(i)-.01+z_offset_mm]) linear_extrude(height_mm)
  difference() { square([r[2]-2*inset_mm,r[3]-2*inset_mm]); translate([rail_mm,rail_mm]) square([r[2]-2*inset_mm-2*rail_mm,r[3]-2*inset_mm-2*rail_mm]); }
}
module exterior_panel_ribs(i) {
 // Restrained panel ribs are connected to the industrial stepped frame.
 if(i==1) for(y=[18,22]) block_mm([18,y,exterior_front_mm(i)-.01],[60,1.6,.81]);
}
module exterior_decorative_bolts(i) {
 r=exterior_frame_record_mm(i);
 for(x=[r[0]+1.5,r[0]+r[2]-1.5],y=[r[1]+1.5,r[1]+r[3]-1.5]) translate([x,y,exterior_front_mm(i)-.01]) cylinder(d=2.6,h=0.5,$fn=6);
}
module safe_assembly(i,angle_deg=door_angle_deg,latch_state_deg=latch_angle_deg,cover_removed=secret_cover_removed,released=snap_released) {
 safe_body(i); safe_door(i,angle_deg,i>1?released:false);
 if(i==1) door_transform(i,angle_deg) installed_cam_closure(i,latch_state_deg);
 if(i==5) safe5_secret_assembly(cover_removed);
}
module nested_assembly(i,active=true) {
 safe_assembly(i,active?door_angle_deg:0,active?latch_angle_deg:0,active?secret_cover_removed:false,active?snap_released:false);
 if(i<5) translate(child_placement_mm(i)+[0,0,active?extraction_distance_mm:0]) nested_assembly(i+1,false);
}
// Manufacturing pose: original Y is print Z; seated tab geometry is invariant.
// Bounds include hinge stock, complete hook reach and front knob/dial height.
function body_door_print_xmin_mm(i) = let(a=hinge_axis_mm(i),
 xhi=i==1?door_right_mm(i):safe_width_mm(i)-primary_wall_mm+.30,
 zhi=frame_front_mm(i)+max(2.35,i==1?0:cam_knob_height_mm(i)))
 min(0,a[0]+cos(110)*(xhi-a[0])-sin(110)*(zhi-a[2]));
function body_door_print_zmax_mm(i) = let(a=hinge_axis_mm(i),
 xhi=i==1?door_right_mm(i):safe_width_mm(i)-primary_wall_mm+.30)
 max(safe_depth_mm(i),a[2]+sin(110)*(xhi-a[0])+cos(110)*(door_back_mm(i)-a[2]));
module printable_body_door_unit(i) {
 translate([-body_door_print_xmin_mm(i)+.01,body_door_print_zmax_mm(i)+.01,0])
  rotate([90,0,0]) { safe_body(i); safe_door(i,110,false); }
}
module u1_print_part(i,id) {
 if(id=="body_door_unit") printable_body_door_unit(i);
 else if(i==1 && (id=="handle_axle" || id=="cam" || id=="cam_clip"))
  translate([.01,.01,0]) printable_cam_part(i,id);
 else if(id=="secret_cover" && i==5) translate([.01,.01,0]) printable_secret_cover();
 else assert(false,str("Unavailable printed part: ",i," ",id));
}
// Authoritative printable-unit inventory: pairs contain two separated solids.
function printed_inventory(i) = concat(
 [["body_door_unit",1,"body"]],
 i==1 ? [["handle_axle",1,"mechanism"],["cam",1,"mechanism"],["cam_clip",1,"mechanism"]] : [],
 i==5 ? [["secret_cover",1,"details"]] : []);
function group_parts(i,g) = [for(r=printed_inventory(i)) if(r[2]==g) for(k=[1:r[1]]) r[0]];
// Analytic normalized footprints include a .01 mm reserve on each XY edge.
function part_footprint_mm(i,id) =
 id=="body_door_unit" ? [safe_width_mm(i)-body_door_print_xmin_mm(i)+.02,body_door_print_zmax_mm(i)+.02] :
 id=="handle_axle" && i==1 ? [35.02,35.02] :
 id=="cam" && i==1 ? [cam_tip_mm(i)-cam_axis_mm(i)[0]+4.8+.02,9.62] :
 id=="cam_clip" && i==1 ? [3.62,3.62] :
 id=="secret_cover" && i==5 ? [35.32,55.02] :
 assert(false,str("Unavailable footprint: ",i," ",id)) [0,0];
// Shelf packing uses 3 mm clear gaps and a 5 mm plate margin.
function packed_positions_mm(i,ids,k=0,x=5,y=5,row_height=0) = k>=len(ids) ? [] :
 let(f=part_footprint_mm(i,ids[k]),wrap=x+f[0]>251,px=wrap?5:x,py=wrap?y+row_height+3:y,rh=wrap?f[1]:max(row_height,f[1]))
 concat([[px,py]],packed_positions_mm(i,ids,k+1,px+f[0]+3,py,rh));
module printable_group(i,g) {
 ids=group_parts(i,g); positions=packed_positions_mm(i,ids);
 if(len(ids)>0) for(k=[0:len(ids)-1]) {
  f=part_footprint_mm(i,ids[k]); p=positions[k];
  assert(p[0]>=5 && p[1]>=5 && p[0]+f[0]<=251 && p[1]+f[1]<=251,"Print group exceeds physical plate margin");
  translate([p[0],p[1],0]) u1_print_part(i,ids[k]);
 }
}
// Complete-set occurrences retain inventory order and copy identity.
// Occurrence: [safe, part ID, copy]. Placement: [safe, part ID, copy,
// plate, x, y, width, height]. Manufacturing transforms are translation-only.
function complete_set_occurrences() = [for(i=[1:5]) for(r=printed_inventory(i)) for(copy=[1:r[1]]) [i,r[0],copy]];
function complete_set_placements(occurrences,k=0,plate=1,x=5,y=5,row_height=0) =
 k>=len(occurrences) ? [] :
 let(o=occurrences[k],f=part_footprint_mm(o[0],o[1]))
 assert(is_num(f[0]) && is_num(f[1]) && f[0]>0 && f[1]>0 && f[0]<=246 && f[1]<=246,
        str("Invalid or oversized complete-set footprint: ",o," ",f))
 let(wrap=x+f[0]>251,
     row_x=wrap?5:x,row_y=wrap?y+row_height+3:y,
     next_plate=row_y+f[1]>251,
     px=next_plate?5:row_x,py=next_plate?5:row_y,
     pp=next_plate?plate+1:plate,
     rh=next_plate || wrap ? f[1] : max(row_height,f[1]))
 concat([[o[0],o[1],o[2],pp,px,py,f[0],f[1]]],
        complete_set_placements(occurrences,k+1,pp,px+f[0]+3,py,rh));
function complete_set_plate_count(placements) = placements[len(placements)-1][3];
function complete_set_overview_offset_mm(plate) = [((plate-1)%2)*276,floor((plate-1)/2)*276,0];
module printable_complete_set() {
 placements=complete_set_placements(complete_set_occurrences());
 plate_count=complete_set_plate_count(placements);
 assert(is_num(plate_index) && floor(plate_index)==plate_index && plate_index>=0 && plate_index<=plate_count,
        str("Complete-set plate_index must be an integer in 0..",plate_count));
 echo(complete_set_plate_count=plate_count,complete_set_occurrence_count=len(placements));
 for(p=placements) {
  echo(complete_set_placement=p);
  assert(p[4]>=5 && p[5]>=5 && p[4]+p[6]<=251 && p[5]+p[7]<=251,"Complete-set plate margin exceeded");
  if(plate_index==0 || p[3]==plate_index)
   translate([p[4],p[5],0]+(plate_index==0?complete_set_overview_offset_mm(p[3]):[0,0,0]))
    u1_print_part(p[0],p[1]);
 }
}

// Integral inner snap closures (Safes 2–5).
module inner_snap_panel_cut(i) {
 r=door_right_mm(i); b=door_back_mm(i);
 c=snap_running_clearance_mm;travel=snap_release_travel_mm;
 block_mm([r-(.80+travel+c),18,b-.01],[travel+c,12+c,2.02]);
 block_mm([r-.80,18,b-.01],[.81,12+c,2.02]);
}
module snap_deformation(i,released=false) {
 travel=snap_release_travel_mm;
 if(!released) children();
 else union() {
  // The finite root at Y17.95..18 remains fixed throughout release.
  intersection() { children(); cube([safe_width_mm(i),18,safe_depth_mm(i)]); }
  intersection() {
   multmatrix([[1,-travel/12,0,travel*18/12],[0,1,0,0],[0,0,1,0],[0,0,0,1]]) children();
   block_mm([0,18,0],[safe_width_mm(i),safe_height_mm(i)-18,safe_depth_mm(i)]);
  }
 }
}
module inner_hook_span(i,y0,y1,root_overlap_mm=0) {
 r=door_right_mm(i); b=door_back_mm(i); z=hinge_axis_mm(i)[2];t=safe_width_mm(i)-2+.30;travel=snap_release_travel_mm;
 multmatrix([[1,travel/12,0,-travel*30/12],[0,1,0,0],[0,0,1,0],[0,0,0,1]])
  translate([0,y1,0]) rotate([90,0,0]) linear_extrude(y1-y0)
   polygon([[r-.80-root_overlap_mm,b+.01],[r,b+.01],[t,z],[r-.80-root_overlap_mm,z]]);
}
module inner_snap(i,released=false) {
 r=door_right_mm(i); b=door_back_mm(i); f=frame_front_mm(i); t=safe_width_mm(i)-2+.30;c=snap_running_clearance_mm;
 snap_deformation(i,released) union() {
  block_mm([r-.8,17.95,b],[.8,12.05,2]);
  // Exact X/Z closing ramp, finite overlap with the tab.
  // One parametric convex solid shares the full hook/root boundary.
  hull() {
   intersection() {
    block_mm([r-.8,27,b],[.8,.01,2]);
    inner_hook_span(i,27,27.01);
   }
   inner_hook_span(i,28.49,28.51);
   inner_hook_span(i,28.5,30);
  }
  // Front-facing 3x6 pad clears the rigid door by 0.35 in Z.
  block_mm([r-3,24,f+c],[3,6,.8]);
  block_mm([r-.8,21.8,f-.01],[.8,8.2,c+.02]);
  hull() {
   block_mm([r-.8,21.8-(c+.80),f-.01],[.8,.01,.01]);
   block_mm([r-.8,21.8,f-.01],[.8,.01,c+.81]);
  }
  hull() {
   block_mm([r-.8,21.8,f+c],[.8,.01,.8]);
   block_mm([r-3,24,f+c],[3,.01,.8]);
  }
 }
}
module inner_snap_catch(i) {
 x=safe_width_mm(i)-2; f=frame_front_mm(i); z=hinge_axis_mm(i)[2];c=snap_running_clearance_mm;
 catch_front=z+c+.8;
 root_start=28-(catch_front-(f-.10));
 hull() {
  // Actual root is entirely wall-connected, with no forward unsupported start.
  block_mm([x,root_start,f-.10],[2,.2,.10]);
  block_mm([x,28,z+c],[2,2.35,.8]);
 }
}
module inner_snap_receiver(i) {
 r=door_right_mm(i); b=door_back_mm(i); f=frame_front_mm(i); z=hinge_axis_mm(i)[2]; t=safe_width_mm(i)-2+.30;c=snap_running_clearance_mm;
 // Deliberately excludes all primary stock Z <= door_back, especially Safe 5.
 intersection() {
  block_mm([r-c,17.95-c,b+.0001],[t-r+2*c,12.05+2*c,z-b+c-.0001]);
  hull() {
   translate([-c,-c,-c]) inner_snap(i,false);
   translate([c,c,c]) inner_snap(i,false);
  }
 }
}
module inner_pad_decor_clearance(i) {
 r=door_right_mm(i);f=frame_front_mm(i);c=snap_running_clearance_mm;travel=snap_release_travel_mm;
 // Secondary decoration only: full tab-support/pad shear corridor plus clearance.
 block_mm([r-(3+travel+c),21.8-(c+.80)-c,f-.01],[3+travel+2*c,30+c-(21.8-(c+.80)-c),2*c+.81]);
}
module inner_fixed_knob(i) {
 translate([door_right_mm(i)-(i==2?10:9),34,frame_front_mm(i)-.01])
  cylinder(r=cam_knob_radius_mm(i),h=cam_knob_height_mm(i)+.01);
}
// Output dispatch
if(render_mode=="assembly") {
 if(assembly_view=="nested") nested_assembly(safe_index); else safe_assembly(safe_index);
} else if(render_mode=="individual_part") {
 assert(part_id!="","Select an individual part"); u1_print_part(safe_index,part_id);
} else if(print_scope=="complete_set") printable_complete_set();
else if(part_id!="") u1_print_part(safe_index,part_id);
else printable_group(safe_index,print_group);
