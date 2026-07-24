// Linksys LGS105 cable-management enclosure
// OpenSCAD 2021.01 compatible; all dimensions are millimetres.
//
// Coordinate convention:
// - X is switch width, increasing from left to right.
// - Y is enclosure depth, increasing from the Ethernet-side wall toward the
//   power-side wall.
// - Z is height, increasing upward from the print plane.
// - The enclosure origin is its Ethernet-side, left, bottom exterior corner.

// ======================================================
// Adjustable Parameters
// ======================================================

// Render controls and reference visibility
$fn = 48;
render_mode = "printable_layout"; // [assembly/bottom_tray/top_cover/vertical_support_foot/cable_routing_preview/printable_layout]
assembly_orientation = "horizontal"; // [horizontal/vertical]
vertical_standing_side = "left"; // [left/right]
show_switch_reference = true;
show_cable_references = true;
show_minimum_bend_reference = true;

// Switch body dimensions and fit clearances
switch_width_mm = 121.0;
switch_depth_mm = 89.0;
switch_height_mm = 26.0;
switch_corner_radius_mm = 3.0;
switch_side_clearance_mm = 0.6;
switch_end_clearance_mm = 0.6;
switch_top_clearance_mm = 0.8;

// Tray, wall, floor, cover, and corner dimensions
wall_thickness_mm = 2.4;
tray_floor_thickness_mm = 2.4;
tray_wall_height_mm = 34.0;
cover_thickness_mm = 2.4;
cover_skirt_depth_mm = 4.0;
outer_corner_radius_mm = 5.0;
inner_corner_radius_mm = 2.6;
cover_edge_overhang_mm = 0.0;

// Switch retention rails, stops, and vertical pads
switch_rail_width_mm = 2.4;
switch_rail_height_mm = 3.0;
switch_rail_end_clearance_mm = 12.0;
switch_stop_width_mm = 12.0;
switch_stop_depth_mm = 2.4;
switch_stop_height_mm = 5.0;
switch_vertical_pad_width_mm = 12.0;
switch_vertical_pad_depth_mm = 8.0;
switch_vertical_pad_height_mm = 1.8;
switch_vertical_pad_clearance_mm = 0.4;

// Cable count, dimensions, storage allowance, and bend control
ethernet_cable_count = 5;
uplink_cable_count = 1;
device_cable_count = 4;
ethernet_cable_lengths_mm = [250, 250, 250, 250, 500];
ethernet_total_storage_allowance_mm = 1500;
uplink_cable_diameter_mm = 5.90;
uplink_cable_fit_clearance_mm = 0.5;
device_cable_width_mm = 6.0;
device_cable_thickness_mm = 1.4;
minimum_cable_bend_radius_mm = 15.0;
cable_contact_rounding_mm = 0.5;

// Cable-storage compartment and routing-guide geometry
cable_storage_depth_mm = 68.0;
cable_storage_switch_gap_mm = 4.0;
routing_guide_shoulder_diameter_mm = 28.0;
routing_guide_waist_diameter_mm = 26.0;
routing_guide_height_mm = 33.9;
routing_guide_floor_clearance_mm = 0.0;
routing_guide_edge_clearance_mm = 5.0;
routing_guide_shoulder_height_mm = 1.5;
routing_guide_transition_height_mm = 2.0;
routing_guide_profile_steps = 8;
uplink_device_divider_thickness_mm = 2.0;
uplink_device_divider_length_mm = 20.0;
uplink_device_divider_height_mm = 12.0;

// Ethernet lay-in apertures and measured power-head pass-through
uplink_aperture_width_mm = 7.0;
uplink_aperture_height_mm = 8.0;
uplink_aperture_x_mm = 45.0;
device_aperture_width_mm = 8.0;
device_aperture_height_mm = 7.0;
device_aperture_x_mm = 75.0;
power_head_reference_diameter_mm = 9.0;
power_head_rigid_length_mm = 28.20;
power_pass_through_diameter_mm = 10.0;
power_input_visual_right_offset_mm = 21.0;
power_pass_through_vertical_offset_mm = 4.0;
aperture_side_clearance_mm = 0.4;
aperture_edge_rounding_mm = 2.0;

// LED sightline
led_sightline_width_mm = 58.0;
led_sightline_height_mm = 5.0;
led_sightline_x_mm = 60.5;
led_sightline_z_mm = 24.0;
led_sightline_clearance_mm = 0.6;

// Bottom ventilation
bottom_vent_width_mm = 4.0;
bottom_vent_length_mm = 24.0;
bottom_vent_count = 3;
bottom_vent_spacing_mm = 7.0;
bottom_vent_x_offset_mm = 0.0;
bottom_vent_y_offset_mm = 0.0;

// Side ventilation
side_vent_width_mm = 4.0;
side_vent_height_mm = 12.0;
side_vent_count = 3;
side_vent_spacing_mm = 6.0;
side_vent_y_offset_mm = 0.0;
side_vent_z_offset_mm = 8.0;

// Top ventilation
top_vent_width_mm = 4.0;
top_vent_length_mm = 48.0;
top_vent_count = 5;
top_vent_spacing_mm = 8.0;
top_vent_x_offset_mm = 0.0;
top_vent_y_offset_mm = 0.0;

// Cover retention and fit
cover_pin_diameter_mm = 4.0;
cover_pin_height_mm = 4.0;
cover_pin_tip_diameter_mm = 3.2;
cover_pin_tip_taper_height_mm = 0.8;
cover_pin_inset_mm = 8.0;
cover_socket_wall_mm = 1.8;
cover_retention_clearance_mm = 0.25;
cover_fit_clearance_mm = 0.30;
cover_receiver_relief_extra_clearance_mm = 0.5;
cover_latch_interference_mm = 0.15;
cover_latch_flexure_length_mm = 12.0;
cover_latch_flexure_thickness_mm = 2.0;
cover_latch_flexure_side_gap_mm = 1.5;
cover_latch_engagement_depth_mm = 0.8;
cover_latch_engagement_height_mm = 1.6;
cover_latch_lead_in_reach_allowance_mm = 3.0;
cover_latch_release_access_width_mm = 16.0;
cover_latch_release_access_height_mm = 6.0;

// Detachable vertical-support feet
vertical_support_foot_count = 2;
vertical_support_base_width_mm = 60.0;
vertical_support_foot_length_mm = 18.0;
vertical_vent_gap_mm = 3.0;
vertical_support_fit_clearance_mm = 0.30;

// Printable layout and preview colours
print_bed_width_mm = 256.0;
print_bed_depth_mm = 256.0;
printable_layout_spacing_mm = 0.5;
printable_layout_bed_margin_mm = 0.5;
tray_preview_colour = "LightSteelBlue";
cover_preview_colour = "Gainsboro";
switch_preview_colour = "DimGray";
uplink_cable_preview_colour = "DodgerBlue";
device_cable_preview_colours = ["OrangeRed", "Gold", "LimeGreen", "MediumPurple"];
power_cable_preview_colour = "Black";
bend_reference_colour = "DeepPink";
reference_transparency = 0.45;

// ======================================================
// Derived Values
// ======================================================

switch_bay_width_mm = switch_width_mm + 2 * switch_side_clearance_mm;
switch_bay_depth_mm = switch_depth_mm + 2 * switch_end_clearance_mm;
geometry_overlap_mm = 0.1;
switch_bay_height_mm = switch_height_mm + switch_top_clearance_mm;
enclosure_inner_width_mm = switch_bay_width_mm;
enclosure_outer_width_mm = enclosure_inner_width_mm + 2 * wall_thickness_mm;

switch_origin_x_mm = wall_thickness_mm + switch_side_clearance_mm;
switch_origin_y_mm = wall_thickness_mm
    + cable_storage_depth_mm
    + cable_storage_switch_gap_mm
    + switch_end_clearance_mm;
switch_origin_z_mm = tray_floor_thickness_mm;
switch_center_x_mm = switch_origin_x_mm + switch_width_mm / 2;
switch_center_y_mm = switch_origin_y_mm + switch_depth_mm / 2;
switch_top_z_mm = switch_origin_z_mm + switch_height_mm;

cover_pin_socket_diameter_mm = cover_pin_diameter_mm + 2 * cover_retention_clearance_mm;
cover_socket_outer_diameter_mm = cover_pin_socket_diameter_mm
    + 2 * cover_socket_wall_mm;
cover_pin_center_inset_mm = max(
    cover_pin_inset_mm,
    wall_thickness_mm
        + cover_fit_clearance_mm
        + wall_thickness_mm
        + cover_socket_outer_diameter_mm / 2
        + cover_fit_clearance_mm
);
// The switch-side pair sits immediately ahead of the switch.  Its complete
// boss remains outside the switch's straight-up removal sweep, with the same
// end clearance used by the switch bay.  The catch release span is derived
// forward from that boss so neither retention feature controls case depth.
rear_cover_socket_center_y_mm = switch_origin_y_mm
    - switch_end_clearance_mm
    - cover_socket_outer_diameter_mm / 2;
rear_cover_socket_near_y_mm = rear_cover_socket_center_y_mm
    - cover_socket_outer_diameter_mm / 2;
rear_cover_socket_far_y_mm = rear_cover_socket_center_y_mm
    + cover_socket_outer_diameter_mm / 2;
cover_latch_release_far_y_mm = rear_cover_socket_near_y_mm
    - wall_thickness_mm;
cover_latch_center_y_mm = cover_latch_release_far_y_mm
    - cover_latch_release_access_width_mm / 2;
cover_latch_release_near_y_mm = cover_latch_center_y_mm
    - cover_latch_release_access_width_mm / 2;
rear_cover_socket_hole_far_y_mm = rear_cover_socket_center_y_mm
    + cover_pin_socket_diameter_mm / 2;
enclosure_outer_depth_mm = switch_origin_y_mm
    + switch_depth_mm
    + switch_end_clearance_mm
    + wall_thickness_mm;
enclosure_inner_depth_mm = enclosure_outer_depth_mm - 2 * wall_thickness_mm;
enclosure_outer_height_mm = tray_floor_thickness_mm
    + tray_wall_height_mm
    + cover_thickness_mm;

ethernet_wall_y_mm = 0;
power_wall_y_mm = enclosure_outer_depth_mm - wall_thickness_mm;
switch_power_face_y_mm = switch_origin_y_mm + switch_depth_mm;
power_side_clearance_mm = power_wall_y_mm - switch_power_face_y_mm;
power_side_rear_extension_mm = enclosure_outer_depth_mm
    - switch_power_face_y_mm;
cable_storage_center_y_mm = wall_thickness_mm + cable_storage_depth_mm / 2;
uplink_aperture_bottom_z_mm = tray_floor_thickness_mm
    + tray_wall_height_mm
    - uplink_aperture_height_mm;
uplink_aperture_radial_clearance_mm =
    (min(uplink_aperture_width_mm, uplink_aperture_height_mm)
        - uplink_cable_diameter_mm) / 2;
device_aperture_bottom_z_mm = tray_floor_thickness_mm
    + tray_wall_height_mm
    - device_aperture_height_mm;
aperture_bottom_z_mm = min(
    uplink_aperture_bottom_z_mm,
    device_aperture_bottom_z_mm
);
power_pass_through_center_x_mm = switch_origin_x_mm
    + power_input_visual_right_offset_mm;
power_pass_through_center_z_mm = switch_origin_z_mm
    + switch_height_mm / 2
    + power_pass_through_vertical_offset_mm;
power_pass_through_radius_mm = power_pass_through_diameter_mm / 2;
power_pass_through_cut_start_y_mm = enclosure_outer_depth_mm
    - wall_thickness_mm
    - geometry_overlap_mm;
power_pass_through_cut_depth_mm = wall_thickness_mm + 2 * geometry_overlap_mm;
power_pass_through_cut_end_y_mm = power_pass_through_cut_start_y_mm
    + power_pass_through_cut_depth_mm;
// Keep a full wall-thickness web below the lay-in slots wherever the LED
// sightline overlaps them in X.
led_sightline_safe_center_z_mm = min(
    led_sightline_z_mm,
    aperture_bottom_z_mm
        - wall_thickness_mm
        - led_sightline_height_mm / 2
);

routing_guide_shoulder_radius_mm = routing_guide_shoulder_diameter_mm / 2;
routing_guide_waist_radius_mm = routing_guide_waist_diameter_mm / 2;
routing_guide_z_mm = tray_floor_thickness_mm + routing_guide_floor_clearance_mm;
routing_guide_top_rounding_mm = min(
    cable_contact_rounding_mm,
    routing_guide_shoulder_height_mm
);
routing_guide_geometry_base_z_mm = routing_guide_z_mm - geometry_overlap_mm;
routing_guide_lower_transition_start_z_mm = routing_guide_shoulder_height_mm;
routing_guide_lower_transition_end_z_mm =
    routing_guide_lower_transition_start_z_mm
        + routing_guide_transition_height_mm;
routing_guide_upper_transition_end_z_mm = routing_guide_height_mm
    - routing_guide_shoulder_height_mm;
routing_guide_upper_transition_start_z_mm =
    routing_guide_upper_transition_end_z_mm
        - routing_guide_transition_height_mm;
routing_guide_waist_center_z_mm = routing_guide_geometry_base_z_mm
    + (routing_guide_lower_transition_end_z_mm
        + routing_guide_upper_transition_start_z_mm) / 2;
routing_guide_profile_max_slope =
    (routing_guide_shoulder_radius_mm - routing_guide_waist_radius_mm)
        * PI / (2 * routing_guide_transition_height_mm);
routing_guide_profile_support_angle_deg = atan(
    routing_guide_profile_max_slope
);
routing_guide_cap_top_z_mm = routing_guide_geometry_base_z_mm
    + routing_guide_height_mm;
cover_installed_z_mm = tray_floor_thickness_mm + tray_wall_height_mm;
cover_total_height_mm = cover_thickness_mm + cover_skirt_depth_mm;

retention_rail_intrusion_mm = min(
    switch_rail_width_mm,
    switch_side_clearance_mm / 2
);
switch_retention_rail_length_mm = switch_depth_mm
    - 2 * switch_rail_end_clearance_mm;
vertical_retention_reach_mm = cover_installed_z_mm
    - switch_top_z_mm
    - switch_vertical_pad_clearance_mm;
vertical_pad_standoff_height_mm = max(
    0,
    vertical_retention_reach_mm - switch_vertical_pad_height_mm
);
cover_skirt_outer_width_mm = enclosure_inner_width_mm
    - 2 * cover_fit_clearance_mm;
cover_skirt_outer_depth_mm = enclosure_inner_depth_mm
    - 2 * cover_fit_clearance_mm;
cover_skirt_inner_width_mm = cover_skirt_outer_width_mm
    - 2 * wall_thickness_mm;
cover_skirt_inner_depth_mm = cover_skirt_outer_depth_mm
    - 2 * wall_thickness_mm;
cover_skirt_near_outer_y_mm = wall_thickness_mm + cover_fit_clearance_mm;
cover_skirt_near_inner_y_mm = cover_skirt_near_outer_y_mm + wall_thickness_mm;
ethernet_passage_start_y_mm = ethernet_wall_y_mm
    - aperture_side_clearance_mm;
cover_ethernet_relief_end_y_mm = cover_skirt_near_inner_y_mm
    + geometry_overlap_mm;
cover_ethernet_relief_depth_mm = cover_ethernet_relief_end_y_mm
    - ethernet_passage_start_y_mm;
cover_ethernet_relief_bottom_z_mm = cover_thickness_mm;
cover_ethernet_relief_height_mm = cover_skirt_depth_mm
    + 2 * geometry_overlap_mm;
// The cover prints roof-face-down and is installed with a real 180-degree
// rotation around Y. That preserves the Ethernet-side Y face but reverses X,
// so the printable cover-local relief centers must mirror the tray centers.
cover_ethernet_relief_local_centers_x_mm = [
    enclosure_outer_width_mm - uplink_aperture_x_mm,
    enclosure_outer_width_mm - device_aperture_x_mm
];
cover_ethernet_relief_installed_centers_x_mm = [
    for (local_center_x_mm = cover_ethernet_relief_local_centers_x_mm)
        enclosure_outer_width_mm - local_center_x_mm
];
cover_ethernet_relief_widths_mm = [
    uplink_aperture_width_mm,
    device_aperture_width_mm
];
cover_receiver_total_relief_clearance_mm = cover_fit_clearance_mm
    + cover_receiver_relief_extra_clearance_mm;
cover_receiver_boss_relief_diameter_mm = cover_socket_outer_diameter_mm
    + 2 * cover_receiver_total_relief_clearance_mm;
cover_receiver_web_relief_diameter_mm = wall_thickness_mm
    + 2 * cover_receiver_total_relief_clearance_mm;
cover_receiver_relief_bottom_z_mm = cover_thickness_mm;
cover_receiver_relief_height_mm = cover_skirt_depth_mm
    + 2 * geometry_overlap_mm;
cover_pin_body_height_mm = cover_pin_height_mm
    - cover_pin_tip_taper_height_mm;
cover_retention_x_positions_mm = [
    cover_pin_center_inset_mm,
    enclosure_outer_width_mm - cover_pin_center_inset_mm
];
cover_retention_y_positions_mm = [
    cover_pin_center_inset_mm,
    rear_cover_socket_center_y_mm
];
cover_pin_local_centers_mm = [
    for (pin_x_mm = cover_retention_x_positions_mm)
        for (pin_y_mm = cover_retention_y_positions_mm)
            [pin_x_mm, pin_y_mm]
];
tray_wall_top_z_mm = tray_floor_thickness_mm + tray_wall_height_mm;
cover_roof_underside_local_z_mm = cover_thickness_mm;
cover_assembly_rotate_y_deg = 180;
cover_assembly_translate_x_mm = enclosure_outer_width_mm;
cover_assembly_translate_z_mm = cover_installed_z_mm + cover_thickness_mm;
cover_pin_installed_centers_mm = [
    for (pin_center_mm = cover_pin_local_centers_mm)
        [enclosure_outer_width_mm - pin_center_mm[0], pin_center_mm[1]]
];
cover_pin_installed_socket_match_indices = [2, 3, 0, 1];
// rotate([0, 180, 0]) maps local X/Z to -X/-Z before translation.
cover_roof_underside_installed_z_mm = cover_assembly_translate_z_mm
    - cover_roof_underside_local_z_mm;
// Each catch arm roots beside the inner wall with locating-skirt fit clearance.
// Its hook points outward across the wall, away from the switch and its 0.6 mm
// side clearance; the through-wall window remains the deliberate finger-release
// access.  Moving the tongue inward by only the engagement plus interference
// clears the hook from the wall shoulder.
cover_latch_hook_projection_mm = cover_fit_clearance_mm
    + cover_latch_engagement_depth_mm
    + cover_latch_interference_mm;
cover_latch_arm_outer_x_positions_mm = [
    wall_thickness_mm + cover_fit_clearance_mm,
    enclosure_outer_width_mm
        - wall_thickness_mm
        - cover_fit_clearance_mm
        - cover_latch_flexure_thickness_mm
];
cover_latch_release_travel_mm = cover_latch_hook_projection_mm
    - cover_fit_clearance_mm;
cover_latch_hook_bottom_z_mm = cover_installed_z_mm
    - cover_latch_flexure_length_mm;
cover_latch_entry_tip_z_mm = cover_latch_hook_bottom_z_mm
    - cover_latch_lead_in_reach_allowance_mm;
cover_latch_capture_ledge_z_mm = cover_latch_hook_bottom_z_mm
    + cover_latch_engagement_height_mm;
cover_latch_shoulder_z_mm = cover_latch_hook_bottom_z_mm
    + cover_latch_engagement_height_mm
    - cover_latch_interference_mm;
cover_latch_release_bottom_z_mm = cover_latch_shoulder_z_mm
    - cover_latch_release_access_height_mm;
cover_latch_release_top_z_mm = cover_latch_release_bottom_z_mm
    + cover_latch_release_access_height_mm;
cover_latch_entry_tip_local_z_mm = cover_thickness_mm
    + cover_latch_flexure_length_mm
    + cover_latch_lead_in_reach_allowance_mm;
cover_latch_capture_ledge_local_z_mm = cover_thickness_mm
    + cover_latch_flexure_length_mm
    - cover_latch_engagement_height_mm;
cover_latch_arm_width_mm = cover_latch_release_access_width_mm
    - 2 * cover_latch_flexure_side_gap_mm;
cover_socket_bottom_z_mm = cover_installed_z_mm - cover_pin_height_mm;
cover_socket_top_z_mm = cover_installed_z_mm;
cover_retention_assertion_epsilon_mm = max(
    geometry_overlap_mm / 1000000,
    cover_retention_clearance_mm / 1000000
);
cover_latch_arm_inner_x_positions_mm = [
    cover_latch_arm_outer_x_positions_mm[0]
        + cover_latch_flexure_thickness_mm,
    cover_latch_arm_outer_x_positions_mm[1]
];
cover_latch_hook_outer_x_positions_mm = [
    cover_latch_arm_outer_x_positions_mm[0] - cover_latch_hook_projection_mm,
    cover_latch_arm_outer_x_positions_mm[1]
        + cover_latch_flexure_thickness_mm
        + cover_latch_hook_projection_mm
];
// Probe the actual local hull taper just inside the unchanged tray-window top.
// The physical Y-axis cover rotation reverses X and preserves Y; installed
// envelopes below explicitly swap/mirror the two local catches.
cover_latch_window_min_x_positions_mm = [
    -geometry_overlap_mm,
    enclosure_outer_width_mm - wall_thickness_mm - geometry_overlap_mm
];
cover_latch_window_max_x_positions_mm = [
    wall_thickness_mm + geometry_overlap_mm,
    enclosure_outer_width_mm + geometry_overlap_mm
];
cover_latch_window_near_y_mm = cover_latch_center_y_mm
    - cover_latch_release_access_width_mm / 2;
cover_latch_window_far_y_mm = cover_latch_center_y_mm
    + cover_latch_release_access_width_mm / 2;
cover_latch_hull_taper_lower_z_mm = cover_latch_entry_tip_z_mm
    + geometry_overlap_mm;
cover_latch_hull_taper_upper_z_mm = cover_latch_capture_ledge_z_mm
    - geometry_overlap_mm;
cover_latch_window_probe_z_mm = cover_latch_release_top_z_mm
    - geometry_overlap_mm;
cover_latch_window_probe_fraction =
    (cover_latch_window_probe_z_mm - cover_latch_hull_taper_lower_z_mm)
        / (cover_latch_hull_taper_upper_z_mm
            - cover_latch_hull_taper_lower_z_mm);
cover_latch_entry_min_x_positions_mm = [
    cover_latch_arm_outer_x_positions_mm[0]
        - cover_latch_window_probe_fraction
            * cover_latch_hook_projection_mm,
    cover_latch_arm_outer_x_positions_mm[1]
        + cover_latch_window_probe_fraction
            * cover_latch_flexure_thickness_mm
];
cover_latch_entry_max_x_positions_mm = [
    cover_latch_arm_outer_x_positions_mm[0]
        + (1 - cover_latch_window_probe_fraction)
            * cover_latch_flexure_thickness_mm,
    cover_latch_arm_outer_x_positions_mm[1]
        + cover_latch_flexure_thickness_mm
        + cover_latch_window_probe_fraction
            * cover_latch_hook_projection_mm
];
cover_latch_entry_installed_min_x_positions_mm = [
    enclosure_outer_width_mm - cover_latch_entry_max_x_positions_mm[1],
    enclosure_outer_width_mm - cover_latch_entry_max_x_positions_mm[0]
];
cover_latch_entry_installed_max_x_positions_mm = [
    enclosure_outer_width_mm - cover_latch_entry_min_x_positions_mm[1],
    enclosure_outer_width_mm - cover_latch_entry_min_x_positions_mm[0]
];
cover_latch_entry_near_y_mm = cover_latch_center_y_mm
    - cover_latch_arm_width_mm / 2;
cover_latch_entry_far_y_mm = cover_latch_center_y_mm
    + cover_latch_arm_width_mm / 2;
cover_latch_side_envelope_depth_mm = 2 * wall_thickness_mm
    + cover_fit_clearance_mm;

// Each long tray side carries the same two recessed snap sockets.  Their
// complete depth remains inside the side wall, so the tray retains its nominal
// X bounds and its bare underside remains available for horizontal placement.
// The split, tapered T-head on either identical foot presses directly into a
// socket and springs behind its internal shoulder for tool-free retention.
vertical_support_base_thickness_mm = wall_thickness_mm;
vertical_support_engagement_stem_width_mm = wall_thickness_mm;
vertical_support_engagement_head_width_mm = 4.0;
vertical_support_engagement_center_z_mm = tray_floor_thickness_mm
    + vertical_support_fit_clearance_mm
    + (vertical_support_engagement_head_width_mm
        + 2 * vertical_support_fit_clearance_mm) / 2;
vertical_support_engagement_length_mm = vertical_support_foot_length_mm
    - 2 * vertical_support_fit_clearance_mm;
vertical_support_end_keepout_mm = outer_corner_radius_mm
    + wall_thickness_mm;
vertical_support_release_keepout_clearance_mm = wall_thickness_mm;
vertical_support_depth_positions_mm = [
    vertical_support_end_keepout_mm + vertical_support_foot_length_mm / 2,
    enclosure_outer_depth_mm
        - vertical_support_end_keepout_mm
        - vertical_support_foot_length_mm / 2
];
vertical_support_head_channel_width_mm =
    vertical_support_engagement_head_width_mm
        + 2 * vertical_support_fit_clearance_mm;
vertical_support_stem_channel_width_mm =
    vertical_support_engagement_stem_width_mm
        + 2 * vertical_support_fit_clearance_mm;
vertical_support_fit_assertion_epsilon_mm =
    vertical_support_fit_clearance_mm / 1000000;
vertical_support_socket_entry_depth_mm = 0.6;
vertical_support_socket_head_depth_mm = 1.2;
vertical_support_socket_total_depth_mm =
    vertical_support_socket_entry_depth_mm
        + vertical_support_socket_head_depth_mm;
vertical_support_foot_stem_height_mm = vertical_vent_gap_mm
    + vertical_support_socket_entry_depth_mm
    + vertical_support_fit_clearance_mm
    - vertical_support_base_thickness_mm;
vertical_support_foot_head_depth_mm =
    vertical_support_socket_head_depth_mm
        - 2 * vertical_support_fit_clearance_mm;
vertical_support_foot_total_height_mm =
    vertical_support_base_thickness_mm
        + vertical_support_foot_stem_height_mm
        + vertical_support_foot_head_depth_mm;
vertical_support_flexure_slot_width_mm = 1.2;
vertical_support_flexure_slot_depth_mm = 1.2;
// Cable slots stay in the straight wall span between the rounded corners and
// the corner retention/socket zones.  These bounds apply equally to the front
// Ethernet wall and rear power wall.
aperture_safe_left_x_mm = max(
    outer_corner_radius_mm,
    cover_retention_x_positions_mm[0]
        + cover_socket_outer_diameter_mm / 2
        + wall_thickness_mm
);
aperture_safe_right_x_mm = min(
    enclosure_outer_width_mm - outer_corner_radius_mm,
    cover_retention_x_positions_mm[1]
        - cover_socket_outer_diameter_mm / 2
        - wall_thickness_mm
);
ethernet_aperture_separation_mm = abs(
        device_aperture_x_mm - uplink_aperture_x_mm
    ) - (device_aperture_width_mm + uplink_aperture_width_mm) / 2;
cable_service_aperture_count = 3;
ethernet_lay_in_aperture_count = 2;

horizontal_tabletop_footprint_area_mm2 = enclosure_outer_width_mm
    * enclosure_outer_depth_mm;
vertical_tabletop_footprint_area_mm2 = vertical_support_base_width_mm
    * enclosure_outer_depth_mm;
vertical_support_tray_min_x_mm = 0;
vertical_support_tray_max_x_mm = enclosure_outer_width_mm;
vertical_support_near_foot_far_y_mm = vertical_support_depth_positions_mm[0]
    + vertical_support_foot_length_mm / 2;
vertical_support_far_foot_near_y_mm = vertical_support_depth_positions_mm[1]
    - vertical_support_foot_length_mm / 2;
vertical_support_far_foot_far_y_mm = vertical_support_depth_positions_mm[1]
    + vertical_support_foot_length_mm / 2;
cover_positive_catch_count = 2;

printable_layout_tray_x_mm = printable_layout_bed_margin_mm;
printable_layout_tray_y_mm = printable_layout_bed_margin_mm;
printable_layout_cover_x_mm = printable_layout_tray_x_mm
    + enclosure_outer_width_mm
    + printable_layout_spacing_mm;
printable_layout_cover_y_mm = printable_layout_bed_margin_mm;
printable_layout_foot_1_x_mm = printable_layout_bed_margin_mm;
printable_layout_foot_1_y_mm = printable_layout_tray_y_mm
    + enclosure_outer_depth_mm
    + printable_layout_spacing_mm;
printable_layout_foot_2_x_mm = printable_layout_foot_1_x_mm
    + vertical_support_base_width_mm
    + printable_layout_spacing_mm;
printable_layout_foot_2_y_mm = printable_layout_foot_1_y_mm;
printable_layout_width_mm = printable_layout_cover_x_mm
    + enclosure_outer_width_mm
    + printable_layout_bed_margin_mm;
printable_layout_depth_mm = printable_layout_foot_1_y_mm
    + vertical_support_foot_length_mm
    + printable_layout_bed_margin_mm;
printable_layout_fits_bed = printable_layout_width_mm <= print_bed_width_mm
    && printable_layout_depth_mm <= print_bed_depth_mm
    && printable_layout_bed_margin_mm > 0;

uplink_reference_z_mm = uplink_aperture_bottom_z_mm
    + uplink_aperture_height_mm / 2;
device_bundle_height_mm = device_cable_count * device_cable_thickness_mm;
device_bundle_bottom_z_mm = device_aperture_bottom_z_mm
    + (device_aperture_height_mm - device_bundle_height_mm) / 2;
power_head_reference_inner_y_mm = switch_power_face_y_mm;
power_head_reference_outer_y_mm = power_head_reference_inner_y_mm
    + power_head_rigid_length_mm;
power_head_external_protrusion_mm = power_head_reference_outer_y_mm
    - enclosure_outer_depth_mm;
default_minimal_depth_inputs = abs(cable_storage_depth_mm - 68.0) < 0.000001
    && abs(cable_storage_switch_gap_mm - 4.0) < 0.000001
    && abs(switch_depth_mm - 89.0) < 0.000001
    && abs(switch_end_clearance_mm - 0.6) < 0.000001
    && abs(wall_thickness_mm - 2.4) < 0.000001;
default_power_reference_inputs = default_minimal_depth_inputs
    && abs(power_head_rigid_length_mm - 28.20) < 0.000001
    && abs(geometry_overlap_mm - 0.1) < 0.000001;
default_uplink_fit_inputs = abs(uplink_cable_diameter_mm - 5.90) < 0.000001
    && abs(uplink_cable_fit_clearance_mm - 0.5) < 0.000001
    && abs(uplink_aperture_width_mm - 7.0) < 0.000001
    && abs(uplink_aperture_height_mm - 8.0) < 0.000001;
default_tray_height_inputs = abs(tray_floor_thickness_mm - 2.4) < 0.000001
    && abs(tray_wall_height_mm - 34.0) < 0.000001
    && abs(cover_thickness_mm - 2.4) < 0.000001
    && abs(routing_guide_height_mm - 33.9) < 0.000001
    && abs(switch_height_mm - 26.0) < 0.000001
    && abs(switch_top_clearance_mm - 0.8) < 0.000001
    && abs(switch_vertical_pad_height_mm - 1.8) < 0.000001
    && abs(switch_vertical_pad_clearance_mm - 0.4) < 0.000001;
default_top_vent_inputs = default_minimal_depth_inputs
    && abs(top_vent_length_mm - 48.0) < 0.000001
    && abs(top_vent_y_offset_mm) < 0.000001;
default_layout_inputs = default_minimal_depth_inputs
    && abs(switch_width_mm - 121.0) < 0.000001
    && abs(switch_side_clearance_mm - 0.6) < 0.000001
    && abs(vertical_support_foot_length_mm - 18.0) < 0.000001
    && abs(printable_layout_spacing_mm - 0.5) < 0.000001
    && abs(printable_layout_bed_margin_mm - 0.5) < 0.000001;
default_cover_latch_inputs = default_layout_inputs
    && abs(cover_fit_clearance_mm - 0.30) < 0.000001
    && abs(cover_latch_interference_mm - 0.15) < 0.000001
    && abs(cover_latch_flexure_length_mm - 12.0) < 0.000001
    && abs(cover_latch_flexure_thickness_mm - 2.0) < 0.000001
    && abs(cover_latch_flexure_side_gap_mm - 1.5) < 0.000001
    && abs(cover_latch_engagement_depth_mm - 0.8) < 0.000001
    && abs(cover_latch_engagement_height_mm - 1.6) < 0.000001
    && abs(cover_receiver_relief_extra_clearance_mm - 0.5) < 0.000001
    && abs(cover_latch_lead_in_reach_allowance_mm - 3.0) < 0.000001
    && abs(cover_latch_release_access_width_mm - 16.0) < 0.000001
    && abs(cover_latch_release_access_height_mm - 6.0) < 0.000001;
// Keep the complete representative routes on their aperture Z profiles. The
// maximum shoulder envelope protects these paths without a vertical chord/drop.
reference_cable_z_mm = uplink_reference_z_mm;
device_route_bundle_bottom_z_mm = device_bundle_bottom_z_mm;

function planar_distance_mm(point_a_mm, point_b_mm) = sqrt(
    pow(point_a_mm[0] - point_b_mm[0], 2)
        + pow(point_a_mm[1] - point_b_mm[1], 2)
);
function required_axis_offset_mm(hypotenuse_mm, fixed_offset_mm) = sqrt(max(
    0,
    pow(hypotenuse_mm, 2) - pow(fixed_offset_mm, 2)
));
function smooth_profile_radius_mm(start_radius_mm, end_radius_mm, step_index,
    step_count) = start_radius_mm
        + (end_radius_mm - start_radius_mm)
            * (1 - cos(180 * step_index / step_count)) / 2;

// Solid radii describe the printed guide. Cable-centerline radii separately
// protect the complete cable profiles from the maximum shoulder envelope.
uplink_route_radius_mm = routing_guide_shoulder_radius_mm
    + uplink_cable_diameter_mm / 2;
device_route_radius_mm = routing_guide_shoulder_radius_mm
    + device_cable_width_mm / 2;
uplink_route_outer_envelope_radius_mm = uplink_route_radius_mm
    + uplink_cable_diameter_mm / 2;
device_route_outer_envelope_radius_mm = device_route_radius_mm
    + device_cable_width_mm / 2;
uplink_guide_center_x_mm = uplink_aperture_x_mm - uplink_route_radius_mm;
device_guide_center_x_mm = enclosure_outer_width_mm
    - wall_thickness_mm
    - routing_guide_edge_clearance_mm
    - device_route_outer_envelope_radius_mm;
uplink_route_entry_x_mm = uplink_aperture_x_mm;
device_route_entry_x_mm = device_guide_center_x_mm - device_route_radius_mm;
device_transition_shift_x_mm = device_route_entry_x_mm - device_aperture_x_mm;
device_transition_radius_mm = minimum_cable_bend_radius_mm;
device_transition_angle_deg = acos(
    1 - device_transition_shift_x_mm / (2 * device_transition_radius_mm)
);
device_transition_end_y_mm = 2 * device_transition_radius_mm
    * sin(device_transition_angle_deg);
device_transition_first_center_mm = [
    device_aperture_x_mm + device_transition_radius_mm,
    ethernet_wall_y_mm
];
device_transition_second_center_mm = [
    device_route_entry_x_mm - device_transition_radius_mm,
    device_transition_end_y_mm
];

cover_socket_radius_mm = cover_socket_outer_diameter_mm / 2;
route_socket_clearance_mm = cable_contact_rounding_mm;
route_socket_clearance_assertion_epsilon_mm = max(
    geometry_overlap_mm / 1000000,
    route_socket_clearance_mm / 1000000
);
device_near_socket_required_y_mm = cover_retention_y_positions_mm[0]
    + required_axis_offset_mm(
        device_route_outer_envelope_radius_mm
            + cover_socket_radius_mm
            + route_socket_clearance_mm,
        cover_retention_x_positions_mm[1] - device_guide_center_x_mm
    );
reference_route_near_y_mm = max([
    wall_thickness_mm
        + routing_guide_edge_clearance_mm
        + routing_guide_shoulder_radius_mm,
    device_transition_end_y_mm,
    device_near_socket_required_y_mm
]);
reference_route_far_y_mm = wall_thickness_mm
    + cable_storage_depth_mm
    - routing_guide_edge_clearance_mm
    - routing_guide_shoulder_radius_mm;
reference_route_left_x_mm = uplink_guide_center_x_mm;
reference_route_right_x_mm = device_guide_center_x_mm;
uplink_guide_center_mm = [uplink_guide_center_x_mm, reference_route_near_y_mm];
device_guide_center_mm = [device_guide_center_x_mm, reference_route_near_y_mm];
cover_socket_centers_mm = [
    for (socket_x_mm = cover_retention_x_positions_mm)
        for (socket_y_mm = cover_retention_y_positions_mm)
            [socket_x_mm, socket_y_mm]
];
routing_guide_centers_mm = [uplink_guide_center_mm, device_guide_center_mm];
routing_guide_socket_surface_gaps_mm = [
    for (guide_center_mm = routing_guide_centers_mm)
        for (socket_center_mm = cover_socket_centers_mm)
            planar_distance_mm(guide_center_mm, socket_center_mm)
                - routing_guide_shoulder_radius_mm
                - cover_socket_radius_mm
];
representative_route_outer_radii_mm = [
    uplink_route_outer_envelope_radius_mm,
    device_route_outer_envelope_radius_mm
];
representative_route_socket_surface_gaps_mm = [
    for (guide_index = [0 : len(routing_guide_centers_mm) - 1])
        for (socket_center_mm = cover_socket_centers_mm)
            planar_distance_mm(
                routing_guide_centers_mm[guide_index],
                socket_center_mm
            ) - representative_route_outer_radii_mm[guide_index]
                - cover_socket_radius_mm
];

// Bound every Ethernet storage/service reference, including the complete round
// loops and flat-cable transition arcs.  The catches remain wholly outside this
// shared X envelope; the separate power-head route is separated from them in Y.
ethernet_service_route_min_x_mm = min([
    uplink_aperture_x_mm - uplink_cable_diameter_mm / 2,
    uplink_guide_center_mm[0] - uplink_route_outer_envelope_radius_mm,
    device_transition_first_center_mm[0]
        - device_transition_radius_mm - device_cable_width_mm / 2,
    device_transition_second_center_mm[0]
        - device_transition_radius_mm - device_cable_width_mm / 2,
    device_guide_center_mm[0] - device_route_outer_envelope_radius_mm
]);
ethernet_service_route_max_x_mm = max([
    uplink_aperture_x_mm + uplink_cable_diameter_mm / 2,
    uplink_guide_center_mm[0] + uplink_route_outer_envelope_radius_mm,
    device_transition_first_center_mm[0]
        + device_transition_radius_mm + device_cable_width_mm / 2,
    device_transition_second_center_mm[0]
        + device_transition_radius_mm + device_cable_width_mm / 2,
    device_guide_center_mm[0] + device_route_outer_envelope_radius_mm
]);
cover_latch_complete_left_max_x_mm = cover_latch_arm_inner_x_positions_mm[0];
cover_latch_complete_right_min_x_mm = cover_latch_arm_inner_x_positions_mm[1];
cover_latch_complete_far_y_mm = cover_latch_release_far_y_mm;
power_service_route_near_y_mm = power_head_reference_inner_y_mm
    - power_head_reference_diameter_mm / 2;

// The switch body is an intentional floor-vent keepout. Place the low inlet
// bank in the clear aisle between the two complete representative loop
// envelopes, including cable thickness and contact clearance.
ventilation_keepout_clearance_mm = cable_contact_rounding_mm;
bottom_vent_left_keepout_x_mm = uplink_aperture_x_mm
    + uplink_cable_diameter_mm / 2
    + ventilation_keepout_clearance_mm;
bottom_vent_right_keepout_x_mm = device_guide_center_mm[0]
    - device_route_outer_envelope_radius_mm
    - ventilation_keepout_clearance_mm;
bottom_vent_near_keepout_y_mm = reference_route_near_y_mm
    + max(representative_route_outer_radii_mm)
    + ventilation_keepout_clearance_mm;
bottom_vent_far_keepout_y_mm = wall_thickness_mm
    + cable_storage_depth_mm
    - ventilation_keepout_clearance_mm;
bottom_vent_center_x_mm = (bottom_vent_left_keepout_x_mm
        + bottom_vent_right_keepout_x_mm) / 2
    + bottom_vent_x_offset_mm;
bottom_vent_center_y_mm = (bottom_vent_near_keepout_y_mm
        + bottom_vent_far_keepout_y_mm) / 2
    + bottom_vent_y_offset_mm;
// Place the side outlets in the switch-bay long walls behind the relocated
// retention band.  Their Z-only relationship to the switch remains unchanged,
// while both support sockets retain clear wall spans at the enclosure ends.
side_vent_center_y_mm = switch_center_y_mm + side_vent_y_offset_mm;
side_vent_bottom_z_mm = tray_floor_thickness_mm + side_vent_z_offset_mm;
top_vent_center_x_mm = switch_center_x_mm + top_vent_x_offset_mm;
top_vent_center_y_mm = switch_center_y_mm + top_vent_y_offset_mm;
bottom_vent_left_x_mm = bottom_vent_center_x_mm - bottom_vent_length_mm / 2;
bottom_vent_right_x_mm = bottom_vent_center_x_mm + bottom_vent_length_mm / 2;
side_vent_bank_half_depth_mm = ((side_vent_count - 1) * side_vent_spacing_mm
    + side_vent_width_mm) / 2;
side_vent_near_y_mm = side_vent_center_y_mm - side_vent_bank_half_depth_mm;
side_vent_far_y_mm = side_vent_center_y_mm + side_vent_bank_half_depth_mm;
top_vent_bank_half_width_mm = ((top_vent_count - 1) * top_vent_spacing_mm
    + top_vent_width_mm) / 2;
top_vent_left_x_mm = top_vent_center_x_mm - top_vent_bank_half_width_mm;
top_vent_right_x_mm = top_vent_center_x_mm + top_vent_bank_half_width_mm;
top_vent_near_y_mm = top_vent_center_y_mm - top_vent_length_mm / 2;
top_vent_far_y_mm = top_vent_center_y_mm + top_vent_length_mm / 2;

// The approved input order is four device cables followed by one uplink cable.
// Keep that association explicit so count or length edits fail deterministically
// instead of silently changing which profile receives which length.
function cable_length_sum_mm(lengths_mm, index = 0) =
    index >= len(lengths_mm)
        ? 0
        : lengths_mm[index] + cable_length_sum_mm(lengths_mm, index + 1);
function circular_route_length_mm(radius_mm, sweep_deg) =
    2 * PI * radius_mm * abs(sweep_deg) / 360;
device_cable_lengths_mm = [
    for (device_index = [0 : device_cable_count - 1])
        ethernet_cable_lengths_mm[device_index]
];
uplink_cable_length_mm = ethernet_cable_lengths_mm[device_cable_count];
calculated_ethernet_total_length_mm = cable_length_sum_mm(
    ethernet_cable_lengths_mm
);
switch_side_service_y_mm = switch_origin_y_mm;

// Each reference enters at its real lay-in slot, completes one smooth storage
// loop about its assigned guide, then continues to the switch-side service
// region. Cable not consumed by this representative internal route remains
// available as individually selectable exposed length outside the enclosure.
uplink_stored_route_length_mm = reference_route_near_y_mm
    + circular_route_length_mm(uplink_route_radius_mm, 360)
    + switch_side_service_y_mm - reference_route_near_y_mm;
device_stored_route_length_mm = circular_route_length_mm(
        device_transition_radius_mm,
        2 * device_transition_angle_deg
    )
    + reference_route_near_y_mm - device_transition_end_y_mm
    + circular_route_length_mm(device_route_radius_mm, 360)
    + switch_side_service_y_mm - reference_route_near_y_mm;
uplink_exposed_reference_length_mm = uplink_cable_length_mm
    - uplink_stored_route_length_mm;
device_exposed_reference_lengths_mm = [
    for (device_length_mm = device_cable_lengths_mm)
        device_length_mm - device_stored_route_length_mm
];

assert(uplink_cable_count == 1,
    "Approved routing requires exactly one uplink cable");
assert(device_cable_count == 4,
    "Approved routing requires exactly four device cables");
assert(ethernet_cable_count == 5,
    "Approved routing requires exactly five Ethernet cables");
assert(ethernet_cable_count == uplink_cable_count + device_cable_count,
    "Ethernet cable count must equal uplink plus device counts");
assert(len(ethernet_cable_lengths_mm) == ethernet_cable_count,
    "Every Ethernet cable requires one approved length");
assert(calculated_ethernet_total_length_mm == 1500,
    "Approved Ethernet cable length total must be 1500 mm");
assert(calculated_ethernet_total_length_mm
        == ethernet_total_storage_allowance_mm,
    "Cable lengths must match the configured storage allowance");
assert(uplink_cable_length_mm == 500,
    "The round uplink must consume the approved 500 mm length");
assert(len(device_cable_lengths_mm) == 4
        && min(device_cable_lengths_mm) == 250
        && max(device_cable_lengths_mm) == 250,
    "Each flat device cable must consume an approved 250 mm length");
assert(routing_guide_shoulder_radius_mm > routing_guide_waist_radius_mm
        && routing_guide_waist_radius_mm > 0,
    "Hourglass guide requires a positive waist smaller than its shoulder");
assert(routing_guide_shoulder_height_mm > 0
        && routing_guide_transition_height_mm > 0
        && routing_guide_profile_steps >= 1
        && floor(routing_guide_profile_steps) == routing_guide_profile_steps,
    "Hourglass profile dimensions and integer step count must be positive");
assert(2 * (routing_guide_shoulder_height_mm
            + routing_guide_transition_height_mm)
        < routing_guide_height_mm
        && routing_guide_upper_transition_start_z_mm
            > routing_guide_lower_transition_end_z_mm,
    "Two shoulders, two transitions, and a positive waist must fit the guide height");
assert(routing_guide_top_rounding_mm >= 0
        && routing_guide_top_rounding_mm <= routing_guide_shoulder_height_mm
        && routing_guide_top_rounding_mm < routing_guide_shoulder_radius_mm,
    "Hourglass top rounding must fit its shoulder and radius");
assert(routing_guide_profile_support_angle_deg >= 0
        && routing_guide_profile_support_angle_deg <= 45,
    "Hourglass transition must remain within the support-free 0 to 45 degree profile");
assert(routing_guide_geometry_base_z_mm < tray_floor_thickness_mm
        && routing_guide_z_mm <= tray_floor_thickness_mm,
    "Routing guides must overlap and remain joined to the tray floor");
assert(uplink_route_radius_mm >= minimum_cable_bend_radius_mm,
    "Round uplink reference violates the minimum bend radius");
assert(device_route_radius_mm >= minimum_cable_bend_radius_mm,
    "Flat device references violate the minimum bend radius");
assert(uplink_route_radius_mm
            == routing_guide_shoulder_radius_mm + uplink_cable_diameter_mm / 2
        && device_route_radius_mm
            == routing_guide_shoulder_radius_mm + device_cable_width_mm / 2,
    "Representative cable centerlines must clear the maximum guide envelope");
assert(len(routing_guide_socket_surface_gaps_mm) == 8
        && min(routing_guide_socket_surface_gaps_mm)
            >= cable_contact_rounding_mm,
    "Both maximum guide shoulders must clear all four female cover sockets");
assert(len(representative_route_socket_surface_gaps_mm) == 8
        && min(representative_route_socket_surface_gaps_mm)
            >= route_socket_clearance_mm
                - route_socket_clearance_assertion_epsilon_mm,
    "Representative cable loops must leave usable clearance at every socket");
assert(uplink_route_entry_x_mm == uplink_aperture_x_mm
        && uplink_guide_center_mm[0] + uplink_route_radius_mm
            == uplink_aperture_x_mm,
    "Uplink slot, full loop, and outgoing leg must share one XY tangent");
assert(device_transition_radius_mm >= minimum_cable_bend_radius_mm,
    "Flat-device slot transition violates the minimum bend radius");
assert(device_transition_shift_x_mm >= 0
        && device_transition_shift_x_mm <= 2 * device_transition_radius_mm,
    "Flat-device slot cannot transition smoothly to its storage guide");
assert(device_transition_end_y_mm <= reference_route_near_y_mm,
    "Flat-device slot transition reaches beyond its storage guide");
assert(device_guide_center_mm[0] + device_route_radius_mm
            + device_cable_width_mm / 2
        <= enclosure_outer_width_mm - wall_thickness_mm,
    "Flat-device storage loop crosses the right enclosure wall");
assert(uplink_guide_center_mm[0] - routing_guide_shoulder_radius_mm
            >= wall_thickness_mm
        && uplink_guide_center_mm[0]
            - uplink_route_outer_envelope_radius_mm
            >= wall_thickness_mm,
    "Uplink guide or complete storage loop crosses the left enclosure wall");
assert(uplink_exposed_reference_length_mm >= 0,
    "Round uplink storage route exceeds its approved cable length");
assert(min(device_exposed_reference_lengths_mm) >= 0,
    "A flat-device storage route exceeds its approved cable length");
assert(device_cable_width_mm <= device_aperture_width_mm
        && device_bundle_height_mm <= device_aperture_height_mm,
    "Flat-device bundle does not fit its shared lay-in slot");
assert(uplink_cable_diameter_mm <= uplink_aperture_width_mm
        && uplink_cable_diameter_mm <= uplink_aperture_height_mm
        && uplink_cable_fit_clearance_mm >= 0
        && uplink_aperture_radial_clearance_mm
            >= uplink_cable_fit_clearance_mm,
    "Round uplink does not retain its required per-side aperture clearance");
assert(!default_uplink_fit_inputs
        || abs(uplink_aperture_radial_clearance_mm - 0.55) < 0.000001,
    "Default 5.90 mm uplink requires 0.55 mm clearance per side");
assert(tray_wall_height_mm >= switch_bay_height_mm,
    "Tray wall height must contain the switch plus configured top clearance");
assert(!default_tray_height_inputs
        || (abs(cover_installed_z_mm - 36.4) < 0.000001
            && abs(enclosure_outer_height_mm - 38.8) < 0.000001
            && abs(routing_guide_cap_top_z_mm - 36.2) < 0.000001
            && abs(vertical_pad_standoff_height_mm - 5.8) < 0.000001),
    "Default 34 mm tray wall requires matching guide, cover, and retention heights");
assert(cable_service_aperture_count == 3,
    "The enclosure contract requires exactly three cable-service apertures");
assert(ethernet_lay_in_aperture_count == 2,
    "Only the two Ethernet cable-service apertures may be lay-in slots");
assert(len(cover_ethernet_relief_local_centers_x_mm) == 2
        && cover_ethernet_relief_local_centers_x_mm[0]
            == enclosure_outer_width_mm - uplink_aperture_x_mm
        && cover_ethernet_relief_local_centers_x_mm[1]
            == enclosure_outer_width_mm - device_aperture_x_mm
        && cover_ethernet_relief_installed_centers_x_mm[0]
            == uplink_aperture_x_mm
        && cover_ethernet_relief_installed_centers_x_mm[1]
            == device_aperture_x_mm
        && cover_ethernet_relief_widths_mm[0] == uplink_aperture_width_mm
        && cover_ethernet_relief_widths_mm[1] == device_aperture_width_mm,
    "Physically rotated cover reliefs must share both installed tray X envelopes");
assert(ethernet_passage_start_y_mm
            == ethernet_wall_y_mm - aperture_side_clearance_mm
        && cover_ethernet_relief_end_y_mm > cover_skirt_near_inner_y_mm
        && cover_ethernet_relief_depth_mm
            == cover_ethernet_relief_end_y_mm
                - ethernet_passage_start_y_mm,
    "Cover Ethernet reliefs must cross the complete installed tray-to-skirt passage");
assert(cover_ethernet_relief_bottom_z_mm == cover_thickness_mm
        && cover_ethernet_relief_height_mm >= cover_skirt_depth_mm,
    "Ethernet skirt reliefs must leave the exterior cover roof intact");
assert(uplink_aperture_x_mm - uplink_aperture_width_mm / 2
            >= aperture_safe_left_x_mm
        && uplink_aperture_x_mm + uplink_aperture_width_mm / 2
            <= aperture_safe_right_x_mm
        && device_aperture_x_mm - device_aperture_width_mm / 2
            >= aperture_safe_left_x_mm
        && device_aperture_x_mm + device_aperture_width_mm / 2
            <= aperture_safe_right_x_mm,
    "Ethernet slot enters a corner, retention, or perimeter keepout");
assert(ethernet_aperture_separation_mm >= wall_thickness_mm,
    "Adjacent Ethernet slots require at least one wall-thickness web");
assert(power_pass_through_center_x_mm
            == switch_origin_x_mm + power_input_visual_right_offset_mm
        && power_pass_through_center_z_mm
            == switch_origin_z_mm
                + switch_height_mm / 2
                + power_pass_through_vertical_offset_mm,
    "Power pass-through center must follow the approved switch-input formulas");
assert(abs(power_pass_through_vertical_offset_mm - 4.0) >= 0.000001
        || abs(switch_origin_z_mm - 2.4) >= 0.000001
        || abs(switch_height_mm - 26.0) >= 0.000001
        || abs(power_pass_through_center_z_mm - 19.4) < 0.000001,
    "Default power pass-through vertical offset must raise its center to 19.4 mm");
assert(power_pass_through_diameter_mm >= power_head_reference_diameter_mm
        && (power_pass_through_diameter_mm
            - power_head_reference_diameter_mm) / 2 >= 0,
    "Power pass-through must provide nonnegative radial head clearance");
assert(power_pass_through_center_x_mm - power_pass_through_radius_mm
            >= aperture_safe_left_x_mm
        && power_pass_through_center_x_mm + power_pass_through_radius_mm
            <= aperture_safe_right_x_mm,
    "Power pass-through enters a corner, retention, or perimeter keepout");
assert(power_pass_through_center_z_mm - power_pass_through_radius_mm
            >= tray_floor_thickness_mm
        && power_pass_through_center_z_mm + power_pass_through_radius_mm
            <= tray_floor_thickness_mm + tray_wall_height_mm,
    "Power pass-through must remain vertically bounded by the tray wall");
assert(power_pass_through_cut_start_y_mm
            <= enclosure_outer_depth_mm - wall_thickness_mm
        && power_pass_through_cut_end_y_mm >= enclosure_outer_depth_mm,
    "Power pass-through cut must cross the complete rear wall thickness");
assert(power_head_reference_inner_y_mm
            == switch_power_face_y_mm
        && power_head_reference_outer_y_mm
            == power_head_reference_inner_y_mm + power_head_rigid_length_mm
        && power_head_external_protrusion_mm > 0,
    "Installed rigid head must connect at the switch face and protrude outside");
assert(enclosure_outer_depth_mm
            == switch_origin_y_mm + switch_depth_mm
                + switch_end_clearance_mm + wall_thickness_mm
        && abs(switch_bay_depth_mm
                - (switch_depth_mm + 2 * switch_end_clearance_mm)) < 0.000001
        && abs(power_side_clearance_mm - switch_end_clearance_mm) < 0.000001
        && abs(power_side_rear_extension_mm
                - (switch_end_clearance_mm + wall_thickness_mm)) < 0.000001,
    "Power-side depth must follow direct switch fit and preserve inner clearance");
assert(!default_minimal_depth_inputs
        || (abs(switch_bay_depth_mm - 90.2) < 0.000001
            && abs(switch_power_face_y_mm - 164.0) < 0.000001
            && abs(enclosure_outer_depth_mm - 167.0) < 0.000001
            && abs(power_wall_y_mm - 164.6) < 0.000001
            && abs(power_side_clearance_mm - 0.6) < 0.000001
            && abs(power_side_rear_extension_mm - 3.0) < 0.000001),
    "Default 89 mm switch span requires a 90.2 mm bay and 167 mm enclosure depth");
assert(!default_power_reference_inputs
        || (abs(power_pass_through_cut_start_y_mm - 164.5) < 0.000001
            && abs(power_pass_through_cut_end_y_mm - 167.1) < 0.000001
            && abs(power_head_reference_inner_y_mm - 164.0) < 0.000001
            && abs(power_head_reference_outer_y_mm - 192.2) < 0.000001
            && abs(power_head_external_protrusion_mm - 25.2) < 0.000001),
    "Default power cut and rigid head reference must match the shortened wall");
assert(rear_cover_socket_near_y_mm - cover_latch_release_far_y_mm
            >= wall_thickness_mm - cover_retention_assertion_epsilon_mm
        && rear_cover_socket_far_y_mm
            <= switch_origin_y_mm - switch_end_clearance_mm
                + cover_retention_assertion_epsilon_mm
        && rear_cover_socket_far_y_mm
            <= power_wall_y_mm + cover_retention_assertion_epsilon_mm,
    "Switch-side sockets require a full latch web and switch-removal clearance");
assert(cover_socket_bottom_z_mm >= switch_top_z_mm
            + switch_top_clearance_mm
        && cover_socket_top_z_mm <= cover_installed_z_mm,
    "Switch-side socket and installed-pin Z envelopes must stay above the switch");
assert(cover_latch_release_near_y_mm >= wall_thickness_mm
        && cover_latch_release_far_y_mm
            + wall_thickness_mm <= rear_cover_socket_near_y_mm
                + cover_retention_assertion_epsilon_mm,
    "Catch release span must remain in bounds ahead of the switch-side sockets");
assert(led_sightline_safe_center_z_mm + led_sightline_height_mm / 2
            + wall_thickness_mm
        <= aperture_bottom_z_mm,
    "LED sightline does not retain a full vertical web below the cable slots");
assert(reference_cable_z_mm == uplink_reference_z_mm
        && device_route_bundle_bottom_z_mm == device_bundle_bottom_z_mm,
    "Representative cable routes must remain at their aperture Z profiles");
assert(reference_cable_z_mm + uplink_cable_diameter_mm / 2
            <= routing_guide_geometry_base_z_mm
                + routing_guide_height_mm - routing_guide_top_rounding_mm
        && reference_cable_z_mm - uplink_cable_diameter_mm / 2
            >= routing_guide_geometry_base_z_mm
        && device_route_bundle_bottom_z_mm + device_bundle_height_mm
            <= routing_guide_geometry_base_z_mm
                + routing_guide_height_mm - routing_guide_top_rounding_mm
        && device_route_bundle_bottom_z_mm
            >= routing_guide_geometry_base_z_mm,
    "Maximum guide envelope must protect both complete cable profiles");
assert(routing_guide_cap_top_z_mm < cover_installed_z_mm,
    "Routing-guide rounded cap enters the installed-cover keepout");
assert(uplink_reference_z_mm + uplink_cable_diameter_mm / 2
            <= cover_installed_z_mm
        && device_bundle_bottom_z_mm + device_bundle_height_mm
            <= cover_installed_z_mm
        && reference_cable_z_mm + uplink_cable_diameter_mm / 2
            <= cover_installed_z_mm
        && device_route_bundle_bottom_z_mm + device_bundle_height_mm
            <= cover_installed_z_mm,
    "A representative cable route enters the installed-cover keepout");
assert(bottom_vent_left_x_mm >= bottom_vent_left_keepout_x_mm
        && bottom_vent_right_x_mm <= bottom_vent_right_keepout_x_mm,
    "Floor vents cross a default cable-route keepout");
assert(bottom_vent_center_y_mm
            - ((bottom_vent_count - 1) * bottom_vent_spacing_mm
                + bottom_vent_width_mm) / 2
        >= bottom_vent_near_keepout_y_mm
        && bottom_vent_center_y_mm
            + ((bottom_vent_count - 1) * bottom_vent_spacing_mm
                + bottom_vent_width_mm) / 2
        <= bottom_vent_far_keepout_y_mm,
    "Floor vent bank crosses a guide, cable loop, or switch-bay keepout");
assert(side_vent_near_y_mm
            >= rear_cover_socket_far_y_mm + wall_thickness_mm
        && side_vent_far_y_mm
            <= vertical_support_far_foot_near_y_mm - wall_thickness_mm
        && side_vent_near_y_mm >= wall_thickness_mm
        && side_vent_far_y_mm <= power_wall_y_mm,
    "Side vent bank enters a retention, support, or wall-end keepout");
assert(side_vent_bottom_z_mm >= tray_floor_thickness_mm
        && side_vent_bottom_z_mm + side_vent_height_mm
            <= cover_installed_z_mm,
    "Side vent bank crosses the tray floor or top boundary");
assert(top_vent_left_x_mm >= wall_thickness_mm
        && top_vent_right_x_mm
            <= enclosure_outer_width_mm - wall_thickness_mm
        && top_vent_near_y_mm >= wall_thickness_mm
        && top_vent_far_y_mm
            <= enclosure_outer_depth_mm - wall_thickness_mm,
    "Top vent bank crosses the cover boundary");
assert(top_vent_left_x_mm
            >= switch_origin_x_mm + switch_vertical_pad_width_mm
                + wall_thickness_mm
        && top_vent_right_x_mm
            <= switch_origin_x_mm + switch_width_mm
                - switch_vertical_pad_width_mm - wall_thickness_mm
        && top_vent_near_y_mm >= switch_origin_y_mm + wall_thickness_mm
        && top_vent_far_y_mm
            <= switch_origin_y_mm + switch_depth_mm - wall_thickness_mm,
    "Top vents cross a retention feature or switch-bay strength clearance");
assert(top_vent_left_x_mm
            >= cover_retention_x_positions_mm[0]
                + cover_socket_outer_diameter_mm / 2 + wall_thickness_mm
        && top_vent_right_x_mm
            <= cover_retention_x_positions_mm[1]
                - cover_socket_outer_diameter_mm / 2 - wall_thickness_mm,
    "Top vents cross the cover-pin retention clearance");
assert(!default_top_vent_inputs
        || (abs(top_vent_near_y_mm - 95.5) < 0.000001
            && abs(top_vent_far_y_mm - 143.5) < 0.000001),
    "Default top vents must retain their shortened-outline Y bounds");
assert(vertical_support_foot_count == 2
        && len(vertical_support_depth_positions_mm) == 2,
    "Vertical placement requires exactly two identical support feet");
assert(assembly_orientation == "horizontal"
        || assembly_orientation == "vertical",
    "assembly_orientation must be horizontal or vertical");
assert(vertical_standing_side == "left"
        || vertical_standing_side == "right",
    "vertical_standing_side must be left or right");
assert(vertical_tabletop_footprint_area_mm2
        < horizontal_tabletop_footprint_area_mm2,
    "Vertical placement must reduce the tabletop bounding footprint");
assert(vertical_support_base_width_mm < enclosure_outer_width_mm,
    "Vertical support width must remain narrower than the enclosure");
assert(vertical_vent_gap_mm >= 3.0
        && vertical_support_base_thickness_mm < vertical_vent_gap_mm,
    "Support geometry must preserve the approved side-wall tabletop gap");
assert(vertical_support_socket_total_depth_mm < wall_thickness_mm
        && vertical_support_foot_head_depth_mm > 0
        && vertical_support_foot_stem_height_mm > 0,
    "Recessed support sockets must retain an interior wall skin and a usable snap head");
assert(abs((vertical_support_head_channel_width_mm
                - vertical_support_engagement_head_width_mm) / 2
            - vertical_support_fit_clearance_mm)
            <= vertical_support_fit_assertion_epsilon_mm
        && abs((vertical_support_stem_channel_width_mm
                - vertical_support_engagement_stem_width_mm) / 2
            - vertical_support_fit_clearance_mm)
            <= vertical_support_fit_assertion_epsilon_mm
        && abs((vertical_support_foot_length_mm
                - vertical_support_engagement_length_mm) / 2
            - vertical_support_fit_clearance_mm)
            <= vertical_support_fit_assertion_epsilon_mm
        && abs((vertical_support_socket_head_depth_mm
                - vertical_support_foot_head_depth_mm) / 2
            - vertical_support_fit_clearance_mm)
            <= vertical_support_fit_assertion_epsilon_mm,
    "Support-foot socket clearance must match the approved fit clearance");
assert(vertical_support_tray_min_x_mm == 0
        && vertical_support_tray_max_x_mm == enclosure_outer_width_mm,
    "Vertical support engagement must remain inside the nominal tray X bounds");
assert(vertical_support_near_foot_far_y_mm
            <= cover_latch_release_near_y_mm
                - vertical_support_release_keepout_clearance_mm
        && vertical_support_far_foot_near_y_mm > side_vent_far_y_mm
        && vertical_support_engagement_center_z_mm
            + vertical_support_head_channel_width_mm / 2
            < side_vent_bottom_z_mm,
    "Support feet or recessed sockets enter a side-vent keepout");
assert(vertical_support_near_foot_far_y_mm
            <= cover_latch_release_near_y_mm
                - vertical_support_release_keepout_clearance_mm
        && vertical_support_far_foot_near_y_mm
            >= side_vent_far_y_mm
                + vertical_support_release_keepout_clearance_mm,
    "Support foot or recessed socket enters the cover-release keepout");
assert(cover_positive_catch_count == 2
        && cover_latch_hook_projection_mm
            == cover_fit_clearance_mm
                + cover_latch_engagement_depth_mm
                + cover_latch_interference_mm
        && abs(cover_latch_release_travel_mm
                - (cover_latch_engagement_depth_mm
                    + cover_latch_interference_mm))
            <= cover_retention_assertion_epsilon_mm
        && cover_latch_release_travel_mm > 0
        && cover_latch_release_travel_mm < cover_latch_flexure_length_mm
        && cover_latch_shoulder_z_mm
            == cover_latch_hook_bottom_z_mm
                + cover_latch_engagement_height_mm
                - cover_latch_interference_mm
        && cover_latch_interference_mm > 0,
    "Opposed catches must retain exact positive interference and shoulder capture");
assert(cover_latch_lead_in_reach_allowance_mm > 0
        && cover_latch_entry_tip_z_mm < cover_latch_hook_bottom_z_mm
        && cover_latch_entry_tip_z_mm > cover_latch_release_bottom_z_mm
        && cover_latch_entry_tip_z_mm < cover_latch_release_top_z_mm
        && cover_latch_capture_ledge_local_z_mm
            < cover_thickness_mm + cover_latch_flexure_length_mm
        && cover_latch_entry_tip_local_z_mm
            > cover_thickness_mm + cover_latch_flexure_length_mm
        && abs(cover_latch_release_top_z_mm
                - cover_latch_release_bottom_z_mm
                - cover_latch_release_access_height_mm)
            <= cover_retention_assertion_epsilon_mm,
    "Extended catch entries must enter the fixed windows without bottoming out");
assert(cover_latch_window_probe_fraction > 0
        && cover_latch_window_probe_fraction < 1
        && cover_latch_entry_installed_min_x_positions_mm[0]
            < cover_latch_window_max_x_positions_mm[0]
        && cover_latch_entry_installed_max_x_positions_mm[0]
            > cover_latch_window_min_x_positions_mm[0]
        && cover_latch_entry_installed_min_x_positions_mm[1]
            < cover_latch_window_max_x_positions_mm[1]
        && cover_latch_entry_installed_max_x_positions_mm[1]
            > cover_latch_window_min_x_positions_mm[1]
        && cover_latch_entry_near_y_mm < cover_latch_window_far_y_mm
        && cover_latch_entry_far_y_mm > cover_latch_window_near_y_mm,
    "Both installed hulled catch entries must intersect their fixed tray windows in X and Y");
assert(abs(cover_latch_capture_ledge_z_mm
                - cover_latch_release_top_z_mm
                - cover_latch_interference_mm)
            <= cover_retention_assertion_epsilon_mm
        && abs(cover_latch_release_travel_mm
                - (cover_latch_engagement_depth_mm
                    + cover_latch_interference_mm))
            <= cover_retention_assertion_epsilon_mm
        && cover_latch_release_travel_mm
            < cover_latch_flexure_length_mm,
    "Catch ledges must preserve positive shoulder capture and inward release clearance");
assert(!default_cover_latch_inputs
        || (abs(cover_latch_hook_projection_mm - 1.25) < 0.000001
            && abs(cover_latch_release_travel_mm - 0.95) < 0.000001
            && abs(cover_latch_entry_tip_z_mm
                    - (cover_latch_hook_bottom_z_mm - 3.0)) < 0.000001
            && abs(cover_latch_arm_outer_x_positions_mm[0] - 2.7)
                < 0.000001
            && abs(cover_latch_arm_outer_x_positions_mm[1] - 122.3)
                < 0.000001),
    "Default catches must retain approved placement, lead-in reach, and release travel");
assert(cover_latch_arm_outer_x_positions_mm[0] >= 0
        && cover_latch_arm_inner_x_positions_mm[0]
            <= cover_latch_side_envelope_depth_mm
        && cover_latch_arm_inner_x_positions_mm[1]
            >= enclosure_outer_width_mm - cover_latch_side_envelope_depth_mm
        && cover_latch_arm_outer_x_positions_mm[1]
                + cover_latch_flexure_thickness_mm
            <= enclosure_outer_width_mm
        && cover_latch_hook_outer_x_positions_mm[0] >= 0
        && cover_latch_hook_outer_x_positions_mm[1]
            <= enclosure_outer_width_mm,
    "Catch arms and outward hooks must stay in the long-side envelopes");
assert(cover_latch_release_far_y_mm
            <= switch_origin_y_mm - switch_end_clearance_mm
        && cover_latch_hook_bottom_z_mm < cover_installed_z_mm,
    "Catch arms and hooks enter the switch or cover-removal keepout");
assert(cover_latch_complete_left_max_x_mm
            + cover_fit_clearance_mm <= ethernet_service_route_min_x_mm
        && cover_latch_complete_right_min_x_mm
            >= ethernet_service_route_max_x_mm + cover_fit_clearance_mm
        && cover_latch_complete_far_y_mm + cover_fit_clearance_mm
            <= power_service_route_near_y_mm,
    "Complete catches enter an Ethernet or power cable service-route envelope");
assert(cover_pin_tip_diameter_mm > 0
        && cover_pin_tip_diameter_mm < cover_pin_diameter_mm
        && cover_pin_tip_taper_height_mm > 0
        && cover_pin_tip_taper_height_mm < cover_pin_height_mm
        && cover_pin_socket_diameter_mm > cover_pin_diameter_mm,
    "Alignment pins require a smaller tapered lead-in and positive socket clearance");
assert((cover_receiver_boss_relief_diameter_mm
            - cover_socket_outer_diameter_mm) / 2
            + cover_retention_assertion_epsilon_mm
            >= cover_receiver_total_relief_clearance_mm
        && (cover_receiver_web_relief_diameter_mm - wall_thickness_mm) / 2
            + cover_retention_assertion_epsilon_mm
            >= cover_receiver_total_relief_clearance_mm
        && cover_receiver_total_relief_clearance_mm
            == cover_fit_clearance_mm
                + cover_receiver_relief_extra_clearance_mm
        && cover_receiver_relief_extra_clearance_mm >= 0
        && cover_receiver_relief_bottom_z_mm == cover_thickness_mm
        && cover_receiver_relief_height_mm >= cover_skirt_depth_mm,
    "Cover skirt reliefs must clear complete receiver bosses and structural webs");
assert(len(cover_pin_installed_centers_mm) == 4
        && max([
            for (pin_index = [0 : len(cover_pin_installed_centers_mm) - 1])
                planar_distance_mm(
                    cover_pin_installed_centers_mm[pin_index],
                    cover_socket_centers_mm[
                        cover_pin_installed_socket_match_indices[pin_index]
                    ]
                )
        ]) <= cover_retention_assertion_epsilon_mm,
    "All four physically rotated cover pins must remain coaxial with the tray sockets");
assert(cover_assembly_rotate_y_deg == 180
        && cover_assembly_translate_x_mm == enclosure_outer_width_mm
        && cover_roof_underside_installed_z_mm == tray_wall_top_z_mm
        && tray_wall_top_z_mm == cover_installed_z_mm,
    "The physically rotated and translated cover must align and seat on the tray-wall datum");
assert(printable_layout_cover_x_mm
        > printable_layout_tray_x_mm + enclosure_outer_width_mm,
    "Printable tray and cover require positive separation");
assert(printable_layout_width_mm < print_bed_width_mm
        && printable_layout_depth_mm < print_bed_depth_mm,
    "Printable layout requires positive bed margins");
assert(!default_layout_inputs
        || (abs(printable_layout_width_mm - 255.5) < 0.000001
            && abs(printable_layout_depth_mm - 186.5) < 0.000001),
    "Default printable layout must be 255.5 by 186.5");
assert(printable_layout_foot_1_y_mm
            > printable_layout_tray_y_mm + enclosure_outer_depth_mm
        && printable_layout_foot_2_x_mm
            > printable_layout_foot_1_x_mm
                + vertical_support_base_width_mm,
    "All four printable objects require positive separation");
assert(printable_layout_tray_x_mm > 0
        && printable_layout_tray_y_mm > 0
        && printable_layout_cover_x_mm > 0
        && printable_layout_cover_y_mm > 0
        && printable_layout_foot_1_x_mm > 0
        && printable_layout_foot_1_y_mm > 0
        && printable_layout_foot_2_x_mm > 0
        && printable_layout_foot_2_y_mm > 0
        && printable_layout_foot_2_x_mm + vertical_support_base_width_mm
            < print_bed_width_mm
        && printable_layout_foot_2_y_mm + vertical_support_foot_length_mm
            < print_bed_depth_mm,
    "Every printable object requires positive P2S bed margins");

// ======================================================
// Reference Envelopes And Helpers
// ======================================================

module switch_reference() {
    color(switch_preview_colour, 1 - reference_transparency)
        translate([switch_origin_x_mm, switch_origin_y_mm, switch_origin_z_mm])
            rounded_rect_prism(
                switch_width_mm,
                switch_depth_mm,
                switch_height_mm,
                switch_corner_radius_mm
            );
}

module cable_reference_node(point_mm, diameter_mm, preview_colour) {
    color(preview_colour, 1 - reference_transparency)
        translate(point_mm)
            sphere(d = diameter_mm);
}

module cable_reference_segment(start_mm, end_mm, diameter_mm, preview_colour) {
    hull() {
        cable_reference_node(start_mm, diameter_mm, preview_colour);
        cable_reference_node(end_mm, diameter_mm, preview_colour);
    }
}

module cable_reference_path(points_mm, diameter_mm, preview_colour) {
    for (point_index = [0 : len(points_mm) - 2]) {
        cable_reference_segment(
            points_mm[point_index],
            points_mm[point_index + 1],
            diameter_mm,
            preview_colour
        );
    }
}

module flat_cable_reference_node(point_mm, width_mm, thickness_mm,
        tangent_angle_deg, preview_colour) {
    color(preview_colour, 1 - reference_transparency)
        translate(point_mm)
            rotate([0, 0, tangent_angle_deg - 90])
                cube([width_mm, 0.2, thickness_mm], center = true);
}

module flat_cable_reference_segment(start_mm, end_mm, width_mm, thickness_mm,
        preview_colour) {
    tangent_angle_deg = atan2(
        end_mm[1] - start_mm[1],
        end_mm[0] - start_mm[0]
    );
    hull() {
        flat_cable_reference_node(
            start_mm, width_mm, thickness_mm, tangent_angle_deg, preview_colour
        );
        flat_cable_reference_node(
            end_mm, width_mm, thickness_mm, tangent_angle_deg, preview_colour
        );
    }
}

module flat_cable_reference_path(points_mm, width_mm, thickness_mm,
        preview_colour) {
    for (point_index = [0 : len(points_mm) - 2]) {
        flat_cable_reference_segment(
            points_mm[point_index],
            points_mm[point_index + 1],
            width_mm,
            thickness_mm,
            preview_colour
        );
    }
}

module cable_reference_arc(
    center_mm,
    radius_mm,
    start_angle_deg,
    end_angle_deg,
    diameter_mm,
    preview_colour
) {
    arc_step_count = max(1, ceil(abs(end_angle_deg - start_angle_deg) / 10));
    for (arc_step = [0 : arc_step_count - 1]) {
        angle_1_deg = start_angle_deg
            + (end_angle_deg - start_angle_deg) * arc_step / arc_step_count;
        angle_2_deg = start_angle_deg
            + (end_angle_deg - start_angle_deg) * (arc_step + 1) / arc_step_count;
        cable_reference_segment(
            [
                center_mm[0] + radius_mm * cos(angle_1_deg),
                center_mm[1] + radius_mm * sin(angle_1_deg),
                reference_cable_z_mm
            ],
            [
                center_mm[0] + radius_mm * cos(angle_2_deg),
                center_mm[1] + radius_mm * sin(angle_2_deg),
                reference_cable_z_mm
            ],
            diameter_mm,
            preview_colour
        );
    }
}

module flat_cable_reference_arc(
    center_mm,
    radius_mm,
    start_angle_deg,
    end_angle_deg,
    route_z_mm,
    width_mm,
    thickness_mm,
    preview_colour
) {
    arc_step_count = max(1, ceil(abs(end_angle_deg - start_angle_deg) / 10));
    for (arc_step = [0 : arc_step_count - 1]) {
        angle_1_deg = start_angle_deg
            + (end_angle_deg - start_angle_deg) * arc_step / arc_step_count;
        angle_2_deg = start_angle_deg
            + (end_angle_deg - start_angle_deg) * (arc_step + 1) / arc_step_count;
        flat_cable_reference_segment(
            [
                center_mm[0] + radius_mm * cos(angle_1_deg),
                center_mm[1] + radius_mm * sin(angle_1_deg),
                route_z_mm
            ],
            [
                center_mm[0] + radius_mm * cos(angle_2_deg),
                center_mm[1] + radius_mm * sin(angle_2_deg),
                route_z_mm
            ],
            width_mm,
            thickness_mm,
            preview_colour
        );
    }
}

module minimum_bend_radius_reference(center_mm, preview_colour = bend_reference_colour) {
    color(preview_colour, 1 - reference_transparency)
        translate(center_mm)
            difference() {
                cylinder(
                    r = minimum_cable_bend_radius_mm + uplink_cable_diameter_mm / 2,
                    h = uplink_cable_diameter_mm,
                    center = true
                );
                cylinder(
                    r = minimum_cable_bend_radius_mm - uplink_cable_diameter_mm / 2,
                    h = uplink_cable_diameter_mm + 0.2,
                    center = true
                );
            }
}

module representative_cable_references() {
    cable_reference_path(
        [
            [uplink_aperture_x_mm, ethernet_wall_y_mm, uplink_reference_z_mm],
            [uplink_route_entry_x_mm, uplink_guide_center_mm[1],
                reference_cable_z_mm]
        ],
        uplink_cable_diameter_mm,
        uplink_cable_preview_colour
    );
    cable_reference_arc(
        uplink_guide_center_mm,
        uplink_route_radius_mm,
        0,
        360,
        uplink_cable_diameter_mm,
        uplink_cable_preview_colour
    );
    cable_reference_path(
        [
            [uplink_route_entry_x_mm, uplink_guide_center_mm[1],
                reference_cable_z_mm],
            [uplink_route_entry_x_mm, switch_side_service_y_mm,
                reference_cable_z_mm]
        ],
        uplink_cable_diameter_mm,
        uplink_cable_preview_colour
    );

    for (device_index = [0 : device_cable_count - 1]) {
        device_route_x_mm = device_aperture_x_mm;
        device_route_z_mm = device_route_bundle_bottom_z_mm
            + (device_index + 0.5) * device_cable_thickness_mm;
        device_aperture_z_mm = device_bundle_bottom_z_mm
            + (device_index + 0.5) * device_cable_thickness_mm;
        flat_cable_reference_arc(
            device_transition_first_center_mm,
            device_transition_radius_mm,
            180,
            180 - device_transition_angle_deg,
            device_aperture_z_mm,
            device_cable_width_mm,
            device_cable_thickness_mm,
            device_cable_preview_colours[device_index % len(device_cable_preview_colours)]
        );
        flat_cable_reference_arc(
            device_transition_second_center_mm,
            device_transition_radius_mm,
            -device_transition_angle_deg,
            0,
            device_aperture_z_mm,
            device_cable_width_mm,
            device_cable_thickness_mm,
            device_cable_preview_colours[device_index % len(device_cable_preview_colours)]
        );
        flat_cable_reference_path(
            [
                [device_route_entry_x_mm, device_transition_end_y_mm,
                    device_aperture_z_mm],
                [device_route_entry_x_mm, device_guide_center_mm[1],
                    device_route_z_mm]
            ],
            device_cable_width_mm,
            device_cable_thickness_mm,
            device_cable_preview_colours[device_index % len(device_cable_preview_colours)]
        );
        flat_cable_reference_arc(
            device_guide_center_mm,
            device_route_radius_mm,
            180,
            -180,
            device_route_z_mm,
            device_cable_width_mm,
            device_cable_thickness_mm,
            device_cable_preview_colours[device_index % len(device_cable_preview_colours)]
        );
        flat_cable_reference_path(
            [
                [device_route_entry_x_mm, device_guide_center_mm[1],
                    device_route_z_mm],
                [device_route_entry_x_mm, switch_side_service_y_mm,
                    device_route_z_mm]
            ],
            device_cable_width_mm,
            device_cable_thickness_mm,
            device_cable_preview_colours[device_index % len(device_cable_preview_colours)]
        );
    }

    cable_reference_path(
        [
            [power_pass_through_center_x_mm, power_head_reference_inner_y_mm,
                power_pass_through_center_z_mm],
            [power_pass_through_center_x_mm, power_head_reference_outer_y_mm,
                power_pass_through_center_z_mm]
        ],
        power_head_reference_diameter_mm,
        power_cable_preview_colour
    );
}

module reference_geometry() {
    if (show_switch_reference) {
        switch_reference();
    }

    if (show_cable_references) {
        representative_cable_references();
    }

    if (show_cable_references && show_minimum_bend_reference) {
        minimum_bend_radius_reference([
            cable_storage_depth_mm > 0 ? reference_route_left_x_mm : 0,
            cable_storage_center_y_mm,
            reference_cable_z_mm
        ]);
    }
}

// ======================================================
// Printable Geometry Integration Points
// ======================================================

module rounded_rect_prism(width_mm, depth_mm, height_mm, radius_mm) {
    safe_radius_mm = min(radius_mm, min(width_mm, depth_mm) / 2);

    hull() {
        for (x_mm = [safe_radius_mm, width_mm - safe_radius_mm]) {
            for (y_mm = [safe_radius_mm, depth_mm - safe_radius_mm]) {
                translate([x_mm, y_mm, 0])
                    cylinder(r = safe_radius_mm, h = height_mm);
            }
        }
    }
}

module tray_shell() {
    difference() {
        rounded_rect_prism(
            enclosure_outer_width_mm,
            enclosure_outer_depth_mm,
            tray_floor_thickness_mm + tray_wall_height_mm,
            outer_corner_radius_mm
        );
        translate([wall_thickness_mm, wall_thickness_mm, tray_floor_thickness_mm])
            rounded_rect_prism(
                enclosure_inner_width_mm,
                enclosure_inner_depth_mm,
                tray_wall_height_mm + 0.1,
                inner_corner_radius_mm
            );
    }
}

module rounded_y_wall_passage(
    center_x_mm,
    start_y_mm,
    depth_mm,
    bottom_z_mm,
    width_mm,
    height_mm,
    rounding_mm
) {
    safe_rounding_mm = min(rounding_mm, min(width_mm, height_mm) / 2);
    hull() {
        for (x_mm = [
            center_x_mm - width_mm / 2 + safe_rounding_mm,
            center_x_mm + width_mm / 2 - safe_rounding_mm
        ]) {
            for (z_mm = [
                bottom_z_mm + safe_rounding_mm,
                bottom_z_mm + height_mm - safe_rounding_mm
            ]) {
                translate([x_mm, start_y_mm, z_mm])
                    rotate([-90, 0, 0])
                        cylinder(r = safe_rounding_mm, h = depth_mm);
            }
        }
    }
}

module tray_service_and_sightline_openings() {
    ethernet_passage_depth_mm = wall_thickness_mm
        + 2 * aperture_side_clearance_mm;
    rounded_y_wall_passage(
        uplink_aperture_x_mm,
        -aperture_side_clearance_mm,
        ethernet_passage_depth_mm,
        uplink_aperture_bottom_z_mm,
        uplink_aperture_width_mm,
        uplink_aperture_height_mm + aperture_side_clearance_mm,
        aperture_edge_rounding_mm
    );
    rounded_y_wall_passage(
        device_aperture_x_mm,
        -aperture_side_clearance_mm,
        ethernet_passage_depth_mm,
        device_aperture_bottom_z_mm,
        device_aperture_width_mm,
        device_aperture_height_mm + aperture_side_clearance_mm,
        aperture_edge_rounding_mm
    );
    translate([
        power_pass_through_center_x_mm,
        power_pass_through_cut_start_y_mm,
        power_pass_through_center_z_mm
    ])
        rotate([-90, 0, 0])
            cylinder(
                d = power_pass_through_diameter_mm,
                h = power_pass_through_cut_depth_mm
            );

    // This closed wall window is a sightline, not a top-open cable aperture.
    rounded_y_wall_passage(
        led_sightline_x_mm,
        -led_sightline_clearance_mm,
        wall_thickness_mm + 2 * led_sightline_clearance_mm,
        led_sightline_safe_center_z_mm - led_sightline_height_mm / 2,
        led_sightline_width_mm,
        led_sightline_height_mm,
        min(aperture_edge_rounding_mm, led_sightline_height_mm / 2)
    );
}

module tray_cover_latch_release_openings() {
    // The top edge of each opposed window is a positive capture shoulder.
    // Pinching both exposed hook faces inward clears those shoulders and
    // releases the cover without tools or permanent deformation.
    for (opening_x_mm = [
        -geometry_overlap_mm,
        enclosure_outer_width_mm - wall_thickness_mm - geometry_overlap_mm
    ]) {
        translate([
            opening_x_mm,
            cover_latch_center_y_mm
                - cover_latch_release_access_width_mm / 2,
            cover_latch_release_bottom_z_mm
        ])
            cube([
                wall_thickness_mm + 2 * geometry_overlap_mm,
                cover_latch_release_access_width_mm,
                cover_latch_release_access_height_mm
            ]);
    }
}

module rounded_z_vent(center_x_mm, center_y_mm, slot_width_mm, slot_length_mm,
        start_z_mm, depth_mm) {
    end_offset_mm = max(0, (slot_length_mm - slot_width_mm) / 2);
    hull() {
        for (y_mm = [center_y_mm - end_offset_mm, center_y_mm + end_offset_mm]) {
            translate([center_x_mm, y_mm, start_z_mm])
                cylinder(d = slot_width_mm, h = depth_mm);
        }
    }
}

module rounded_x_floor_vent(center_x_mm, center_y_mm, slot_width_mm,
        slot_length_mm, start_z_mm, depth_mm) {
    end_offset_mm = max(0, (slot_length_mm - slot_width_mm) / 2);
    hull() {
        for (x_mm = [center_x_mm - end_offset_mm, center_x_mm + end_offset_mm]) {
            translate([x_mm, center_y_mm, start_z_mm])
                cylinder(d = slot_width_mm, h = depth_mm);
        }
    }
}

module tray_ventilation_openings() {
    // Horizontal floor slots occupy the derived clear aisle in cable storage.
    // This avoids placing a nominal inlet underneath the solid switch body and
    // keeps every opening away from guides, default routes, and service slots.
    for (vent_index = [0 : bottom_vent_count - 1]) {
        vent_y_mm = bottom_vent_center_y_mm
            + (vent_index - (bottom_vent_count - 1) / 2)
                * bottom_vent_spacing_mm;
        rounded_x_floor_vent(
            bottom_vent_center_x_mm,
            vent_y_mm,
            bottom_vent_width_mm,
            bottom_vent_length_mm,
            -geometry_overlap_mm,
            tray_floor_thickness_mm + 2 * geometry_overlap_mm
        );
    }

    // Elevated side slots occupy the switch-bay long walls.  The open internal
    // volume communicates with the cable-storage floor inlet without adding
    // another cable-service aperture or assuming vent locations in the switch.
    for (vent_index = [0 : side_vent_count - 1]) {
        vent_y_mm = side_vent_center_y_mm
            + (vent_index - (side_vent_count - 1) / 2)
                * side_vent_spacing_mm;
        for (vent_x_mm = [-geometry_overlap_mm,
                enclosure_outer_width_mm - wall_thickness_mm
                    - geometry_overlap_mm]) {
            translate([vent_x_mm, vent_y_mm - side_vent_width_mm / 2,
                    side_vent_bottom_z_mm])
                cube([
                    wall_thickness_mm + 2 * geometry_overlap_mm,
                    side_vent_width_mm,
                    side_vent_height_mm
                ]);
        }
    }
}

module hourglass_routing_guide(center_mm) {
    profile_points = concat(
        [[0, 0], [routing_guide_shoulder_radius_mm, 0],
            [routing_guide_shoulder_radius_mm,
                routing_guide_lower_transition_start_z_mm]],
        [for (profile_step = [1 : routing_guide_profile_steps])
            [smooth_profile_radius_mm(
                routing_guide_shoulder_radius_mm,
                routing_guide_waist_radius_mm,
                profile_step,
                routing_guide_profile_steps
            ), routing_guide_lower_transition_start_z_mm
                + routing_guide_transition_height_mm
                    * profile_step / routing_guide_profile_steps]],
        [[routing_guide_waist_radius_mm,
            routing_guide_upper_transition_start_z_mm]],
        [for (profile_step = [1 : routing_guide_profile_steps])
            [smooth_profile_radius_mm(
                routing_guide_waist_radius_mm,
                routing_guide_shoulder_radius_mm,
                profile_step,
                routing_guide_profile_steps
            ), routing_guide_upper_transition_start_z_mm
                + routing_guide_transition_height_mm
                    * profile_step / routing_guide_profile_steps]],
        [[routing_guide_shoulder_radius_mm,
            routing_guide_height_mm - routing_guide_top_rounding_mm]],
        [for (profile_step = [1 : routing_guide_profile_steps])
            [routing_guide_shoulder_radius_mm
                    - routing_guide_top_rounding_mm
                    + routing_guide_top_rounding_mm
                        * cos(90 * profile_step / routing_guide_profile_steps),
                routing_guide_height_mm - routing_guide_top_rounding_mm
                    + routing_guide_top_rounding_mm
                        * sin(90 * profile_step / routing_guide_profile_steps)]],
        [[0, routing_guide_height_mm]]
    );
    translate([
        center_mm[0],
        center_mm[1],
        routing_guide_geometry_base_z_mm
    ])
        rotate_extrude(convexity = 10)
            polygon(profile_points);
}

module cable_routing_guides() {
    hourglass_routing_guide(uplink_guide_center_mm);
    hourglass_routing_guide(device_guide_center_mm);
}

module uplink_device_exit_divider() {
    divider_center_x_mm = (uplink_aperture_x_mm + device_aperture_x_mm) / 2;
    translate([
        divider_center_x_mm - uplink_device_divider_thickness_mm / 2,
        wall_thickness_mm - geometry_overlap_mm,
        tray_floor_thickness_mm - geometry_overlap_mm
    ])
        rounded_rect_prism(
            uplink_device_divider_thickness_mm,
            uplink_device_divider_length_mm,
            uplink_device_divider_height_mm + geometry_overlap_mm,
            uplink_device_divider_thickness_mm / 2
        );
}

module switch_side_retention_rails() {
    rail_y_mm = switch_origin_y_mm + switch_rail_end_clearance_mm;

    translate([
        wall_thickness_mm,
        rail_y_mm,
        tray_floor_thickness_mm - geometry_overlap_mm
    ])
        cube([
            retention_rail_intrusion_mm,
            switch_retention_rail_length_mm,
            switch_rail_height_mm + geometry_overlap_mm
        ]);

    translate([
        enclosure_outer_width_mm
            - wall_thickness_mm
            - retention_rail_intrusion_mm,
        rail_y_mm,
        tray_floor_thickness_mm - geometry_overlap_mm
    ])
        cube([
            retention_rail_intrusion_mm,
            switch_retention_rail_length_mm,
            switch_rail_height_mm + geometry_overlap_mm
        ]);
}

module switch_end_retention_stops() {
    for (stop_x_mm = [
        switch_origin_x_mm,
        switch_origin_x_mm + switch_width_mm - switch_stop_width_mm
    ]) {
        // Low corner stops leave the central RJ45/LED and DC-input regions open.
        translate([
            stop_x_mm,
            switch_origin_y_mm
                - switch_end_clearance_mm
                - switch_stop_depth_mm,
            tray_floor_thickness_mm - geometry_overlap_mm
        ])
            cube([
                switch_stop_width_mm,
                switch_stop_depth_mm,
                switch_stop_height_mm + geometry_overlap_mm
            ]);

        translate([
            stop_x_mm,
            switch_origin_y_mm
                + switch_depth_mm
                + switch_end_clearance_mm,
            tray_floor_thickness_mm - geometry_overlap_mm
        ])
            cube([
                switch_stop_width_mm,
                switch_stop_depth_mm,
                switch_stop_height_mm + geometry_overlap_mm
            ]);
    }
}

module cover_retention_socket(socket_x_mm, socket_y_mm) {
    socket_bottom_z_mm = cover_installed_z_mm - cover_pin_height_mm;

    difference() {
        union() {
            translate([socket_x_mm, socket_y_mm, socket_bottom_z_mm])
                cylinder(
                    d = cover_socket_outer_diameter_mm,
                    h = cover_pin_height_mm
                );

            // The web owns the socket structurally; neither switch nor cable
            // geometry is required for cover retention.
            hull() {
                translate([socket_x_mm, socket_y_mm, socket_bottom_z_mm])
                    cylinder(
                        d = cover_socket_outer_diameter_mm,
                        h = cover_pin_height_mm
                    );
                translate([
                    socket_x_mm < enclosure_outer_width_mm / 2
                        ? wall_thickness_mm / 2
                        : enclosure_outer_width_mm - wall_thickness_mm / 2,
                    socket_y_mm,
                    socket_bottom_z_mm
                ])
                    cylinder(
                        d = wall_thickness_mm,
                        h = cover_pin_height_mm
                    );
            }
        }

        translate([socket_x_mm, socket_y_mm, socket_bottom_z_mm - 0.1])
            cylinder(
                d = cover_pin_socket_diameter_mm,
                h = cover_pin_height_mm + 0.2
            );
    }
}

module tray_cover_retention_sockets() {
    for (socket_x_mm = cover_retention_x_positions_mm) {
        for (socket_y_mm = cover_retention_y_positions_mm) {
            cover_retention_socket(socket_x_mm, socket_y_mm);
        }
    }
}

module vertical_support_engagement_recess(center_y_mm, left_side) {
    socket_y_mm = center_y_mm - vertical_support_foot_length_mm / 2;
    entry_x_mm = left_side
        ? -geometry_overlap_mm
        : enclosure_outer_width_mm - vertical_support_socket_entry_depth_mm;
    head_x_mm = left_side
        ? vertical_support_socket_entry_depth_mm - geometry_overlap_mm
        : enclosure_outer_width_mm - vertical_support_socket_total_depth_mm;

    translate([
        entry_x_mm,
        socket_y_mm,
        vertical_support_engagement_center_z_mm
            - vertical_support_stem_channel_width_mm / 2
    ])
        cube([
            vertical_support_socket_entry_depth_mm + geometry_overlap_mm,
            vertical_support_foot_length_mm,
            vertical_support_stem_channel_width_mm
        ]);

    translate([
        head_x_mm,
        socket_y_mm,
        vertical_support_engagement_center_z_mm
            - vertical_support_head_channel_width_mm / 2
    ])
        cube([
            vertical_support_socket_head_depth_mm + geometry_overlap_mm,
            vertical_support_foot_length_mm,
            vertical_support_head_channel_width_mm
        ]);
}

module tray_vertical_support_engagement_recesses() {
    for (center_y_mm = vertical_support_depth_positions_mm) {
        vertical_support_engagement_recess(center_y_mm, true);
        vertical_support_engagement_recess(center_y_mm, false);
    }
}

// Print broad-base-down.  The central relief lets both halves of the tapered
// T-head flex inward during insertion, then spring into a recessed tray socket.
// The uninterrupted lower base keeps each foot connected and table-stable.
module vertical_support_foot() {
    difference() {
        union() {
            rounded_rect_prism(
                vertical_support_base_width_mm,
                vertical_support_foot_length_mm,
                vertical_support_base_thickness_mm,
                min(outer_corner_radius_mm,
                    vertical_support_foot_length_mm / 2)
            );

            translate([
                (vertical_support_base_width_mm
                        - vertical_support_engagement_stem_width_mm) / 2,
                vertical_support_fit_clearance_mm,
                vertical_support_base_thickness_mm - geometry_overlap_mm
            ])
                cube([
                    vertical_support_engagement_stem_width_mm,
                    vertical_support_engagement_length_mm,
                    vertical_support_foot_stem_height_mm + geometry_overlap_mm
                ]);

            hull() {
                translate([
                    (vertical_support_base_width_mm
                            - vertical_support_engagement_head_width_mm) / 2,
                    vertical_support_fit_clearance_mm,
                    vertical_support_base_thickness_mm
                        + vertical_support_foot_stem_height_mm
                        - geometry_overlap_mm
                ])
                    cube([
                        vertical_support_engagement_head_width_mm,
                        vertical_support_engagement_length_mm,
                        geometry_overlap_mm
                    ]);
                translate([
                    (vertical_support_base_width_mm
                            - vertical_support_engagement_stem_width_mm) / 2,
                    vertical_support_fit_clearance_mm,
                    vertical_support_foot_total_height_mm
                        - geometry_overlap_mm
                ])
                    cube([
                        vertical_support_engagement_stem_width_mm,
                        vertical_support_engagement_length_mm,
                        geometry_overlap_mm
                    ]);
            }
        }

        translate([
            (vertical_support_base_width_mm
                    - vertical_support_flexure_slot_width_mm) / 2,
            vertical_support_fit_clearance_mm - geometry_overlap_mm,
            vertical_support_base_thickness_mm
                - vertical_support_flexure_slot_depth_mm
        ])
            cube([
                vertical_support_flexure_slot_width_mm,
                vertical_support_engagement_length_mm
                    + 2 * geometry_overlap_mm,
                vertical_support_foot_total_height_mm
            ]);
    }
}

module bottom_tray() {
    union() {
        difference() {
            tray_shell();
            tray_service_and_sightline_openings();
            tray_ventilation_openings();
            tray_cover_latch_release_openings();
            tray_vertical_support_engagement_recesses();
        }
        switch_side_retention_rails();
        switch_end_retention_stops();
        tray_cover_retention_sockets();
        cable_routing_guides();
        uplink_device_exit_divider();
    }
}

module cover_ventilation_openings() {
    // Roof slots form the high outlet of the passive path. Their central
    // switch-bay bank avoids all four retention pads and corner pin features.
    for (vent_index = [0 : top_vent_count - 1]) {
        vent_x_mm = top_vent_center_x_mm
            + (vent_index - (top_vent_count - 1) / 2)
                * top_vent_spacing_mm;
        rounded_z_vent(
            vent_x_mm,
            top_vent_center_y_mm,
            top_vent_width_mm,
            top_vent_length_mm,
            -geometry_overlap_mm,
            cover_thickness_mm + 2 * geometry_overlap_mm
        );
    }
}

module cover_receiver_relief(receiver_x_mm, receiver_y_mm) {
    wall_anchor_x_mm = receiver_x_mm < enclosure_outer_width_mm / 2
        ? wall_thickness_mm / 2
        : enclosure_outer_width_mm - wall_thickness_mm / 2;

    // Match the complete unchanged tray receiver, expanding both its boss and
    // wall-owning web by the cover fit clearance plus the physical-fit
    // calibration allowance. This cut affects the skirt only; the roof and
    // coaxial alignment pin remain solid.
    hull() {
        translate([
            receiver_x_mm,
            receiver_y_mm,
            cover_receiver_relief_bottom_z_mm
        ])
            cylinder(
                d = cover_receiver_boss_relief_diameter_mm,
                h = cover_receiver_relief_height_mm
            );
        translate([
            wall_anchor_x_mm,
            receiver_y_mm,
            cover_receiver_relief_bottom_z_mm
        ])
            cylinder(
                d = cover_receiver_web_relief_diameter_mm,
                h = cover_receiver_relief_height_mm
            );
    }
}

module cover_skirt() {
    skirt_x_mm = wall_thickness_mm + cover_fit_clearance_mm;
    skirt_y_mm = wall_thickness_mm + cover_fit_clearance_mm;

    difference() {
        translate([
            skirt_x_mm,
            skirt_y_mm,
            cover_thickness_mm - geometry_overlap_mm
        ])
            difference() {
                rounded_rect_prism(
                    cover_skirt_outer_width_mm,
                    cover_skirt_outer_depth_mm,
                    cover_skirt_depth_mm + geometry_overlap_mm,
                    max(0.1, inner_corner_radius_mm - cover_fit_clearance_mm)
                );
                translate([wall_thickness_mm, wall_thickness_mm, -0.1])
                    rounded_rect_prism(
                        cover_skirt_inner_width_mm,
                        cover_skirt_inner_depth_mm,
                        cover_skirt_depth_mm + geometry_overlap_mm + 0.2,
                        max(
                            0.1,
                            inner_corner_radius_mm
                                - cover_fit_clearance_mm
                                - wall_thickness_mm
                        )
                    );
            }

        // Reliefs keep the locating skirt clear of each complete receiver.
        for (pin_x_mm = cover_retention_x_positions_mm) {
            for (pin_y_mm = cover_retention_y_positions_mm) {
                cover_receiver_relief(pin_x_mm, pin_y_mm);
            }
        }

        // Free the two cantilever tongues from the otherwise continuous skirt.
        for (relief_x_mm = [
            skirt_x_mm - geometry_overlap_mm,
            enclosure_outer_width_mm
                - skirt_x_mm
                - wall_thickness_mm
                - geometry_overlap_mm
        ]) {
            translate([
                relief_x_mm,
                cover_latch_center_y_mm
                    - cover_latch_release_access_width_mm / 2,
                cover_thickness_mm - 2 * geometry_overlap_mm
            ])
                cube([
                    wall_thickness_mm + 2 * geometry_overlap_mm,
                    cover_latch_release_access_width_mm,
                    cover_skirt_depth_mm + 4 * geometry_overlap_mm
                ]);
        }

        // Installed, both cuts share their tray aperture X envelopes and run
        // continuously from the tray passage through the skirt inner face.
        // Starting at the roof underside leaves the exterior roof intact.
        for (relief_index = [0 : len(cover_ethernet_relief_local_centers_x_mm) - 1]) {
            relief_width_mm = cover_ethernet_relief_widths_mm[relief_index];
            translate([
                cover_ethernet_relief_local_centers_x_mm[relief_index]
                    - relief_width_mm / 2,
                ethernet_passage_start_y_mm,
                cover_ethernet_relief_bottom_z_mm
            ])
                cube([
                    relief_width_mm,
                    cover_ethernet_relief_depth_mm,
                    cover_ethernet_relief_height_mm
                ]);
        }
    }
}

module cover_positive_snap_catch(left_side) {
    arm_x_mm = left_side
        ? cover_latch_arm_outer_x_positions_mm[0]
        : cover_latch_arm_outer_x_positions_mm[1];
    arm_y_mm = cover_latch_center_y_mm
        - cover_latch_arm_width_mm / 2;
    hook_x_mm = left_side
        ? arm_x_mm - cover_latch_hook_projection_mm
        : arm_x_mm + cover_latch_flexure_thickness_mm;

    // Roof-rooted cantilever keeps its fixed flexure length. The tapered entry
    // continues beyond its free end, while the fixed ledge captures the window
    // shoulder at its existing height.
    translate([arm_x_mm, arm_y_mm, cover_thickness_mm - geometry_overlap_mm])
        cube([
            cover_latch_flexure_thickness_mm,
            cover_latch_arm_width_mm,
            cover_latch_flexure_length_mm + geometry_overlap_mm
        ]);

    hull() {
        translate([
            hook_x_mm,
            arm_y_mm,
            cover_latch_capture_ledge_local_z_mm
        ])
            cube([
                cover_latch_hook_projection_mm,
                cover_latch_arm_width_mm,
                geometry_overlap_mm
            ]);
        translate([
            arm_x_mm,
            arm_y_mm,
            cover_latch_entry_tip_local_z_mm - geometry_overlap_mm
        ])
            cube([
                cover_latch_flexure_thickness_mm,
                cover_latch_arm_width_mm,
                geometry_overlap_mm
            ]);
    }
}

module cover_positive_snap_catches() {
    cover_positive_snap_catch(true);
    cover_positive_snap_catch(false);
}

module cover_retention_pins() {
    for (pin_x_mm = cover_retention_x_positions_mm) {
        for (pin_y_mm = cover_retention_y_positions_mm) {
            translate([
                pin_x_mm,
                pin_y_mm,
                cover_thickness_mm - geometry_overlap_mm
            ])
                union() {
                    cylinder(
                        d = cover_pin_diameter_mm,
                        h = cover_pin_body_height_mm + geometry_overlap_mm
                    );
                    translate([
                        0,
                        0,
                        cover_pin_body_height_mm
                    ])
                        cylinder(
                            d1 = cover_pin_diameter_mm,
                            d2 = cover_pin_tip_diameter_mm,
                            h = cover_pin_tip_taper_height_mm
                                + geometry_overlap_mm
                        );
                }
        }
    }
}

module cover_vertical_retention_pad(pad_x_mm, pad_y_mm) {
    support_width_mm = max(
        wall_thickness_mm,
        switch_vertical_pad_width_mm - 2 * wall_thickness_mm
    );
    support_depth_mm = max(
        wall_thickness_mm,
        switch_vertical_pad_depth_mm - 2 * wall_thickness_mm
    );

    if (vertical_pad_standoff_height_mm > 0) {
        translate([
            pad_x_mm + (switch_vertical_pad_width_mm - support_width_mm) / 2,
            pad_y_mm + (switch_vertical_pad_depth_mm - support_depth_mm) / 2,
            cover_thickness_mm - geometry_overlap_mm
        ])
            cube([
                support_width_mm,
                support_depth_mm,
                vertical_pad_standoff_height_mm + geometry_overlap_mm
            ]);
    }

    translate([
        pad_x_mm,
        pad_y_mm,
        cover_thickness_mm
            + vertical_pad_standoff_height_mm
            - geometry_overlap_mm
    ])
        cube([
            switch_vertical_pad_width_mm,
            switch_vertical_pad_depth_mm,
            switch_vertical_pad_height_mm + geometry_overlap_mm
        ]);
}

module cover_switch_vertical_retention() {
    pad_y_positions_mm = [
        switch_origin_y_mm + switch_rail_end_clearance_mm,
        switch_origin_y_mm
            + switch_depth_mm
            - switch_rail_end_clearance_mm
            - switch_vertical_pad_depth_mm
    ];

    for (pad_x_mm = [
        switch_origin_x_mm,
        switch_origin_x_mm + switch_width_mm - switch_vertical_pad_width_mm
    ]) {
        for (pad_y_mm = pad_y_positions_mm) {
            cover_vertical_retention_pad(pad_x_mm, pad_y_mm);
        }
    }
}

// The cover is modeled inside-up for printing: its broad outer roof face is on
// Z=0. Assembly composition flips it into its installed orientation.
module top_cover() {
    union() {
        difference() {
            rounded_rect_prism(
                enclosure_outer_width_mm,
                enclosure_outer_depth_mm,
                cover_thickness_mm,
                outer_corner_radius_mm + cover_edge_overhang_mm
            );
            cover_ventilation_openings();
        }
        cover_skirt();
        cover_retention_pins();
        cover_positive_snap_catches();
        cover_switch_vertical_retention();
    }
}

module assembled_enclosure() {
    color(tray_preview_colour) bottom_tray();
    color(cover_preview_colour)
        translate([
            cover_assembly_translate_x_mm,
            0,
            cover_assembly_translate_z_mm
        ])
            rotate([0, cover_assembly_rotate_y_deg, 0])
                top_cover();
    reference_geometry();
}

module installed_vertical_support_feet() {
    for (center_y_mm = vertical_support_depth_positions_mm) {
        translate([
            0,
            center_y_mm - vertical_support_foot_length_mm / 2,
            0
        ])
            color(tray_preview_colour)
                vertical_support_foot();
    }
}

module vertical_assembly_preview() {
    installed_vertical_support_feet();
    if (vertical_standing_side == "left") {
        translate([
            vertical_support_base_width_mm / 2
                + vertical_support_engagement_center_z_mm,
            0,
            vertical_vent_gap_mm
        ])
            rotate([0, -90, 0])
                assembled_enclosure();
    } else {
        translate([
            vertical_support_base_width_mm / 2
                - vertical_support_engagement_center_z_mm,
            0,
            vertical_vent_gap_mm + enclosure_outer_width_mm
        ])
            rotate([0, 90, 0])
                assembled_enclosure();
    }
}

module assembly_preview() {
    if (assembly_orientation == "horizontal") {
        assembled_enclosure();
    } else {
        vertical_assembly_preview();
    }
}

module cable_routing_preview() {
    color(tray_preview_colour) bottom_tray();
    switch_reference();
    representative_cable_references();
    if (show_minimum_bend_reference) {
        minimum_bend_radius_reference([
            reference_route_left_x_mm,
            cable_storage_center_y_mm,
            reference_cable_z_mm
        ]);
    }
}

module printable_layout() {
    assert(printable_layout_fits_bed,
        "Printable layout exceeds configured print bed");
    translate([printable_layout_tray_x_mm, printable_layout_tray_y_mm, 0])
        bottom_tray();
    translate([printable_layout_cover_x_mm, printable_layout_cover_y_mm, 0])
        top_cover();
    translate([printable_layout_foot_1_x_mm, printable_layout_foot_1_y_mm, 0])
        vertical_support_foot();
    translate([printable_layout_foot_2_x_mm, printable_layout_foot_2_y_mm, 0])
        vertical_support_foot();
}

// ======================================================
// Render Dispatcher
// ======================================================

if (render_mode == "assembly") {
    assembly_preview();
} else if (render_mode == "bottom_tray") {
    bottom_tray();
} else if (render_mode == "top_cover") {
    top_cover();
} else if (render_mode == "vertical_support_foot") {
    vertical_support_foot();
} else if (render_mode == "cable_routing_preview") {
    cable_routing_preview();
} else if (render_mode == "printable_layout") {
    printable_layout();
} else {
    echo(str("Unknown render_mode: ", render_mode));
}
