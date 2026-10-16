// Shed vent: provisional photo estimates. Units mm; installed up is +Y,
// outside is +Z, rear mounting plane and print bed are Z=0.
// Adjustable Parameters
render_mode = "printable_layout";
door_angle_deg = 0;
// Assembly: 0 locked, 180 positively parked; release before swinging.
clasp_angle_deg = 0;
clasp_released = false;
// Deliberate assembly service path: spread fully before withdrawing +Z.
clip_spread_mm = 0; // 0..0.6; ignored in printable_layout
clip_withdrawal_mm = 0; // 0..30; ignored in printable_layout
layout_part = "all"; // all, vent, clasp, pin, clip
// A10 manually selected provisional PETG interface dimensions.
clasp_pivot_y_mm = 64;
clasp_pivot_z_mm = 10;
clasp_pin_diameter_mm = 5;
clasp_bore_diameter_mm = 5.2;
clasp_hub_width_mm = 25.8;
clasp_hub_diameter_mm = 10;
clasp_beam_thickness_mm = 2;
clasp_flex_length_mm = 24;
clasp_max_release_mm = 4;
clasp_commanded_release_mm = 3.90;
clasp_root_radius_mm = 2;
clasp_clip_thickness_mm = 2;
clasp_clip_core_diameter_mm = 4;
clasp_clip_overlap_mm = 0.5;
clasp_pin_flat_width_mm = 2;
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
shaft_diameter_mm = 5;
collar_radius_mm = 4.5;
// Structural sections: selected reinforcement defaults, not strength claims.
perimeter_wall_mm = 1.2;
hinge_arm_width_mm = 2.4;
bearing_wall_mm = 2;
stop_band_width_mm = 2.4;
stop_lug_inner_radius_mm = 3.5;
stop_lug_outer_radius_mm = 7;
fixed_stop_inner_radius_mm = 6;
fixed_stop_outer_radius_mm = 8;
stop_sector_angle_deg = 10;
upper_corner_relief_radius_mm = 5.4;
lower_corner_relief_radius_mm = 7.5;
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
hinge_y_mm = -plate_height_mm/2 - 11.5;
hinge_z_mm = max(8,frame_thickness_mm+screw_head_height_mm+moving_clearance_mm);
core_half_height_radicand_mm2 = pow(opening_height_mm/2-moving_clearance_mm-hinge_y_mm,2)-pow(hinge_z_mm,2);
core_height_mm = 2*min(opening_height_mm/2-moving_clearance_mm,sqrt(max(0,core_half_height_radicand_mm2))+hinge_y_mm);
shaft_radius_mm = shaft_diameter_mm/2;
hinge_facets = 64;
hinge_segment_count = 11;
hinge_span_mm = door_width_mm;
hinge_segment_length_mm = (hinge_span_mm-(hinge_segment_count-1)*moving_clearance_mm)/hinge_segment_count;
function hinge_segment_start_mm(i) = -hinge_span_mm/2+i*(hinge_segment_length_mm+moving_clearance_mm);
bore_radius_mm = (shaft_radius_mm+moving_clearance_mm)/cos(180/hinge_facets);
bore_roof_radius_mm = sqrt(2)*bore_radius_mm;
housing_half_depth_mm = bore_radius_mm+bearing_wall_mm;
housing_roof_v_mm = sqrt(2)*(bore_radius_mm+bearing_wall_mm);
housing_shoulder_v_mm = housing_roof_v_mm-housing_half_depth_mm;
housing_top_mm = hinge_z_mm+housing_roof_v_mm;
fixed_rib_end_y_mm = -plate_height_mm/2+0.2;
hinge_foot_forward_mm = 8;
hinge_foot_sweep_radius_mm = sqrt(pow(hinge_z_mm,2)+pow(hinge_foot_forward_mm,2));
lower_plate_edge_distance_mm = -plate_height_mm/2-hinge_y_mm;
lower_frame_nearest_distance_mm = sqrt(pow(lower_plate_edge_distance_mm,2)+pow(max(hinge_z_mm-frame_thickness_mm,0),2));
lower_frame_sweep_clearance_mm = lower_frame_nearest_distance_mm-hinge_foot_sweep_radius_mm;
end_bridge_center_mm = hinge_span_mm/2-7;
function bridge_center_mm(i) = i==0 ? -end_bridge_center_mm : i==10 ? end_bridge_center_mm : hinge_segment_start_mm(i)+hinge_segment_length_mm/2;
expanded_head_radius_mm = screw_head_diameter_mm/2+moving_clearance_mm;
function head_relief_radicand_mm2(s) = pow(s-hinge_y_mm-expanded_head_radius_mm,2)-pow(hinge_z_mm,2);
function head_relief_bound_mm(s) = s-hinge_y_mm-sqrt(max(0,head_relief_radicand_mm2(s)));
slot_width_mm = (core_width_mm - 18)/louver_columns;
row_pitch_mm = (core_height_mm - 10)/louver_rows;
slot_height_mm = row_pitch_mm - 7;
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
// A10 conditional full-play certificate. These arithmetic guards enforce the
// selected enclosure; actual head/clip/ear non-crossing and coupled contact
// premises still require independent geometric verification, not an echo.
receiver_root_y_mm = 33;
receiver_top_y_mm = 41.6;
receiver_top_z_mm = lip_z_mm+4.6;
receiver_sweep_y_mm = hinge_y_mm+sqrt(pow(receiver_top_y_mm-hinge_y_mm,2)+pow(max(abs(lip_z_mm+1.6-hinge_z_mm),abs(receiver_top_z_mm-hinge_z_mm)),2));
clasp_hub_side_gap_mm = (26-clasp_hub_width_mm)/2;
clasp_pin_radial_gap_mm = (clasp_bore_diameter_mm-clasp_pin_diameter_mm)/2;
clasp_pin_flat_depth_mm = sqrt(pow(clasp_pin_diameter_mm/2,2)-pow(clasp_pin_flat_width_mm/2,2));
clasp_bore_outer_radius_mm = clasp_bore_diameter_mm/2/cos(180/64);
clasp_centre_slack_mm = clasp_bore_outer_radius_mm-clasp_pin_flat_depth_mm;
clasp_centre_diameter_mm = (1+sqrt(2))*clasp_centre_slack_mm;
clasp_pin_witness_span_mm = 32; // inner planes +/-16 exclude played groove
clasp_pin_tilt_enclosure_deg = 2;
clasp_pin_axial_enclosure_mm = 1.5;
clasp_pin_tilt_bound_deg = atan(clasp_centre_diameter_mm/clasp_pin_witness_span_mm);
clasp_play_tilt_deg = clasp_pin_tilt_bound_deg+atan(clasp_centre_diameter_mm/clasp_hub_width_mm);
// Each eroded peaked bore centre has radius <=sqrt(2)*slack. Summing
// ear/pin and hub/pin offsets gives <.90 at an ear-side hub rim witness.
clasp_rim_offset_bound_mm = 2*sqrt(2)*clasp_centre_slack_mm;
clasp_rim_offset_enclosure_mm = 0.90;
clasp_rim_inradius_mm = clasp_hub_diameter_mm/2*cos(180/64);
clasp_pin_axial_candidate_mm = 0.8+5*sin(clasp_pin_tilt_enclosure_deg)+40*(1-cos(clasp_pin_tilt_enclosure_deg));
clasp_shaft_start_bound_mm = -18*cos(clasp_pin_tilt_enclosure_deg)+clasp_pin_axial_enclosure_mm+2.5*sin(clasp_pin_tilt_enclosure_deg);
clasp_groove_start_bound_mm = 18.4*cos(clasp_pin_tilt_enclosure_deg)-clasp_pin_axial_enclosure_mm-2.5*sin(clasp_pin_tilt_enclosure_deg);
clasp_toe_radius_mm = sqrt(pow(clasp_pivot_y_mm-35,2)+pow(clasp_pivot_z_mm-7.5,2));
clasp_toe_lateral_error_mm = clasp_hub_side_gap_mm+11.4*(1-cos(clasp_play_tilt_deg))+clasp_toe_radius_mm*sin(clasp_play_tilt_deg);
clasp_nominal_overlap_mm = 9-7.2;
clasp_retained_overlap_bound_mm = clasp_nominal_overlap_mm-clasp_toe_lateral_error_mm;
clasp_release_mm = clasp_commanded_release_mm;
clasp_release_clearance_bound_mm = clasp_release_mm*cos(clasp_play_tilt_deg)-clasp_nominal_overlap_mm-clasp_toe_lateral_error_mm;
clasp_straight_flex_length_mm = clasp_flex_length_mm-clasp_root_radius_mm;
clasp_clip_throat_mm = clasp_clip_core_diameter_mm-2*clasp_clip_overlap_mm;
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
assert(door_angle_deg>=0 && door_angle_deg<=180, "Operational range 0..180 degrees");
assert(louver_rows==4 && louver_columns==2 && slot_height_mm>0 && slot_width_mm>0 && louver_projection_mm>0, "Eight noncollapsed passages required");
assert(door_overlap_mm<frame_border_mm && core_width_mm>40 && core_height_mm>30, "Invalid overlap or aperture");
assert(screw_spacing_x_mm/2+screw_head_diameter_mm/2<=plate_width_mm/2 && screw_spacing_y_mm/2+screw_head_diameter_mm/2<=plate_height_mm/2, "Screw head outside mounting plate");
assert(screw_spacing_x_mm>opening_width_mm && screw_spacing_y_mm>opening_height_mm, "Screw centres must remain in corner borders");
assert(screw_clearance_diameter_mm>0 && screw_clearance_diameter_mm<screw_head_diameter_mm, "Invalid screw diameters");
assert(screw_head_height_mm>0, "Positive screw head height required");
// Smaller heads are subsets of the reinforced default Z=3.6..7.6 envelope.
// Taller heads need renewed local-relief motion inspection before support.
assert(screw_head_height_mm<=4, "Screw head exceeds supported 4 mm motion envelope");
assert(screw_corner_distance_mm>screw_clearance_diameter_mm/2, "Screw shank intersects aperture corner");
assert(collar_bridge_overlap_mm>0, "Collar and moving bridge require positive material overlap");
for (sx=[-1,1],sy=[-1,1]) {
    assert(rectangle_distance_mm(sx*screw_spacing_x_mm/2,sy*screw_spacing_y_mm/2,-20,20,42.2,100.1)>expanded_head_radius_mm, "Screw head/tool intersects clasp mount");
    assert(rectangle_distance_mm(sx*screw_spacing_x_mm/2,sy*screw_spacing_y_mm/2,-5,5,receiver_root_y_mm,receiver_top_y_mm)>expanded_head_radius_mm, "Screw head/tool intersects receiver");
}
assert(core_half_height_radicand_mm2>0 && core_top_sweep_mm<=opening_height_mm/2-moving_clearance_mm+0.000001, "Recessed core collides with frame top during sweep");
assert(hinge_segment_length_mm>2*stop_band_width_mm && hinge_arm_width_mm>0, "Collapsed hinge segment or bridge");
assert(bearing_wall_mm>=2 && collar_radius_mm*cos(180/hinge_facets)>bore_roof_radius_mm, "Lost axial hinge capture or undersized housing");
assert(shaft_radius_mm>0 && shaft_radius_mm<collar_radius_mm && moving_clearance_mm<hinge_segment_length_mm, "Invalid shaft or axial capture");
assert(hinge_z_mm>=fixed_stop_outer_radius_mm && 2*hinge_z_mm-max(hinge_z_mm+collar_radius_mm,receiver_top_z_mm,door_thickness_mm+louver_projection_mm)>=moving_clearance_mm, "Door violates wall plane or fully-open clearance");
assert(lower_frame_sweep_clearance_mm>=moving_clearance_mm, "Forward hinge foot lacks lower-frame sweep clearance");
assert(hinge_y_mm+housing_half_depth_mm<-plate_height_mm/2 && fixed_rib_end_y_mm<-opening_height_mm/2, "Housing or ribs obstruct passage");
assert(stop_band_width_mm>0 && stop_lug_inner_radius_mm>0 && stop_lug_inner_radius_mm<collar_radius_mm && stop_lug_outer_radius_mm>fixed_stop_inner_radius_mm && fixed_stop_inner_radius_mm>collar_radius_mm && fixed_stop_outer_radius_mm>stop_lug_outer_radius_mm && stop_sector_angle_deg==10, "Invalid 180-degree stop engagement");
assert(upper_corner_relief_radius_mm>0 && lower_corner_relief_radius_mm>0, "Positive screw relief dimensions required");
assert(perimeter_wall_mm>0 && perimeter_wall_mm<min(core_width_mm,core_height_mm)/2, "Invalid perimeter connection wall");
assert(head_relief_radicand_mm2(screw_spacing_y_mm/2)>0 && head_relief_radicand_mm2(-screw_spacing_y_mm/2)>0, "Invalid screw relief sweep envelope");
assert(upper_corner_relief_radius_mm>=head_relief_bound_mm(screw_spacing_y_mm/2) && lower_corner_relief_radius_mm>=head_relief_bound_mm(-screw_spacing_y_mm/2), "Corner relief smaller than full screw-head sweep bound");
for(sx=[-1,1],sy=[-1,1]) {
    relief_radius_mm = sy>0 ? upper_corner_relief_radius_mm : lower_corner_relief_radius_mm;
    // Keep the complete louver region and side connection walls untouched.
    assert(relief_radius_mm<rectangle_distance_mm(sx*screw_spacing_x_mm/2,sy*screw_spacing_y_mm/2,-core_width_mm/2,core_width_mm/2,-louver_outer_y_mm-perimeter_wall_mm,louver_outer_y_mm+perimeter_wall_mm), "Corner relief severs core, louvers or side perimeter");
    // Preserve a full transverse perimeter rib above/below the louver region.
    assert(relief_radius_mm<rectangle_distance_mm(sx*screw_spacing_x_mm/2,sy*screw_spacing_y_mm/2,-louver_outer_x_mm,louver_outer_x_mm,min(sy*(core_height_mm/2-perimeter_wall_mm),sy*door_height_mm/2),max(sy*(core_height_mm/2-perimeter_wall_mm),sy*door_height_mm/2)), "Corner relief severs upper/lower perimeter rib");
    assert(relief_radius_mm<rectangle_distance_mm(sx*screw_spacing_x_mm/2,sy*screw_spacing_y_mm/2,-5,5,receiver_root_y_mm,receiver_top_y_mm), "Corner relief severs receiver");
}
for(i=[0:2:10]) {
    assert(bridge_center_mm(i)-hinge_arm_width_mm/2>=hinge_segment_start_mm(i) && bridge_center_mm(i)+hinge_arm_width_mm/2<=hinge_segment_start_mm(i)+hinge_segment_length_mm, "Bridge escapes moving knuckle band");
    for(sx=[-1,1]) assert(abs(bridge_center_mm(i)-sx*screw_spacing_x_mm/2)>hinge_arm_width_mm/2+expanded_head_radius_mm, "Screw head/tool intersects hinge bridge");
}
for(i=[1:2:9],sx=[-1,1],sy=[-1,1])
    assert(rectangle_distance_mm(sx*screw_spacing_x_mm/2,sy*screw_spacing_y_mm/2,hinge_segment_start_mm(i),hinge_segment_start_mm(i)+hinge_segment_length_mm,hinge_y_mm-housing_half_depth_mm,fixed_rib_end_y_mm)>expanded_head_radius_mm, "Screw head/tool intersects fixed hinge rib");
assert(louver_projection_mm==9 && louver_roof_thickness_mm>=1.6 && louver_roof_thickness_mm<louver_projection_mm, "A8 requires 9 mm hoods and at least 1.6 mm vertical roofs");
assert(louver_roof_slope>=1, "A8 hood underside must grow at least 45 degrees to the bed");
assert(louver_cheek_width_mm==1 && louver_rib_width_mm==1.2 && louver_root_overlap_mm==1 && louver_roof_overlap_mm==0.4, "A8 selected cheek, rib and positive root/roof unions required");
assert(louver_roof_overlap_mm>0 && louver_roof_overlap_mm<louver_roof_thickness_mm && door_thickness_mm>0.2, "Collapsed hood root or roof union");
assert(louver_middle_channel_mm>1 && louver_outer_channel_mm>1 && slot_height_mm>1 && louver_underside_mm(louver_lower_y_mm)>0, "Collapsed through-air channels or downward mouth");
assert(row_pitch_mm-(louver_upper_y_mm-louver_lower_y_mm)==6 && row_pitch_mm-(louver_upper_y_mm-louver_lower_y_mm+louver_root_overlap_mm)>0, "Adjacent hood roofs or bed roots overlap");
// Preserve the six A7 independent hinge-foot floors.
assert(hinge_segment_length_mm*hinge_foot_forward_mm>=60 && min(hinge_segment_length_mm,hinge_foot_forward_mm)>=4, "A7 hinge sole below 60 mm2 area or 4 mm short dimension");
assert(hinge_foot_forward_mm==8, "A7 selected hinge sole depth is fixed");
assert(render_mode=="printable_layout" || (clip_spread_mm>=0 && clip_spread_mm<=0.6), "Clip spread range 0..0.6 mm");
assert(render_mode=="printable_layout" || (clip_withdrawal_mm>=0 && clip_withdrawal_mm<=30), "Clip withdrawal range 0..30 mm");
assert(render_mode=="printable_layout" || clip_withdrawal_mm==0 || clip_spread_mm==0.6, "Fully spread clip before withdrawal");
assert(clasp_angle_deg>=0 && clasp_angle_deg<=180, "Clasp range 0..180 degrees");
assert(layout_part=="all" || layout_part=="vent" || layout_part=="clasp" || layout_part=="pin" || layout_part=="clip", "Unknown printable part");
assert(render_mode=="printable_layout" || door_angle_deg==0 || (clasp_angle_deg==180 && !clasp_released), "Park clasp before opening door");
assert(clasp_pivot_y_mm==64 && clasp_pivot_z_mm==10 && clasp_hub_width_mm==25.8 && clasp_hub_diameter_mm==10, "A10 selected pivot/hub interface");
assert(clasp_pin_diameter_mm==5 && clasp_bore_diameter_mm==5.2 && clasp_pin_flat_width_mm==2 && clasp_pin_flat_width_mm<clasp_pin_diameter_mm, "A10 pin/bore interface requires certified 2 mm D-flat");
assert(clasp_beam_thickness_mm==2 && clasp_flex_length_mm==24 && clasp_max_release_mm==4, "A9 flex allocation");
assert(clasp_clip_thickness_mm==2 && clasp_clip_core_diameter_mm==4 && clasp_clip_overlap_mm==0.5 && clasp_clip_throat_mm>0, "A9 clip interface");
assert(clasp_hub_side_gap_mm>=0.1-0.000001 && clasp_release_mm==3.90 && clasp_release_mm<=clasp_max_release_mm, "A10 release/axial allocation");
assert(clasp_root_radius_mm==2 && clasp_straight_flex_length_mm>=22, "A10 root/straight flex allocation");
assert(clasp_shaft_start_bound_mm < -clasp_pin_witness_span_mm/2 && clasp_groove_start_bound_mm > clasp_pin_witness_span_mm/2, "Inner shaft witnesses enter head/groove");
assert(clasp_pin_tilt_bound_deg<clasp_pin_tilt_enclosure_deg && clasp_pin_axial_candidate_mm<clasp_pin_axial_enclosure_mm, "Conditional pin enclosure fails");
assert(clasp_rim_offset_bound_mm<clasp_rim_offset_enclosure_mm && clasp_rim_inradius_mm*cos(clasp_play_tilt_deg)-clasp_rim_offset_enclosure_mm>sqrt(2)*clasp_bore_outer_radius_mm && clasp_hub_diameter_mm/2+clasp_rim_offset_enclosure_mm<6, "Conditional hub rim loses solid ear witness");
// f(a)=12.9cos(a)+rim*sin(a) is concave on this interval; endpoints
// >=12.9 imply every intermediate projected axial rim reaches the ear.
assert(clasp_hub_width_mm/2*cos(clasp_play_tilt_deg)+clasp_rim_inradius_mm*sin(clasp_play_tilt_deg)>=clasp_hub_width_mm/2, "Hub axial projection loses ear contact");
assert(clasp_retained_overlap_bound_mm>0 && clasp_release_clearance_bound_mm>=0.4, "Conditional retention/release margin fails");
assert(42.2-receiver_sweep_y_mm>=0.4, "Fixed mount enters receiver sweep");
assert(receiver_root_y_mm<door_height_mm/2 && receiver_root_y_mm>=core_height_mm/2, "Receiver loses upper perimeter root");
echo(conditional_retention_overlap_mm=clasp_retained_overlap_bound_mm,conditional_release_clearance_mm=clasp_release_clearance_bound_mm,conditional_rim_offset_mm=clasp_rim_offset_bound_mm);
echo(clasp_release_mm=clasp_release_mm,clasp_play_tilt_deg=clasp_play_tilt_deg,clasp_pin_flat_depth_mm=clasp_pin_flat_depth_mm);
echo(hinge_span_mm=hinge_span_mm,segment_length_mm=hinge_segment_length_mm,bore_radius_mm=bore_radius_mm,housing_top_mm=housing_top_mm,retention_overlap_mm=collar_radius_mm*cos(180/hinge_facets)-bore_roof_radius_mm);
echo(collar_bridge_overlap_mm=collar_bridge_overlap_mm,lower_frame_sweep_clearance_mm=lower_frame_sweep_clearance_mm,head_relief_bounds_mm=[head_relief_bound_mm(screw_spacing_y_mm/2),head_relief_bound_mm(-screw_spacing_y_mm/2)]);

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
    polygon([[-housing_half_depth_mm,-hinge_z_mm],[housing_half_depth_mm,-hinge_z_mm],[housing_half_depth_mm,housing_shoulder_v_mm],[0,housing_roof_v_mm],[-housing_half_depth_mm,housing_shoulder_v_mm]]);
}
module annular_sector(inner_mm,outer_mm,start_deg,end_deg) {
    polygon(concat([for(a=[start_deg:1:end_deg]) [outer_mm*cos(a),outer_mm*sin(a)]],[for(a=[end_deg:-1:start_deg]) [inner_mm*cos(a),inner_mm*sin(a)]]));
}
module fixed_stop_profile() {
    // Downward-only rear growth: no connector enters the moving collar band.
    hull() {
        annular_sector(fixed_stop_inner_radius_mm,fixed_stop_outer_radius_mm,190,200);
        polygon([[fixed_stop_outer_radius_mm*cos(190),-hinge_z_mm],[fixed_stop_inner_radius_mm*cos(200),-hinge_z_mm],[fixed_stop_inner_radius_mm*cos(200),fixed_stop_inner_radius_mm*sin(200)]]);
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
module fixed_stop_station(i,neighbor_i,right_edge=false) {
    band_start_mm=hinge_segment_start_mm(i)+(right_edge ? hinge_segment_length_mm-stop_band_width_mm : 0);
    adjacent_start_mm=hinge_segment_start_mm(neighbor_i);
    axis_prism(min(band_start_mm,adjacent_start_mm),max(band_start_mm+stop_band_width_mm,adjacent_start_mm+hinge_segment_length_mm)-min(band_start_mm,adjacent_start_mm)) fixed_stop_profile();
    // Join rear footprint to housing only within the fixed knuckle's X band.
    axis_prism(adjacent_start_mm,hinge_segment_length_mm)
        translate([fixed_stop_outer_radius_mm*cos(190),-hinge_z_mm]) square([-housing_half_depth_mm+0.2-fixed_stop_outer_radius_mm*cos(190),hinge_z_mm+fixed_stop_inner_radius_mm*sin(200)]);
}
module fixed_frame() {
    difference() {
        linear_extrude(height=frame_thickness_mm) difference() {
            rounded_rectangle(plate_width_mm,plate_height_mm);
            rounded_rectangle(opening_width_mm,opening_height_mm);
        }
        for (sx=[-1,1],sy=[-1,1]) translate([sx*screw_spacing_x_mm/2,sy*screw_spacing_y_mm/2,-0.1]) cylinder(h=frame_thickness_mm+0.2,d=screw_clearance_diameter_mm);
    }
    for(i=[1:2:9]) fixed_hinge_knuckle(i);
    fixed_stop_station(2,1); fixed_stop_station(8,9,true);
    fixed_clasp_mount();
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
    // One integral shaft; collars and forward-only feet are supported at Z=0.
    axis_prism(-hinge_span_mm/2,hinge_span_mm) circle(r=shaft_radius_mm,$fn=hinge_facets);
    for(i=[0:2:10]) {
        axis_prism(hinge_segment_start_mm(i),hinge_segment_length_mm) hull() {
            circle(r=collar_radius_mm,$fn=hinge_facets);
            translate([0,-hinge_z_mm]) square([hinge_foot_forward_mm,hinge_z_mm]);
        }
        // A5 rear-plane exceptions: core/perimeter and these forward bed feet.
        // A7 first bridge layers span support-free from foot to core, about 14.272 mm.
        translate([bridge_center_mm(i)-hinge_arm_width_mm/2,hinge_y_mm,lip_z_mm])
            cube([hinge_arm_width_mm,-core_height_mm/2-hinge_y_mm+2,door_thickness_mm]);
    }
    axis_prism(hinge_segment_start_mm(2),stop_band_width_mm)
        annular_sector(stop_lug_inner_radius_mm,stop_lug_outer_radius_mm,0,stop_sector_angle_deg);
    axis_prism(hinge_segment_start_mm(8)+hinge_segment_length_mm-stop_band_width_mm,stop_band_width_mm)
        annular_sector(stop_lug_inner_radius_mm,stop_lug_outer_radius_mm,0,stop_sector_angle_deg);
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
    }
    door_louvers();
    door_receiver();
}
module moving_door() {
    difference() {
        door_solid();
        // A2 full-depth corner relief includes the recessed core for initial swing.
        // Four local corner gaps preserve all straight-edge overlap and hole inputs.
        for (sx=[-1,1],sy=[-1,1])
            translate([sx*screw_spacing_x_mm/2,sy*screw_spacing_y_mm/2,-0.1])
                cylinder(h=max(lip_z_mm+door_thickness_mm,louver_projection_mm+door_thickness_mm,receiver_top_z_mm)+0.2,r=sy>0 ? upper_corner_relief_radius_mm : lower_corner_relief_radius_mm);
    }
    moving_hinge();
}
module door_at_angle(angle_deg) {
    translate([0,hinge_y_mm,hinge_z_mm]) rotate([angle_deg,0,0]) translate([0,-hinge_y_mm,-hinge_z_mm]) moving_door();
}
// All new pivot parts are assembled after printing; no bearing support/fusion.
module clasp_axis_prism(x_mm,length_mm) {
    translate([x_mm,clasp_pivot_y_mm,clasp_pivot_z_mm])
        rotate([90,0,90]) linear_extrude(height=length_mm) children();
}
module clasp_bore_profile() {
    r_mm=clasp_bore_diameter_mm/2/cos(180/64);
    polygon(concat([for(a=[135:360/64:405]) [r_mm*cos(a),r_mm*sin(a)]],[[0,sqrt(2)*r_mm]]));
}
// New plates alone receive the larger shaft clearance; the existing ear's
// 5.2 mm bearing is cut separately and preserved when these bodies are united.
module clasp_clip_guide() {
    for(x_mm=[15.4,21]) difference() {
        translate([x_mm,53,0]) cube([2.6,22,30]);
        clasp_axis_prism(x_mm-0.01,2.62) {
            r_mm=3.7/cos(180/64);
            polygon(concat([for(a=[135:360/64:405]) [r_mm*cos(a),r_mm*sin(a)]],[[0,sqrt(2)*r_mm]]));
        }
        translate([x_mm-0.01,60,22]) cube([2.62,8,8.01]);
    }
    for(y_mm=[53,72]) translate([15.4,y_mm,0]) cube([8.2,3,30]);
    translate([15.4,53,0]) cube([8.2,22,3.6]);
}
module fixed_clasp_mount() {
    clasp_clip_guide();
    translate([0,(42.2+100.1)/2,0]) linear_extrude(height=3.6)
        rounded_rectangle(40,100.1-42.2,3);
    for(x_mm=[-18,13]) difference() {
        clasp_axis_prism(x_mm,5)
            polygon([[-6,-10],[6,-10],[6,2.5],[0,8.5],[-6,2.5]]);
        clasp_axis_prism(x_mm-0.01,5.02) clasp_bore_profile();
    }
    // Radius3 concave ear/base roots; confined to each stationary ear band.
    for(x_mm=[-18,13], side=[-1,1])
        clasp_axis_prism(x_mm,5)
            polygon(concat([[side*6,-6.4],[side*9,-6.4]],
                [for(a=[-90:5:0]) [side*(9-3*cos(a)),-3.4+3*sin(a)]]));
    // A10 upper bridge: complete unsupported inward reach is 6.7 mm.
    // No low gusset may intrude into the played toe/retaining-wall sweep.
    translate([7,90,12.9]) cube([2,3,2]);
    translate([7,92.6,12.9]) cube([2,4.5,2]);
    translate([7,96.7,0]) cube([3,3.4,14.9]);
}
module door_receiver() {
    translate([-5,receiver_root_y_mm,lip_z_mm]) cube([10,35.5-receiver_root_y_mm,receiver_top_z_mm-lip_z_mm]);
    translate([-5,receiver_root_y_mm,lip_z_mm+1.6]) cube([10,receiver_top_y_mm-receiver_root_y_mm,3]);
    // Broad 3 mm root joins the inherited receiver; lip is 0.4 above toe.
    translate([2,35,receiver_top_z_mm-0.2]) cube([3,3,12-receiver_top_z_mm+0.2]);
    translate([3,35,10]) cube([6,3,2]);
    // Local 2 mm concave root fillet, trimmed to the lip envelope.
    translate([3,35,8]) difference() {
        cube([4,3,4]);
        translate([4,-0.01,0]) rotate([-90,0,0]) cylinder(r=2,h=3.02);
    }
}
module clasp_tongue(release_mm=0) {
    // Smooth cubic displacement over the 22 mm straight span; radius2
    // transition and its root stay fixed while the free end moves +X.
    for(i=[0:23]) {
        y0_mm=36+i; y1_mm=i==23 ? 60.35 : 37+i;
        t0=max(0,(58-y0_mm)/clasp_straight_flex_length_mm); t1=max(0,(58-y1_mm)/clasp_straight_flex_length_mm);
        hull() {
            translate([9.4+release_mm*t0*t0*(3-2*t0),y0_mm,9]) cube([clasp_beam_thickness_mm,0.05,6.4]);
            translate([9.4+release_mm*t1*t1*(3-2*t1),y1_mm,9]) cube([clasp_beam_thickness_mm,0.05,6.4]);
        }
    }
    // Radius2 concave transition occupies Y58..60 of the nominal beam.
    // It remains fixed with the root; the straight compliant region is 22 mm.
    translate([7.4,58,12.4]) linear_extrude(height=3) difference() {
        square([clasp_root_radius_mm,clasp_root_radius_mm+0.4]);
        circle(r=clasp_root_radius_mm,$fn=64);
    }
    translate([release_mm,0,0]) {
        difference() {
            translate([7.2,35,7.5]) cube([4.2,3,2.1]);
            // One-millimetre 45 degree engagement lead-in at free toe edge.
            translate([7.2,35-0.01,7.5]) rotate([-90,0,0]) linear_extrude(height=3.02)
                polygon([[0,0],[1,0],[0,-1]]);
        }
        // Finger pad projects sideways, clear of the door catch and carrier.
        translate([11,31,12.4]) cube([8.4,8,3]);
    }
}
module clasp_carrier(release_mm=0) {
    difference() {
        union() {
            clasp_axis_prism(-clasp_hub_width_mm/2,clasp_hub_width_mm)
                circle(d=clasp_hub_diameter_mm,$fn=64);
            translate([-6,34,12.4]) cube([12,26.4,3]);
            translate([4,60,12.4]) cube([7.4,4,3]);
            // Hub/carrier transition stays within rigid carrier X bounds.
            translate([-6,59,12.4]) cube([12,5,3]);
            translate([3,33,9.6]) cube([3,1.6,5.8]);
        }
        clasp_axis_prism(-13,26) clasp_bore_profile();
    }
    clasp_tongue(release_mm);
}
module clasp_pin() {
    difference() {
        union() {
            clasp_axis_prism(-20,2) circle(d=10,$fn=64);
            clasp_axis_prism(-18,40) circle(d=clasp_pin_diameter_mm,$fn=64);
        }
        // Annular groove leaves an intact 1.2 mm end shoulder.
        clasp_axis_prism(18.4,2.4) difference() {
            circle(d=6,$fn=64); circle(d=clasp_clip_core_diameter_mm,$fn=64);
        }
        // Matching head/shaft D-flat; pin remains inside nominal circular fit.
        translate([-21,clasp_pivot_y_mm-6,clasp_pivot_z_mm-6])
            cube([44,12,6-clasp_pin_flat_depth_mm]);
    }
}
// A11 geometric service pose, not an elastic/material simulation. Roots
// stay fixed; cubic arm displacement has zero end slope over v=-11..1.
function clip_arm_shift_mm(v_mm,spread_mm) =
    let(t=max(0,min(1,(v_mm+11)/12))) spread_mm*t*t*(3-2*t);
module clasp_clip_arm(sx,spread_mm) {
    // Rounded 2 mm arm, u=4..6 (mirrored), v=-15..2. The sampled
    // boundary follows the same smooth displacement on both sides.
    polygon([for(p=concat(
        [for(a=[180:5:360]) [5+cos(a),-14+sin(a)]],
        [for(v=[-13.5:0.5:1]) [6,v]],
        [for(a=[5:5:180]) [5+cos(a),1+sin(a)]],
        [for(v=[0.5:-0.5:-13.5]) [4,v]]))
            [sx*(p[0]+clip_arm_shift_mm(p[1],spread_mm)),p[1]]]);
}
module clasp_clip_flat(spread_mm=0) {
    linear_extrude(height=clasp_clip_thickness_mm) difference() {
        union() {
            hull() for(sx=[-1,1]) translate([sx*4,-15]) circle(r=2,$fn=64);
            for(sx=[-1,1]) {
                clasp_clip_arm(sx,spread_mm);
                // Concave radius2 transition stays below free-arm v=-11.
                scale([sx,1]) translate([2,-13]) difference() {
                    square([2,2]);
                    translate([0,2]) circle(r=2,$fn=64);
                }
                // Cut the relaxed tooth first, then translate that same material.
                translate([sx*spread_mm,0]) difference() {
                    translate([sx*3.75,2]) rounded_rectangle(4.5,2,0.4);
                    circle(r=2.1,$fn=64);
                }
            }
            // Fixed stop: u=-1..1, v=-14..-2.1, positively rooted.
            translate([-1,-14]) square([2,11.9]);
        }
        circle(r=2.1,$fn=64);
        translate([-clasp_clip_throat_mm/2,0]) square([clasp_clip_throat_mm,10]);
    }
}
module clasp_at_angle(a_deg,release_mm=0) {
    translate([0,clasp_pivot_y_mm,clasp_pivot_z_mm]) rotate([-a_deg,0,0])
        translate([0,-clasp_pivot_y_mm,-clasp_pivot_z_mm]) clasp_carrier(release_mm);
}
module vent_assembly(angle_deg,clasp_pose_deg,released=false) {
    color("silver") fixed_frame();
    color("steelblue") door_at_angle(angle_deg);
    color("darkorange") clasp_at_angle(clasp_pose_deg,released ? clasp_release_mm : 0);
    color("gold") clasp_pin();
    color("coral") translate([18.6,clasp_pivot_y_mm,clasp_pivot_z_mm+clip_withdrawal_mm])
        rotate([90,0,90]) rotate([0,0,180]) clasp_clip_flat(clip_spread_mm);
}
module printable_parts() {
    if(layout_part=="all" || layout_part=="vent") {
        fixed_frame(); door_at_angle(0);
    }
    if(layout_part=="all" || layout_part=="clasp")
        translate([plate_width_mm/2+30,44,15.4]) rotate([180,0,0]) clasp_carrier();
    if(layout_part=="all" || layout_part=="pin")
        translate([plate_width_mm/2+35,-40,clasp_pin_flat_depth_mm-clasp_pivot_z_mm])
            translate([0,-clasp_pivot_y_mm,0]) clasp_pin();
    if(layout_part=="all" || layout_part=="clip")
        translate([plate_width_mm/2+36,40,0]) clasp_clip_flat();
}
echo(first_layer_hinge_soles_mm=[hinge_segment_length_mm,hinge_foot_forward_mm],hinge_sole_area_mm2=hinge_segment_length_mm*hinge_foot_forward_mm);
echo(hood_roof_angle_deg=atan(louver_roof_slope),hood_vertical_section_mm=louver_roof_thickness_mm,
     hood_channels_mm=[louver_outer_channel_mm,louver_middle_channel_mm,louver_outer_channel_mm],
     hood_slot_plan_area_mm2=louver_slot_plan_area_mm2);
if(render_mode=="printable_layout") printable_parts();
else vent_assembly(door_angle_deg,clasp_angle_deg,clasp_released);
