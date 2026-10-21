// Shed vent: provisional photo estimates. Units mm; installed up is +Y,
// outside is +Z, rear mounting plane and print bed are Z=0.
// Adjustable Parameters
render_mode = "printable_layout";
door_angle_deg = 0;
// Assembly geometric inspection pose; printable layout is always relaxed.
clip_flex_mm = 0; // free-end displacement toward -X, 0..2.6
open_hold_flex_mm = 0; // assembly only: inward -Y displacement, 0..2.8
// A32-A35 selected provisional PETG leaf dimensions, not strength data.
clip_section_width_mm = 1;
clip_section_height_mm = 12;
clip_inner_corner_radius_mm = 0; // flat full-width bed foot
clip_root_radius_mm = 1.2;
clip_max_flex_mm = 2.6; // A43 geometric inspection ceiling, not a material allowable
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
// Legacy control names are retained: mirroring assigns the 6.1 mm floor
// to lower/far heads and the 8 mm floor to upper/near heads.
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
open_cam_rise_mm_per_deg = (3.716-3.354)/(23.806-8-0.5);
// A41: 188 quarter-degree base intervals, plus the two off-grid breakpoints.
// Strict interior insertion keeps -16, 8, 9, 31 unique and retains exact
// -15.44 and 23.806, with one ordered boundary shared by stock and throat.
open_cam_sample_angles_deg = [for(i=[0:188]) each concat([-16+i/4],
    [for(b=[-15.44,23.806]) if(b>-16+i/4 && b<-16+(i+1)/4) b])];
opening_width_mm = plate_width_mm - 2*frame_border_mm;
opening_height_mm = plate_height_mm - 2*frame_border_mm;
core_width_mm = opening_width_mm - 2*moving_clearance_mm;
lip_z_mm = frame_thickness_mm + moving_clearance_mm;
door_width_mm = opening_width_mm + 2*door_overlap_mm;
door_height_mm = opening_height_mm + 2*door_overlap_mm;
hinge_y_mm = 38.5;
// Profiles use mirrored local U; installed up remains +Y.
hinge_reference_y_mm = -hinge_y_mm;
hinge_z_mm = 6.5;
core_half_height_radicand_mm2 = pow(opening_height_mm/2-moving_clearance_mm-hinge_reference_y_mm,2)-pow(hinge_z_mm,2);
core_height_mm = 2*min(opening_height_mm/2-moving_clearance_mm,sqrt(max(0,core_half_height_radicand_mm2))+hinge_reference_y_mm);
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
fixed_rib_end_y_mm = opening_height_mm/2+0.1;
moving_hinge_segments = [1,5,7];
left_terminal_start_mm = hinge_segment_start_mm(1)+hinge_segment_length_mm+moving_clearance_mm;
left_terminal_end_mm = -24;
right_trim_start_mm = moving_clearance_mm;
right_shaft_start_mm = moving_clearance_mm+0.5; // A36 finite free-end clearance
right_trim_end_mm = hinge_segment_start_mm(4)+hinge_segment_length_mm;
fixed_hinge_ranges = [[hinge_segment_start_mm(0),hinge_segment_start_mm(0)+hinge_segment_length_mm],[left_terminal_start_mm,left_terminal_end_mm],[right_trim_start_mm,right_trim_end_mm],[hinge_segment_start_mm(6),hinge_segment_start_mm(6)+hinge_segment_length_mm],[hinge_segment_start_mm(8),hinge_segment_start_mm(8)+hinge_segment_length_mm]];
hinge_foot_forward_mm = 8;
hinge_foot_rear_mm = 1.55; // A20 selected provisional sole offset.
hinge_foot_sweep_radius_mm = sqrt(pow(hinge_z_mm,2)+pow(hinge_foot_rear_mm+hinge_foot_forward_mm,2));
// General circle-to-bed-foot tangent at the retained frame's top plane.
hinge_foot_tangent_slope = (hinge_foot_rear_mm*hinge_z_mm+collar_radius_mm*sqrt(pow(hinge_z_mm,2)+pow(hinge_foot_rear_mm,2)-pow(collar_radius_mm,2)))/(pow(hinge_z_mm,2)-pow(collar_radius_mm,2));
// Conservative closed-pose Euclidean normal distance, not Y projection.
upper_frame_initial_normal_clearance_mm = (41.3-hinge_y_mm+hinge_foot_rear_mm-hinge_foot_tangent_slope*frame_thickness_mm)/sqrt(1+pow(hinge_foot_tangent_slope,2));
// Conservative complete fixed-profile radius above the moving lip's bottom.
upper_lip_housing_radius_mm = max(housing_roof_v_mm,sqrt(pow(max(housing_half_depth_mm,3),2)+pow(hinge_z_mm-lip_z_mm,2)));
upper_lip_cut_y_mm = hinge_y_mm-upper_lip_housing_radius_mm-moving_clearance_mm;
// Stops remain at moving bands1/7; the left opposed root uses the terminal bearing.
primary_stop_center_x_mm = -(hinge_segment_start_mm(1)+stop_band_width_mm/2);
opposed_stop_center_x_mm = -(hinge_segment_start_mm(1)+hinge_segment_length_mm-stop_band_width_mm/2);
stop_relieved_sole_length_mm = hinge_segment_length_mm-2*(stop_band_width_mm+moving_clearance_mm);
// Initial unsupported shaft reaches; finite growth still needs source-mesh inspection.
hinge_outer_initial_shaft_reach_mm = hinge_segment_length_mm+stop_band_width_mm+2*moving_clearance_mm;
hinge_internal_initial_shaft_reach_mm = hinge_segment_length_mm+stop_band_width_mm+3*moving_clearance_mm;
hinge_left_terminal_initial_shaft_reach_mm = left_terminal_end_mm-(hinge_segment_start_mm(1)+hinge_segment_length_mm-stop_band_width_mm-moving_clearance_mm);
hinge_trimmed_initial_shaft_reach_mm = hinge_segment_start_mm(5)-right_shaft_start_mm;
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
// A31 closure coordinates follow the right mounting border.
catch_x_offset_mm = (plate_width_mm-125)/2;
clip_free_start_y_mm = -20;
clip_free_end_y_mm = 8.2;
clip_free_length_mm = clip_free_end_y_mm-clip_free_start_y_mm;
// 57 equal intervals: exact endpoints, maximum spacing 28.2/57 < 0.5 mm.
clip_station_count = 57;
clip_station_y_mm = [for(i=[0:clip_station_count])
    clip_free_start_y_mm+clip_free_length_mm*i/clip_station_count];
function clip_curve(t) = let(q=max(0,min(1,t))) q*q*(3-q)/2;
function clip_curve_slope(t) = let(q=max(0,min(1,t))) 3*q-1.5*q*q;
// Tangent continuation above the end is solely finite-cap construction stock.
function clip_shape(y) = y>clip_free_end_y_mm ?
    1+(y-clip_free_end_y_mm)*1.5/clip_free_length_mm :
    clip_curve((y-clip_free_start_y_mm)/clip_free_length_mm);
function clip_rotation_deg(y,flex) = atan(flex/clip_free_length_mm*
    clip_curve_slope((y-clip_free_start_y_mm)/clip_free_length_mm));
// Conservative XY keepouts use the real aperture corner, bearing and latch housing.
screw_corner_distance_mm = sqrt(pow(max((screw_spacing_x_mm-opening_width_mm)/2,0),2)+pow(max((screw_spacing_y_mm-opening_height_mm)/2,0),2));
collar_bridge_overlap_mm = min(hinge_z_mm+collar_radius_mm,lip_z_mm+door_thickness_mm)-max(hinge_z_mm-collar_radius_mm,lip_z_mm);
function rectangle_distance_mm(x_mm,y_mm,x0_mm,x1_mm,y0_mm,y1_mm) = sqrt(pow(max(x0_mm-x_mm,0,x_mm-x1_mm),2)+pow(max(y0_mm-y_mm,0,y_mm-y1_mm),2));
// Core radial envelope expressed in the mirrored hinge reference coordinates.
// For negative X rotation the far core edge sweeps toward the lower frame.
// The retained symmetric core fits the complete circular radial enclosure.
core_top_sweep_mm = hinge_reference_y_mm + sqrt(pow(core_height_mm/2-hinge_reference_y_mm,2)+pow(hinge_z_mm,2));

assert(render_mode=="printable_layout" || render_mode=="assembly", "Only permitted inspection modes");
// Reject removed CLI inspection/selectors instead of silently changing their meaning.
assert(is_undef(layout_part) && is_undef(jaw_left_spread_mm) && is_undef(jaw_right_spread_mm) && is_undef(catch_service_mm) && is_undef(catch_withdrawal_mm) && is_undef(catch_lift_mm), "Obsolete separate-catch/jaw/service controls; use clip_flex_mm in assembly");
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
assert(left_terminal_end_mm>left_terminal_start_mm && right_trim_end_mm>right_trim_start_mm && left_terminal_end_mm<=-24 && right_trim_start_mm>0, "Collapsed terminal bearing or occupied central hinge corridor");
// Moving5 is unrelieved and brackets trimmed4/fixed6 on both axial sides.
// This is a nominal topology check, not a combined-play captivity certificate.
assert(abs(hinge_segment_start_mm(5)-right_trim_end_mm-moving_clearance_mm)<0.000001 && abs(hinge_segment_start_mm(6)-hinge_segment_start_mm(5)-hinge_segment_length_mm-moving_clearance_mm)<0.000001, "Moving5 collar lost its two neighboring bearing ends");
assert(collar_bridge_overlap_mm>0, "Collar and moving bridge require positive material overlap");
assert(core_half_height_radicand_mm2>0 && core_top_sweep_mm<=opening_height_mm/2-moving_clearance_mm+0.000001, "Recessed core collides with lower frame during upward sweep");
assert(hinge_segment_length_mm>2*stop_band_width_mm && hinge_arm_width_mm>0, "Collapsed hinge segment or bridge");
assert(bearing_wall_mm>=1.5 && collar_radius_mm*cos(180/hinge_facets)>bore_roof_radius_mm, "Lost axial hinge capture or undersized housing");
assert(shaft_radius_mm>0 && shaft_radius_mm<collar_radius_mm && moving_clearance_mm<hinge_segment_length_mm, "Invalid shaft or axial capture");
assert(2*hinge_z_mm-max(hinge_z_mm+collar_radius_mm,door_thickness_mm+louver_projection_mm)>=moving_clearance_mm, "Door violates wall plane or fully-open clearance");
assert(upper_frame_initial_normal_clearance_mm>=moving_clearance_mm, "Closed hinge foot lacks conservative normal clearance to upper outer frame strip");
assert(hinge_y_mm+housing_rear_depth_mm<=plate_height_mm/2 && hinge_y_mm-housing_half_depth_mm>opening_height_mm/2 && fixed_rib_end_y_mm>opening_height_mm/2, "Housing or ribs obstruct passage");
assert(stop_band_width_mm==1.15 && stop_face_thickness_mm==1 && moving_stop_inner_u_mm==0.7 && moving_stop_outer_u_mm==2.8 && fixed_stop_inner_u_mm==1.9 && fixed_stop_outer_u_mm==3, "A19 selected planar stop dimensions");
assert(pow(moving_stop_inner_u_mm,2)+pow(stop_face_thickness_mm,2)<pow(shaft_radius_mm,2), "First moving stop layers lose shaft union");
assert(fixed_stop_inner_u_mm>bore_radius_mm && fixed_stop_inner_u_mm<housing_half_depth_mm, "Opposed bar loses solid housing root");
assert(primary_stop_center_x_mm>opposed_stop_center_x_mm && opposed_stop_center_x_mm>0, "Stop band pairs are not symmetric ordered stations");
assert(stop_relieved_sole_length_mm>=hinge_arm_width_mm && stop_relieved_sole_length_mm*hinge_foot_forward_mm>=60 && min(stop_relieved_sole_length_mm,hinge_foot_forward_mm)>=4, "Two-end relief loses bridge or sole floors");
assert(housing_rear_depth_mm-bore_radius_mm>=1.29, "A17 rear wall collapsed");
assert(hinge_y_mm+fixed_stop_outer_u_mm<=plate_height_mm/2 && hinge_z_mm+stop_face_thickness_mm<=door_thickness_mm+louver_projection_mm, "Planar stop exceeds closed bounds");
assert(upper_lip_cut_y_mm>core_height_mm/2 && upper_lip_cut_y_mm>opening_height_mm/2, "Local hinge relief severs core or overlap");
assert(perimeter_wall_mm>0 && perimeter_wall_mm<min(core_width_mm,core_height_mm)/2, "Invalid perimeter connection wall");
assert((plate_width_mm==125 && screw_spacing_x_mm==110) || (plate_width_mm==135 && screw_spacing_x_mm==120), "A12 supports default and wide mounting pairs only");
assert(plate_height_mm==85 && screw_spacing_y_mm==70 && frame_border_mm==10 && frame_thickness_mm==3.6 && door_thickness_mm==3 && door_overlap_mm==3, "A12 fixed mounting and panel allocation");
assert(shaft_diameter_mm==2.6 && collar_radius_mm==2.8 && bearing_wall_mm==1.5 && hinge_arm_width_mm==2.4, "A12 selected captive hinge allocation");
for(i=moving_hinge_segments) {
    assert(bridge_center_mm(i)-hinge_arm_width_mm/2>=hinge_segment_start_mm(i) && bridge_center_mm(i)+hinge_arm_width_mm/2<=hinge_segment_start_mm(i)+hinge_segment_length_mm, "Bridge escapes moving knuckle band");
    for(sx=[-1,1]) assert(abs(bridge_center_mm(i)-sx*screw_spacing_x_mm/2)>hinge_arm_width_mm/2+expanded_head_radius_mm, "Screw head/tool intersects hinge bridge");
}
for(b=fixed_hinge_ranges,sx=[-1,1],sy=[-1,1])
    assert(rectangle_distance_mm(sx*screw_spacing_x_mm/2,sy*screw_spacing_y_mm/2,b[0],b[1],fixed_rib_end_y_mm,hinge_y_mm+housing_rear_depth_mm)>expanded_head_radius_mm, "Screw head/tool intersects fixed hinge rib");
assert(louver_projection_mm==9 && louver_roof_thickness_mm>=1.6 && louver_roof_thickness_mm<louver_projection_mm, "A8 requires 9 mm hoods and at least 1.6 mm vertical roofs");
assert(louver_roof_slope>=1, "A8 hood underside must grow at least 45 degrees to the bed");
assert(louver_cheek_width_mm==1 && louver_rib_width_mm==1.2 && louver_root_overlap_mm==1 && louver_roof_overlap_mm==0.4, "A8 selected cheek, rib and positive root/roof unions required");
assert(louver_roof_overlap_mm>0 && louver_roof_overlap_mm<louver_roof_thickness_mm && door_thickness_mm>0.2, "Collapsed hood root or roof union");
assert(louver_middle_channel_mm>1 && louver_outer_channel_mm>1 && slot_height_mm>1 && louver_underside_mm(louver_lower_y_mm)>0, "Collapsed through-air channels or downward mouth");
assert(row_pitch_mm-(louver_upper_y_mm-louver_lower_y_mm)>=6-0.000001 && row_pitch_mm-(louver_upper_y_mm-louver_lower_y_mm+louver_root_overlap_mm)>0, "Adjacent hood roofs or bed roots overlap");
// Preserve minimum floors for the three retained moving soles.
assert(hinge_segment_length_mm*hinge_foot_forward_mm>=60 && min(hinge_segment_length_mm,hinge_foot_forward_mm)>=4, "A7 hinge sole below 60 mm2 area or 4 mm short dimension");
assert(hinge_foot_forward_mm==8, "A7 selected hinge sole depth is fixed");
assert(clip_section_width_mm==1 && clip_section_height_mm==12 && clip_inner_corner_radius_mm==0 && clip_root_radius_mm==1.2 && clip_max_flex_mm==2.6, "A32-A35 leaf/root and A43 inspection ceiling");
assert(open_hold_flex_mm>=0 && open_hold_flex_mm<=2.8, "Open hold inspection flex outside 0..2.8 mm");
assert(right_shaft_start_mm==moving_clearance_mm+0.5 && right_shaft_start_mm<right_trim_end_mm, "A36 recessed moving cap allocation");
assert(clip_flex_mm>=0 && clip_flex_mm<=clip_max_flex_mm, "Clip inspection flex outside 0..2.6 mm");
echo(clip_free_station_y_mm=clip_station_y_mm,clip_cap_station_y_mm=clip_free_end_y_mm);
echo(hinge_span_mm=hinge_span_mm,segment_length_mm=hinge_segment_length_mm,bore_radius_mm=bore_radius_mm,housing_top_mm=housing_top_mm,retention_overlap_mm=collar_radius_mm*cos(180/hinge_facets)-bore_roof_radius_mm);
echo(collar_bridge_overlap_mm=collar_bridge_overlap_mm,upper_frame_initial_normal_clearance_mm=upper_frame_initial_normal_clearance_mm,
     upper_lip_cut_y_mm=upper_lip_cut_y_mm,local_upper_overlap_mm=upper_lip_cut_y_mm-opening_height_mm/2,
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
    // Reflect the completed extrusion: OpenSCAD 2021.01 can corrupt a mirrored 2D hull.
    translate([start_x_mm,hinge_y_mm,hinge_z_mm]) mirror([0,1,0])
        rotate([90,0,90]) linear_extrude(height=length_mm) children();
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
module fixed_hinge_knuckle(start_mm,end_mm) {
    length_mm=end_mm-start_mm;
    difference() {
        axis_prism(start_mm,length_mm) hinge_housing_profile();
        axis_prism(start_mm-0.01,length_mm+0.02) hinge_bore_profile();
    }
    translate([start_mm,fixed_rib_end_y_mm,0]) cube([length_mm,hinge_y_mm-fixed_rib_end_y_mm,frame_thickness_mm]);
}
module fixed_planar_stop_band(center_x_mm,adjacent_start_mm,adjacent_end_mm,primary=true) {
    band_start_mm=center_x_mm-stop_band_width_mm/2;
    span_start_mm=min(band_start_mm,adjacent_start_mm);
    span_end_mm=max(band_start_mm+stop_band_width_mm,adjacent_end_mm);
    axis_prism(span_start_mm,span_end_mm-span_start_mm)
        if(primary)
            translate([-fixed_stop_outer_u_mm,-hinge_z_mm])
                square([fixed_stop_outer_u_mm-fixed_stop_inner_u_mm,hinge_z_mm]);
        else
            translate([fixed_stop_inner_u_mm,0])
                square([fixed_stop_outer_u_mm-fixed_stop_inner_u_mm,stop_face_thickness_mm]);
}
module fixed_planar_stops() {
    fixed_planar_stop_band(-primary_stop_center_x_mm,fixed_hinge_ranges[0][0],fixed_hinge_ranges[0][1],true);
    fixed_planar_stop_band(primary_stop_center_x_mm,fixed_hinge_ranges[4][0],fixed_hinge_ranges[4][1],true);
    fixed_planar_stop_band(-opposed_stop_center_x_mm,left_terminal_start_mm,left_terminal_end_mm,false);
    fixed_planar_stop_band(opposed_stop_center_x_mm,fixed_hinge_ranges[3][0],fixed_hinge_ranges[3][1],false);
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
        // Cut upper plate only; retain the 1.2 mm outer strip. Fixed
        // housings and stop roots are united after this subtraction.
        for(i=moving_hinge_segments) translate([hinge_segment_start_mm(i)-moving_clearance_mm,opening_height_mm/2,-0.01])
            cube([hinge_segment_length_mm+2*moving_clearance_mm,8.8,frame_thickness_mm+0.02]);
        // Open leaf: inward 2.8 mm travel plus running gap, outer gap and
        // finite end gap. Root behind X-18 remains joined to frame stock.
        translate([-18,38.9-2.8-moving_clearance_mm,-0.01])
            cube([18+moving_clearance_mm,4.8+2*moving_clearance_mm,frame_thickness_mm+0.02]);
        // A37: outside the central passage, left of right fixed bearings.
        // Bed carrier pocket may meet the leaf channel; outer strip remains.
        translate([-5,32.5,-0.01]) cube([5,3.9,frame_thickness_mm+0.02]);
        // Free the tall side leaf; retain the 5.8 mm outer frame bar and root.
        translate([52.5+catch_x_offset_mm,-20,-0.01])
            cube([4.2,28.7,frame_thickness_mm+0.02]);
        for (sx=[-1,1],sy=[-1,1]) translate([sx*screw_spacing_x_mm/2,sy*screw_spacing_y_mm/2,-0.1]) cylinder(h=frame_thickness_mm+0.2,d=screw_clearance_diameter_mm);
    }
    for(b=fixed_hinge_ranges) fixed_hinge_knuckle(b[0],b[1]);
    fixed_planar_stops();
    integral_frame_clip(render_mode=="assembly" ? clip_flex_mm : 0);
    integral_open_hold_leaf(render_mode=="assembly" ? open_hold_flex_mm : 0);
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
    // A35: separate left/right shafts clear the central open-hold corridor.
    // Moving collars lie between actual fixed bearing groups.
    // Initial shaft reach includes gaps and the relieved anchor edges;
    // terminal/trimmed bearing reaches differ from the former central shaft.
    // These analytic reach diagnostics need actual mesh growth inspection,
    // slicer toolpath and physical growth validation.
    axis_prism(-hinge_span_mm/2,left_terminal_end_mm+hinge_span_mm/2) circle(r=shaft_radius_mm,$fn=hinge_facets);
    axis_prism(right_shaft_start_mm,hinge_span_mm/2-right_shaft_start_mm) circle(r=shaft_radius_mm,$fn=hinge_facets);
    for(i=moving_hinge_segments) {
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
        // Inward bed feet positively overlap the upper edge of the retained core.
        // Each 2.4 mm bridge stays inside its unrelieved moving band.
        translate([bridge_center_mm(i)-hinge_arm_width_mm/2,core_height_mm/2-2,lip_z_mm])
            cube([hinge_arm_width_mm,hinge_y_mm-core_height_mm/2+2,door_thickness_mm]);
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
        // A40: guard the complete fixed root/free-leaf and hinge obstacles.
        // Raised door stock only: core, louvers and later hinge/cam unions remain.
        translate([-23.7,29.8,lip_z_mm-0.01])
            cube([24.4,12.7,12.02-lip_z_mm]);
        for(b=fixed_hinge_ranges)
            translate([b[0]-0.7,28.5,lip_z_mm-0.01])
                cube([b[1]-b[0]+1.4,14,12.02-lip_z_mm]);
        for(sx=[-1,1]) {
            translate([sx*primary_stop_center_x_mm-stop_band_width_mm/2-0.7,
                       30.2,lip_z_mm-0.01])
                cube([stop_band_width_mm+1.4,12.3,12.02-lip_z_mm]);
            translate([sx*opposed_stop_center_x_mm-stop_band_width_mm/2-0.7,
                       34.4,lip_z_mm-0.01])
                cube([stop_band_width_mm+1.4,8.1,12.02-lip_z_mm]);
        }
        // A13: remove only the closure-side overlap; preserve the core edge
        // at X52.1 (g0.4), approaching X52.5 as g approaches zero.
        translate([52.5+catch_x_offset_mm,-29.4,lip_z_mm-0.01])
            cube([3.01,39.4,door_thickness_mm+0.02]);
        // Open the underside of the raised pull purchase from the +X side.
        translate([53+catch_x_offset_mm,18,lip_z_mm-0.01])
            cube([2.51,8,8-lip_z_mm+0.01]);
    }
    door_louvers();
    chamfered_paddle_and_grip();
}
// Broad chamfered paddle and stout carrier, integral with the moving door.
// Selected geometry only: actual finite contact and support proof is separate.
module chamfered_paddle_and_grip() {
    translate([catch_x_offset_mm,0,0]) {
        // Intersect three prisms: 0.8 X/Z upper-inner chamfer, 45-degree
        // underside growth toward Y6, and 0.2 mm eased Y-entry/exit corners.
        intersection() {
            translate([0,10,0]) rotate([90,0,0]) linear_extrude(height=4)
                polygon([[56.7,4.4],[59.7,4.4],[59.7,10.2],
                         [57.5,10.2],[56.7,9.4]]);
            translate([56.7,0,0]) rotate([90,0,90]) linear_extrude(height=3)
                polygon([[6,8.4],[10,4.4],[10,10.2],[6,10.2]]);
            linear_extrude(height=12)
                polygon([[56.9,6],[59.5,6],[59.7,6.2],[59.7,9.8],
                         [59.5,10],[56.9,10],[56.7,9.8],[56.7,6.2]]);
        }
        // Positive overlap Y9.6..10 with the paddle; no tangent-only seam.
        translate([58.7,11.8,4.4]) linear_extrude(height=3)
            rounded_rectangle(3,4.4,0.2);
        // Retained bridge envelope X51..59.4/Y12..16/Z4.4..6.
        translate([55.2,14,4.4]) linear_extrude(height=1.6)
            rounded_rectangle(8.4,4,0.8);
        translate([51,18,lip_z_mm]) cube([2,8,8.2-lip_z_mm]);
        translate([53,22,8]) linear_extrude(height=2)
            rounded_rectangle(4,8,0.8);
    }
}
// Mirrored four-cylinder enclosure of inverse head motion intersecting
// door_solid(): Z0..12, Y>=-35.5. Hinge is united after the subtraction.
// Circumscribed facets and 0.001 mm padding preserve the analytic enclosure.
module swept_screw_head_relief() {
    head_v_mm=max(abs(frame_thickness_mm-moving_clearance_mm-hinge_z_mm),abs(frame_thickness_mm+screw_head_height_mm+moving_clearance_mm-hinge_z_mm));
    door_v_mm=max(hinge_z_mm,abs(door_thickness_mm+louver_projection_mm-hinge_z_mm));
    top_u_min_mm=screw_spacing_y_mm/2-hinge_reference_y_mm-expanded_head_radius_mm;
    top_shift_mm=max(top_u_min_mm-sqrt(pow(top_u_min_mm,2)-pow(door_v_mm,2)),sqrt(pow(top_u_min_mm,2)+pow(head_v_mm,2))-top_u_min_mm);
    upper_radius_mm=max(expanded_head_radius_mm+top_shift_mm,upper_screw_head_relief_floor_mm);
    bottom_u_max_mm=-screw_spacing_y_mm/2-hinge_reference_y_mm+expanded_head_radius_mm;
    bottom_max_y_mm=hinge_reference_y_mm+sqrt(pow(bottom_u_max_mm,2)+pow(head_v_mm,2));
    bottom_dy_mm=max(abs(bottom_max_y_mm+screw_spacing_y_mm/2),abs(-door_height_mm/2+screw_spacing_y_mm/2));
    lower_radius_mm=max(sqrt(pow(expanded_head_radius_mm,2)+pow(bottom_dy_mm,2)),lower_screw_head_relief_floor_mm);
    for(sx=[-1,1],sy=[-1,1])
        translate([sx*screw_spacing_x_mm/2,sy*screw_spacing_y_mm/2,-0.01])
            cylinder(h=door_thickness_mm+louver_projection_mm+0.02,r=((sy<0 ? upper_radius_mm : lower_radius_mm)+0.001)/cos(180/64),$fn=64);
}
module moving_door() {
    difference() {
        union() {
            difference() {
                door_solid();
                // Preserve T1's scope: these reliefs cut door stock only.
                swept_screw_head_relief();
                for(b=fixed_hinge_ranges)
                    translate([b[0]-moving_clearance_mm,upper_lip_cut_y_mm,-0.01])
                        cube([b[1]-b[0]+2*moving_clearance_mm,plate_height_mm/2-upper_lip_cut_y_mm,door_thickness_mm+louver_projection_mm+0.02]);
                // Opposed fixed stops extend beyond their bearing bands.
                // Relieve door stock only; keep moving hinge/stop roots intact.
                stop_lip_cut_y_mm=hinge_y_mm-sqrt(pow(fixed_stop_outer_u_mm,2)+pow(stop_face_thickness_mm,2))-moving_clearance_mm;
                for(sx=[-1,1])
                    translate([sx*opposed_stop_center_x_mm-stop_band_width_mm/2-moving_clearance_mm,
                               stop_lip_cut_y_mm,-0.01])
                        cube([stop_band_width_mm+2*moving_clearance_mm,
                              plate_height_mm/2-stop_lip_cut_y_mm,
                              door_thickness_mm+louver_projection_mm+0.02]);
            }
            moving_hinge();
            open_hold_cam_stock();
        }
        // Whole-union subtraction prevents the existing lip filling the cam.
        open_hold_cam_throat();
    }
}
module door_at_angle(angle_deg) {
    translate([0,hinge_y_mm,hinge_z_mm]) rotate([-angle_deg,0,0]) translate([0,-hinge_y_mm,-hinge_z_mm]) moving_door();
}
// Full-height rounded root; 0.2 mm positive longitudinal leaf overlap.
module clip_root() {
    translate([55.85,-23.5,0]) linear_extrude(height=12)
        rounded_rectangle(4.5,7,clip_root_radius_mm);
}
// Local XZ section about X55.8. The entire 1 mm foot stays flat at Z0.
// A43 nose: 1.6 mm projection, full plateau Y(5+1.6/6)..7.8.
// Confined to terminal Y5..8.2; retained 45-degree underside and 1 mm tip crown.
function clip_nose_extension(y) = y<5 || y>8.2 ? 0 :
    max(0,min(1.6,6*(y-5),4*(8.2-y)));
// Hull each convex component separately: hulling the combined concave
// profile would fill the intended 45-degree clearance beneath the nose.
module clip_section_profile(y,nose=false) {
    e=clip_nose_extension(y);
    r=max(0,min(1,(y-7.8)/0.4));
    t=0.5*r*r;
    if(nose)
        if(e>0)
            polygon([[0.45,9.4],[0.5,9.4],[0.5+e,9.4+e],
                     [0.5+e-t,12],[0.45-t,12]]);
        else
            polygon([[0.45,9.4],[0.5,9.4],[0.5-t,12],[0.45-t,12]]);
    else
        polygon([[-0.5,0],[0.5,0],[0.5,11.5],[0.5-t,12],[-0.5,12]]);
}
module clip_section(y,flex,nose=false) {
    translate([55.8-flex*clip_shape(y),y,0])
        rotate([0,0,clip_rotation_deg(y,flex)])
            rotate([90,0,0]) linear_extrude(height=0.02,center=true)
                clip_section_profile(y,nose);
}
module clip_tongue(flex=0) {
    // Stations explicitly include nose entry/exit and root overlap. Global
    // end trim bounds the actual finite body, including its rotated cap.
    // A44: eight quadratic-easing intervals; retain exact Y8/8.2 stations.
    terminal_stations=[for(i=[0:8])
        i==4 ? 8 : i==8 ? 8.2 : 7.8+0.4*i/8];
    stations=concat([-20.2],
        [for(y=clip_station_y_mm) if(y<5) y], [5],
        [for(y=clip_station_y_mm) if(y>5 && y<5+1.6/6) y], [5+1.6/6],
        [for(y=clip_station_y_mm) if(y>5+1.6/6 && y<7.8) y],
        [for(i=[0:8]) each concat([terminal_stations[i]],
            i<8 ? [for(y=clip_station_y_mm)
                if(y>terminal_stations[i] && y<terminal_stations[i+1]) y] : [])]);
    intersection() {
        union() {
            // The nose embeds 0.05 mm in the rectangular body at every
            // station, giving a positive union without convexifying its gap.
            for(nose=[false,true],i=[0:len(stations)-2]) hull() {
                clip_section(stations[i],flex,nose);
                clip_section(stations[i+1],flex,nose);
            }
        }
        translate([50,-20.2,0]) cube([10,28.4,12]);
    }
}
module integral_frame_clip(flex=0) {
    translate([catch_x_offset_mm,0,0]) {
        clip_root();
        clip_tongue(flex);
    }
}
// Open-hold geometric inspection: Euler-Bernoulli end-load shape only.
// Sections rotate with beam slope; this is not a force/contact solution.
function open_hold_shape(x) = let(q=min(1,max(0,(x+18)/18))) q*q*(3-q)/2;
function open_hold_slope(x,flex) = let(q=min(1,max(0,(x+18)/18))) -flex*(3*q-1.5*q*q)/18;
module open_hold_section(x,flex,ramp=false) {
    translate([x,39.9-flex*open_hold_shape(x),0])
        rotate([0,0,atan(open_hold_slope(x,flex))])
            rotate([90,0,90]) linear_extrude(height=0.02,center=true)
                if(ramp)
                    polygon([[0.95,6.4],[1,6.4],[2.6,8],[0.95,8]]);
                else
                    translate([-1,0]) square([2,8]);
}
module integral_open_hold_leaf(flex=0) {
    // R1.5 shoulders, positive union to both retained stock and free leaf.
    translate([-20.5,39.9,0]) linear_extrude(height=8)
        rounded_rectangle(5,5,1.5);
    stations=concat([-18.2],[for(i=[0:60]) -18+18*i/60]);
    intersection() {
        union() {
            // Separate convex body and ramp hulls preserve the 45-degree
            // underside, with 0.05 mm positive embedding into the body.
            for(i=[0:len(stations)-2]) hull() {
                open_hold_section(stations[i],flex);
                open_hold_section(stations[i+1],flex);
            }
            ramp_stations=concat([-3],[for(x=stations) if(x>-3) x]);
            for(i=[0:len(ramp_stations)-2]) hull() {
                open_hold_section(ramp_stations[i],flex,true);
                open_hold_section(ramp_stations[i+1],flex,true);
            }
        }
        // Explicit finite end cap at X0, including rotated section corners.
        translate([-18.2,35,0]) cube([18.2,7.5,8]);
    }
}
// Coordinates below describe the fully-open physical YZ section. Rotate 180
// to print the cam closed; extrusion X-4..-1 is integral to the door lip.
function open_cam_blend(t) = t*t*(3-2*t);
function open_cam_inner_r(beta) = beta<=-15.44 ? 5 :
    beta<=8 ? 5+(3.354-5)*open_cam_blend((beta+15.44)/(8+15.44)) :
    let(d=beta-8,m=open_cam_rise_mm_per_deg)
        d<=1 ? 3.354+m*d*d/2 : 3.354+m*(d-0.5);
module open_hold_closed_prism(start_x,length) {
    translate([start_x,hinge_y_mm,hinge_z_mm]) rotate([180,0,0])
        rotate([90,0,90]) linear_extrude(height=length) children();
}
// Exact bed-grown carrier is also the sole new cutter-protected stock.
module open_hold_bed_carrier() {
    translate([-4,31.6,0]) cube([3,3.9,4]);
}
module open_hold_cam_stock() {
    // Full-radius sector -16..31: extended entry joins the existing annulus.
    open_hold_closed_prism(-4,3)
        polygon(concat([[0,0]],[for(b=open_cam_sample_angles_deg) [5.5*cos(b),5.5*sin(b)]]));
    // Broad raised carrier overlaps the surviving wall, lip and bed carrier.
    translate([-4,32.3,4]) cube([3,1.7,1.5]);
    open_hold_bed_carrier();
}
module open_hold_cam_throat() {
    // Guard X-5..0. The positive-slope inner wall has no flat seat plateau.
    difference() {
        // One planar outline removes coincident internal radial seams while
        // preserving exactly the three sampled sector boundaries.
        open_hold_closed_prism(-5,5) polygon(concat([[0,0]],
            [for(i=[0:40]) let(b=-46+30*i/40) [6*cos(b),6*sin(b)]],
            [for(b=open_cam_sample_angles_deg) let(r=open_cam_inner_r(b)) [r*cos(b),r*sin(b)]],
            [for(i=[0:40]) let(b=31+39*i/40) [6*cos(b),6*sin(b)]]));
        // Protect only A37's exact bed carrier and A36's actual shaft.
        // The carrier ends at Z4, below the inner throat; never protect the
        // neighboring lip or raised cam contact stock.
        open_hold_bed_carrier();
        axis_prism(right_shaft_start_mm,hinge_span_mm/2-right_shaft_start_mm)
            circle(r=shaft_radius_mm,$fn=hinge_facets);
    }
}
module vent_assembly(angle_deg) {
    color("silver") fixed_frame();
    color("steelblue") door_at_angle(angle_deg);
}
module printable_parts() {
    fixed_frame();
    door_at_angle(0);
}
echo(hinge_fixed_ranges_mm=fixed_hinge_ranges,hinge_moving_segments=moving_hinge_segments,
     hinge_outer_unsupported_shaft_reach_mm=hinge_outer_initial_shaft_reach_mm,
     hinge_internal_unsupported_shaft_reach_mm=hinge_internal_initial_shaft_reach_mm,
     hinge_left_terminal_unsupported_shaft_reach_mm=hinge_left_terminal_initial_shaft_reach_mm,
     hinge_trimmed_unsupported_shaft_reach_mm=hinge_trimmed_initial_shaft_reach_mm,
     first_layer_hinge_soles_mm=[hinge_segment_length_mm,hinge_foot_forward_mm],
     unrelieved_sole_area_mm2=hinge_segment_length_mm*hinge_foot_forward_mm,
     relieved_sole_area_mm2=stop_relieved_sole_length_mm*hinge_foot_forward_mm);
echo(hood_roof_angle_deg=atan(louver_roof_slope),hood_vertical_section_mm=louver_roof_thickness_mm,
     hood_channels_mm=[louver_outer_channel_mm,louver_middle_channel_mm,louver_outer_channel_mm],
     hood_slot_plan_area_mm2=louver_slot_plan_area_mm2);
if(render_mode=="printable_layout") printable_parts();
else vent_assembly(door_angle_deg);
