// Shed vent: provisional photo estimates. Units mm; installed up is +Y,
// outside is +Z, rear mounting plane and print bed are Z=0.
// Adjustable Parameters
render_mode = "printable_layout";
door_angle_deg = 0;
// Assembly inspection: positive slide withdraws the rigid bolt toward -X.
latch_slide_mm = 0;
latch_lift_mm = 0;
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
// Airflow layout.
louver_projection_mm = 5;
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
// Full roof/slot footprint, including the inclined roof's upper connector.
louver_outer_x_mm = (louver_columns-1)*slot_x_pitch_mm/2+slot_width_mm/2+1;
louver_outer_y_mm = (louver_rows-1)*row_pitch_mm/2+slot_height_mm/2+1;
// A6 rigid latch allocations, with the A7 enlarged first-layer foot. Fixed centres are measured in the mounting plane.
latch_stroke_mm = 16;
latch_travel_lift_mm = 3;
latch_seated_y_mm = 53;
flange_width_mm = 16;
flange_depth_mm = 16;
flange_thickness_mm = 3;
bolt_stem_width_mm = 3;
guide_wall_mm = 2.4;
guide_rail_top_mm = 2;
// A7 selected sole: preserve its offset and positive flange overlap.
foot_width_mm = 15;
foot_depth_mm = 4;
foot_y_min_mm = -2.5;
foot_y_max_mm = foot_y_min_mm+foot_depth_mm;
foot_top_mm = 2.8;
flange_bottom_mm = guide_rail_top_mm+moving_clearance_mm;
flange_top_mm = flange_bottom_mm+flange_thickness_mm;
guide_roof_bottom_mm = flange_top_mm+moving_clearance_mm;
guide_roof_top_mm = guide_roof_bottom_mm+guide_wall_mm;
stem_slot_width_mm = bolt_stem_width_mm+2*moving_clearance_mm;
guide_x_min_mm = -latch_stroke_mm-flange_width_mm/2-moving_clearance_mm;
guide_x_max_mm = flange_width_mm/2+moving_clearance_mm;
guide_y_min_mm = latch_seated_y_mm-flange_depth_mm/2-moving_clearance_mm;
guide_y_max_mm = latch_seated_y_mm+latch_travel_lift_mm+flange_depth_mm/2+moving_clearance_mm;
rear_slot_y_min_mm = latch_seated_y_mm+foot_y_min_mm-moving_clearance_mm;
rear_slot_y_max_mm = latch_seated_y_mm+latch_travel_lift_mm+foot_y_max_mm+moving_clearance_mm;
rear_slot_width_mm = rear_slot_y_max_mm-rear_slot_y_min_mm;
receiver_root_y_mm = 33;
receiver_top_y_mm = 41.6;
receiver_top_z_mm = lip_z_mm+4.6;
tongue_bottom_mm = receiver_top_z_mm+moving_clearance_mm;
bolt_top_mm = tongue_bottom_mm+3;
receiver_sweep_y_mm = hinge_y_mm+sqrt(pow(receiver_top_y_mm-hinge_y_mm,2)+pow(max(abs(lip_z_mm+1.6-hinge_z_mm),abs(receiver_top_z_mm-hinge_z_mm)),2));
lip_sweep_y_mm = hinge_y_mm+sqrt(pow(door_height_mm/2-hinge_y_mm,2)+pow(max(abs(lip_z_mm-hinge_z_mm),abs(lip_z_mm+door_thickness_mm-hinge_z_mm)),2));
// Selected A6 proof constants: four opposed sections close the FIRST-departure
// envelope independently of pad sidedness or continued stem engagement.
tongue_width_mm = 6;
tongue_front_local_y_mm = -15.5;
tongue_length_mm = 17;
tongue_thickness_mm = 3;
proof_inclination_deg = 7;
proof_section_x_mm = 3.5;
proof_section_y_mm = 6.5;
proof_roof_plane_mm = 7;
proof_slope_x_max = 0.8/7;
proof_slope_y_max = 0.8/13;
proof_yaw_a_max = 0.279259;
proof_yaw_b_min = 0.958241;
proof_rxy_max = 0.298770;
proof_rxx_min = 0.947;
proof_rzx_max = 0.13148;
proof_rzy_max = 0.09569;
flange_centre_z_mm = flange_bottom_mm+flange_thickness_mm/2;
proof_enclosing_z_min_mm = 3;
proof_enclosing_z_max_mm = 4.4+2*moving_clearance_mm;
proof_centre_z_min_mm = guide_rail_top_mm+flange_thickness_mm/2;
proof_centre_z_max_mm = guide_roof_bottom_mm-flange_thickness_mm/2;
proof_vertical_half_extent_mm = flange_thickness_mm/2*cos(proof_inclination_deg)+sqrt(pow(flange_width_mm/2,2)+pow(flange_depth_mm/2,2))*sin(proof_inclination_deg);
proof_section_radius_mm = sqrt(pow(proof_section_x_mm,2)+pow(proof_section_y_mm,2))/cos(proof_inclination_deg)+flange_thickness_mm/2*tan(proof_inclination_deg);
proof_disc_projection_mm = min(flange_width_mm,flange_depth_mm)/2*cos(proof_inclination_deg);
proof_centre_y_min_mm = guide_y_min_mm+proof_disc_projection_mm;
proof_centre_y_max_mm = guide_y_max_mm-proof_disc_projection_mm;
proof_confinement_mm = 2*proof_section_x_mm*tan(proof_inclination_deg)+flange_thickness_mm/cos(proof_inclination_deg);
proof_aperture_y_max_mm = latch_seated_y_mm+latch_travel_lift_mm+stem_slot_width_mm/2;
// Confinement gives |tX|<=2g/7; finite roof section gives endpoint
// axis play g, plus centre-to-plane lever (7-3.5)*2g/7.
proof_endpoint_play_mm = moving_clearance_mm+(proof_roof_plane_mm-proof_centre_z_min_mm)*2*moving_clearance_mm/(2*proof_section_x_mm);
proof_tongue_bottom_lever_mm = tongue_bottom_mm-flange_centre_z_mm;
proof_tongue_top_lever_mm = bolt_top_mm-flange_centre_z_mm;
proof_tongue_y_min_mm = guide_y_min_mm+flange_depth_mm/2+tongue_front_local_y_mm-(proof_tongue_top_lever_mm-flange_thickness_mm/2)*proof_slope_y_max;
proof_retracted_x_max_mm = -latch_stroke_mm+proof_endpoint_play_mm-tongue_front_local_y_mm*proof_rxy_max+tongue_width_mm/2+proof_tongue_top_lever_mm*proof_slope_x_max;
// Coupled sidewall bound is convex in a=abs(Ryx), so check both endpoints.
function proof_leading_y_max_mm(a) = guide_y_max_mm-(flange_width_mm/2-tongue_width_mm/2)*a+(tongue_front_local_y_mm-flange_depth_mm/2)*sqrt(1-pow(proof_slope_y_max,2)-a*a)+(proof_tongue_bottom_lever_mm-flange_thickness_mm/2)*proof_slope_y_max;
proof_engaged_y_max_mm = max(proof_leading_y_max_mm(0),proof_leading_y_max_mm(proof_yaw_a_max));
proof_leading_mid_x_max_mm = proof_endpoint_play_mm-tongue_front_local_y_mm*proof_rxy_max+proof_tongue_bottom_lever_mm*proof_slope_x_max;
proof_leading_half_x_min_mm = tongue_width_mm/2*proof_rxx_min;
proof_tongue_bottom_z_max_mm = proof_centre_z_max_mm-tongue_front_local_y_mm*proof_rzy_max+tongue_width_mm/2*proof_rzx_max+proof_tongue_bottom_lever_mm;
proof_tongue_top_z_min_mm = proof_centre_z_min_mm+tongue_front_local_y_mm*proof_rzy_max-tongue_width_mm/2*proof_rzx_max+proof_tongue_top_lever_mm*cos(proof_inclination_deg);
function receiver_rotated_y_mm(y,z) = hinge_y_mm+(y-hinge_y_mm)*cos(2)-(z-hinge_z_mm)*sin(2);
function receiver_rotated_z_mm(y,z) = hinge_z_mm+(y-hinge_y_mm)*sin(2)+(z-hinge_z_mm)*cos(2);
proof_foot_lever_mm = max(flange_centre_z_mm,abs(foot_top_mm-flange_centre_z_mm));
proof_pad_top_lever_mm = bolt_top_mm+3-flange_centre_z_mm;
// Coupled chamber-sidewall bound also supplies the nonnegative term
// (flange_width_mm-foot_width_mm)/2*abs(Ryx). Discard it conservatively;
// the A7 foot-containment guard below keeps it nonnegative for the wider sole.
proof_foot_y_min_mm = guide_y_min_mm+(flange_depth_mm/2+foot_y_min_mm)*proof_yaw_b_min-(proof_foot_lever_mm-flange_thickness_mm/2)*proof_slope_y_max;
proof_stem_y_min_mm = guide_y_min_mm+(flange_depth_mm/2-bolt_stem_width_mm/2)*proof_yaw_b_min-(proof_tongue_top_lever_mm-flange_thickness_mm/2)*proof_slope_y_max;
proof_pad_y_min_mm = guide_y_min_mm+(flange_depth_mm/2-3)*proof_yaw_b_min-(proof_pad_top_lever_mm-flange_thickness_mm/2)*proof_slope_y_max;
proof_stem_bottom_z_max_mm = proof_centre_z_max_mm+flange_thickness_mm/2+bolt_stem_width_mm/2*(proof_rzx_max+proof_rzy_max);
proof_stem_top_z_min_mm = proof_centre_z_min_mm+proof_tongue_top_lever_mm*cos(proof_inclination_deg)-bolt_stem_width_mm/2*(proof_rzx_max+proof_rzy_max);
proof_receiver_front_y_min_mm = receiver_rotated_y_mm(receiver_top_y_mm,receiver_top_z_mm);
proof_receiver_root_y_max_mm = receiver_rotated_y_mm(receiver_root_y_mm,lip_z_mm+1.6);
proof_receiver_bottom_z_max_mm = receiver_rotated_z_mm(receiver_top_y_mm,lip_z_mm+1.6);
proof_receiver_top_z_min_mm = receiver_rotated_z_mm(receiver_root_y_mm,receiver_top_z_mm);
// Conservative XY keepouts use the real aperture corner, bearing and rigid guide.
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
assert(moving_clearance_mm<=0.4, "A6 capture supports moving clearance only up to 0.4 mm");
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
    assert(rectangle_distance_mm(sx*screw_spacing_x_mm/2,sy*screw_spacing_y_mm/2,guide_x_min_mm-guide_wall_mm,guide_x_max_mm+guide_wall_mm,39.5,guide_y_max_mm+guide_wall_mm)>expanded_head_radius_mm, "Screw head/tool intersects rigid guide");
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
assert(louver_roof_thickness_mm>0 && louver_roof_thickness_mm<louver_projection_mm, "Collapsed louver mouth");
assert(latch_stroke_mm>0 && latch_travel_lift_mm>0 && flange_width_mm>0 && flange_depth_mm>0 && flange_thickness_mm>0 && bolt_stem_width_mm>0 && guide_wall_mm>0 && guide_rail_top_mm>0, "Positive rigid latch dimensions required");
assert(stem_slot_width_mm>=bolt_stem_width_mm+2*moving_clearance_mm && guide_roof_top_mm>guide_roof_bottom_mm && rear_slot_y_min_mm>guide_y_min_mm && rear_slot_y_max_mm<guide_y_max_mm, "Collapsed latch corridors or retaining rails");
assert(latch_slide_mm>=0 && latch_slide_mm<=latch_stroke_mm && latch_lift_mm>=0 && latch_lift_mm<=latch_travel_lift_mm, "Latch pose outside lift/slide range");
assert(render_mode=="printable_layout" || latch_slide_mm==0 || latch_slide_mm==latch_stroke_mm || latch_lift_mm==latch_travel_lift_mm, "Lift fully before lateral travel");
assert(render_mode=="printable_layout" || door_angle_deg==0 || (latch_slide_mm==latch_stroke_mm && latch_lift_mm==0), "Retract and seat bolt before opening door");
assert(flange_depth_mm-stem_slot_width_mm>0 && flange_width_mm-stem_slot_width_mm>0 && flange_depth_mm-rear_slot_width_mm>=2*moving_clearance_mm, "Lost roof or bottom flange capture");
// Exact source floors apply to each of the six hinge soles and the bolt sole.
assert(hinge_segment_length_mm*hinge_foot_forward_mm>=60 && min(hinge_segment_length_mm,hinge_foot_forward_mm)>=4, "A7 hinge sole below 60 mm2 area or 4 mm short dimension");
assert(foot_width_mm*foot_depth_mm>=60 && min(foot_width_mm,foot_depth_mm)>=4, "A7 bolt sole below 60 mm2 area or 4 mm short dimension");
assert(hinge_foot_forward_mm==8, "A7 selected hinge sole depth is fixed");
assert(foot_width_mm<flange_width_mm && foot_y_min_mm>-flange_depth_mm/2 && foot_y_max_mm<flange_depth_mm/2 && foot_top_mm>flange_bottom_mm && foot_top_mm<=flange_top_mm, "A7 foot escapes flange footprint or loses positive union");
assert(latch_stroke_mm==16 && latch_travel_lift_mm==3 && latch_seated_y_mm==53 && flange_width_mm==16 && flange_depth_mm==16 && flange_thickness_mm==3 && bolt_stem_width_mm==3 && guide_wall_mm==2.4 && guide_rail_top_mm==2 && foot_width_mm==15 && foot_depth_mm==4 && foot_y_min_mm==-2.5 && foot_top_mm==2.8 && tongue_width_mm==6 && tongue_front_local_y_mm==-15.5 && tongue_length_mm==17 && tongue_thickness_mm==3, "A6/A7 selected mechanism allocation is fixed");
assert(proof_enclosing_z_min_mm==3 && proof_enclosing_z_max_mm==4.4+2*moving_clearance_mm && proof_inclination_deg==7 && proof_section_x_mm==3.5 && proof_section_y_mm==6.5 && proof_roof_plane_mm==7 && proof_slope_x_max==0.8/7 && proof_slope_y_max==0.8/13 && proof_yaw_a_max==0.279259 && proof_yaw_b_min==0.958241 && proof_rxy_max==0.298770 && proof_rxx_min==0.947 && proof_rzx_max==0.13148 && proof_rzy_max==0.09569, "A6 proof constants are fixed");
assert(proof_section_radius_mm<min(flange_width_mm,flange_depth_mm)/2 && proof_enclosing_z_min_mm>proof_vertical_half_extent_mm && proof_enclosing_z_max_mm+proof_vertical_half_extent_mm<guide_roof_top_mm, "A6 section radius or sidewall-height margin lost");
assert(proof_centre_y_max_mm-proof_section_y_mm<rear_slot_y_min_mm && proof_centre_y_min_mm+proof_section_y_mm>max(rear_slot_y_max_mm,proof_aperture_y_max_mm) && proof_section_y_mm<proof_disc_projection_mm && proof_section_x_mm<proof_disc_projection_mm, "A6 opposed sections intersect aperture or chamber boundary");
assert(proof_yaw_a_max>=( (guide_y_max_mm-guide_y_min_mm)/flange_depth_mm-sqrt(2*(1-pow(proof_slope_y_max,2))-pow((guide_y_max_mm-guide_y_min_mm)/flange_depth_mm,2)) )/2 && proof_yaw_b_min<=sqrt(1-pow(proof_slope_y_max,2)-pow(proof_yaw_a_max,2)) && proof_rxy_max>=(proof_yaw_a_max+proof_slope_x_max*proof_slope_y_max)/proof_yaw_b_min && proof_endpoint_play_mm<=0.8+0.000001, "A6 yaw or endpoint bound unsupported");
assert(proof_confinement_mm>flange_thickness_mm+2*moving_clearance_mm && proof_centre_z_min_mm>proof_enclosing_z_min_mm && proof_centre_z_max_mm<proof_enclosing_z_max_mm && flange_depth_mm*sqrt(2)*cos(proof_inclination_deg)>guide_y_max_mm-guide_y_min_mm, "A6 first-contact inclination, centre or yaw boundary lost");
assert(proof_rxx_min<=sqrt(1-pow(proof_slope_x_max,2)-pow(proof_rxy_max,2)) && proof_rzx_max>=proof_slope_x_max+proof_slope_y_max*proof_yaw_a_max && proof_rzy_max>=proof_slope_x_max*proof_rxy_max+proof_slope_y_max, "A6 orthogonality bounds unsupported");
assert(proof_stem_bottom_z_max_mm<proof_roof_plane_mm && proof_stem_top_z_min_mm>proof_roof_plane_mm, "A6 finite stem misses certified roof plane");
assert(proof_roof_plane_mm>guide_roof_bottom_mm && proof_roof_plane_mm<guide_roof_top_mm && flange_top_mm<proof_roof_plane_mm && bolt_top_mm>proof_roof_plane_mm && proof_tongue_top_lever_mm<=8.1+0.000001 && proof_tongue_bottom_lever_mm<=5.1+0.000001 && proof_tongue_bottom_lever_mm>0, "A6 finite stem or tongue height lever unsupported");
assert(proof_foot_lever_mm<=3.9+0.000001 && proof_pad_top_lever_mm<=11.1+0.000001 && min(guide_y_min_mm,proof_foot_y_min_mm,proof_stem_y_min_mm,proof_pad_y_min_mm)-receiver_sweep_y_mm>=moving_clearance_mm, "A6 remaining bolt features lack continuous receiver sweep clearance");
assert(proof_tongue_y_min_mm-lip_sweep_y_mm>=moving_clearance_mm && -5-proof_retracted_x_max_mm>=moving_clearance_mm, "A6 all-play tongue lip or receiver clearance lost");
assert(5+proof_leading_half_x_min_mm-proof_leading_mid_x_max_mm>0 && proof_engaged_y_max_mm<proof_receiver_front_y_min_mm && proof_tongue_y_min_mm>proof_receiver_root_y_max_mm && proof_tongue_bottom_z_max_mm<proof_receiver_top_z_min_mm && proof_tongue_top_z_min_mm>proof_receiver_bottom_z_max_mm, "A6 all-play receiver obstruction at 2 degrees lost");
assert(flange_bottom_mm<2.8 && flange_top_mm<guide_roof_bottom_mm && bolt_top_mm>guide_roof_top_mm+moving_clearance_mm, "Disconnected bed foot or lost stem engagement");
assert(tongue_bottom_mm-guide_roof_top_mm>=2*moving_clearance_mm-0.000001 && tongue_bottom_mm-receiver_top_z_mm>=moving_clearance_mm-0.000001, "Tongue intersects guide or receiver");
assert(receiver_root_y_mm<door_height_mm/2 && receiver_root_y_mm>=core_height_mm/2 && lip_z_mm<receiver_top_z_mm && lip_z_mm+1.6<receiver_top_z_mm, "Receiver loses upper lip root");
assert(39.5>opening_height_mm/2 && guide_y_min_mm-guide_wall_mm-receiver_sweep_y_mm>=moving_clearance_mm, "Guide obstructs passage or receiver sweep");
assert(latch_seated_y_mm+tongue_front_local_y_mm-lip_sweep_y_mm>=moving_clearance_mm && receiver_top_y_mm-(latch_seated_y_mm+tongue_front_local_y_mm+latch_travel_lift_mm)>0, "Lost nominal lip clearance or lifted tongue engagement");
assert(latch_stroke_mm-3-5>=moving_clearance_mm && 2*hinge_z_mm-receiver_top_z_mm>=moving_clearance_mm, "Lost retracted receiver clearance or fully-open rear gap");

echo(opening_mm=[opening_width_mm,opening_height_mm],core_height_mm=core_height_mm,core_top_sweep_mm=core_top_sweep_mm,hinge_axis_mm=[hinge_y_mm,hinge_z_mm]);
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
    fixed_latch_guide();
}
module vent_slots() {
    for (row=[0:louver_rows-1],column=[0:louver_columns-1]) {
        x_mm=(column-(louver_columns-1)/2)*slot_x_pitch_mm;
        y_mm=(row-(louver_rows-1)/2)*row_pitch_mm;
        translate([x_mm,y_mm,-0.1]) linear_extrude(height=lip_z_mm+door_thickness_mm+0.2) rounded_rectangle(slot_width_mm,slot_height_mm,0.5);
    }
}
module door_louvers() {
    for (row=[0:louver_rows-1],column=[0:louver_columns-1]) {
        x_mm=(column-(louver_columns-1)/2)*slot_x_pitch_mm;
        y_mm=(row-(louver_rows-1)/2)*row_pitch_mm;
        // Top-connected inclined roof; bottom mouth remains open to downward Y.
        translate([x_mm-slot_width_mm/2-1,y_mm,door_thickness_mm]) rotate([90,0,90]) linear_extrude(height=slot_width_mm+2)
            polygon([[slot_height_mm/2+1,-0.2],[slot_height_mm/2+1,louver_roof_thickness_mm],[-slot_height_mm/2,louver_projection_mm],[-slot_height_mm/2,louver_projection_mm-louver_roof_thickness_mm]]);
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
module latch_stem_slot() {
    // Two enclosed gravity pockets and a lifted connecting corridor.
    for(x_mm=[-latch_stroke_mm,0])
        translate([x_mm-stem_slot_width_mm/2,latch_seated_y_mm-stem_slot_width_mm/2])
            square([stem_slot_width_mm,latch_travel_lift_mm+stem_slot_width_mm]);
    translate([-latch_stroke_mm-stem_slot_width_mm/2,latch_seated_y_mm+latch_travel_lift_mm-stem_slot_width_mm/2])
        square([latch_stroke_mm+stem_slot_width_mm,stem_slot_width_mm]);
}
module fixed_latch_guide() {
    // Sidewalls close both ends. Cavity remains open at rear between retaining rails.
    difference() {
        translate([guide_x_min_mm-guide_wall_mm,guide_y_min_mm-guide_wall_mm,0])
            cube([guide_x_max_mm-guide_x_min_mm+2*guide_wall_mm,guide_y_max_mm-guide_y_min_mm+2*guide_wall_mm,guide_roof_top_mm]);
        translate([guide_x_min_mm,guide_y_min_mm,-0.1])
            cube([guide_x_max_mm-guide_x_min_mm,guide_y_max_mm-guide_y_min_mm,guide_roof_bottom_mm+0.1]);
        translate([0,0,guide_roof_bottom_mm-0.01]) linear_extrude(height=guide_wall_mm+0.02) latch_stem_slot();
    }
    for(ends=[[guide_y_min_mm,rear_slot_y_min_mm],[rear_slot_y_max_mm,guide_y_max_mm]])
        translate([guide_x_min_mm,ends[0],0]) cube([guide_x_max_mm-guide_x_min_mm,ends[1]-ends[0],guide_rail_top_mm]);
    // Frame anchor ends at chamber boundary, never filling the moving rear slot.
    translate([guide_x_min_mm-guide_wall_mm,39.5,0])
        cube([guide_x_max_mm-guide_x_min_mm+2*guide_wall_mm,guide_y_min_mm-39.5,frame_thickness_mm]);
}
module door_receiver() {
    translate([-5,receiver_root_y_mm,lip_z_mm]) cube([10,35.5-receiver_root_y_mm,receiver_top_z_mm-lip_z_mm]);
    translate([-5,receiver_root_y_mm,lip_z_mm+1.6]) cube([10,receiver_top_y_mm-receiver_root_y_mm,3]);
}
module rigid_latch_bolt() {
    // A5 rear-plane exception: this offset foot and adjoining low-Z flange material.
    translate([-foot_width_mm/2,foot_y_min_mm,0]) cube([foot_width_mm,foot_depth_mm,foot_top_mm]);
    translate([-flange_width_mm/2,-flange_depth_mm/2,flange_bottom_mm]) cube([flange_width_mm,flange_depth_mm,flange_thickness_mm]);
    translate([-bolt_stem_width_mm/2,-bolt_stem_width_mm/2,flange_top_mm]) cube([bolt_stem_width_mm,bolt_stem_width_mm,bolt_top_mm-flange_top_mm]);
    translate([-tongue_width_mm/2,tongue_front_local_y_mm,tongue_bottom_mm]) cube([tongue_width_mm,tongue_length_mm,tongue_thickness_mm]);
    translate([-4,-3,bolt_top_mm]) cube([8,6,3]);
    // Exterior tongue support: X=-19..-13,Y37.5..41.8 in print pose.
    // Bridge Y41.8..51.5 at Z9; no support in captive gaps or flange cavity.
}
module bolt_at_pose(slide_mm,lift_mm) {
    translate([-slide_mm,latch_seated_y_mm+lift_mm,0]) rigid_latch_bolt();
}
module vent_assembly(angle_deg,slide_mm,lift_mm) {
    color("silver") fixed_frame();
    color("steelblue") door_at_angle(angle_deg);
    color("darkorange") bolt_at_pose(slide_mm,lift_mm);
}
echo(proof_operating_bounds_mm=[proof_engaged_y_max_mm,proof_leading_mid_x_max_mm,proof_tongue_bottom_z_max_mm,proof_tongue_top_z_min_mm],proof_remaining_y_min_mm=[proof_foot_y_min_mm,proof_stem_y_min_mm,proof_pad_y_min_mm]);
echo(first_layer_soles_mm=[hinge_segment_length_mm,hinge_foot_forward_mm,foot_width_mm,foot_depth_mm],sole_areas_mm2=[hinge_segment_length_mm*hinge_foot_forward_mm,foot_width_mm*foot_depth_mm],rear_slot_y_mm=[rear_slot_y_min_mm,rear_slot_y_max_mm]);
echo(latch_capture_mm=[(flange_depth_mm-stem_slot_width_mm)/2,flange_depth_mm-rear_slot_width_mm],proof_section_radius_mm=proof_section_radius_mm,proof_confinement_mm=proof_confinement_mm,proof_tongue_y_min_mm=proof_tongue_y_min_mm,proof_retracted_x_max_mm=proof_retracted_x_max_mm,receiver_sweep_y_mm=receiver_sweep_y_mm,lip_sweep_y_mm=lip_sweep_y_mm);
// Ignore all inspection pose overrides for the printable closed/retracted pose.
vent_assembly(render_mode=="printable_layout" ? 0 : door_angle_deg,
              render_mode=="printable_layout" ? latch_stroke_mm : latch_slide_mm,
              render_mode=="printable_layout" ? 0 : latch_lift_mm);
