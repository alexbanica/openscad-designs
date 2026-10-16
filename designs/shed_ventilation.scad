// Shed vent: provisional photo estimates. Units mm; installed up is +Y,
// outside is +Z, rear mounting plane and print bed are Z=0.
// Adjustable Parameters
render_mode = "printable_layout";
door_angle_deg = 0;
// Assembly inspection: -45 released, +45 locked; print at central angle 0.
latch_angle_deg = -45;
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
// A8 B2 selected quarter-turn allocations. Local XY is relative to pivot.
latch_pivot_x_mm = -12;
latch_pivot_y_mm = 53;
latch_foot_radius_mm = 6;
latch_foot_top_mm = 2.8;
latch_flange_radius_mm = 8;
latch_flange_bottom_mm = 2.4;
latch_flange_top_mm = 5.4;
latch_spindle_radius_mm = 3;
latch_spindle_bottom_mm = 5;
latch_spindle_top_mm = 17.5;
latch_housing_radius_mm = 10.8;
latch_cavity_radius_mm = latch_flange_radius_mm+moving_clearance_mm;
latch_lower_opening_radius_mm = latch_foot_radius_mm+moving_clearance_mm;
latch_lower_lip_top_mm = 2;
latch_roof_bottom_mm = latch_flange_top_mm+moving_clearance_mm;
latch_roof_top_mm = 7.8+moving_clearance_mm;
latch_spindle_opening_radius_mm = latch_spindle_radius_mm+moving_clearance_mm;
latch_blocker_half_width_mm = 1.5;
latch_blocker_length_mm = 19;
latch_blocker_bottom_mm = 10.5;
latch_blocker_top_mm = 13.5;
latch_tab_half_width_mm = 5;
latch_tab_y_min_mm = 6;
latch_tab_y_max_mm = 22;
latch_tab_bottom_mm = 15;
latch_tab_top_mm = 21;
latch_tab_web_end_mm = 6.4;
latch_stop_root_end_mm = 7.4;
latch_stop_neck_inner_radius_mm = 7;
latch_stop_lug_inner_radius_mm = 10;
latch_stop_lug_outer_radius_mm = 13;
latch_stop_start_deg = 85;
latch_stop_end_deg = 95;
latch_stop_bottom_mm = 10;
latch_stop_top_mm = 13;
latch_fixed_stop_inner_radius_mm = 9;
latch_fixed_stop_outer_radius_mm = 14;
receiver_root_y_mm = 33;
receiver_top_y_mm = 41.6;
receiver_top_z_mm = lip_z_mm+4.6;
receiver_sweep_y_mm = hinge_y_mm+sqrt(pow(receiver_top_y_mm-hinge_y_mm,2)+pow(max(abs(lip_z_mm+1.6-hinge_z_mm),abs(receiver_top_z_mm-hinge_z_mm)),2));
latch_anchor_y_min_mm = receiver_sweep_y_mm+moving_clearance_mm;
// These nominal gaps do not replace the required all-reachable-play proof.
latch_axial_freedom_mm = latch_roof_bottom_mm-latch_lower_lip_top_mm-(latch_flange_top_mm-latch_flange_bottom_mm);
latch_locked_under_gap_mm = latch_blocker_bottom_mm-receiver_top_z_mm;
// A8 all-play certificate; these bounds do not change printable geometry.
// First-departure box: tilt <7 deg, flange centre Z in [3,4.8].
// Its full flange remains inside the housing's Z range. At radius 7,
// vertical flange sections stay inside its inscribed polygon, outside both
// retaining openings, and require 14*tan(beta)+3/cos(beta) <= .4+g+3.
// Thus beta <3.26 deg; centre Z is [3.5,3.9+g], XY radius <.424.
latch_play_tilt_deg = 3.26;
latch_play_xy_mm = 0.424;
latch_play_z_mm = 0.4;
latch_flange_inscribed_radius_mm = latch_flange_radius_mm*cos(180/128);
latch_play_initial_xy_mm = 8.4-latch_flange_inscribed_radius_mm*cos(7);
latch_play_section_radius_mm = 7;
latch_play_section_span_mm = 14*tan(latch_play_tilt_deg)+3/cos(latch_play_tilt_deg);
function latch_play_xy_error_mm(r_mm,z_mm) = latch_play_xy_mm+abs(z_mm-3.9)*sin(latch_play_tilt_deg)+r_mm*(1-cos(latch_play_tilt_deg));
function latch_play_z_error_mm(r_mm,z_mm) = latch_play_z_mm+r_mm*sin(latch_play_tilt_deg)+abs(z_mm-3.9)*(1-cos(latch_play_tilt_deg));
latch_blocker_radius_mm = sqrt(pow(latch_blocker_length_mm,2)+pow(latch_blocker_half_width_mm,2));
latch_blocker_min_play_z_mm = latch_blocker_bottom_mm-latch_play_z_error_mm(latch_blocker_radius_mm,latch_blocker_bottom_mm);
// Stop envelope includes translation/tilt, rather than ideal +/-45 contacts.
latch_stop_min_angle_deg = 38;
latch_stop_max_angle_deg = 50;
latch_witness_radius_mm = sqrt(pow(1.3,2)+pow(18.8,2));
latch_witness_xy_error_mm = latch_play_xy_error_mm(latch_witness_radius_mm,latch_blocker_top_mm);
function latch_witness_x_mm(a_deg) = latch_pivot_x_mm-1.3*cos(a_deg)+18.8*sin(a_deg);
function latch_witness_y_mm(a_deg) = latch_pivot_y_mm-1.3*sin(a_deg)-18.8*cos(a_deg);
// Receiver shelf bounds at 3 deg outward swing; root remains below witness.
receiver_catch_angle_deg = 3;
receiver_catch_y_max_mm = hinge_y_mm+(receiver_top_y_mm-hinge_y_mm)*cos(receiver_catch_angle_deg)-(receiver_top_z_mm-hinge_z_mm)*sin(receiver_catch_angle_deg);
receiver_catch_y_min_mm = hinge_y_mm+(receiver_root_y_mm-hinge_y_mm)*cos(receiver_catch_angle_deg)-(receiver_top_z_mm-hinge_z_mm)*sin(receiver_catch_angle_deg);
receiver_catch_z_min_mm = hinge_z_mm+(receiver_top_y_mm-hinge_y_mm)*sin(receiver_catch_angle_deg)+(lip_z_mm+1.6-hinge_z_mm)*cos(receiver_catch_angle_deg);
receiver_catch_z_max_mm = hinge_z_mm+(receiver_root_y_mm-hinge_y_mm)*sin(receiver_catch_angle_deg)+(receiver_top_z_mm-hinge_z_mm)*cos(receiver_catch_angle_deg);
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
    assert(rectangle_distance_mm(sx*screw_spacing_x_mm/2,sy*screw_spacing_y_mm/2,latch_pivot_x_mm-latch_fixed_stop_outer_radius_mm,latch_pivot_x_mm+latch_fixed_stop_outer_radius_mm,latch_anchor_y_min_mm,latch_pivot_y_mm+latch_fixed_stop_outer_radius_mm)>expanded_head_radius_mm, "Screw head/tool intersects latch housing/stops");
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
assert(latch_angle_deg>=-45 && latch_angle_deg<=45, "Latch range -45 released to +45 locked");
assert(render_mode=="printable_layout" || door_angle_deg==0 || latch_angle_deg==-45, "Release latch to -45 before opening door");
assert(latch_pivot_x_mm==-12 && latch_pivot_y_mm==53 && latch_foot_radius_mm==6 && latch_foot_top_mm==2.8 && latch_flange_radius_mm==8 && latch_flange_bottom_mm==2.4 && latch_flange_top_mm==5.4 && latch_spindle_radius_mm==3 && latch_spindle_bottom_mm==5 && latch_spindle_top_mm==17.5 && latch_housing_radius_mm==10.8 && latch_lower_lip_top_mm==2, "A8 selected pivot, foot, flange and housing allocation is fixed");
assert(latch_blocker_half_width_mm==1.5 && latch_blocker_length_mm==19 && latch_blocker_bottom_mm==10.5 && latch_blocker_top_mm==13.5 && latch_tab_half_width_mm==5 && latch_tab_y_min_mm==6 && latch_tab_y_max_mm==22 && latch_tab_bottom_mm==15 && latch_tab_top_mm==21 && latch_tab_web_end_mm==6.4, "A8 selected blocker and counterweight allocation is fixed");
assert(latch_stop_root_end_mm==7.4 && latch_stop_neck_inner_radius_mm==7 && latch_stop_lug_inner_radius_mm==10 && latch_stop_lug_outer_radius_mm==13 && latch_stop_start_deg==85 && latch_stop_end_deg==95 && latch_stop_bottom_mm==10 && latch_stop_top_mm==13 && latch_fixed_stop_inner_radius_mm==9 && latch_fixed_stop_outer_radius_mm==14, "A8 selected stop allocation is fixed");
assert(PI*latch_foot_radius_mm*latch_foot_radius_mm>=60 && 2*latch_foot_radius_mm>=4, "A8 latch sole below 60 mm2 area or 4 mm short dimension");
assert(latch_foot_top_mm>latch_flange_bottom_mm && latch_spindle_bottom_mm<latch_flange_top_mm && latch_spindle_top_mm>latch_tab_bottom_mm && latch_tab_web_end_mm>latch_tab_y_min_mm, "Latch positive-volume unions lost");
assert(latch_cavity_radius_mm<latch_fixed_stop_inner_radius_mm && sqrt(pow(latch_stop_root_end_mm,2)+pow(latch_blocker_half_width_mm,2))<latch_fixed_stop_inner_radius_mm && latch_stop_neck_inner_radius_mm<latch_stop_root_end_mm && latch_stop_lug_outer_radius_mm>latch_fixed_stop_inner_radius_mm && latch_fixed_stop_inner_radius_mm<latch_housing_radius_mm, "Latch stop neck, housing union or root sweep invalid");
assert(latch_lower_opening_radius_mm<latch_flange_radius_mm && latch_spindle_opening_radius_mm<latch_flange_radius_mm && latch_cavity_radius_mm<latch_housing_radius_mm && latch_axial_freedom_mm>0 && latch_axial_freedom_mm<=0.8+0.000001, "Nominal latch retaining openings or axial freedom invalid");
assert(latch_pivot_y_mm-latch_housing_radius_mm-receiver_sweep_y_mm>=moving_clearance_mm && latch_anchor_y_min_mm>opening_height_mm/2 && latch_anchor_y_min_mm<plate_height_mm/2 && latch_anchor_y_min_mm<latch_pivot_y_mm, "Housing/anchor obstructs receiver sweep, frame passage or loses frame union");
assert(latch_blocker_bottom_mm>latch_roof_top_mm+moving_clearance_mm && latch_locked_under_gap_mm>moving_clearance_mm, "Blocker intersects roof or closed receiver");
assert(receiver_root_y_mm<door_height_mm/2 && receiver_root_y_mm>=core_height_mm/2 && lip_z_mm+1.6<receiver_top_z_mm, "Receiver loses upper lip root");
// Capture proof prerequisites, including the complete clearance interval.
assert(3-(8*sin(7)+1.5*cos(7))>0 && 4.8+8*sin(7)+1.5*cos(7)<7.8, "First-departure flange leaves housing Z range");
assert(7/cos(7)+1.5*tan(7)<latch_flange_inscribed_radius_mm && 7-latch_play_initial_xy_mm>6.4, "Capture witness sections leave flange or enter retaining aperture");
assert(latch_play_section_span_mm>3.4+moving_clearance_mm && 8.4-latch_flange_inscribed_radius_mm*cos(latch_play_tilt_deg)<latch_play_xy_mm, "All-play inclination/translation bound invalid");
// At 38 degrees the entire neck/lug is separated from the nearest stop
// plane by at least 9*sin(7). By 50 degrees a strict interior lug point
// (r12, polar94.9, Z11.5) lies inside fixed sector140..150, forcing contact.
assert(latch_play_xy_error_mm(13,13)<9*sin(7) && sqrt(pow(7.4,2)+pow(1.5,2))+latch_play_xy_error_mm(7.551,13)<9*cos(0.5), "Actual stop can contact before certified 38-degree bound");
assert(latch_play_xy_error_mm(12,11.5)<12*sin(4.9) && latch_play_xy_error_mm(12,11.5)<min(12-9,14*cos(0.5)-12) && 11.5+latch_play_z_error_mm(12,11.5)<13 && 11.5-latch_play_z_error_mm(12,11.5)>0, "Stop does not force contact by certified 50-degree bound");
assert(latch_pivot_y_mm-8-latch_play_xy_error_mm(8,5.4)>receiver_sweep_y_mm && latch_pivot_y_mm+6*cos(50)-5*sin(50)-latch_play_xy_error_mm(sqrt(509),21)>receiver_sweep_y_mm, "Released rotor flange or counterweight enters receiver sweep");
// Low-Z flange/foot are rear-plane exceptions off wall; installed wall clips
// negative Z play. No absent-wall or friction assumption enters capture.
assert(latch_blocker_min_play_z_mm>latch_roof_top_mm+moving_clearance_mm && latch_blocker_min_play_z_mm>receiver_top_z_mm, "All-play blocker hits roof or closed receiver");
assert(latch_stop_bottom_mm-latch_play_z_error_mm(13,latch_stop_bottom_mm)>latch_roof_top_mm, "All-play stop neck hits housing roof");
assert(latch_tab_bottom_mm-latch_play_z_error_mm(sqrt(509),latch_tab_bottom_mm)>latch_roof_top_mm, "All-play counterweight hits housing roof");
assert(latch_witness_xy_error_mm<1.01 && latch_witness_x_mm(latch_stop_min_angle_deg)-1.01>-5 && latch_witness_x_mm(latch_stop_max_angle_deg)+1.01<5 && latch_witness_y_mm(latch_stop_min_angle_deg)-1.01>receiver_catch_y_min_mm && latch_witness_y_mm(latch_stop_max_angle_deg)+1.01<receiver_catch_y_max_mm, "All-play locked witness leaves receiver before catch");
assert(latch_blocker_bottom_mm+latch_play_z_error_mm(latch_witness_radius_mm,latch_blocker_bottom_mm)<receiver_catch_z_max_mm && latch_blocker_top_mm-latch_play_z_error_mm(latch_witness_radius_mm,latch_blocker_top_mm)>receiver_catch_z_min_mm, "Receiver does not catch all-play blocker by 3 degrees");
assert(latch_pivot_x_mm+latch_blocker_half_width_mm*cos(latch_stop_min_angle_deg)+latch_play_xy_error_mm(latch_blocker_radius_mm,latch_blocker_top_mm)<-5, "Released blocker enters receiver sweep X range");
echo(latch_all_play_bounds=[latch_play_tilt_deg,latch_play_xy_mm,latch_play_z_mm],latch_stop_angle_bounds=[latch_stop_min_angle_deg,latch_stop_max_angle_deg],latch_blocker_min_play_z_mm=latch_blocker_min_play_z_mm);
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
    fixed_latch_housing();
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
module fixed_latch_housing() {
    translate([latch_pivot_x_mm,latch_pivot_y_mm,0]) {
        difference() {
            union() {
                cylinder(r=latch_housing_radius_mm,h=latch_roof_top_mm,$fn=128);
                translate([-latch_housing_radius_mm,latch_anchor_y_min_mm-latch_pivot_y_mm,0])
                    cube([2*latch_housing_radius_mm,latch_pivot_y_mm-latch_anchor_y_min_mm,frame_thickness_mm]);
            }
            // Cut the anchor too: no material enters either captive opening.
            translate([0,0,-0.1]) cylinder(r=latch_lower_opening_radius_mm,h=latch_lower_lip_top_mm+0.11,$fn=128);
            translate([0,0,latch_lower_lip_top_mm]) cylinder(r=latch_cavity_radius_mm,h=latch_roof_bottom_mm-latch_lower_lip_top_mm,$fn=128);
            translate([0,0,latch_roof_bottom_mm-0.01]) cylinder(r=latch_spindle_opening_radius_mm,h=latch_roof_top_mm-latch_roof_bottom_mm+0.11,$fn=128);
        }
        for(bounds=[[30,40],[140,150]])
            linear_extrude(height=latch_stop_top_mm)
                annular_sector(latch_fixed_stop_inner_radius_mm,latch_fixed_stop_outer_radius_mm,bounds[0],bounds[1]);
    }
}
module door_receiver() {
    translate([-5,receiver_root_y_mm,lip_z_mm]) cube([10,35.5-receiver_root_y_mm,receiver_top_z_mm-lip_z_mm]);
    translate([-5,receiver_root_y_mm,lip_z_mm+1.6]) cube([10,receiver_top_y_mm-receiver_root_y_mm,3]);
}
module quarter_turn_latch() {
    // Rear-plane exception: foot and adjoining low-Z flange material.
    // Nominal rotation preserves Z; off-wall play must be certified separately.
    cylinder(r=latch_foot_radius_mm,h=latch_foot_top_mm,$fn=128);
    translate([0,0,latch_flange_bottom_mm]) cylinder(r=latch_flange_radius_mm,h=latch_flange_top_mm-latch_flange_bottom_mm,$fn=128);
    translate([0,0,latch_spindle_bottom_mm]) cylinder(r=latch_spindle_radius_mm,h=latch_spindle_top_mm-latch_spindle_bottom_mm,$fn=128);
    translate([-latch_blocker_half_width_mm,-latch_blocker_length_mm,latch_blocker_bottom_mm])
        cube([2*latch_blocker_half_width_mm,latch_blocker_length_mm,latch_blocker_top_mm-latch_blocker_bottom_mm]);
    translate([-latch_tab_half_width_mm,latch_tab_y_min_mm,latch_tab_bottom_mm])
        cube([2*latch_tab_half_width_mm,latch_tab_y_max_mm-latch_tab_y_min_mm,latch_tab_top_mm-latch_tab_bottom_mm]);
    translate([-latch_blocker_half_width_mm,0,latch_tab_bottom_mm])
        cube([2*latch_blocker_half_width_mm,latch_tab_web_end_mm,latch_tab_top_mm-latch_tab_bottom_mm]);
    translate([-latch_blocker_half_width_mm,0,latch_stop_bottom_mm])
        cube([2*latch_blocker_half_width_mm,latch_stop_root_end_mm,latch_stop_top_mm-latch_stop_bottom_mm]);
    translate([0,0,latch_stop_bottom_mm]) linear_extrude(height=latch_stop_top_mm-latch_stop_bottom_mm)
        annular_sector(latch_stop_neck_inner_radius_mm,latch_stop_lug_outer_radius_mm,latch_stop_start_deg,latch_stop_end_deg);
}
module latch_at_angle(angle_deg) {
    translate([latch_pivot_x_mm,latch_pivot_y_mm,0]) rotate([0,0,angle_deg]) quarter_turn_latch();
}
module vent_assembly(angle_deg,latch_pose_deg) {
    color("silver") fixed_frame();
    color("steelblue") door_at_angle(angle_deg);
    color("darkorange") latch_at_angle(latch_pose_deg);
}
echo(first_layer_soles_mm=[hinge_segment_length_mm,hinge_foot_forward_mm,2*latch_foot_radius_mm],sole_areas_mm2=[hinge_segment_length_mm*hinge_foot_forward_mm,PI*latch_foot_radius_mm*latch_foot_radius_mm]);
echo(latch_nominal_axial_freedom_mm=latch_axial_freedom_mm,latch_nominal_locked_gap_mm=latch_locked_under_gap_mm,receiver_sweep_y_mm=receiver_sweep_y_mm);
echo(hood_roof_angle_deg=atan(louver_roof_slope),hood_vertical_section_mm=louver_roof_thickness_mm,
     hood_channels_mm=[louver_outer_channel_mm,louver_middle_channel_mm,louver_outer_channel_mm],
     hood_slot_plan_area_mm2=louver_slot_plan_area_mm2);
// Ignore inspection poses for the closed, central-angle printable layout.
vent_assembly(render_mode=="printable_layout" ? 0 : door_angle_deg,
              render_mode=="printable_layout" ? 0 : latch_angle_deg);
