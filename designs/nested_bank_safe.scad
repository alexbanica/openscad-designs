// Five independently dimensioned, all-printed nested bank safes.
// Shells, hinges, retained closures, exterior plaques and two-stage final reveal.
// Adjustable Parameters
// Selection and motion
render_mode = "printable_layout";
safe_index = 1;
print_group = "body";
part_id = "";
assembly_view = "single";
show_guide_plate = true; // Assembly inspection only; manufacturing retains the guide.
door_angle_deg = 0;
latch_angle_deg = 90;
secret_slide_mm = 0;
secret_stop_snap_clearance_mm = 0.2; // Named C-clip snap exception.
secret_cleat_edge_clearance_mm = 0.05; // Static plaque edge/foreflange exception.
secret_cleat_flange_thickness_mm = 0.55; // Mechanical flange, not primary shell.
secret_left_capture_height_mm = 0.45; // Thin rigid capture cap, not primary shell.
secret_cleat_clip_radial_clearance_mm = 0.15; // Captive neck snap exception.
exterior_mount_axial_clearance_mm = 0.05; // Static shoulder allowance.
exterior_clip_radial_clearance_mm = 0.15; // Positive neck C-clip snap exception.
extraction_distance_mm = 0;
// Manually release the front slider before turning the handle. Preview defaults
// depict the catch released for an unlatched rotor; no automatic mechanism.
safe1_catch_engaged = latch_angle_deg == 0;
safe1_catch_slide_mm = safe1_catch_engaged ? 0 : 4;
dial_angle_deg = 0;
safe1_dial_clip_axial_clearance_mm = 0.05; // Static neck end clearances.
safe1_dial_clip_radial_clearance_mm = 0.15; // Snap exception, not bearing.
// Dimensions: complete installed W/H/D, manually selected CAD dimensions.
safe_envelopes_mm = [[85,100,75],[71,90,54],[59,81,39],[49,73,27],[40,65,17]];
primary_wall_mm = 2;
nest_clearance_mm = 0.5;
moving_clearance_mm = 0.35;
hinge_pin_diameter_mm = 1;
safe1_drive_peg_diameter_mm = 1.5;
safe1_drive_radius_mm = 9;
safe1_mount_axial_clearance_mm = 0.05; // Static guide/head/clip shoulder gaps.
safe1_axle_axial_clearance_mm = 0.05; // Keyed rotor and axle turn together.
// Rigid front grip beams, not primary chamber walls or flexible hinges.
retrieval_cap_depths_mm = [2,2,2,1.2,2];
retainer_axial_clearance_mm = 0.05; // Static leaf head and rear clip axial gap.
cam_clip_radial_clearance_mm = 0.15; // Snap neck exception, not a bearing.
cam_stack_axial_clearance_mm = 0.05; // Keyed stack shoulder exception.
hinge_snap_clearance_mm = 0.15; // Captive clip radial exception; not a running bearing.
$fn = 32;

// Derived Values
secret_upper_capture_back_mm = 8.5;
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
function hinge_axis_mm(i) = [i==5?2:chamber_left_mm(i)/2,0,i==5?12:door_back_mm(i)+1];
function hinge_radius_mm(i) = i==5?2:3;
function hinge_start_mm(i) = i==5?3:chamber_bottom_mm(i);
function hinge_end_mm(i) = i==5?63:safe_height_mm(i)-chamber_bottom_mm(i);
function hinge_record_mm(i) = [hinge_axis_mm(i),hinge_radius_mm(i),hinge_start_mm(i),hinge_end_mm(i)];
function fixed_hinge_segments_mm(i) = i==5?[[3,11],[31,9],[55,8]]:let(y=hinge_start_mm(i),l=hinge_end_mm(i)-y) [[y,l*0.1742424242],[y+l*0.4318181818,l*0.1363636364],[y+l*0.8257575758,l*0.1742424242]];
function moving_hinge_segments_mm(i) = i==5?[[14.35,16.3],[40.35,14.3]]:let(y=hinge_start_mm(i),l=hinge_end_mm(i)-y,s=fixed_hinge_segments_mm(i)) [[s[0][0]+s[0][1]+moving_clearance_mm,s[1][0]-s[0][0]-s[0][1]-2*moving_clearance_mm],[s[1][0]+s[1][1]+moving_clearance_mm,s[2][0]-s[1][0]-s[1][1]-2*moving_clearance_mm]];
function door_left_mm(i) = i==5?3:hinge_axis_mm(i)[0]+hinge_radius_mm(i)+moving_clearance_mm;
function door_bottom_mm(i) = i==5?3:chamber_bottom_mm(i)+moving_clearance_mm;
function door_width_mm(i) = i==5?34:safe_width_mm(i)-primary_wall_mm-moving_clearance_mm-door_left_mm(i);
function door_height_mm(i) = i==5?57.5:chamber_size_mm(i)[1]-2*moving_clearance_mm;
function leaf_front_mm(i) = hinge_axis_mm(i)[2]+hinge_radius_mm(i);
function leaf_back_mm(i) = door_back_mm(i)-moving_clearance_mm-1.2;
function leaf_pin_positions_mm(i,k) = let(s=moving_hinge_segments_mm(i)[k]) [[door_left_mm(i)+(i==5?3.5:2.2),s[0]+4],[door_left_mm(i)+(i==5?3.5:2.2),s[0]+s[1]-4]];
function retrieval_roof_mm(i) = i==5?63:safe_height_mm(i)-chamber_bottom_mm(i);
function retrieval_cap_depth_mm(i) = retrieval_cap_depths_mm[i-1];
// Exact accessible recess, [origin,size]; roof slot connects to the door notch.
function finger_recess_record_mm(i) = i==5 ? [[14,55,9],[12,6,6]] : [[safe_width_mm(i)/2-6,retrieval_roof_mm(i)-6,safe_depth_mm(i)-retrieval_cap_depth_mm(i)-6],[12,6,6]];
safe1_rotor_center_mm = [48,36];
safe1_rotor_back_mm = 57.35;
safe1_bolt_back_mm = 59.7;
safe1_guide_back_mm = 62.05;
function safe1_bolt_travel_mm(a) = safe1_drive_radius_mm*(cos(45)-cos(45+a));
function safe1_peg_x_mm(left=true) = 48+(left?-1:1)*safe1_drive_radius_mm*cos(45);
function safe1_bolt_y_mm(left=true) = left?24.7:40.065;
function safe1_slot_y_mm(left=true) = left?27:36+safe1_drive_radius_mm*cos(45);
function cam_axis_mm(i) = [[0,0],[63,34],[51,34],[42,34],[32,31]][i-1];
function cam_back_mm(i) = door_back_mm(i)-primary_wall_mm-moving_clearance_mm;
function cam_tip_mm(i) = safe_width_mm(i)-primary_wall_mm+0.65;
function cam_knob_height_mm(i) = [0,4,2.5,1.2,2][i-1];
function cam_knob_radius_mm(i) = [0,7,5.5,4.5,3.5][i-1];
function cam_knob_back_mm(i) = door_back_mm(i)+primary_wall_mm+moving_clearance_mm;
function cam_knob_front_mm(i) = cam_knob_back_mm(i)+cam_knob_height_mm(i);
function cam_axle_origin_mm(i) = cam_back_mm(i)+cam_stack_axial_clearance_mm;
function cam_key_length_mm(i) = cam_knob_front_mm(i)+cam_stack_axial_clearance_mm-cam_axle_origin_mm(i);
// Exterior records: plaque [x,y,width,height]; frame has separate colourable stock.
function exterior_plaque_record_mm(i) = [[26,76.5,44,12],[16,60,38,12],[13,53,40,12],[12,48,30,14]][i-1];
function exterior_frame_record_mm(i) = [[17,12,62,77],[14,57,42,18],[11,50,44,18],[10,12,35,51]][i-1];
function exterior_lines(i) = [["PRIVATE —","DO NOT OPEN"],["NOT YOURS"],["SERIOUSLY?"],["LAST","WARNING"]][i-1];
function exterior_mount_positions_mm(i) = let(r=exterior_plaque_record_mm(i)) [[r[0]+1.35,r[1]+1.5],[r[0]+r[2]-1.35,r[1]+r[3]-1.5]];
function exterior_front_mm(i) = door_back_mm(i)+primary_wall_mm;
function safe_text_width_mm(s) = len(s)==0?0:(len(s)-1)*3.6+2.82;
function sweep_point(p,a) = [cos(a)*p[0]-sin(a)*p[1],sin(a)*p[0]+cos(a)*p[1]];


assert(primary_wall_mm>=2,"Primary shell walls must be at least 2 mm");
assert(nest_clearance_mm>=0.5 && moving_clearance_mm>=0.3 && moving_clearance_mm<=0.4,"Clearance budget");
assert(safe_index>=1 && safe_index<=5 && floor(safe_index)==safe_index,"Unsupported safe index");
assert(render_mode=="printable_layout" || render_mode=="assembly" || render_mode=="individual_part","Unsupported render mode");
assert(print_group=="body" || print_group=="door" || print_group=="mechanism" || print_group=="details","Unsupported print group");
assert(part_id=="" || len([for(r=printed_inventory(safe_index)) if(r[0]==part_id) r])==1,"Part unavailable for selected safe");
assert(assembly_view=="single" || assembly_view=="nested","Unsupported assembly view");
assert(safe1_catch_slide_mm>=0 && safe1_catch_slide_mm<=4,"Rigid catch travel");
assert(!safe1_catch_engaged || (safe1_catch_slide_mm==0 && latch_angle_deg==0),"Release front catch before rotating handle");
assert(latch_angle_deg==0 || safe1_catch_slide_mm==4,"Withdraw catch completely before rotating rotor");
assert(safe1_dial_clip_axial_clearance_mm==0.05 && safe1_dial_clip_radial_clearance_mm==0.15,"Allocated dial clip exceptions");
assert(latch_angle_deg>=0 && latch_angle_deg<=90,"Quarter-turn latch travel");
assert(safe1_drive_radius_mm==9 && safe1_drive_peg_diameter_mm==1.5,"Safe 1 allocated drive dimensions");
assert(door_angle_deg>=0 && door_angle_deg<=110,"Door travel");
assert(door_angle_deg==0 || latch_angle_deg==90,"Retract latch fully before opening door");
assert(extraction_distance_mm>=0,"Extraction cannot move rearward");
assert(safe_index<5 || extraction_distance_mm==0,"Safe 5 has no child to extract");
assert(extraction_distance_mm==0 || (assembly_view=="nested" && door_angle_deg==110 && latch_angle_deg==90),"Extraction requires nested view and fully clear door");
assert(secret_slide_mm==0 || (safe_index==5 && door_angle_deg>0 && latch_angle_deg==90),"Secret reveal requires active Safe 5 with open door");
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
 assert(safe_width_mm(i)<=246 && safe_height_mm(i)<=246,"Body plate bounds");
 if(i<5) {
  assert(chamber_left_mm(i)>=primary_wall_mm && chamber_bottom_mm(i)>=primary_wall_mm,"Primary frame stock");
  assert(primary_wall_mm+chamber_size_mm(i)[2]<=door_back_mm(i)-moving_clearance_mm,"Child rear/front clearance");
  assert(safe_width_mm(i+1)+2*nest_clearance_mm<=chamber_size_mm(i)[0] && safe_height_mm(i+1)+2*nest_clearance_mm<=chamber_size_mm(i)[1],"Complete child passes throat");
 }
}

module block_mm(origin,size) { translate(origin) cube(size); }
module hinge_barrel(i,y_mm,length_mm,clearance_mm=0,bore=true) {
 a=hinge_axis_mm(i);
 translate([a[0],y_mm,a[2]]) rotate([-90,0,0]) difference() {
  cylinder(r=hinge_radius_mm(i)+clearance_mm,h=length_mm);
  if(bore) translate([0,0,-0.1]) cylinder(d=hinge_pin_diameter_mm+2*moving_clearance_mm,h=length_mm+0.2);
 }
}
module hinge_segment_relief(i,moving=true) {
 for(s=moving?moving_hinge_segments_mm(i):fixed_hinge_segments_mm(i)) hinge_barrel(i,s[0]-moving_clearance_mm,s[1]+2*moving_clearance_mm,moving_clearance_mm,false);
}
module hinge_head_recess(i) {
 a=hinge_axis_mm(i);
 for(s=[[hinge_start_mm(i)-0.01,0.96],[hinge_end_mm(i)-1,1.1]]) translate([a[0],s[0],a[2]]) rotate([-90,0,0]) cylinder(d=3.1,h=s[1]);
}
module body_hinges(i) { difference() { for(s=fixed_hinge_segments_mm(i)) hinge_barrel(i,s[0],s[1]); hinge_head_recess(i); } }
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
// Front-only pocket for the panel's left edge. The fixed barrels are added
// afterwards, preserving the continuous rear/side shell and hinge stock.
// The remaining front corner is inside the fixed barrel radius throughout
// panel rotation; a closed-position-only gap would miss its diagonal corner.
module door_panel_pocket(i) {
 if(i<=4) {
  left=door_left_mm(i)-2*moving_clearance_mm;
  corner_x=left-hinge_axis_mm(i)[0];
  corner_z=hinge_axis_mm(i)[2]-door_back_mm(i)+moving_clearance_mm;
  assert(sqrt(corner_x*corner_x+corner_z*corner_z)<=hinge_radius_mm(i),"Front pocket corner inside fixed hinge radius");
  assert(door_left_mm(i)-hinge_axis_mm(i)[0]-hinge_radius_mm(i)+1e-9>=0.3,"Continuous panel radial clearance");
  assert(left>=primary_wall_mm,"Front pocket retains primary side stock");
  // Rear stock ends moving_clearance_mm behind the minimum swept Z; floor and
  // roof retain the same moving clearance because rotation preserves Y.
  block_mm([left,chamber_bottom_mm(i),door_back_mm(i)-moving_clearance_mm],
   [chamber_left_mm(i)+moving_clearance_mm-left,chamber_size_mm(i)[1],safe_depth_mm(i)-door_back_mm(i)+moving_clearance_mm+0.1]);
 }
}
module safe_body(i) {
 difference() {
  union() {
   difference() {
    cube([safe_width_mm(i),safe_height_mm(i),frame_front_mm(i)]);
    block_mm(chamber_origin_mm(i),[chamber_size_mm(i)[0],chamber_size_mm(i)[1],safe_depth_mm(i)+0.1]);
    door_panel_pocket(i);
    hinge_segment_relief(i,true);
    moving_leaf_sweep_relief(i);
    if(i==1) safe1_receiver_cutters();
    else cam_receiver_cutters(i);
    // Safe 5 slide passage keeps its rails and captive stop clear.
    if(i==5) block_mm([2,60,5.25],[36,6,3.25]);
   }
   body_hinges(i);
   retrieval_lip(i);
   if(i==5) { secret_slide_rails(); second_message_rails(); }
  }
  retrieval_recess(i);
  if(i==5) secret_stop_cutters();
 }
}
// Each moving leaf is independently printed and slides sideways over the panel.
// Two headed pins with recessed C-clips provide positive retention and anti-twist.
module leaf_pin_bores(i,k) {
 for(p=leaf_pin_positions_mm(i,k)) translate([p[0],p[1],leaf_back_mm(i)-0.1]) cylinder(d=2.3,h=leaf_front_mm(i)-leaf_back_mm(i)+0.2);
}
module hinge_leaf(i,k) {
 s=moving_hinge_segments_mm(i)[k]; a=hinge_axis_mm(i);
 x=a[0]+hinge_radius_mm(i)-1; right=door_left_mm(i)+(i==5?5.7:4.4);
 difference() {
  union() {
   hinge_barrel(i,s[0],s[1]);
   block_mm([x,s[0],leaf_back_mm(i)],[right-x,s[1],1.2]);
   block_mm([x,s[0],door_back_mm(i)+primary_wall_mm+moving_clearance_mm],[right-x,s[1],leaf_front_mm(i)-door_back_mm(i)-primary_wall_mm-moving_clearance_mm]);
  }
  leaf_pin_bores(i,k);
  for(p=leaf_pin_positions_mm(i,k)) {
   translate([p[0],p[1],leaf_back_mm(i)-0.1]) cylinder(d=3.5,h=0.75);
  }
 }
}
module moving_leaf_sweep_relief(i) {
 a=hinge_axis_mm(i); x=hinge_radius_mm(i)-1; right=door_left_mm(i)+(i==5?5.7:4.4)-a[0];
 for(s=moving_hinge_segments_mm(i))
  translate([a[0],s[0]+s[1]+moving_clearance_mm,a[2]]) rotate([90,0,0]) linear_extrude(s[1]+2*moving_clearance_mm)
   offset(delta=moving_clearance_mm) union() {
    for(zs=[[leaf_back_mm(i)-a[2],door_back_mm(i)-moving_clearance_mm-a[2]],[door_back_mm(i)+primary_wall_mm+moving_clearance_mm-a[2],leaf_front_mm(i)-a[2]]])
     for(ang=[0:5:105]) hull() {
      polygon([for(p=[[x,zs[0]],[right,zs[0]],[right,zs[1]],[x,zs[1]]]) sweep_point(p,ang)]);
      polygon([for(p=[[x,zs[0]],[right,zs[0]],[right,zs[1]],[x,zs[1]]]) sweep_point(p,ang+5)]);
     }
   }
}
module safe_door_closed(i) {
 difference() {
  union() {
   block_mm([door_left_mm(i),door_bottom_mm(i),door_back_mm(i)],[door_width_mm(i),door_height_mm(i),primary_wall_mm]);
   if(i>1) cam_fixed_stop(i);
  }
  if(i<5) exterior_mount_bores(i);
  if(i>1) let(a=cam_axis_mm(i)) translate([a[0],a[1],door_back_mm(i)-0.1]) cylinder(d=2+2*moving_clearance_mm,h=primary_wall_mm+0.2);
  hinge_segment_relief(i,false);
  hinge_segment_relief(i,true);
  for(k=[0:1]) leaf_pin_bores(i,k);
  if(i==1) {
   translate([48,36,door_back_mm(i)-0.1]) cylinder(d=4.7,h=primary_wall_mm+0.2);
   // Front-operable catch stem: 4 mm stroke plus 0.35 end clearance.
   block_mm([67.65,34.5,63.5],[8.7,3,2.2]);
   translate([48,65,63.5]) cylinder(d=4.7,h=2.2);
   for(x=[64,76]) {
    translate([x,33.2,63.5]) cylinder(d=1.7,h=2.2);
    translate([x,33.2,63.5]) cylinder(d=3,h=0.75);
   }
   // Four through bores for positively retained printed guide pins.
   for(p=safe1_guide_mounts_mm) translate([p[0],p[1],door_back_mm(i)-0.1]) cylinder(d=2.3,h=primary_wall_mm+0.2);
  }
  block_mm([safe_width_mm(i)/2-6,safe_height_mm(i)-(i==5?10:chamber_bottom_mm(i)+6),door_back_mm(i)-0.1],[12,6,primary_wall_mm+0.2]);
 }
}
// Local pin coordinates: broad head at Z=0; shaft grows towards the rear.
module leaf_pin(i) {
 span=leaf_front_mm(i)-leaf_back_mm(i)+0.6+retainer_axial_clearance_mm;
 union() {
  cylinder(d=3.2,h=0.6);
  translate([0,0,0.55]) cylinder(d=1.6,h=span-1.2);
  translate([0,0,span-0.65]) cylinder(d=1,h=0.55);
  translate([0,0,span-0.15]) cylinder(d=1.6,h=0.15);
 }
}
module leaf_clip(i) {
 linear_extrude(0.5) difference() { circle(d=2.8); circle(d=1+2*hinge_snap_clearance_mm); translate([-2,-0.3]) square([2,0.6]); }
}
module installed_leaves(i) {
 for(k=[0:1]) {
  hinge_leaf(i,k);
  for(p=leaf_pin_positions_mm(i,k)) {
   translate([p[0],p[1],leaf_front_mm(i)+0.6+retainer_axial_clearance_mm]) rotate([180,0,0]) leaf_pin(i);
   translate([p[0],p[1],leaf_back_mm(i)+0.15]) leaf_clip(i);
  }
 }
}
module door_transform(i,angle_deg=door_angle_deg) {
 a=hinge_axis_mm(i); translate(a) rotate([0,-angle_deg,0]) translate(-a) children();
}
module safe_door(i,angle_deg=door_angle_deg) { door_transform(i,angle_deg) { safe_door_closed(i); installed_leaves(i); } }
module hinge_pin(i) {
 a=hinge_axis_mm(i); y0=hinge_start_mm(i); l=hinge_end_mm(i)-y0;
 translate([a[0],y0,a[2]]) rotate([-90,0,0]) union() {
  cylinder(d=2.4,h=0.6);
  translate([0,0,0.55]) cylinder(d=hinge_pin_diameter_mm,h=l-1.2);
  translate([0,0,l-0.65]) cylinder(d=0.6,h=0.6);
  translate([0,0,l-0.1]) cylinder(d=hinge_pin_diameter_mm,h=0.1);
 }
}
module hinge_clip(i) {
 a=hinge_axis_mm(i);
 translate([a[0],hinge_end_mm(i)-0.65,a[2]]) rotate([-90,0,0]) linear_extrude(0.55) difference() {
  circle(d=2.4); circle(d=0.6+2*hinge_snap_clearance_mm); translate([-2,-0.2]) square([2,0.4]);
 }
}
// U2 physical cam/slider drive. Manufacture and assembly share these solids.
safe1_guide_mounts_mm = [[20,22],[76,22],[20,50],[76,50]];
module safe1_receiver_cutters() {
 // Right receiver passes completely through its 2 mm wall; no thin outer skin.
 for(left=[true,false]) block_mm([left?9.65:83,safe1_bolt_y_mm(left)-moving_clearance_mm,59.35],[left?1.45:2.1,7.235+2*moving_clearance_mm,2.7]);
}
module safe1_rotor() {
 translate([48,36,safe1_rotor_back_mm]) difference() {
  union() {
   cylinder(r=12,h=2);
   // Running axial shoulder reaches within 0.35 of the fixed guide face.
   translate([0,0,1.95]) cylinder(d=7,h=2.4);
   // Rigid stop peg sweeps only the guide's upper-left clear quadrant.
   translate([0,10.5,1.95]) cylinder(d=1.5,h=3.45);
   for(a=[225,45]) translate([9*cos(a),9*sin(a),1.95]) cylinder(d=safe1_drive_peg_diameter_mm,h=2.4);
  }
  // Rigid catch tongue enters this notch only at the latched 0-degree stop.
  translate([10.6,-1.5,-0.1]) cube([1.5,3,2.2]);
  // Recessed axle head remains forward of the child chamber ending at Z57.
  translate([0,0,-0.1]) cylinder(d=7.7,h=0.75);
  // Keyed bore receives the successor's independent handle axle.
  translate([0,0,-0.1]) linear_extrude(4.6) intersection() { circle(d=4.7); square([4.7,3.7],center=true); }
 }
}
module safe1_bolt(left=true) {
 y=safe1_bolt_y_mm(left); px=safe1_peg_x_mm(left);
 difference() {
  block_mm([left?10:49.5,y,safe1_bolt_back_mm],[34.5,7.235,2]);
  // Transverse slots contain the full curved peg sweep plus 0.35 per surface.
  translate([px,safe1_slot_y_mm(left),safe1_bolt_back_mm-0.1]) linear_extrude(2.2) hull() {
   circle(d=safe1_drive_peg_diameter_mm+2*moving_clearance_mm);
   translate([0,9-9*cos(45)]) circle(d=safe1_drive_peg_diameter_mm+2*moving_clearance_mm);
  }
 }
}
module safe1_guide() {
 difference() {
  union() {
   block_mm([14,20,safe1_guide_back_mm],[68.65,32,1.2]);
   // Capped rails: broad upper plate plus lower edge lips hold both sliders.
   // Lips stay outside the rotor's x36..60 sweep; no drive-layer intersection.
   for(left=[true,false]) let(x=left?24:64,y=safe1_bolt_y_mm(left))
    for(upper=[false,true]) {
     block_mm([x,upper?y+7.235+moving_clearance_mm:y-moving_clearance_mm-1.2,59.0],[left?9:6,1.2,3.05]);
     block_mm([x,upper?y+7.235-0.8:y-moving_clearance_mm-1.2,59.0],[left?9:6,2.35,0.35]);
    }
   // Rigid catch T-channel. Rear lip and front roof capture the tongue;
   // rotor sweep ends at X60, so fixed channel stock starts at X61.
   // Rear keeper is separate so the slider inserts from the rear.
   for(x=[64,76]) block_mm([x-1.25,31.9,57.8],[2.5,2.6,4.25]);
   for(y=[33.5,37.5]) block_mm([61,y,57.8],[17,1,4.25]);
   block_mm([61,33.5,59.7],[17,5,2.35]);
   // Separate printed spacer washers preserve broad-face guide printing.
  }
  // Closed-end stem window gives positive travel stops; assemble catch in
  // this channel before securing guide onto the detached door.
  block_mm([67.65,34.5,59.6],[8.7,3,3.8]);
  for(x=[64,76]) {
   translate([x,33.2,57.7]) cylinder(d=1.7,h=5.8);
   block_mm([x-1.25,31.9,57.7],[2.5,2.6,0.5]);
  }
  // Annular running clearance, with tangent end faces at exact 0/90 stops.
  translate([48,36,61.95]) linear_extrude(1.7) intersection() {
   difference() { circle(r=11.6); circle(r=9.4); }
   translate([-12,-0.75]) square([12.75,13]);
  }
  // Real through windows expose the moving bolt tips and transverse slots.
  for(left=[true,false]) block_mm([left?15:60,safe1_bolt_y_mm(left)+0.8,61.95],[left?20:21,5.635,1.7]);
  translate([48,36,61.95]) cylinder(d=4.7,h=1.7);
  for(p=safe1_guide_mounts_mm) translate([p[0],p[1],61.95]) cylinder(d=2.3,h=1.8);
 }
}
// Mounting pins insert from the exterior; clips remain accessible behind the
// guide with the door detached. Four washers set the gap before clips engage.
module safe1_guide_pin() {
 union() {
  cylinder(d=3.4,h=0.6);
  translate([0,0,0.55]) cylinder(d=1.6,h=3.7);
  translate([0,0,4.25]) cylinder(d=1,h=0.55);
  translate([0,0,4.8]) cylinder(d=1.6,h=0.15);
 }
}
module safe1_guide_spacer() {
 difference() { cylinder(d=3.8,h=0.35); translate([0,0,-0.1]) cylinder(d=2.3,h=0.55); }
}
module safe1_guide_clip() {
 linear_extrude(0.5) difference() { circle(d=2.8); circle(d=1.3); translate([-2,-0.3]) square([2,0.6]); }
}
module safe1_key_profile(clearance_mm=0) {
 intersection() { circle(d=4+2*clearance_mm); square([4+2*clearance_mm,3+2*clearance_mm],center=true); }
}
// Head-down printed axle: keyed shaft through rotor, round running bores in
// guide and door, separate keyed handle, neck and positive front C-clip.
module safe1_handle_axle() {
 union() {
  cylinder(d=7,h=0.6);
  translate([0,0,0.55]) linear_extrude(13.05) safe1_key_profile();
  translate([0,0,13.55]) cylinder(d=2.8,h=0.8);
  // Keyed collar passes the rotor/handle flats while retaining C-clip arc bearing.
  translate([0,0,14.35]) linear_extrude(0.25) safe1_key_profile();
 }
}
module safe1_handle() {
 difference() {
  union() {
   cylinder(d=12,h=5);
   for(a=[0,120,240]) rotate([0,0,a]) hull() {
    translate([4,0,0]) cylinder(r=2.5,h=2.5);
    translate([15,0,0]) cylinder(r=2.5,h=2.5);
   }
  }
  translate([0,0,-0.1]) linear_extrude(5.2) safe1_key_profile(moving_clearance_mm);
 }
}
module safe1_axle_clip() {
 linear_extrude(0.7) difference() { circle(d=7); circle(d=3.1); translate([-4,-0.9]) square([4,1.8]); }
}
module installed_safe1_handle(angle_deg) {
 // Rotor rear pocket shoulder Z58 supports the axle head at Z57.4..58.
 // Front handle hub Z65.95..70.95: rear shoulder clears door by 0.35;
 // its spokes occupy Z68.45..70.95. Rotor sleeve clears guide by 0.35.
 // Both shoulder faces constrain the complete axle stack axially.
 // Separate handle slides over its keyed shaft and is retained by the C-clip;
 // clip Z71..71.7 bears on the positive end collar at Z71.75.
 translate([48,36,safe1_rotor_back_mm+safe1_axle_axial_clearance_mm]) rotate([0,0,angle_deg]) safe1_handle_axle();
 translate([48,36,70.95]) rotate([0,0,angle_deg]) rotate([180,0,0]) safe1_handle();
 translate([48,36,70.95+safe1_axle_axial_clearance_mm]) rotate([0,0,angle_deg]) safe1_axle_clip();
 for(p=safe1_guide_mounts_mm) {
  translate([p[0],p[1],66.2+safe1_mount_axial_clearance_mm]) rotate([180,0,0]) safe1_guide_pin();
  translate([p[0],p[1],61.55-safe1_mount_axial_clearance_mm]) safe1_guide_clip();
  translate([p[0],p[1],63.25]) safe1_guide_spacer();
 }
}
// Catch is one rigid printed slider, supported on its broad side for printing.
// The finger tab remains X67..77, beyond handle swept max X65.5 in both states.
// Pull tab right 4 mm to unlock, turn handle, then open door. Close/re-latch at
// rotor zero before pushing slider left. No spring or friction-only retention.
module safe1_catch() {
 union() {
  block_mm([58.95,34.85,58.15],[14,2.3,1.2]);
  block_mm([68,34.85,59.3],[4,2.3,8.75]);
  block_mm([67,34.85,68],[6,2.3,2]);
 }
}
// Rear keeper closes the rigid channel after the catch is inserted. Two
// pins insert from the guide front into door rear counterbores; clips recess
// into the keeper rear. Clip/collar rear bounds remain at or forward of Z57.
module safe1_catch_keeper() {
 difference() {
  union() {
   block_mm([61,31.9,57],[17,6.6,0.8]);
   for(x=[64,76]) block_mm([x-1.25,31.9,57.75],[2.5,2.6,0.45]);
  }
  for(x=[64,76]) {
   translate([x,33.2,56.9]) cylinder(d=1.7,h=1);
   translate([x,33.2,56.9]) cylinder(d=2.5,h=0.85);
  }
 }
}
module safe1_catch_pin() {
 union() {
  cylinder(d=2.3,h=0.6);
  translate([0,0,0.55]) cylinder(d=1,h=5.55);
  translate([0,0,6.1]) cylinder(d=0.6,h=0.6);
  translate([0,0,6.7]) cylinder(d=1,h=0.2);
 }
}
module safe1_catch_clip() {
 linear_extrude(0.5) difference() { circle(d=2.3); circle(d=0.9); translate([-2,-0.2]) square([2,0.4]); }
}
module installed_safe1_catch(catch_slide_mm=safe1_catch_slide_mm) {
 translate([catch_slide_mm,0,0]) safe1_catch();
 safe1_catch_keeper();
 for(x=[64,76]) {
  translate([x,33.2,63.9]) rotate([180,0,0]) safe1_catch_pin();
  translate([x,33.2,57.25]) safe1_catch_clip();
 }
}
// Decorative free-spinning dial with integral round axle, neck, end collar.
// Back C-clip installs while door is detached and before guide installation.
module safe1_dial() {
 translate([48,65,0]) union() {
  translate([0,0,65.95]) cylinder(r=9,h=5);
  translate([0,0,63.25]) cylinder(d=4,h=2.75);
  translate([0,0,62.5]) cylinder(d=2.8,h=0.8);
  translate([0,0,62.25]) cylinder(d=4,h=0.3);
 }
}
module safe1_dial_clip() {
 linear_extrude(0.7) difference() {
  circle(d=7); circle(d=2.8+2*safe1_dial_clip_radial_clearance_mm);
  translate([-4,-0.9]) square([4,1.8]);
 }
}
module installed_safe1_dial() {
 translate([48,65,0]) rotate([0,0,dial_angle_deg]) translate([-48,-65,0]) safe1_dial();
 translate([48,65,62.5+safe1_dial_clip_axial_clearance_mm]) safe1_dial_clip();
}
module safe1_drive(angle_deg=latch_angle_deg,guide_visible=true,catch_slide_mm=safe1_catch_slide_mm) {
 translate([48,36,0]) rotate([0,0,angle_deg]) translate([-48,-36,0]) safe1_rotor();
 for(left=[true,false]) translate([(left?1:-1)*safe1_bolt_travel_mm(angle_deg),0,0]) safe1_bolt(left);
 if(guide_visible) safe1_guide();
 installed_safe1_handle(angle_deg);
 installed_safe1_catch(catch_slide_mm);
 installed_safe1_dial();
}
module printable_safe1_drive(id) {
 if(id=="rotor") translate([-36,-24,-safe1_rotor_back_mm]) safe1_rotor();
 else if(id=="bolt_left" || id=="bolt_right") let(left=id=="bolt_left") translate([left?-10:-49.5,-safe1_bolt_y_mm(left),-safe1_bolt_back_mm]) safe1_bolt(left);
 // The guide rests on its broad plate face, rails upwards.
 else if(id=="guide_pin") translate([1.7,1.7,0]) safe1_guide_pin();
 else if(id=="guide_spacer") translate([1.9,1.9,0]) safe1_guide_spacer();
 else if(id=="guide_clip") translate([1.4,1.4,0]) safe1_guide_clip();
 else if(id=="handle_axle") translate([3.5,3.5,0]) safe1_handle_axle();
 else if(id=="handle") translate([17.5,17.5,0]) safe1_handle();
 else if(id=="axle_clip") translate([3.5,3.5,0]) safe1_axle_clip();
 else if(id=="catch") translate([-58.95,70,-34.85]) rotate([90,0,0]) safe1_catch();
 else if(id=="dial") translate([-39,74,70.95]) rotate([180,0,0]) safe1_dial();
 else if(id=="dial_clip") translate([3.5,3.5,0]) safe1_dial_clip();
 else if(id=="catch_keeper") translate([-61,-31.9,-57]) safe1_catch_keeper();
 else if(id=="catch_pin") translate([1.15,1.15,0]) safe1_catch_pin();
 else if(id=="catch_clip") translate([1.15,1.15,0]) safe1_catch_clip();
 else if(id=="guide") translate([-14,52,63.25]) rotate([180,0,0]) safe1_guide();
}
// U3a smaller-safe closures: independent keyed cam, headed axle, knob and
// positive neck clip. Install axle through cam from the rear, then door bearing,
// then front knob and clip. The fixed rear stop stays integral to the door.
module cam_key_profile(clearance_mm=0) {
 intersection() { circle(d=2+2*clearance_mm); translate([-2,-2]) square([4,2.65+clearance_mm]); }
}
module cam_fixed_stop(i) {
 a=cam_axis_mm(i);
 translate([a[0]-3.6,a[1],cam_back_mm(i)+0.1]) cylinder(d=1.2,h=door_back_mm(i)-cam_back_mm(i));
}
module cam_tongue_profile(i,clearance_mm=0) {
 offset(delta=clearance_mm) union() {
  circle(r=4.8);
  translate([0,-1.6]) square([cam_tip_mm(i)-cam_axis_mm(i)[0],3.2]);
 }
}
module cam_receiver_cutters(i) {
 // Swept receiver allows rotation while engaged. It opens completely through
 // the side wall and ends at door-back Z, preserving 2 mm front frame stock.
 a=cam_axis_mm(i);
 translate([a[0],a[1],cam_back_mm(i)-moving_clearance_mm]) linear_extrude(primary_wall_mm+2*moving_clearance_mm)
  union() { for(ang=[0:5:85]) hull() {
   rotate(ang) cam_tongue_profile(i,moving_clearance_mm);
   rotate(ang+5) cam_tongue_profile(i,moving_clearance_mm);
  } }
}
module cam_latch(i) {
 difference() {
  linear_extrude(primary_wall_mm) cam_tongue_profile(i);
  translate([0,0,-0.1]) linear_extrude(primary_wall_mm+0.2) cam_key_profile(moving_clearance_mm);
  // Head-down axle is captive in this rear counterbore.
  translate([0,0,-0.1]) cylinder(d=5.5,h=0.75);
  // Fixed pin lies at local 180 degrees closed and 90 degrees open.
  // Radial clearance is 0.35; tangent faces provide exact quarter-turn stops.
  translate([0,0,-0.1]) linear_extrude(primary_wall_mm+0.2) intersection() {
   difference() { circle(r=4.55); circle(r=2.65); }
   translate([-5,-0.6]) square([5.6,5.6]);
  }
 }
}
module cam_axle(i) {
 l=cam_key_length_mm(i);
 union() {
  cylinder(d=4.8,h=0.6);
  translate([0,0,0.55]) linear_extrude(l-0.55) cam_key_profile();
  translate([0,0,l-0.01]) cylinder(d=1.2,h=0.61);
  translate([0,0,l+0.6]) cylinder(d=2,h=0.2);
 }
}
module cam_knob(i) {
 difference() {
  union() {
   cylinder(r=cam_knob_radius_mm(i),h=cam_knob_height_mm(i));
   // Obvious shallow finger rib marks the tongue's direction.
   translate([-cam_knob_radius_mm(i),-0.8,0]) cube([2*cam_knob_radius_mm(i),1.6,cam_knob_height_mm(i)]);
  }
  translate([0,0,-0.1]) linear_extrude(cam_knob_height_mm(i)+0.2) cam_key_profile(moving_clearance_mm);
 }
}
module cam_axle_clip(i) {
 linear_extrude(0.5) difference() {
  circle(d=3.6); circle(d=1.2+2*cam_clip_radial_clearance_mm);
  translate([-2,-0.3]) square([2,0.6]);
 }
}
module installed_cam_closure(i,angle_deg=latch_angle_deg) {
 a=cam_axis_mm(i);
 translate([a[0],a[1],0]) rotate([0,0,angle_deg]) {
  translate([0,0,cam_back_mm(i)]) cam_latch(i);
  translate([0,0,cam_axle_origin_mm(i)]) cam_axle(i);
  translate([0,0,cam_knob_back_mm(i)]) cam_knob(i);
  translate([0,0,cam_knob_front_mm(i)+2*cam_stack_axial_clearance_mm]) cam_axle_clip(i);
 }
}
module printable_cam_part(i,id) {
 assert(i>=2 && i<=5,"Cam part requires safe 2..5");
 if(id=="cam") translate([4.8,4.8,0]) cam_latch(i);
 else if(id=="cam_axle") translate([2.4,2.4,0]) cam_axle(i);
 else if(id=="cam_knob") translate([cam_knob_radius_mm(i),cam_knob_radius_mm(i),0]) cam_knob(i);
 else if(id=="cam_clip") translate([1.8,1.8,0]) cam_axle_clip(i);
}
for(i=[2:5]) {
 assert(cam_tip_mm(i)<=safe_width_mm(i),"Cam tongue complete width");
 assert(cam_knob_front_mm(i)+cam_stack_axial_clearance_mm+0.8<=safe_depth_mm(i),"Knob axle collar complete depth");
 assert(cam_axis_mm(i)[0]+cam_knob_radius_mm(i)<=safe_width_mm(i),"Knob complete width");
 if(i<5) assert(cam_back_mm(i)>=primary_wall_mm+chamber_size_mm(i)[2],"Cam behind door clears child chamber");
}
// U3b Safe 5 reveal: two separately printed backed message plaques.
// Reserve: rear 0..2, second backing 2..2.8, text 2.8..3.4,
// clear pocket x5..35/y5..45/z3.4..6.4, slide backing 6.75..7.55,
// slide lettering 7.55..8.15, cam 8.5..10.5, door 10.85..12.85.
assert(secret_slide_mm>=0 && secret_slide_mm<=42,"Captive secret-slide travel");
assert(secret_stop_snap_clearance_mm==0.2,"Allocated secret stop snap clearance");
assert(6.4-3.4>=3 && 60-(5+42)>=13,"Clear pocket and retained rail engagement");
assert(secret_left_capture_height_mm>0 && secret_upper_capture_back_mm+secret_left_capture_height_mm<=leaf_back_mm(5)-moving_clearance_mm+0.000001,"Left capture cap clears Safe 5 swept rear leaf");
// The transverse pin has a broad flush head and a captive neck C-clip.
module secret_stop_cutters() {
 translate([-0.1,49.75,5.65]) rotate([0,90,0]) cylinder(d=2.2,h=40.2);
 translate([0,49.75,5.65]) rotate([0,90,0]) cylinder(d=3.7,h=0.95);
 translate([38.05,49.75,5.65]) rotate([0,90,0]) cylinder(d=3.7,h=2.05);
 // Access from right exterior/front cavity, also clears the flush C-clip.
 block_mm([38.05,48.25,4.15],[2.05,3,8.8]);
}
module secret_slide_rails() {
 difference() {
  for(x=[1.5,36.65]) {
   // Full-width left capture retains the T ear; its shallow cap clears the
   // rear leaf throughout 0..110 degrees (minimum rear Z is leaf_back_mm(5)).
   // Right capture retains its 1.2 mm stock and existing cam relief.
   block_mm([x,5,secret_upper_capture_back_mm],[1.85,55,x==1.5?secret_left_capture_height_mm:1.2]);
   block_mm([x,5,4.9],[1.85,55,0.35]);
   block_mm([x,4,4.9],[1.85,1,4]);
  }
  secret_stop_cutters();
  // Actual hub and tongue sweep relieve upper right capture; lower and left
  // rails stay continuous around the latch allocation.
  cam_receiver_cutters(5);
 }
}
module second_message_rails() {
 // Backing slides in from above before the first plaque and stop are fitted.
 // 0.35 running clearance at both sides and over its 0.8 backing.
 block_mm([1.5,3,2],[2.15,43,1.15]);
 block_mm([36.35,3,2],[2.15,43,1.15]);
 for(x=[1.5,35.35]) block_mm([x,3,3.15],[3.15,43,1.2]);
 block_mm([4,3,2],[32,0.65,1.15]);
}
module secret_stop_pin() {
 union() {
  cylinder(d=3,h=0.6);
  translate([0,0,0.55]) cylinder(d=1.5,h=37.7);
  translate([0,0,38.25]) cylinder(d=0.8,h=0.6);
  translate([0,0,38.85]) cylinder(d=1.5,h=0.75);
 }
}
module secret_stop_clip() {
 linear_extrude(0.6) difference() {
  circle(d=3); circle(d=0.8+2*secret_stop_snap_clearance_mm);
  translate([-2,-0.325]) square([2,0.65]);
 }
}
module installed_secret_stops() {
 translate([0,49.75,5.65]) rotate([0,90,0]) secret_stop_pin();
 translate([38.25,49.75,5.65]) rotate([0,90,0]) secret_stop_clip();
}
function safe_glyph_segments(c)=c=="P"?[[[.4,.4],[.4,3.6]],[[.4,3.6],[2.4,3.6]],[[2.4,3.6],[2.4,2]],[[2.4,2],[.4,2]]]:c=="D"?[[[.4,.4],[.4,3.6]],[[.4,3.6],[1.8,3.6]],[[1.8,3.6],[2.4,3]],[[2.4,3],[2.4,1]],[[2.4,1],[1.8,.4]],[[1.8,.4],[.4,.4]]]:c=="W"?[[[.4,3.6],[.7,.4]],[[.7,.4],[1.4,2]],[[1.4,2],[2.1,.4]],[[2.1,.4],[2.4,3.6]]]:c=="—"?[[[.4,2],[2.4,2]]]:c==" "?[]:c=="F"?[[[.4,.4],[.4,3.6]],[[.4,3.6],[2.4,3.6]],[[.4,2],[2,2]]]:c=="U"?[[[.4,3.6],[.4,.4]],[[.4,.4],[2.4,.4]],[[2.4,.4],[2.4,3.6]]]:c=="C"?[[[2.4,3.6],[.4,3.6]],[[.4,3.6],[.4,.4]],[[.4,.4],[2.4,.4]]]:c=="K"?[[[.4,.4],[.4,3.6]],[[.4,2],[2.4,3.6]],[[.4,2],[2.4,.4]]]:c=="I"?[[[.4,3.6],[2.4,3.6]],[[1.4,.4],[1.4,3.6]],[[.4,.4],[2.4,.4]]]:c=="N"?[[[.4,.4],[.4,3.6]],[[.4,3.6],[2.4,.4]],[[2.4,.4],[2.4,3.6]]]:c=="G"?[[[2.4,3.6],[.4,3.6]],[[.4,3.6],[.4,.4]],[[.4,.4],[2.4,.4]],[[2.4,.4],[2.4,2]],[[1.4,2],[2.4,2]]]:c=="O"?[[[.4,.4],[.4,3.6]],[[.4,3.6],[2.4,3.6]],[[2.4,3.6],[2.4,.4]],[[2.4,.4],[.4,.4]]]:c=="S"?[[[2.4,3.6],[.4,3.6]],[[.4,3.6],[.4,2]],[[.4,2],[2.4,2]],[[2.4,2],[2.4,.4]],[[2.4,.4],[.4,.4]]]:c=="Y"?[[[.4,3.6],[1.4,2]],[[2.4,3.6],[1.4,2]],[[1.4,2],[1.4,.4]]]:c=="A"?[[[.4,.4],[1.4,3.6]],[[1.4,3.6],[2.4,.4]],[[.8,1.7],[2,1.7]]]:c=="R"?[[[.4,.4],[.4,3.6]],[[.4,3.6],[2.4,3.6]],[[2.4,3.6],[2.4,2]],[[2.4,2],[.4,2]],[[1.4,2],[2.4,.4]]]:c=="E"?[[[.4,.4],[.4,3.6]],[[.4,3.6],[2.4,3.6]],[[.4,2],[2,2]],[[.4,.4],[2.4,.4]]]:c=="T"?[[[.4,3.6],[2.4,3.6]],[[1.4,3.6],[1.4,.4]]]:c=="B"?[[[.4,.4],[.4,3.6]],[[.4,3.6],[2.4,3.6]],[[.4,2],[2.4,2]],[[.4,.4],[2.4,.4]],[[2.4,.4],[2.4,3.6]]]:c=="L"?[[[.4,.4],[.4,3.6]],[[.4,.4],[2.4,.4]]]:c=="V"?[[[.4,3.6],[1.4,.4]],[[1.4,.4],[2.4,3.6]]]:c=="?"?[[[.4,3.6],[2.4,3.6]],[[2.4,3.6],[2.4,2.5]],[[2.4,2.5],[1.4,2]],[[1.4,2],[1.4,1.6]],[[1.4,.4],[1.4,.4]]]:c=="'"?[[[1.4,3.6],[1.4,3]]]:c==","?[[[1.4,.8],[1.1,.4]]]:c=="."?[[[1.4,.4],[1.4,.4]]]:[];
module safe_glyph(c){assert(c==" " || len(safe_glyph_segments(c))>0,str("Unsupported glyph: ",c));for(s=safe_glyph_segments(c))hull(){translate(s[0])circle(d=.82,$fn=32);translate(s[1])circle(d=.82,$fn=32);}}
module safe_text_line(s){for(i=[0:len(s)-1])translate([i*3.6,0])safe_glyph(s[i]);}

module first_message_letters() {
 translate([7,23,7.55]) linear_extrude(0.6)
  for(i=[0:3]) translate([0,(3-i)*6]) safe_text_line(["FUCKING","NOSY,","AREN'T","YOU?"][i]);
}
module second_message_letters() {
 translate([7,17,2.8]) linear_extrude(0.6)
  for(i=[0:1]) translate([0,(1-i)*6]) safe_text_line(["UNBELI","EVABLE."][i]);
}
// Four pins/clips fasten two detachable C-cleats to a flat printable plaque.
// Slide cleats around its edges before inserting pins from the front and clips
// from behind. Install this assembly through the rail mouths before the stop.
function secret_cleat_pin_positions_mm() = [[5.2,47.5],[5.2,53],[34.8,47.5],[34.8,53]];
module secret_cleat_bores() {
 for(p=secret_cleat_pin_positions_mm()) translate([p[0],p[1],6.5]) cylinder(d=1+2*moving_clearance_mm,h=2);
}
module secret_slide(slide_state_mm=0) {
 translate([0,slide_state_mm,0]) union() {
  difference() {
   block_mm([3,5,6.75],[34,55,0.8]);
   // Discoverable shallow edge scallop; no exterior lettering.
   translate([20,60,6.65]) cylinder(r=3,h=1);
   secret_cleat_bores();
  }
  first_message_letters();
 }
}
module secret_cleat_left() {
 difference() {
  union() {
   block_mm([2.35,5,5.6],[1.65,2,0.8]);
   block_mm([2.35,5,6.35],[0.65-secret_cleat_edge_clearance_mm,2,1.3]);
   block_mm([2.35,5,7.55+secret_cleat_edge_clearance_mm],[4.35,50,secret_cleat_flange_thickness_mm]);
  }
  secret_cleat_bores();
 }
}
module secret_cleat(right=false) {
 if(right) translate([40,0,0]) mirror([1,0,0]) secret_cleat_left();
 else secret_cleat_left();
}
module secret_cleat_pin() {
 union() {
  translate([0,0,8.2]) cylinder(d=2.3,h=0.6);
  translate([0,0,6.65]) cylinder(d=1,h=1.6);
  translate([0,0,6.05]) cylinder(d=0.6,h=0.65);
  translate([0,0,5.9]) cylinder(d=1,h=0.2);
 }
}
module secret_cleat_clip() {
 linear_extrude(0.5) difference() {
  circle(d=2.3); circle(d=0.6+2*secret_cleat_clip_radial_clearance_mm);
  translate([-1.5,-0.225]) square([1.5,0.45]);
 }
}
module installed_secret_cleats(slide_state_mm=0) {
 translate([0,slide_state_mm,0]) {
  secret_cleat(); secret_cleat(true);
  for(p=secret_cleat_pin_positions_mm()) translate([p[0],p[1],0]) {
   secret_cleat_pin(); translate([0,0,6.15]) secret_cleat_clip();
  }
 }
}
assert(secret_cleat_edge_clearance_mm==0.05 && secret_cleat_flange_thickness_mm==0.55 && secret_cleat_clip_radial_clearance_mm==0.15,"Allocated detachable cleat exceptions");
module second_message_plaque() {
 union() {
  block_mm([4,4,2],[32,42,0.8]);
  // Shared transverse stop positively blocks the tall top ear from escaping.
  // Removing the first slide alone cannot release this message backing.
  block_mm([11,45.9,2],[2,2.1,3.3]);
  second_message_letters();
 }
}
module safe5_secret_assembly(slide_state_mm=secret_slide_mm) {
 second_message_plaque(); secret_slide(slide_state_mm); installed_secret_cleats(slide_state_mm); installed_secret_stops();
}
module printable_secret_part(id) {
 if(id=="secret_slide") translate([-3,-5,-6.75]) secret_slide();
 else if(id=="secret_cleat_left") translate([-2.35,55,8.15]) rotate([180,0,0]) secret_cleat();
 else if(id=="secret_cleat_right") translate([-33.3,55,8.15]) rotate([180,0,0]) secret_cleat(true);
 else if(id=="secret_cleat_pin") translate([1.15,1.15,8.8]) rotate([180,0,0]) secret_cleat_pin();
 else if(id=="secret_cleat_clip") translate([1.15,1.15,0]) secret_cleat_clip();
 else if(id=="second_message") translate([-4,-4,-2]) second_message_plaque();
 else if(id=="secret_stop_pin") translate([1.5,1.5,0]) secret_stop_pin();
 else if(id=="secret_stop_clip") translate([1.5,1.5,0]) secret_stop_clip();
}

// U4a independently printable front plaques and trim. The two diagonal pins
// capture the trim, plaque and door with positive heads/neck collars. Rear clips
// install on the detached door before inserting the child; no glue or hardware.
module exterior_mount_bores(i) {
 for(p=exterior_mount_positions_mm(i)) translate([p[0],p[1],door_back_mm(i)-0.1]) cylinder(d=1+2*moving_clearance_mm,h=4);
}
module exterior_detail_pin() {
 union() {
  cylinder(d=2.3,h=0.6);
  translate([0,0,0.55]) cylinder(d=1,h=3.75);
  translate([0,0,4.3]) cylinder(d=0.6,h=0.6);
  translate([0,0,4.9]) cylinder(d=1,h=0.2);
 }
}
module exterior_detail_clip() {
 linear_extrude(0.5) difference() {
  circle(d=2.3); circle(d=0.6+2*exterior_clip_radial_clearance_mm);
  translate([-1.5,-0.225]) square([1.5,0.45]);
 }
}
module exterior_plaque(i) {
 r=exterior_plaque_record_mm(i); lines=exterior_lines(i); f=exterior_front_mm(i);
 difference() {
  union() {
   block_mm([r[0],r[1],f+0.9],[r[2],r[3],0.8]);
   for(k=[0:len(lines)-1]) {
    w=safe_text_width_mm(lines[k]);
    assert(w+4<=r[2],"Exact exterior lettering fits without scaling");
    translate([r[0]+(r[2]-w)/2+0.01,r[1]+(r[3]-(len(lines)-1)*6-4.02)/2+(len(lines)-1-k)*6,f+1.7]) linear_extrude(0.6) safe_text_line(lines[k]);
   }
  }
  exterior_mount_bores(i);
 }
}
module exterior_frame_ring(i,inset_mm=0,rail_mm=1.6,height_mm=0.8,z_offset_mm=0) {
 r=exterior_frame_record_mm(i);
 translate([r[0]+inset_mm,r[1]+inset_mm,exterior_front_mm(i)+0.05+z_offset_mm]) linear_extrude(height_mm)
  difference() { square([r[2]-2*inset_mm,r[3]-2*inset_mm]); translate([rail_mm,rail_mm]) square([r[2]-2*inset_mm-2*rail_mm,r[3]-2*inset_mm-2*rail_mm]); }
}
module exterior_panel_ribs(i) {
 // Restrained panel ribs are connected to the industrial stepped frame.
 if(i==1) for(y=[18,22]) block_mm([18,y,exterior_front_mm(i)+0.05],[60,1.6,0.8]);
}
module exterior_decorative_bolts(i) {
 r=exterior_frame_record_mm(i);
 for(x=[r[0]+1.5,r[0]+r[2]-1.5],y=[r[1]+1.5,r[1]+r[3]-1.5]) translate([x,y,exterior_front_mm(i)+0.65]) cylinder(d=2.6,h=0.5,$fn=6);
}
module exterior_trim(i) {
 r=exterior_plaque_record_mm(i); t=exterior_frame_record_mm(i);
 leaf_clear_x=door_left_mm(i)+4.4+moving_clearance_mm;
 difference() {
  union() {
   exterior_frame_ring(i);
   // Safes 3/4 keep a connected frame rail inward of both leaf and pin heads.
   // Leaves and exterior details rotate together, so this bound holds in motion.
   if(i==3 || i==4) block_mm([leaf_clear_x,t[1],exterior_front_mm(i)+0.05],[1.6,t[3],0.8]);
   if(i==1 || i==4) exterior_frame_ring(i,1.1,1.2,0.3,0.65);
   // The connected panel supports the separate plaque backing; the 0.05 gap
   // is allocated shoulder clearance, not a printed floating part.
   block_mm([r[0]-0.5,r[1]-0.5,exterior_front_mm(i)+0.05],[r[2]+1,r[3]+1,0.8]);
   exterior_panel_ribs(i);
   // Keep both frame rails connected around the four guide-pin head bores.
   // Each local pad leaves 1.6 mm stock on the inner side of the clearance.
   if(i==1) for(p=safe1_guide_mounts_mm)
    block_mm([p[0]==76?72.35:17,p[1]-3.65,exterior_front_mm(i)+0.05],[6.65,7.3,0.95]);
   if(i==1 || i==4) exterior_decorative_bolts(i);
  }
  // Retain 0.35 mm beside the complete moving leaf, including its headed pins.
  if(i==3 || i==4) block_mm([0,t[1]-0.1,exterior_front_mm(i)-0.1],[leaf_clear_x,t[3]+0.2,3]);
  // Guide-pin heads have radius 1.7; preserve 0.35 radial running clearance.
  if(i==1) for(p=safe1_guide_mounts_mm)
   translate([p[0],p[1],exterior_front_mm(i)-0.1]) cylinder(r=2.05,h=2);
  // The premium frame opens around the complete knob sweep, including 0.35 clearance.
  if(i==4) let(a=cam_axis_mm(i)) translate([a[0],a[1],exterior_front_mm(i)-0.1]) cylinder(r=cam_knob_radius_mm(i)+moving_clearance_mm,h=2);
  // Shallow seat: upper steps clear the plaque by 0.35 mm on each side.
  block_mm([r[0]-moving_clearance_mm,r[1]-moving_clearance_mm,exterior_front_mm(i)+0.85],[r[2]+2*moving_clearance_mm,r[3]+2*moving_clearance_mm,1]);
  exterior_mount_bores(i);
 }
}
module installed_exterior_details(i) {
 if(i<5) {
  exterior_trim(i); exterior_plaque(i);
  for(p=exterior_mount_positions_mm(i)) {
   translate([p[0],p[1],exterior_front_mm(i)+2.3]) rotate([180,0,0]) exterior_detail_pin();
   translate([p[0],p[1],door_back_mm(i)-0.55]) exterior_detail_clip();
  }
 }
}
module printable_exterior_part(i,id) {
 assert(i>=1 && i<=4,"Safe 5 exterior has no lettering or trim");
 r=id=="decorative_trim"?exterior_frame_record_mm(i):exterior_plaque_record_mm(i);
 if(id=="exterior_plaque") translate([-r[0],-r[1],-exterior_front_mm(i)-0.9]) exterior_plaque(i);
 else if(id=="decorative_trim") translate([-r[0],-r[1],-exterior_front_mm(i)-0.05]) exterior_trim(i);
 else if(id=="detail_pin") translate([1.15,1.15,0]) exterior_detail_pin();
 else if(id=="detail_clip") translate([1.15,1.15,0]) exterior_detail_clip();
}
assert(exterior_mount_axial_clearance_mm==0.05 && exterior_clip_radial_clearance_mm==0.15,"Allocated exterior mount exceptions");
for(i=[1:4]) {
 r=exterior_plaque_record_mm(i); t=exterior_frame_record_mm(i);
 assert(exterior_front_mm(i)+2.3<=safe_depth_mm(i),"Complete exterior relief depth");
 assert(t[0]>=door_left_mm(i) && t[0]+t[2]<=safe_width_mm(i)-primary_wall_mm,"Complete trim width");
 assert(r[1]+r[3]<retrieval_roof_mm(i)-6 && t[1]+t[3]<retrieval_roof_mm(i)-6,"Exterior details clear retrieval notch");
 assert(door_back_mm(i)-0.8>=primary_wall_mm+chamber_size_mm(i)[2]+moving_clearance_mm,"Rear collar excludes child chamber");
}

module safe_assembly(i,angle_deg=door_angle_deg,latch_state_deg=latch_angle_deg,slide_state_mm=secret_slide_mm,guide_visible=show_guide_plate,catch_slide_mm=safe1_catch_slide_mm) {
 safe_body(i); safe_door(i,angle_deg);
 door_transform(i,angle_deg) installed_exterior_details(i);
 hinge_pin(i); hinge_clip(i);
 if(i==1) door_transform(i,angle_deg) safe1_drive(latch_state_deg,guide_visible,catch_slide_mm);
 else door_transform(i,angle_deg) installed_cam_closure(i,latch_state_deg);
 if(i==5) safe5_secret_assembly(slide_state_mm);
}
module nested_assembly(i,active=true) {
 safe_assembly(i,active?door_angle_deg:0,active?latch_angle_deg:0,active?secret_slide_mm:0,show_guide_plate,active?safe1_catch_slide_mm:0);
 if(i<5) translate(child_placement_mm(i)+[0,0,active?extraction_distance_mm:0]) nested_assembly(i+1,false);
}
// Manufacturing helpers use the same geometry as the assembled mechanisms.
// Flat door and separate leaves each rest on their own broad front face.
module printable_body(i) { safe_body(i); }
module printable_door(i) { translate([-door_left_mm(i),door_height_mm(i)+door_bottom_mm(i),door_back_mm(i)+primary_wall_mm]) rotate([180,0,0]) safe_door_closed(i); }
module printable_hinge_pin(i) {
 a=hinge_axis_mm(i); translate([1.2,1.2,-hinge_start_mm(i)]) rotate([90,0,0]) translate([-a[0],0,-a[2]]) hinge_pin(i);
}
module printable_hinge_clip(i) {
 a=hinge_axis_mm(i); translate([1.2,1.2,-hinge_end_mm(i)+0.65]) rotate([90,0,0]) translate([-a[0],0,-a[2]]) hinge_clip(i);
}
module printable_leaf(i,k) { s=moving_hinge_segments_mm(i)[k]; translate([-hinge_axis_mm(i)[0]+hinge_radius_mm(i),s[0]+s[1],leaf_front_mm(i)]) rotate([180,0,0]) hinge_leaf(i,k); }
module u1_print_part(i,id) {
 if(id=="body") printable_body(i);
 else if(id=="door") printable_door(i);
 else if(id=="hinge_pin") printable_hinge_pin(i);
 else if(id=="hinge_clip") printable_hinge_clip(i);
 else if(id=="hinge_leaf_lower") printable_leaf(i,0);
 else if(id=="hinge_leaf_upper") printable_leaf(i,1);
 else if(id=="leaf_pin") translate([1.6,1.6,0]) leaf_pin(i);
 else if(id=="leaf_clip") translate([1.4,1.4,0]) leaf_clip(i);
 else if(id=="secret_slide" || id=="second_message" || id=="secret_stop_pin" || id=="secret_stop_clip" || id=="secret_cleat_left" || id=="secret_cleat_right" || id=="secret_cleat_pin" || id=="secret_cleat_clip") { assert(i==5,"Secret parts require Safe 5"); printable_secret_part(id); }
 else if(id=="exterior_plaque" || id=="decorative_trim" || id=="detail_pin" || id=="detail_clip") printable_exterior_part(i,id);
 else if(id=="cam" || id=="cam_axle" || id=="cam_knob" || id=="cam_clip") printable_cam_part(i,id);
 else { assert(i==1,"Safe 1 drive selector requires safe_index=1"); printable_safe1_drive(id); }
}
// Authoritative completed-object inventory: [part ID, quantity, print group].
function printed_inventory(i) = concat(
 [["body",1,"body"],["door",1,"door"],["hinge_leaf_lower",1,"door"],["hinge_leaf_upper",1,"door"],
  ["hinge_pin",1,"mechanism"],["hinge_clip",1,"mechanism"],["leaf_pin",4,"mechanism"],["leaf_clip",4,"mechanism"]],
 i==1 ? [["rotor",1,"mechanism"],["bolt_left",1,"mechanism"],["bolt_right",1,"mechanism"],["guide",1,"mechanism"],
  ["guide_pin",4,"mechanism"],["guide_spacer",4,"mechanism"],["guide_clip",4,"mechanism"],["handle_axle",1,"mechanism"],
  ["handle",1,"mechanism"],["axle_clip",1,"mechanism"],["catch",1,"mechanism"],["catch_keeper",1,"mechanism"],
  ["catch_pin",2,"mechanism"],["catch_clip",2,"mechanism"],["dial",1,"mechanism"],["dial_clip",1,"mechanism"]]
 : [["cam",1,"mechanism"],["cam_axle",1,"mechanism"],["cam_knob",1,"mechanism"],["cam_clip",1,"mechanism"]],
 i<5 ? [["exterior_plaque",1,"details"],["decorative_trim",1,"details"],["detail_pin",2,"details"],["detail_clip",2,"details"]]
 : [["secret_cleat_left",1,"mechanism"],["secret_cleat_right",1,"mechanism"],["secret_cleat_pin",4,"mechanism"],
  ["secret_cleat_clip",4,"mechanism"],["secret_stop_pin",1,"mechanism"],["secret_stop_clip",1,"mechanism"],
  ["secret_slide",1,"details"],["second_message",1,"details"]]);
function group_parts(i,g) = [for(r=printed_inventory(i)) if(r[2]==g) for(k=[1:r[1]]) r[0]];
// Conservative analytic XY footprints of the normalized manufacturing helpers.
function part_footprint_mm(i,id) =
 id=="body" ? [safe_width_mm(i),safe_height_mm(i)] :
 id=="door" ? [door_width_mm(i),door_height_mm(i)] :
 id=="hinge_leaf_lower" || id=="hinge_leaf_upper" ?
  [door_left_mm(i)+(i==5?5.7:4.4)-hinge_axis_mm(i)[0]+hinge_radius_mm(i),moving_hinge_segments_mm(i)[id=="hinge_leaf_lower"?0:1][1]] :
 id=="hinge_pin" || id=="hinge_clip" ? [2.4,2.4] :
 id=="leaf_pin" ? [3.2,3.2] : id=="leaf_clip" || id=="guide_clip" ? [2.8,2.8] :
 id=="rotor" ? [24,24] : id=="bolt_left" || id=="bolt_right" ? [34.5,7.235] :
 id=="guide" ? [68.65,32] : id=="guide_pin" ? [3.4,3.4] : id=="guide_spacer" ? [3.8,3.8] :
 id=="handle_axle" || id=="axle_clip" || id=="dial_clip" ? [7,7] :
 id=="handle" ? [35,35] : id=="dial" ? [18,18] : id=="catch" ? [18.05,11.85] :
 id=="catch_keeper" ? [17,6.6] : id=="catch_pin" || id=="catch_clip" || id=="detail_pin" || id=="detail_clip" || id=="secret_cleat_pin" || id=="secret_cleat_clip" ? [2.3,2.3] :
 id=="cam" ? [cam_tip_mm(i)-cam_axis_mm(i)[0]+4.8,9.6] : id=="cam_axle" ? [4.8,4.8] :
 id=="cam_knob" ? [2*cam_knob_radius_mm(i),2*cam_knob_radius_mm(i)] : id=="cam_clip" ? [3.6,3.6] :
 id=="exterior_plaque" ? [exterior_plaque_record_mm(i)[2],exterior_plaque_record_mm(i)[3]] :
 id=="decorative_trim" ? [exterior_frame_record_mm(i)[2],exterior_frame_record_mm(i)[3]] :
 id=="secret_slide" ? [34,55] : id=="second_message" ? [32,44] :
 id=="secret_cleat_left" || id=="secret_cleat_right" ? [4.35,50] : [3,3];
// Shelf packing uses 3 mm clear gaps and a 5 mm plate margin.
function packed_positions_mm(i,ids,k=0,x=5,y=5,row_height=0) = k>=len(ids) ? [] :
 let(f=part_footprint_mm(i,ids[k]),wrap=x+f[0]>241,px=wrap?5:x,py=wrap?y+row_height+3:y,rh=wrap?f[1]:max(row_height,f[1]))
 concat([[px,py]],packed_positions_mm(i,ids,k+1,px+f[0]+3,py,rh));
module printable_group(i,g) {
 ids=group_parts(i,g); positions=packed_positions_mm(i,ids);
 for(k=[0:len(ids)-1]) {
  f=part_footprint_mm(i,ids[k]); p=positions[k];
  assert(p[0]>=0 && p[1]>=0 && p[0]+f[0]<=246 && p[1]+f[1]<=246,"Print group exceeds 246 mm usable plate");
  translate([p[0],p[1],0]) u1_print_part(i,ids[k]);
 }
}
// Output dispatch
if(render_mode=="assembly") {
 if(assembly_view=="nested") nested_assembly(safe_index); else safe_assembly(safe_index);
} else if(render_mode=="individual_part") {
 assert(part_id!="","Select an individual part"); u1_print_part(safe_index,part_id);
} else if(part_id!="") u1_print_part(safe_index,part_id);
else printable_group(safe_index,print_group);
