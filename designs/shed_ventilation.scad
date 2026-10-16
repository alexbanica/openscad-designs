// Shed vent: provisional photo estimates. Units mm; installed up is +Y,
// outside is +Z, rear mounting plane and print bed are Z=0.
// Adjustable Parameters
render_mode = "printable_layout";
door_angle_deg = 0;
// Assembly geometric poses; printable layout ignores these controls.
catch_release_mm = 0; // 0..4, outward normal release
catch_service_mm = 0; // 0..1.4, downward service-arm tip
catch_withdrawal_mm = 0; // -0.1..3.5: rear seating, then +Y service travel
catch_sideways_mm = 0; // 0..6, subsequent +X extraction
layout_part = "all"; // all, vent, catch
// Photo-estimated mounting dimensions: measure before installation.
plate_width_mm = 125;
plate_height_mm = 85;
screw_spacing_x_mm = 110;
screw_spacing_y_mm = 70;
// Selected design defaults, not measured hardware.
screw_clearance_diameter_mm = 4.5;
screw_head_diameter_mm = 9;
screw_head_height_mm = 4;
frame_border_mm = 10;
frame_thickness_mm = 3.6;
door_thickness_mm = 3;
door_overlap_mm = 3;
moving_clearance_mm = 0.4;
shaft_diameter_mm = 2.6;
collar_radius_mm = 2.8;
// Structural sections: selected reinforcement defaults, not strength claims.
perimeter_wall_mm = 1.2;
hinge_arm_width_mm = 2.4;
bearing_wall_mm = 1.5;
// A19 selected opposed planar stops; all dimensions are provisional PETG.
stop_band_width_mm = 1.15;
moving_stop_inner_u_mm = 0.7;
moving_stop_outer_u_mm = 2.8;
stop_face_thickness_mm = 1;
fixed_stop_inner_u_mm = 1.9;
fixed_stop_outer_u_mm = 3;
// A21 manually selected provisional minima for captured-play head sweeps.
upper_screw_head_relief_floor_mm = 6.1;
lower_screw_head_relief_floor_mm = 8;
// Screw relief retains the derived nominal swept-envelope enclosure.
louver_roof_thickness_mm = 1.6;
louver_cheek_width_mm = 1;
louver_rib_width_mm = 1.2;
louver_root_overlap_mm = 1;
louver_roof_overlap_mm = 0.4;
// Airflow layout.
louver_projection_mm = 9;
louver_rows = 4;
louver_columns = 2;
$fn = 32;

// Derived Values
opening_width_mm = plate_width_mm - 2*frame_border_mm;
opening_height_mm = plate_height_mm - 2*frame_border_mm;
core_width_mm = opening_width_mm - 2*moving_clearance_mm;
lip_z_mm = frame_thickness_mm + moving_clearance_mm;
door_width_mm = opening_width_mm + 2*door_overlap_mm;
door_height_mm = opening_height_mm + 2*door_overlap_mm;
hinge_y_mm = -39.5;
hinge_z_mm = 6.5;
core_half_height_radicand_mm2 = pow(opening_height_mm/2-moving_clearance_mm-hinge_y_mm,2)-pow(hinge_z_mm,2);
core_height_mm = 2*min(opening_height_mm/2-moving_clearance_mm,sqrt(max(0,core_half_height_radicand_mm2))+hinge_y_mm);
shaft_radius_mm = shaft_diameter_mm/2;
hinge_facets = 64;
hinge_segment_count = 9;
hinge_span_mm = plate_width_mm-26;
hinge_segment_length_mm = (hinge_span_mm-(hinge_segment_count-1)*moving_clearance_mm)/hinge_segment_count;
function hinge_segment_start_mm(i) = -hinge_span_mm/2+i*(hinge_segment_length_mm+moving_clearance_mm);
bore_radius_mm = (shaft_radius_mm+moving_clearance_mm)/cos(180/hinge_facets);
bore_roof_radius_mm = sqrt(2)*bore_radius_mm;
housing_half_depth_mm = bore_radius_mm+bearing_wall_mm;
housing_rear_depth_mm = min(housing_half_depth_mm,3);
housing_roof_v_mm = sqrt(2)*(bore_radius_mm+bearing_wall_mm);
housing_shoulder_v_mm = housing_roof_v_mm-housing_half_depth_mm;
housing_top_mm = hinge_z_mm+housing_roof_v_mm;
fixed_rib_end_y_mm = -opening_height_mm/2-0.1;
hinge_foot_forward_mm = 8;
hinge_foot_rear_mm = 1.55; // A20 selected provisional sole offset.
hinge_foot_sweep_radius_mm = sqrt(pow(hinge_z_mm,2)+pow(hinge_foot_rear_mm+hinge_foot_forward_mm,2));
// General circle-to-bed-foot tangent at the retained frame's top plane.
hinge_foot_tangent_slope = (hinge_foot_rear_mm*hinge_z_mm+collar_radius_mm*sqrt(pow(hinge_z_mm,2)+pow(hinge_foot_rear_mm,2)-pow(collar_radius_mm,2)))/(pow(hinge_z_mm,2)-pow(collar_radius_mm,2));
// Conservative closed-pose Euclidean normal distance, not Y projection.
lower_frame_initial_normal_clearance_mm = (hinge_y_mm+hinge_foot_rear_mm-hinge_foot_tangent_slope*frame_thickness_mm-(-41.3))/sqrt(1+pow(hinge_foot_tangent_slope,2));
// Conservative complete fixed-profile radius above the moving lip's bottom.
lower_lip_housing_radius_mm = max(housing_roof_v_mm,sqrt(pow(max(housing_half_depth_mm,3),2)+pow(hinge_z_mm-lip_z_mm,2)));
lower_lip_cut_y_mm = hinge_y_mm+lower_lip_housing_radius_mm+moving_clearance_mm;
// Positive explicit symmetric pairs: outer primary +/-a, inner opposed +/-b.
primary_stop_center_x_mm = -(hinge_segment_start_mm(1)+stop_band_width_mm/2);
opposed_stop_center_x_mm = -(hinge_segment_start_mm(1)+hinge_segment_length_mm-stop_band_width_mm/2);
stop_relieved_sole_length_mm = hinge_segment_length_mm-2*(stop_band_width_mm+moving_clearance_mm);
// Initial shaft growth from actual surviving collar/foot anchors.
hinge_outer_initial_shaft_reach_mm = hinge_segment_length_mm+stop_band_width_mm+2*moving_clearance_mm;
hinge_internal_initial_shaft_reach_mm = hinge_segment_length_mm+stop_band_width_mm+3*moving_clearance_mm;
hinge_central_initial_shaft_reach_mm = hinge_segment_length_mm+2*moving_clearance_mm;
end_bridge_center_mm = hinge_span_mm/2-7;
function bridge_center_mm(i) = hinge_segment_start_mm(i)+hinge_segment_length_mm/2;
expanded_head_radius_mm = screw_head_diameter_mm/2+moving_clearance_mm;
slot_width_mm = (core_width_mm - 18)/louver_columns;
row_pitch_mm = (core_height_mm - 10)/louver_rows;
// Keep retained hood undersides at least 45 degrees as core height grows.
slot_height_mm = min(row_pitch_mm-7,louver_projection_mm-louver_roof_thickness_mm-0.800001);
slot_x_pitch_mm = slot_width_mm + 5;
// A8 local YZ roof: 1.6 mm vertical section, not normal thickness.
louver_upper_y_mm = slot_height_mm/2+1;
louver_lower_y_mm = -slot_height_mm/2;
louver_roof_rise_mm = louver_projection_mm-louver_roof_thickness_mm+0.2;
louver_roof_slope = louver_roof_rise_mm/(louver_upper_y_mm-louver_lower_y_mm);
function louver_underside_mm(y_mm) = -0.2+(louver_upper_y_mm-y_mm)*louver_roof_slope;
louver_middle_channel_mm = slot_width_mm/3-louver_rib_width_mm;
louver_outer_channel_mm = slot_width_mm/3-louver_rib_width_mm/2;
louver_slot_plan_area_mm2 = louver_rows*louver_columns*(slot_width_mm-2*louver_rib_width_mm)*slot_height_mm;
// Full roof/slot footprint, including the inclined roof's upper connector.
louver_outer_x_mm = (louver_columns-1)*slot_x_pitch_mm/2+slot_width_mm/2+1;
louver_outer_y_mm = (louver_rows-1)*row_pitch_mm/2+slot_height_mm/2+1;
// A12 side catch coordinates shift with the right border.
catch_x_offset_mm = (plate_width_mm-125)/2;
catch_tip_stroke_mm = 4;
catch_service_stroke_mm = 1.4;
// Clamped cantilever geometric pose, not an elastic/force model.
function catch_curve(t) = let(q=max(0,min(1,t))) q*q*(3-q)/2;
function catch_curve_slope(t) = let(q=max(0,min(1,t))) 3*q-1.5*q*q;
function main_shift_mm(y_mm,release_mm) = release_mm*catch_curve((y_mm+6)/32);
function main_rotation_deg(y_mm,release_mm) = -atan(release_mm/32*catch_curve_slope((y_mm+6)/32));
function service_shift_mm(y_mm,stroke_mm) = -stroke_mm*catch_curve((y_mm+26)/16);
function service_rotation_deg(y_mm,stroke_mm) = -atan(stroke_mm/16*catch_curve_slope((y_mm+26)/16));
// Conservative XY keepouts use the real aperture corner, bearing and latch housing.
screw_corner_distance_mm = sqrt(pow(max((screw_spacing_x_mm-opening_width_mm)/2,0),2)+pow(max((screw_spacing_y_mm-opening_height_mm)/2,0),2));
collar_bridge_overlap_mm = min(hinge_z_mm+collar_radius_mm,lip_z_mm+door_thickness_mm)-max(hinge_z_mm-collar_radius_mm,lip_z_mm);
function rectangle_distance_mm(x_mm,y_mm,x0_mm,x1_mm,y0_mm,y1_mm) = sqrt(pow(max(x0_mm-x_mm,0,x_mm-x1_mm),2)+pow(max(y0_mm-y_mm,0,y_mm-y1_mm),2));
// Exact top-core radial envelope over the entire first quadrant.
// Beyond 90 degrees the core moves below the hinge axis.
core_top_sweep_mm = hinge_y_mm + sqrt(pow(core_height_mm/2-hinge_y_mm,2)+pow(hinge_z_mm,2));

assert(render_mode=="printable_layout" || render_mode=="assembly", "Only permitted inspection modes");
assert(plate_width_mm>0 && plate_height_mm>0 && frame_border_mm>0 && frame_thickness_mm>0 && door_thickness_mm>0, "Positive dimensions required");
assert(door_thickness_mm>=0.2, "Louver connector penetrates rear mounting/print plane");
assert(moving_clearance_mm>0 && shaft_diameter_mm>0 && door_overlap_mm>0, "Positive moving clearances required");
assert(moving_clearance_mm<=0.4, "Supported moving clearance is at most 0.4 mm");
assert(render_mode=="printable_layout" || (door_angle_deg>=0 && door_angle_deg<=180), "Operational range 0..180 degrees");
assert(louver_rows==4 && louver_columns==2 && slot_height_mm>0 && slot_width_mm>0 && louver_projection_mm>0, "Eight noncollapsed passages required");
assert(door_overlap_mm<frame_border_mm && core_width_mm>40 && core_height_mm>30, "Invalid overlap or aperture");
assert(screw_spacing_x_mm/2+screw_head_diameter_mm/2<=plate_width_mm/2 && screw_spacing_y_mm/2+screw_head_diameter_mm/2<=plate_height_mm/2, "Screw head outside mounting plate");
assert(screw_spacing_x_mm>opening_width_mm && screw_spacing_y_mm>opening_height_mm, "Screw centres must remain in corner borders");
assert(screw_clearance_diameter_mm>0 && screw_clearance_diameter_mm<screw_head_diameter_mm, "Invalid screw diameters");
assert(screw_head_height_mm>0, "Positive screw head height required");
assert(screw_head_diameter_mm<=9, "Screw head exceeds supported 9 mm diameter envelope");
assert(upper_screw_head_relief_floor_mm==6.1 && lower_screw_head_relief_floor_mm==8, "A21 selected captured-play screw relief minima");
// Smaller heads are subsets of the reinforced default Z=3.6..7.6 envelope.
// Taller heads need renewed local-relief motion inspection before support.
assert(screw_head_height_mm<=4, "Screw head exceeds supported 4 mm motion envelope");
assert(screw_corner_distance_mm>screw_clearance_diameter_mm/2, "Screw shank intersects aperture corner");
assert(collar_bridge_overlap_mm>0, "Collar and moving bridge require positive material overlap");
assert(core_half_height_radicand_mm2>0 && core_top_sweep_mm<=opening_height_mm/2-moving_clearance_mm+0.000001, "Recessed core collides with frame top during sweep");
assert(hinge_segment_length_mm>2*stop_band_width_mm && hinge_arm_width_mm>0, "Collapsed hinge segment or bridge");
assert(bearing_wall_mm>=1.5 && collar_radius_mm*cos(180/hinge_facets)>bore_roof_radius_mm, "Lost axial hinge capture or undersized housing");
assert(shaft_radius_mm>0 && shaft_radius_mm<collar_radius_mm && moving_clearance_mm<hinge_segment_length_mm, "Invalid shaft or axial capture");
assert(2*hinge_z_mm-max(hinge_z_mm+collar_radius_mm,door_thickness_mm+louver_projection_mm)>=moving_clearance_mm, "Door violates wall plane or fully-open clearance");
assert(lower_frame_initial_normal_clearance_mm>=moving_clearance_mm, "Closed hinge foot lacks conservative normal clearance to lower frame");
assert(hinge_y_mm-housing_rear_depth_mm>=-plate_height_mm/2 && hinge_y_mm+housing_half_depth_mm<-opening_height_mm/2 && fixed_rib_end_y_mm<-opening_height_mm/2, "Housing or ribs obstruct passage");
assert(stop_band_width_mm==1.15 && stop_face_thickness_mm==1 && moving_stop_inner_u_mm==0.7 && moving_stop_outer_u_mm==2.8 && fixed_stop_inner_u_mm==1.9 && fixed_stop_outer_u_mm==3, "A19 selected planar stop dimensions");
assert(pow(moving_stop_inner_u_mm,2)+pow(stop_face_thickness_mm,2)<pow(shaft_radius_mm,2), "First moving stop layers lose shaft union");
assert(fixed_stop_inner_u_mm>bore_radius_mm && fixed_stop_inner_u_mm<housing_half_depth_mm, "Opposed bar loses solid housing root");
assert(primary_stop_center_x_mm>opposed_stop_center_x_mm && opposed_stop_center_x_mm>0, "Stop band pairs are not symmetric ordered stations");
assert(stop_relieved_sole_length_mm>=hinge_arm_width_mm && stop_relieved_sole_length_mm*hinge_foot_forward_mm>=60 && min(stop_relieved_sole_length_mm,hinge_foot_forward_mm)>=4, "Two-end relief loses bridge or sole floors");
assert(housing_rear_depth_mm-bore_radius_mm>=1.29, "A17 rear wall collapsed");
assert(hinge_y_mm-fixed_stop_outer_u_mm>=-plate_height_mm/2 && hinge_z_mm+stop_face_thickness_mm<=door_thickness_mm+louver_projection_mm, "Planar stop exceeds closed bounds");
assert(lower_lip_cut_y_mm<-core_height_mm/2 && -lower_lip_cut_y_mm>opening_height_mm/2, "Local hinge relief severs core or overlap");
assert(perimeter_wall_mm>0 && perimeter_wall_mm<min(core_width_mm,core_height_mm)/2, "Invalid perimeter connection wall");
assert((plate_width_mm==125 && screw_spacing_x_mm==110) || (plate_width_mm==135 && screw_spacing_x_mm==120), "A12 supports default and wide mounting pairs only");
assert(plate_height_mm==85 && screw_spacing_y_mm==70 && frame_border_mm==10 && frame_thickness_mm==3.6 && door_thickness_mm==3 && door_overlap_mm==3, "A12 fixed mounting and panel allocation");
assert(shaft_diameter_mm==2.6 && collar_radius_mm==2.8 && bearing_wall_mm==1.5 && hinge_arm_width_mm==2.4, "A12 selected captive hinge allocation");
for(i=[1:2:7]) {
    assert(bridge_center_mm(i)-hinge_arm_width_mm/2>=hinge_segment_start_mm(i) && bridge_center_mm(i)+hinge_arm_width_mm/2<=hinge_segment_start_mm(i)+hinge_segment_length_mm, "Bridge escapes moving knuckle band");
    for(sx=[-1,1]) assert(abs(bridge_center_mm(i)-sx*screw_spacing_x_mm/2)>hinge_arm_width_mm/2+expanded_head_radius_mm, "Screw head/tool intersects hinge bridge");
}
for(i=[0:2:8],sx=[-1,1],sy=[-1,1])
    assert(rectangle_distance_mm(sx*screw_spacing_x_mm/2,sy*screw_spacing_y_mm/2,hinge_segment_start_mm(i),hinge_segment_start_mm(i)+hinge_segment_length_mm,hinge_y_mm-housing_rear_depth_mm,fixed_rib_end_y_mm)>expanded_head_radius_mm, "Screw head/tool intersects fixed hinge rib");
assert(louver_projection_mm==9 && louver_roof_thickness_mm>=1.6 && louver_roof_thickness_mm<louver_projection_mm, "A8 requires 9 mm hoods and at least 1.6 mm vertical roofs");
assert(louver_roof_slope>=1, "A8 hood underside must grow at least 45 degrees to the bed");
assert(louver_cheek_width_mm==1 && louver_rib_width_mm==1.2 && louver_root_overlap_mm==1 && louver_roof_overlap_mm==0.4, "A8 selected cheek, rib and positive root/roof unions required");
assert(louver_roof_overlap_mm>0 && louver_roof_overlap_mm<louver_roof_thickness_mm && door_thickness_mm>0.2, "Collapsed hood root or roof union");
assert(louver_middle_channel_mm>1 && louver_outer_channel_mm>1 && slot_height_mm>1 && louver_underside_mm(louver_lower_y_mm)>0, "Collapsed through-air channels or downward mouth");
assert(row_pitch_mm-(louver_upper_y_mm-louver_lower_y_mm)>=6-0.000001 && row_pitch_mm-(louver_upper_y_mm-louver_lower_y_mm+louver_root_overlap_mm)>0, "Adjacent hood roofs or bed roots overlap");
// Preserve minimum floors for the four actual A15 moving soles.
assert(hinge_segment_length_mm*hinge_foot_forward_mm>=60 && min(hinge_segment_length_mm,hinge_foot_forward_mm)>=4, "A7 hinge sole below 60 mm2 area or 4 mm short dimension");
assert(hinge_foot_forward_mm==8, "A7 selected hinge sole depth is fixed");
assert(layout_part=="all" || layout_part=="vent" || layout_part=="catch", "Unknown printable part");
assert(render_mode=="printable_layout" || (catch_release_mm>=0 && catch_release_mm<=4 && catch_service_mm>=0 && catch_service_mm<=1.4 && catch_withdrawal_mm>=-0.1 && catch_withdrawal_mm<=3.5 && catch_sideways_mm>=0 && catch_sideways_mm<=6), "Catch pose outside allocated travel");
assert(render_mode=="printable_layout" || (catch_service_mm==0 && catch_withdrawal_mm==0 && catch_sideways_mm==0) || (door_angle_deg==180 && catch_release_mm==0), "Service requires open door and relaxed main beam");
assert(render_mode=="printable_layout" || catch_withdrawal_mm<=0 || catch_withdrawal_mm==3.5 || catch_service_mm==1.4, "Depress service arm fully before positive longitudinal travel");
assert(render_mode=="printable_layout" || catch_sideways_mm==0 || (catch_withdrawal_mm==3.5 && catch_service_mm==0), "Clear rear stop and relax service arm before sideways extraction");
echo(hinge_span_mm=hinge_span_mm,segment_length_mm=hinge_segment_length_mm,bore_radius_mm=bore_radius_mm,housing_top_mm=housing_top_mm,retention_overlap_mm=collar_radius_mm*cos(180/hinge_facets)-bore_roof_radius_mm);
echo(collar_bridge_overlap_mm=collar_bridge_overlap_mm,lower_frame_initial_normal_clearance_mm=lower_frame_initial_normal_clearance_mm,
     lower_lip_cut_y_mm=lower_lip_cut_y_mm,local_lower_overlap_mm=-lower_lip_cut_y_mm-opening_height_mm/2,
     rear_housing_wall_mm=housing_rear_depth_mm-bore_radius_mm,
     primary_stop_centers_x_mm=[-primary_stop_center_x_mm,primary_stop_center_x_mm],
     opposed_stop_centers_x_mm=[-opposed_stop_center_x_mm,opposed_stop_center_x_mm]);

// Inspection helper: actual selected head envelope, never part of the print.
// QA can intersect this with door_at_angle() to inspect the complete sweep.
module screw_head_envelopes() {
    for (sx=[-1,1],sy=[-1,1])
        translate([sx*screw_spacing_x_mm/2,sy*screw_spacing_y_mm/2,frame_thickness_mm])
            cylinder(h=screw_head_height_mm,d=screw_head_diameter_mm);
}
module rounded_rectangle(width_mm,height_mm,radius_mm=0.8) {
    offset(r=radius_mm) square([width_mm-2*radius_mm,height_mm-2*radius_mm],center=true);
}
module axis_prism(start_x_mm,length_mm) {
    translate([start_x_mm,hinge_y_mm,hinge_z_mm]) rotate([90,0,90]) linear_extrude(height=length_mm) children();
}
module hinge_bore_profile() {
    // Circular lower/upper arcs to 45-degree tangencies, then a 45-degree roof.
    polygon(concat([for(a=[135:360/hinge_facets:405]) [bore_radius_mm*cos(a),bore_radius_mm*sin(a)]],[[0,bore_roof_radius_mm]]));
}
module hinge_housing_profile() {
    intersection() {
        polygon([[-housing_half_depth_mm,-hinge_z_mm],[housing_half_depth_mm,-hinge_z_mm],[housing_half_depth_mm,housing_shoulder_v_mm],[0,housing_roof_v_mm],[-housing_half_depth_mm,housing_shoulder_v_mm]]);
        translate([-3,-hinge_z_mm]) square([3+housing_half_depth_mm,hinge_z_mm+housing_roof_v_mm]);
    }
}
module fixed_hinge_knuckle(i) {
    start_mm=hinge_segment_start_mm(i);
    difference() {
        axis_prism(start_mm,hinge_segment_length_mm) hinge_housing_profile();
        axis_prism(start_mm-0.01,hinge_segment_length_mm+0.02) hinge_bore_profile();
    }
    translate([start_mm,hinge_y_mm,0]) cube([hinge_segment_length_mm,fixed_rib_end_y_mm-hinge_y_mm,frame_thickness_mm]);
}
module fixed_planar_stop_band(center_x_mm,neighbor_i,primary=true) {
    band_start_mm=center_x_mm-stop_band_width_mm/2;
    adjacent_start_mm=hinge_segment_start_mm(neighbor_i);
    span_start_mm=min(band_start_mm,adjacent_start_mm);
    span_end_mm=max(band_start_mm+stop_band_width_mm,adjacent_start_mm+hinge_segment_length_mm);
    // Span ONLY its named adjacent housing, mating gap and single stop band.
    axis_prism(span_start_mm,span_end_mm-span_start_mm)
        if(primary)
            translate([-fixed_stop_outer_u_mm,-hinge_z_mm])
                square([fixed_stop_outer_u_mm-fixed_stop_inner_u_mm,hinge_z_mm]);
        else
            translate([fixed_stop_inner_u_mm,0])
                square([fixed_stop_outer_u_mm-fixed_stop_inner_u_mm,stop_face_thickness_mm]);
}
module fixed_planar_stops() {
    fixed_planar_stop_band(-primary_stop_center_x_mm,0,true);
    fixed_planar_stop_band(primary_stop_center_x_mm,8,true);
    fixed_planar_stop_band(-opposed_stop_center_x_mm,2,false);
    fixed_planar_stop_band(opposed_stop_center_x_mm,6,false);
}
module moving_planar_stops() {
    for(sx=[-1,1]) {
        axis_prism(sx*primary_stop_center_x_mm-stop_band_width_mm/2,stop_band_width_mm)
            translate([moving_stop_inner_u_mm,-stop_face_thickness_mm])
                square([moving_stop_outer_u_mm-moving_stop_inner_u_mm,stop_face_thickness_mm]);
        axis_prism(sx*opposed_stop_center_x_mm-stop_band_width_mm/2,stop_band_width_mm)
            translate([-moving_stop_outer_u_mm,0])
                square([moving_stop_outer_u_mm-moving_stop_inner_u_mm,stop_face_thickness_mm]);
    }
}
module fixed_frame() {
    difference() {
        linear_extrude(height=frame_thickness_mm) difference() {
            rounded_rectangle(plate_width_mm,plate_height_mm);
            rounded_rectangle(opening_width_mm,opening_height_mm);
        }
        // Cut lower plate only; retain the 1.2 mm outer strip. Fixed
        // housings and stop roots are united after this subtraction.
        for(i=[1:2:7]) translate([hinge_segment_start_mm(i)-moving_clearance_mm,-41.3,-0.01])
            cube([hinge_segment_length_mm+2*moving_clearance_mm,8.8,frame_thickness_mm+0.02]);
        for (sx=[-1,1],sy=[-1,1]) translate([sx*screw_spacing_x_mm/2,sy*screw_spacing_y_mm/2,-0.1]) cylinder(h=frame_thickness_mm+0.2,d=screw_clearance_diameter_mm);
    }
    for(i=[0:2:8]) fixed_hinge_knuckle(i);
    fixed_planar_stops();
    fixed_socket();
}
module vent_slots() {
    for (row=[0:louver_rows-1],column=[0:louver_columns-1]) {
        x_mm=(column-(louver_columns-1)/2)*slot_x_pitch_mm;
        y_mm=(row-(louver_rows-1)/2)*row_pitch_mm;
        translate([x_mm,y_mm,-0.1]) linear_extrude(height=lip_z_mm+door_thickness_mm+0.2) rounded_rectangle(slot_width_mm,slot_height_mm,0.5);
    }
}
// Permanent supports grow from the bed and join solid webs at both slot ends.
// Local YZ profile includes a low lower root; the high roof ends at its mouth.
module louver_reinforcement(start_x_mm,width_mm) {
    translate([start_x_mm,0,0]) rotate([90,0,90]) linear_extrude(height=width_mm)
        polygon([[louver_lower_y_mm-louver_root_overlap_mm,0],
                 [louver_upper_y_mm,0],
                 [louver_upper_y_mm,door_thickness_mm+louver_underside_mm(louver_upper_y_mm)+louver_roof_overlap_mm],
                 [louver_lower_y_mm,door_thickness_mm+louver_underside_mm(louver_lower_y_mm)+louver_roof_overlap_mm],
                 [louver_lower_y_mm,door_thickness_mm],
                 [louver_lower_y_mm-louver_root_overlap_mm,door_thickness_mm]]);
}
module door_louvers() {
    for (row=[0:louver_rows-1],column=[0:louver_columns-1]) {
        x_mm=(column-(louver_columns-1)/2)*slot_x_pitch_mm;
        y_mm=(row-(louver_rows-1)/2)*row_pitch_mm;
        translate([x_mm,y_mm,0]) {
            // A8 upper-edge growth advances <=1 mm in Y per 1 mm in Z.
            translate([-slot_width_mm/2-1,0,door_thickness_mm]) rotate([90,0,90]) linear_extrude(height=slot_width_mm+2)
                polygon([[louver_upper_y_mm,-0.2],
                         [louver_upper_y_mm,louver_roof_thickness_mm-0.2],
                         [louver_lower_y_mm,louver_projection_mm],
                         [louver_lower_y_mm,louver_projection_mm-louver_roof_thickness_mm]]);
            for(side=[-1,1]) {
                louver_reinforcement(side<0 ? -slot_width_mm/2-louver_cheek_width_mm : slot_width_mm/2,louver_cheek_width_mm);
                louver_reinforcement(side*slot_width_mm/6-louver_rib_width_mm/2,louver_rib_width_mm);
            }
        }
    }
}
module moving_hinge() {
    // A15: fixed even end housings bracket four moving odd collars/feet.
    // Initial shaft reach includes gaps and the relieved anchor edges:
    // outer: L+stop_band+2g; internal2/6: L+stop_band+3g; central4: L+2g.
    // These unsupported spans need slicer/physical growth validation.
    axis_prism(-hinge_span_mm/2,hinge_span_mm) circle(r=shaft_radius_mm,$fn=hinge_facets);
    for(i=[1:2:7]) {
        difference() {
            axis_prism(hinge_segment_start_mm(i),hinge_segment_length_mm) hull() {
                circle(r=collar_radius_mm,$fn=hinge_facets);
                translate([hinge_foot_rear_mm,-hinge_z_mm]) square([hinge_foot_forward_mm,hinge_z_mm]);
            }
            if(i==1 || i==7) for(end=[0,1]) {
                relief_start_mm=hinge_segment_start_mm(i)+(end==1 ? hinge_segment_length_mm-stop_band_width_mm-moving_clearance_mm : 0);
                axis_prism(relief_start_mm,stop_band_width_mm+moving_clearance_mm)
                    translate([-10,-hinge_z_mm-1]) square([20,20]);
            }
        }
        // Forward bed feet positively overlap the core in the A15 pose.
        // Each 2.4 mm bridge stays inside its unrelieved moving band.
        translate([bridge_center_mm(i)-hinge_arm_width_mm/2,hinge_y_mm,lip_z_mm])
            cube([hinge_arm_width_mm,-core_height_mm/2-hinge_y_mm+2,door_thickness_mm]);
    }
    moving_planar_stops();
}
module door_solid() {
    difference() {
        union() {
            linear_extrude(height=door_thickness_mm) rounded_rectangle(core_width_mm,core_height_mm);
            // Perimeter overlap grows from core side edges, bridges relief gap.
            translate([0,0,lip_z_mm]) linear_extrude(height=door_thickness_mm) difference() {
                rounded_rectangle(door_width_mm,door_height_mm);
                rounded_rectangle(core_width_mm-2*perimeter_wall_mm,core_height_mm-2*perimeter_wall_mm);
            }
            linear_extrude(height=lip_z_mm+0.2) difference() {
                rounded_rectangle(core_width_mm,core_height_mm);
                rounded_rectangle(core_width_mm-2*perimeter_wall_mm,core_height_mm-2*perimeter_wall_mm);
            }
        }
        vent_slots();
        // Local overlap reduces from 3 to 1.8 mm beside the socket.
        translate([54.3+catch_x_offset_mm,-29.4,lip_z_mm-0.01]) cube([1.21,39.9,door_thickness_mm+0.02]);
        // Front finger recess retains the bottom two mm of the lip.
        translate([51.5+catch_x_offset_mm,14,lip_z_mm+2]) cube([4.01,8,door_thickness_mm-2+0.01]);
    }
    door_louvers();
}
// Continuous four-cylinder enclosure of inverse head motion intersecting
// door_solid(): Z0..12, Y>=-35.5. Hinge is united after the subtraction.
// Circumscribed facets and 0.001 mm padding preserve the analytic enclosure.
module swept_screw_head_relief() {
    head_v_mm=max(abs(frame_thickness_mm-moving_clearance_mm-hinge_z_mm),abs(frame_thickness_mm+screw_head_height_mm+moving_clearance_mm-hinge_z_mm));
    door_v_mm=max(hinge_z_mm,abs(door_thickness_mm+louver_projection_mm-hinge_z_mm));
    top_u_min_mm=screw_spacing_y_mm/2-hinge_y_mm-expanded_head_radius_mm;
    top_shift_mm=max(top_u_min_mm-sqrt(pow(top_u_min_mm,2)-pow(door_v_mm,2)),sqrt(pow(top_u_min_mm,2)+pow(head_v_mm,2))-top_u_min_mm);
    upper_radius_mm=max(expanded_head_radius_mm+top_shift_mm,upper_screw_head_relief_floor_mm);
    bottom_u_max_mm=-screw_spacing_y_mm/2-hinge_y_mm+expanded_head_radius_mm;
    bottom_max_y_mm=hinge_y_mm+sqrt(pow(bottom_u_max_mm,2)+pow(head_v_mm,2));
    bottom_dy_mm=max(abs(bottom_max_y_mm+screw_spacing_y_mm/2),abs(-door_height_mm/2+screw_spacing_y_mm/2));
    lower_radius_mm=max(sqrt(pow(expanded_head_radius_mm,2)+pow(bottom_dy_mm,2)),lower_screw_head_relief_floor_mm);
    for(sx=[-1,1],sy=[-1,1])
        translate([sx*screw_spacing_x_mm/2,sy*screw_spacing_y_mm/2,-0.01])
            cylinder(h=door_thickness_mm+louver_projection_mm+0.02,r=((sy>0 ? upper_radius_mm : lower_radius_mm)+0.001)/cos(180/64),$fn=64);
}
module moving_door() {
    difference() {
        door_solid();
        // Analytic enclosure includes every intermediate head orientation
        // intersecting the cut solid, including the initial opening path.
        swept_screw_head_relief();
        // A17: only lower door lip in fixed bands, never shaft/feet/collars.
        for(i=[0:2:8])
            translate([hinge_segment_start_mm(i)-moving_clearance_mm,-plate_height_mm/2,-0.01])
                cube([hinge_segment_length_mm+2*moving_clearance_mm,lower_lip_cut_y_mm+plate_height_mm/2,door_thickness_mm+louver_projection_mm+0.02]);
    }
    moving_hinge();
}
module door_at_angle(angle_deg) {
    translate([0,hinge_y_mm,hinge_z_mm]) rotate([angle_deg,0,0]) translate([0,-hinge_y_mm,-hinge_z_mm]) moving_door();
}
// A12 socket: open outer side, separated roof stations and independent
// bump/pad apertures. Only the service-arm cavity descends to Z4.5.
module fixed_socket() {
    translate([catch_x_offset_mm,0,0]) union() {
        difference() {
            union() {
                translate([55.6,-28.4,3.6]) cube([6.8,20.5,3.35]);
                translate([55.6,-28.4,6.9]) cube([1.3,20,3.75]);
                translate([55.6,-28.4,9.05]) cube([6.8,20.5,1.6]);
                translate([55.6,-28.4,6.9]) cube([6.8,0.3,3.75]);
                translate([61.1,-28.4,3.6]) cube([1.3,3.4,7.05]);
            }
            translate([58.2,-26,4.5]) cube([1.6,18.11,2.46]);
            translate([55.59,-20.1,9.04]) cube([6.82,9,1.62]);
            translate([58.3,-11.1,9.04]) cube([1.4,2.4,1.62]);
        }
        // A16 bridge is preserved across the pad window and joins the
        // inner wall at its first layer. Cantilever reaches 5.5 mm laterally.
        translate([55.6,-13,8.35]) cube([6.8,1.4,0.7]);
        // Raised guide has no low wall obstructing the deliberate side exit.
        // Its forward 1.6 mm reach connects through bridge and front roof.
        translate([61.1,-12,8.35]) cube([1.3,2,0.85]);
    }
}
// Sections rotate with their local tangent; attachments use the identical
// transform, including the service pad/post and engagement witness.
module main_section(y_mm,release_mm) {
    translate([56.75+main_shift_mm(y_mm,release_mm),y_mm,8])
        rotate([0,0,main_rotation_deg(y_mm,release_mm)])
            translate([-1,-0.03,-1]) cube([2,0.06,2]);
}
module service_section(y_mm,stroke_mm) {
    translate([59,y_mm,7.6+service_shift_mm(y_mm,stroke_mm)])
        rotate([service_rotation_deg(y_mm,stroke_mm),0,0])
            translate([-0.6,-0.03,-0.6]) cube([1.2,0.06,1.2]);
}
module service_attachment(y_mm,stroke_mm) {
    translate([59,y_mm,7.6+service_shift_mm(y_mm,stroke_mm)])
        rotate([service_rotation_deg(y_mm,stroke_mm),0,0]) children();
}
module spring_root() {
    difference() {
        union() {
            translate([57,-28,7]) cube([4,2,2]);
            translate([57,-26.1,7]) cube([1.2,18.1,2]);
            translate([59.8,-26.1,7]) cube([1.2,18.1,2]);
            // Recessed front contour provides a concave R0.8 root
            // transition within the nose; free span begins exactly Y-6.
            translate([0,0,7]) linear_extrude(height=2)
                polygon(concat([[55.75,-8.2],[61,-8.2],[61,-6.8],[58.55,-6.8]],
                    [for(a=[-90:-5:-180]) [58.55+0.8*cos(a),-6+0.8*sin(a)]],[[55.75,-6]]));
            // R0.6 service transitions occupy only the back crossbar.
            for(side=[-1,1]) translate([59+side*0.6,-26.6,7]) linear_extrude(height=1.2)
                scale([side,1]) difference() {
                    square([0.6,0.6]);
                    translate([0.6,0.6]) circle(r=0.6,$fn=32);
                }
        }
        // Both flanges retain a continuous 1.2 mm lower rail; the upper
        // dogleg notches clear the raised bridge/guide during service.
        for(x_mm=[57,59.8]) translate([x_mm-0.01,-16.6,8.2]) cube([1.22,5.2,0.81]);
    }
}
module spring_tongue(release_mm=0,service_mm=0) {
    spring_root();
    for(y_mm=[-6:0.5:25.5]) hull() {
        main_section(y_mm,release_mm); main_section(y_mm+0.5,release_mm);
    }
    // Hook wedge has a finite horizontal underside at Z7.8 and a
    // rising engagement lead-in; each slice follows the main beam.
    for(y_mm=[22:0.5:25.5]) hull() for(v_mm=[y_mm,y_mm+0.5])
        translate([56.75+main_shift_mm(v_mm,release_mm),v_mm,8])
            rotate([0,0,main_rotation_deg(v_mm,release_mm)])
                rotate([90,0,0]) linear_extrude(height=0.06,center=true)
                    polygon([[-3.25,-0.2],[1,-0.2],[1,3]]);
    for(y_mm=[-26:0.5:-9.5]) hull() {
        service_section(y_mm,service_mm); service_section(y_mm+0.5,service_mm);
    }
    // Positive +Y retaining shoulder; sloped -Y insertion face.
    service_attachment(-10,service_mm)
        rotate([90,0,90]) linear_extrude(height=1.2,center=true)
            polygon([[-1,0.6],[1,0.6],[1,2.2],[0,2.2]]);
    service_attachment(-18,service_mm) {
        translate([-0.6,-0.5,0]) cube([1.2,1,3.6]);
        translate([-2.5,-2,3.5]) cube([5,4,0.6]);
    }
}
module catch_pose(release_mm=0,service_mm=0,withdrawal_mm=0,sideways_mm=0) {
    translate([catch_x_offset_mm+sideways_mm,withdrawal_mm,0]) spring_tongue(release_mm,service_mm);
}
module vent_assembly(angle_deg) {
    color("silver") fixed_frame();
    color("steelblue") door_at_angle(angle_deg);
    color("darkorange") catch_pose(catch_release_mm,catch_service_mm,catch_withdrawal_mm,catch_sideways_mm);
}
module printable_parts() {
    if(layout_part=="all" || layout_part=="vent") {
        fixed_frame(); door_at_angle(0);
    }
    if(layout_part=="all" || layout_part=="catch")
        // Tongue minimum X53.5 -> plate edge+10; shared Z7 bed plane.
        translate([plate_width_mm/2+10-53.5,0,-7]) spring_tongue();
}
echo(hinge_fixed_segments=[0,2,4,6,8],hinge_moving_segments=[1,3,5,7],
     hinge_outer_unsupported_shaft_reach_mm=hinge_outer_initial_shaft_reach_mm,
     hinge_internal_unsupported_shaft_reach_mm=hinge_internal_initial_shaft_reach_mm,
     hinge_central_unsupported_shaft_reach_mm=hinge_central_initial_shaft_reach_mm,
     first_layer_hinge_soles_mm=[hinge_segment_length_mm,hinge_foot_forward_mm],
     unrelieved_sole_area_mm2=hinge_segment_length_mm*hinge_foot_forward_mm,
     relieved_sole_area_mm2=stop_relieved_sole_length_mm*hinge_foot_forward_mm);
echo(hood_roof_angle_deg=atan(louver_roof_slope),hood_vertical_section_mm=louver_roof_thickness_mm,
     hood_channels_mm=[louver_outer_channel_mm,louver_middle_channel_mm,louver_outer_channel_mm],
     hood_slot_plan_area_mm2=louver_slot_plan_area_mm2);
if(render_mode=="printable_layout") printable_parts();
else vent_assembly(door_angle_deg);
