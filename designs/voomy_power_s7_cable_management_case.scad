// Voomy Power S7 cable-management case.
//
// Units: mm
// Source axes: +X points toward visual right, +Y points from front to rear,
// and +Z points upward from the bottom face.
//
// Complete editable design with an upright case body, removable ventilated cap,
// solid removable USB access cover, cable routing, ventilation, and printable layout.

// ======================================================
// Adjustable Parameters
// ======================================================

// Render controls
$fn = 64;
render_mode = "printable_layout";
show_powerstrip_reference = false;
show_cable_references = false;

// Fixed assembled exterior envelope (user supplied)
case_width_mm = 210.0;
case_height_mm = 210.0;
case_depth_mm = 110.0;

// Shell and fit allowances (provisional)
wall_thickness_mm = 3.0;
floor_thickness_mm = 3.0;
cap_roof_thickness_mm = 3.0;
powerstrip_fit_clearance_mm = 1.5;

// Published Voomy Power S7 body envelope
powerstrip_width_mm = 80.0;
powerstrip_depth_mm = 80.0;
powerstrip_height_mm = 88.0;
powerstrip_center_x_mm = -12.0;
powerstrip_center_y_mm = 0.0;

// Cable interfaces
lay_in_passage_width_mm = 20.0;
right_passage_center_angle_deg = 30.0;
maximum_cable_diameter_mm = 12.0;
right_routed_cable_count = 4;
cable_lateral_clearance_mm = 4.0;
cable_contact_edge_radius_mm = 2.0;
rear_passage_center_x_mm = powerstrip_center_x_mm;

// Front USB group and solid removable cover (provisional)
usb_cutout_width_mm = 36.0;
usb_cutout_height_mm = 60.0;
usb_cutout_center_z_mm = 103.5;
usb_group_offset_x_mm = 0.0;
usb_group_offset_z_mm = 0.0;
usb_clip_wall_overlap_mm = 3.0;
usb_clip_fit_clearance_mm = 0.3;
usb_clip_panel_thickness_mm = 3.0;
usb_clip_retention_depth_mm = 5.0;
usb_clip_tab_width_mm = 8.0;
usb_clip_hook_engagement_mm = 0.8;

// Plain cap alignment and retention (provisional)
cap_skirt_clearance_mm = 0.3;
cap_skirt_engagement_depth_mm = 6.0;
cap_clip_count = 4;
cap_clip_flexible_length_mm = 20.0;
cap_clip_width_mm = 12.0;
cap_clip_thickness_mm = 2.4;
cap_clip_root_fillet_radius_mm = 2.0;
cap_clip_lead_in_angle_deg = 45.0;
cap_clip_hook_engagement_mm = 0.8;
cap_clip_interference_mm = 0.6;
cap_clip_release_travel_mm = 1.2;
cap_skirt_thickness_mm = 3.0;
cap_clip_press_pad_projection_mm = 0.6;
cap_clip_press_pad_height_mm = 5.0;
cap_clip_receiver_clearance_mm = 0.3;

// Ventilation grid (provisional)
grid_hex_across_flats_mm = 12.0;
grid_minimum_rib_width_mm = 3.0;
grid_structural_border_mm = 12.0;

// Printable layout
printable_layout_spacing_mm = 8.0;
printable_layout_body_center_y_mm = -59.0;
printable_layout_cap_center_y_mm = 59.0;
printable_layout_clip_center_x_mm = 129.0;
printable_layout_clip_center_y_mm = 0.0;
printable_layout_clip_rotation_deg = 0.0;

// Preview colours
case_body_colour = "Gainsboro";
top_cap_colour = "LightGray";
usb_clip_colour = "Silver";
powerstrip_reference_colour = "DimGray";

// ======================================================
// Derived Values
// ======================================================

eps_mm = 0.02;
capsule_outer_radius_mm = case_depth_mm / 2;
capsule_straight_length_mm = case_width_mm - 2 * capsule_outer_radius_mm;
capsule_tangent_center_offset_x_mm = capsule_straight_length_mm / 2;
smooth_wall_radius_mm = capsule_outer_radius_mm;
smooth_wall_width_mm = case_width_mm;
smooth_wall_depth_mm = case_depth_mm;
floor_plate_contact_radius_mm = capsule_outer_radius_mm;
floor_plate_contact_width_mm = capsule_straight_length_mm
    + 2 * floor_plate_contact_radius_mm;
floor_plate_contact_depth_mm = 2 * floor_plate_contact_radius_mm;
body_height_mm = case_height_mm - cap_roof_thickness_mm;
interior_width_at_straight_run_mm =
    smooth_wall_width_mm - 2 * wall_thickness_mm;
interior_depth_mm = smooth_wall_depth_mm - 2 * wall_thickness_mm;
powerstrip_clear_width_mm = powerstrip_width_mm + 2 * powerstrip_fit_clearance_mm;
powerstrip_clear_depth_mm = powerstrip_depth_mm + 2 * powerstrip_fit_clearance_mm;
right_passage_arc_angle_deg =
    lay_in_passage_width_mm / capsule_outer_radius_mm * 180 / PI;
right_passage_center_x_mm = capsule_tangent_center_offset_x_mm
    + capsule_outer_radius_mm * cos(right_passage_center_angle_deg);
right_passage_center_y_mm =
    capsule_outer_radius_mm * sin(right_passage_center_angle_deg);
right_cable_stack_height_mm =
    right_routed_cable_count * maximum_cable_diameter_mm;
powerstrip_bottom_z_mm = floor_thickness_mm;
powerstrip_top_z_mm = powerstrip_bottom_z_mm + powerstrip_height_mm;
interior_capsule_radius_mm = smooth_wall_radius_mm - wall_thickness_mm;
right_passage_half_angle_deg = right_passage_arc_angle_deg / 2;
right_passage_inner_radius_mm = interior_capsule_radius_mm - eps_mm;
right_passage_inner_half_angle_deg =
    (lay_in_passage_width_mm + 2 * cable_contact_edge_radius_mm)
    / right_passage_inner_radius_mm * 180 / PI / 2;
right_passage_bottom_half_angle_deg =
    (lay_in_passage_width_mm + 2 * cable_contact_edge_radius_mm)
    / capsule_outer_radius_mm * 180 / PI / 2;
capsule_rightmost_exterior_x_mm = capsule_tangent_center_offset_x_mm
    + capsule_outer_radius_mm;
right_passage_top_cut_outer_radius_mm =
    (capsule_outer_radius_mm + eps_mm)
    / min(
        cos(right_passage_center_angle_deg - right_passage_half_angle_deg),
        cos(right_passage_center_angle_deg + right_passage_half_angle_deg)
    );
right_passage_bottom_cut_outer_radius_mm =
    (capsule_outer_radius_mm + eps_mm)
    / min(
        cos(right_passage_center_angle_deg
            - right_passage_bottom_half_angle_deg),
        cos(right_passage_center_angle_deg
            + right_passage_bottom_half_angle_deg)
    );
right_passage_top_outer_front_endpoint_x_mm =
    capsule_tangent_center_offset_x_mm
    + right_passage_top_cut_outer_radius_mm
        * cos(right_passage_center_angle_deg - right_passage_half_angle_deg);
right_passage_top_outer_rear_endpoint_x_mm =
    capsule_tangent_center_offset_x_mm
    + right_passage_top_cut_outer_radius_mm
        * cos(right_passage_center_angle_deg + right_passage_half_angle_deg);
right_passage_bottom_outer_front_endpoint_x_mm =
    capsule_tangent_center_offset_x_mm
    + right_passage_bottom_cut_outer_radius_mm
        * cos(right_passage_center_angle_deg
            - right_passage_bottom_half_angle_deg);
right_passage_bottom_outer_rear_endpoint_x_mm =
    capsule_tangent_center_offset_x_mm
    + right_passage_bottom_cut_outer_radius_mm
        * cos(right_passage_center_angle_deg
            + right_passage_bottom_half_angle_deg);
slot_bottom_z_mm = floor_thickness_mm;
right_cable_first_center_z_mm = slot_bottom_z_mm
    + maximum_cable_diameter_mm / 2;
right_cable_last_center_z_mm = right_cable_first_center_z_mm
    + (right_routed_cable_count - 1) * maximum_cable_diameter_mm;
usb_cutout_center_x_mm =
    powerstrip_center_x_mm + usb_group_offset_x_mm;
usb_cutout_center_from_left_tangent_mm =
    usb_cutout_center_x_mm + capsule_tangent_center_offset_x_mm;
usb_cutout_effective_center_z_mm =
    usb_cutout_center_z_mm + usb_group_offset_z_mm;
usb_cutout_min_z_mm =
    usb_cutout_effective_center_z_mm - usb_cutout_height_mm / 2;
usb_cutout_max_z_mm =
    usb_cutout_effective_center_z_mm + usb_cutout_height_mm / 2;
usb_cutout_default_min_z_mm = 103.5 - usb_cutout_height_mm / 2;
usb_cutout_default_max_z_mm = 103.5 + usb_cutout_height_mm / 2;
usb_cutout_midpoint_center_z_mm = body_height_mm / 2;
usb_cutout_midpoint_min_z_mm =
    usb_cutout_midpoint_center_z_mm - usb_cutout_height_mm / 2;
usb_cutout_midpoint_max_z_mm =
    usb_cutout_midpoint_center_z_mm + usb_cutout_height_mm / 2;
usb_clip_outer_width_mm = usb_cutout_width_mm + 2 * usb_clip_wall_overlap_mm;
usb_clip_outer_height_mm = usb_cutout_height_mm + 2 * usb_clip_wall_overlap_mm;
installed_usb_clip_center_x_mm = usb_cutout_center_x_mm;
installed_usb_clip_center_z_mm = usb_cutout_effective_center_z_mm;
grid_hex_circumradius_mm = grid_hex_across_flats_mm / sqrt(3);
grid_column_pitch_mm = 2 * grid_hex_circumradius_mm + grid_minimum_rib_width_mm;
grid_row_pitch_mm = grid_hex_across_flats_mm + grid_minimum_rib_width_mm;
grid_staggered_center_distance_mm = sqrt(
    pow(grid_column_pitch_mm / 2, 2) + pow(grid_row_pitch_mm, 2)
);
grid_staggered_rib_width_mm =
    grid_staggered_center_distance_mm - 2 * grid_hex_circumradius_mm;
cap_skirt_outer_radius_mm = interior_capsule_radius_mm - cap_skirt_clearance_mm;
cap_skirt_inner_radius_mm = cap_skirt_outer_radius_mm - cap_skirt_thickness_mm;
cap_grid_keepout_radius_mm =
    cap_skirt_inner_radius_mm - grid_structural_border_mm;
cap_grid_center_limit_x_mm = capsule_tangent_center_offset_x_mm
    + cap_grid_keepout_radius_mm - grid_hex_circumradius_mm;
cap_grid_center_limit_y_mm = cap_grid_keepout_radius_mm
    - grid_hex_across_flats_mm / 2;
cap_grid_row_index_max = floor(cap_grid_center_limit_y_mm / grid_row_pitch_mm);
cap_grid_column_index_max =
    floor(cap_grid_center_limit_x_mm / grid_column_pitch_mm);
body_wall_grid_aperture_count = 0;
cap_clip_site_radius_mm = interior_capsule_radius_mm;
cap_clip_front_right_x_mm = 38.0;
cap_clip_left_x_mm = -capsule_tangent_center_offset_x_mm
    - cap_clip_site_radius_mm;
cap_clip_rear_left_x_mm = -42.0;
cap_clip_rear_right_x_mm = 20.0;
cap_clip_receiver_width_mm = cap_clip_width_mm
    + 2 * cap_clip_receiver_clearance_mm;
cap_clip_receiver_height_mm = cap_clip_press_pad_height_mm
    + 2 * cap_clip_receiver_clearance_mm;
cap_clip_hook_start_z_mm = cap_roof_thickness_mm
    + cap_clip_flexible_length_mm - cap_clip_hook_engagement_mm;
cap_clip_catch_bottom_z_mm = body_height_mm
    - cap_clip_flexible_length_mm + cap_clip_hook_engagement_mm;
cap_clip_catch_top_z_mm = cap_clip_catch_bottom_z_mm
    + cap_clip_thickness_mm;
cap_clip_press_pad_installed_bottom_z_mm = cap_clip_catch_top_z_mm
    + cap_clip_receiver_clearance_mm;
cap_clip_press_pad_installed_top_z_mm = cap_clip_press_pad_installed_bottom_z_mm
    + cap_clip_press_pad_height_mm;
cap_clip_press_pad_source_bottom_z_mm = case_height_mm
    - cap_clip_press_pad_installed_top_z_mm;
cap_clip_press_pad_source_top_z_mm = case_height_mm
    - cap_clip_press_pad_installed_bottom_z_mm;
cap_clip_receiver_bottom_z_mm = cap_clip_press_pad_installed_bottom_z_mm
    - cap_clip_receiver_clearance_mm;
cap_clip_receiver_top_z_mm = cap_clip_receiver_bottom_z_mm
    + cap_clip_receiver_height_mm;
cap_clip_receiver_top_bridge_mm = body_height_mm
    - cap_clip_receiver_top_z_mm;
cap_installed_flip_x_deg = 180;
cap_front_right_source_x_mm = cap_clip_front_right_x_mm;
cap_front_right_source_y_mm = cap_clip_site_radius_mm;
cap_front_right_source_angle_deg = 0;
cap_left_source_x_mm = cap_clip_left_x_mm;
cap_left_source_y_mm = 0;
cap_left_source_angle_deg = 90;
cap_rear_left_source_x_mm = cap_clip_rear_left_x_mm;
cap_rear_left_source_y_mm = -cap_clip_site_radius_mm;
cap_rear_left_source_angle_deg = 180;
cap_rear_right_source_x_mm = cap_clip_rear_right_x_mm;
cap_rear_right_source_y_mm = -cap_clip_site_radius_mm;
cap_rear_right_source_angle_deg = 180;
cap_clip_receiver_transforms = [
    [cap_clip_front_right_x_mm, -interior_capsule_radius_mm, 180],
    [-capsule_tangent_center_offset_x_mm - interior_capsule_radius_mm, 0, 90],
    [cap_clip_rear_left_x_mm, interior_capsule_radius_mm, 0],
    [cap_clip_rear_right_x_mm, interior_capsule_radius_mm, 0]
];
cap_clip_receiver_count = len(cap_clip_receiver_transforms);

// ======================================================
// Top-Level Contract Assertions
// ======================================================

assert(case_width_mm == 210.0 && case_height_mm == 210.0 && case_depth_mm == 110.0,
    "The assembled exterior envelope must remain exactly 210 x 210 x 110 mm");
assert(capsule_outer_radius_mm == 55.0,
    "The capsule side radius must be 55 mm");
assert(capsule_straight_length_mm == 100.0,
    "The capsule front and rear tangent runs must be 100 mm");
assert(smooth_wall_radius_mm > wall_thickness_mm,
    "Wall thickness must fit inside the smooth-wall radius");
assert(wall_thickness_mm > 0 && floor_thickness_mm > 0 && cap_roof_thickness_mm > 0,
    "Shell thicknesses must be positive");
assert(lay_in_passage_width_mm >= maximum_cable_diameter_mm + 2 * cable_lateral_clearance_mm,
    "The lay-in passage must preserve nominal cable lateral clearance");
assert(cable_contact_edge_radius_mm >= 2.0,
    "Cable-contact edge treatment must be at least 2 mm");
assert(usb_cutout_center_x_mm - usb_cutout_width_mm / 2 >= -capsule_tangent_center_offset_x_mm
    && usb_cutout_center_x_mm + usb_cutout_width_mm / 2 <= capsule_tangent_center_offset_x_mm,
    "The USB wall cutout must remain within the straight front-wall run");
assert(usb_cutout_min_z_mm >= floor_thickness_mm
    && usb_cutout_max_z_mm <= body_height_mm,
    "The complete USB opening must stay between the interior floor and body top");
assert(usb_clip_outer_width_mm - usb_cutout_width_mm
        == 2 * usb_clip_wall_overlap_mm
    && usb_clip_outer_height_mm - usb_cutout_height_mm
        == 2 * usb_clip_wall_overlap_mm,
    "The solid USB cover must overlap the body cutout by 3 mm on every edge");
assert(usb_clip_outer_width_mm == 42.0
    && usb_clip_outer_height_mm == 66.0
    && usb_clip_panel_thickness_mm >= wall_thickness_mm,
    "The solid USB cover panel must fully close the vertical 36 x 60 mm body cutout");
assert(usb_clip_panel_thickness_mm >= wall_thickness_mm
    && usb_clip_retention_depth_mm > wall_thickness_mm + usb_clip_fit_clearance_mm
    && usb_clip_hook_engagement_mm <= usb_clip_wall_overlap_mm,
    "The USB cover retention geometry must bridge and catch the front wall");
assert(usb_clip_tab_width_mm <= usb_cutout_width_mm / 2
    && usb_cutout_width_mm / 4 + usb_clip_tab_width_mm / 2
        <= usb_cutout_width_mm / 2
    && cap_clip_thickness_mm <= usb_cutout_height_mm / 2,
    "The USB cover snap tabs must fit within and remain accessible through the body opening");
assert(cap_skirt_clearance_mm >= 0.3 && cap_skirt_engagement_depth_mm >= 6.0,
    "Cap skirt clearance or engagement is below the approved minimum");
assert(cap_clip_count == 4 && cap_clip_receiver_count == cap_clip_count,
    "The body requires exactly one closed receiver hole for each of four cap clips");
assert(cap_clip_receiver_width_mm == 12.6
    && cap_clip_receiver_height_mm == 5.6
    && cap_clip_receiver_clearance_mm == 0.3,
    "All four closed cap receiver holes must be exactly 12.6 x 5.6 mm by default");
assert(cap_clip_receiver_top_bridge_mm >= wall_thickness_mm
    && cap_clip_receiver_bottom_z_mm > floor_thickness_mm,
    "Each receiver hole must retain continuous structural wall above and below");
assert(cap_clip_flexible_length_mm >= 20.0 && cap_clip_width_mm >= 12.0
    && cap_clip_thickness_mm >= 2.4 && cap_clip_root_fillet_radius_mm >= 2.0,
    "Cap clip beam dimensions are below approved minimums");
assert(cap_clip_lead_in_angle_deg <= 45.0 && cap_clip_hook_engagement_mm >= 0.8,
    "Cap clip lead-in or hook engagement violates the approved contract");
assert(cap_clip_interference_mm <= 0.6 && cap_clip_release_travel_mm <= 1.2,
    "Cap clip interference or release travel exceeds the approved maximum");
assert(grid_hex_across_flats_mm == 12.0 && grid_minimum_rib_width_mm >= 3.0
    && grid_structural_border_mm >= 12.0,
    "Ventilation grid dimensions violate the approved defaults or minimums");
assert(smooth_wall_width_mm == 210.0 && smooth_wall_depth_mm == 110.0
    && smooth_wall_radius_mm == 55.0,
    "The smooth wall must use the complete 210 x 110 mm capsule outline");
assert(floor_plate_contact_width_mm == 210.0
    && floor_plate_contact_depth_mm == 110.0,
    "The upright body plate-contact footprint must be exactly 210 x 110 mm");
assert(capsule_tangent_center_offset_x_mm * 2 == capsule_straight_length_mm,
    "Capsule end centers must preserve the 100 mm tangent runs");
assert(wall_thickness_mm >= 3.0 && floor_thickness_mm >= 3.0,
    "The body wall and floor must be at least 3 mm thick");
assert(grid_column_pitch_mm - 2 * grid_hex_circumradius_mm
        >= grid_minimum_rib_width_mm
    && grid_row_pitch_mm - grid_hex_across_flats_mm
        >= grid_minimum_rib_width_mm
    && grid_staggered_rib_width_mm >= grid_minimum_rib_width_mm,
    "Ventilation apertures must preserve the minimum grid ribs");
assert(cap_grid_keepout_radius_mm > grid_hex_across_flats_mm / 2
    && cap_skirt_inner_radius_mm - cap_grid_keepout_radius_mm
        >= grid_structural_border_mm
    && capsule_outer_radius_mm - cap_grid_keepout_radius_mm
        >= grid_structural_border_mm,
    "The cap grid must retain its perimeter, skirt, and retention keepouts");
assert(cap_grid_row_index_max >= 1 && cap_grid_column_index_max >= 1,
    "The central cap ventilation field must contain staggered grid candidates");
assert(body_wall_grid_aperture_count == 0,
    "Ventilation apertures are prohibited in every body wall");
assert(powerstrip_width_mm == 80.0 && powerstrip_depth_mm == 80.0
    && powerstrip_height_mm == 88.0,
    "The non-printable Voomy reference must remain exactly 80 x 80 x 88 mm");
assert(powerstrip_fit_clearance_mm == 1.5,
    "The Voomy reference envelope must preserve 1.5 mm nominal clearance");
assert(pow(max(abs(powerstrip_center_x_mm) + powerstrip_clear_width_mm / 2
            - capsule_tangent_center_offset_x_mm, 0), 2)
        + pow(abs(powerstrip_center_y_mm) + powerstrip_clear_depth_mm / 2, 2)
        <= pow(interior_capsule_radius_mm, 2),
    "The Voomy clearance envelope must fit inside the body capsule");
assert(powerstrip_bottom_z_mm == floor_thickness_mm
    && powerstrip_top_z_mm < body_height_mm,
    "The Voomy reference must rest on the floor and fit below the open body top");
assert(usb_cutout_width_mm == 36.0 && usb_cutout_height_mm == 60.0
    && usb_cutout_center_from_left_tangent_mm == 38.0,
    "The USB group opening must retain its approved vertical size and left-biased offset");
assert(usb_cutout_default_min_z_mm == 73.5
    && usb_cutout_default_max_z_mm == 133.5,
    "The default vertical USB opening must span exactly Z 73.5 through 133.5 mm");
assert(usb_cutout_midpoint_center_z_mm == 103.5
    && usb_cutout_midpoint_min_z_mm == 73.5
    && usb_cutout_midpoint_max_z_mm == 133.5,
    "The body-midpoint vertical USB opening must span exactly Z 73.5 through 133.5 mm");
assert(usb_cutout_center_x_mm == powerstrip_center_x_mm + usb_group_offset_x_mm,
    "The USB group opening must derive from the installed power-strip datum");
assert(installed_usb_clip_center_x_mm == usb_cutout_center_x_mm
    && installed_usb_clip_center_z_mm == usb_cutout_effective_center_z_mm,
    "The installed solid USB cover and body cutout centers must align exactly");
assert(installed_usb_clip_center_x_mm - usb_clip_outer_width_mm / 2
        == usb_cutout_center_x_mm - usb_cutout_width_mm / 2
            - usb_clip_wall_overlap_mm
    && installed_usb_clip_center_x_mm + usb_clip_outer_width_mm / 2
        == usb_cutout_center_x_mm + usb_cutout_width_mm / 2
            + usb_clip_wall_overlap_mm
    && installed_usb_clip_center_z_mm - usb_clip_outer_height_mm / 2
        == usb_cutout_effective_center_z_mm - usb_cutout_height_mm / 2
            - usb_clip_wall_overlap_mm
    && installed_usb_clip_center_z_mm + usb_clip_outer_height_mm / 2
        == usb_cutout_effective_center_z_mm + usb_cutout_height_mm / 2
            + usb_clip_wall_overlap_mm,
    "The installed solid USB cover must overlap the centered body cutout on every edge");
assert(rear_passage_center_x_mm - lay_in_passage_width_mm / 2
        >= -capsule_tangent_center_offset_x_mm
    && rear_passage_center_x_mm + lay_in_passage_width_mm / 2
        <= capsule_tangent_center_offset_x_mm,
    "The rear lead slot must remain within the straight rear wall run");
assert(right_passage_arc_angle_deg * capsule_outer_radius_mm
        * PI / 180 == lay_in_passage_width_mm,
    "The right slot must span 20 mm of tangential arc at the outer radius");
assert(right_passage_center_angle_deg
        - right_passage_bottom_half_angle_deg > -90
    && right_passage_center_angle_deg
        + right_passage_bottom_half_angle_deg < 90,
    "The complete right slot must remain within the right semicircle");
assert(slot_bottom_z_mm == floor_thickness_mm
    && body_height_mm > slot_bottom_z_mm,
    "Both lay-in slots must remain continuous from the wall top to the floor");
assert(right_passage_top_outer_front_endpoint_x_mm
        > capsule_rightmost_exterior_x_mm
    && right_passage_top_outer_rear_endpoint_x_mm
        > capsule_rightmost_exterior_x_mm
    && right_passage_bottom_outer_front_endpoint_x_mm
        > capsule_rightmost_exterior_x_mm
    && right_passage_bottom_outer_rear_endpoint_x_mm
        > capsule_rightmost_exterior_x_mm,
    "Every right cable slot outer endpoint must extend beyond the capsule's rightmost exterior X");
assert(right_routed_cable_count == 4
    && right_cable_stack_height_mm == 48.0,
    "The right slot requires four non-overlapping 12 mm cable references");
assert(right_cable_first_center_z_mm - maximum_cable_diameter_mm / 2
        >= floor_thickness_mm
    && right_cable_last_center_z_mm + maximum_cable_diameter_mm / 2
        < body_height_mm,
    "The cable-reference stack must remain within the body height");
assert(right_routed_cable_count < 2
    || (right_cable_last_center_z_mm - right_cable_first_center_z_mm)
        / (right_routed_cable_count - 1) >= maximum_cable_diameter_mm,
    "Cable-reference center spacing must prevent nominal overlap");
assert(lay_in_passage_width_mm < capsule_straight_length_mm
    - 2 * grid_structural_border_mm
    && right_passage_arc_angle_deg < 180,
    "Lay-in passages must leave continuous structural wall regions");
assert(cap_skirt_outer_radius_mm == interior_capsule_radius_mm - 0.3
    && cap_skirt_outer_radius_mm - cap_skirt_inner_radius_mm
        == cap_skirt_thickness_mm,
    "The continuous cap skirt must preserve 0.3 mm per-side clearance");
assert(cap_roof_thickness_mm + cap_skirt_engagement_depth_mm
        < cap_roof_thickness_mm + cap_clip_flexible_length_mm,
    "The alignment skirt must locate the cap before the clip hooks engage");
assert(cap_clip_front_right_x_mm - cap_clip_receiver_width_mm / 2
        >= usb_cutout_center_x_mm + usb_cutout_width_mm / 2
            + grid_structural_border_mm
    && cap_clip_front_right_x_mm + cap_clip_receiver_width_mm / 2
        <= capsule_tangent_center_offset_x_mm,
    "The front-right cap receiver must remain in solid wall beyond the USB keepout");
assert(cap_clip_rear_left_x_mm + cap_clip_receiver_width_mm / 2
        <= rear_passage_center_x_mm - lay_in_passage_width_mm / 2
            - grid_structural_border_mm
    && cap_clip_rear_left_x_mm - cap_clip_receiver_width_mm / 2
        >= -capsule_tangent_center_offset_x_mm
    && cap_clip_rear_right_x_mm - cap_clip_receiver_width_mm / 2
        >= rear_passage_center_x_mm + lay_in_passage_width_mm / 2
            + grid_structural_border_mm
    && cap_clip_rear_right_x_mm + cap_clip_receiver_width_mm / 2
        <= capsule_tangent_center_offset_x_mm,
    "The rear cap receivers must remain split around the rear-passage keepout");
assert(cap_clip_thickness_mm
        + max(cap_clip_press_pad_projection_mm, cap_clip_hook_engagement_mm)
        <= wall_thickness_mm + cap_skirt_clearance_mm,
    "Clip pads and hooks must stay within the fixed cap outline");
assert(cap_installed_flip_x_deg == 180,
    "The cap must use a rigid 180-degree installed flip");
assert(cap_clip_site_radius_mm == 52.0 && cap_clip_left_x_mm == -102.0,
    "Cap clamp sites must use the body receiver radial datum");
assert(cap_front_right_source_x_mm == cap_clip_receiver_transforms[0][0]
    && -cap_front_right_source_y_mm == cap_clip_receiver_transforms[0][1]
    && 180 - cap_front_right_source_angle_deg
        == cap_clip_receiver_transforms[0][2],
    "The installed front-right cap clamp must align with its body receiver");
assert(cap_left_source_x_mm == cap_clip_receiver_transforms[1][0]
    && -cap_left_source_y_mm == cap_clip_receiver_transforms[1][1]
    && 180 - cap_left_source_angle_deg == cap_clip_receiver_transforms[1][2],
    "The installed left-end cap clamp must align with its body receiver");
assert(cap_rear_left_source_x_mm == cap_clip_receiver_transforms[2][0]
    && -cap_rear_left_source_y_mm == cap_clip_receiver_transforms[2][1]
    && 180 - cap_rear_left_source_angle_deg
        == cap_clip_receiver_transforms[2][2],
    "The installed rear-left cap clamp must align with its body receiver");
assert(cap_rear_right_source_x_mm == cap_clip_receiver_transforms[3][0]
    && -cap_rear_right_source_y_mm == cap_clip_receiver_transforms[3][1]
    && 180 - cap_rear_right_source_angle_deg
        == cap_clip_receiver_transforms[3][2],
    "The installed rear-right cap clamp must align with its body receiver");
assert(case_height_mm - cap_clip_hook_start_z_mm
        == cap_clip_catch_bottom_z_mm,
    "Rigidly flipped cap hooks must align receiver catches vertically");
assert(cap_clip_press_pad_source_bottom_z_mm >= cap_roof_thickness_mm
    && cap_clip_press_pad_source_top_z_mm
        <= cap_roof_thickness_mm + cap_clip_flexible_length_mm,
    "Each release pad must remain fully supported by its cantilever beam");
assert(abs(cap_clip_receiver_bottom_z_mm
        - (cap_clip_press_pad_installed_bottom_z_mm
            - cap_clip_receiver_clearance_mm)) < eps_mm
    && abs(cap_clip_receiver_top_z_mm
        - (cap_clip_press_pad_installed_top_z_mm
            + cap_clip_receiver_clearance_mm)) < eps_mm,
    "Rigidly flipped release pads must align inside the closed receiver holes");
assert(abs(cap_clip_receiver_bottom_z_mm - cap_clip_catch_top_z_mm) < eps_mm,
    "Receiver access and catch must meet without overlap");
assert(printable_layout_cap_center_y_mm - capsule_outer_radius_mm
        >= printable_layout_body_center_y_mm + capsule_outer_radius_mm
            + printable_layout_spacing_mm,
    "Printable body and cap must remain separated by the requested spacing");
assert(sqrt(pow(printable_layout_clip_center_x_mm
            - usb_clip_outer_width_mm / 2
            - capsule_tangent_center_offset_x_mm, 2)
        + pow(printable_layout_cap_center_y_mm
            - usb_clip_outer_height_mm / 2, 2))
        >= capsule_outer_radius_mm + printable_layout_spacing_mm,
    "The vertical USB cover must remain separated from both capsule parts");
assert(printable_layout_clip_center_x_mm + usb_clip_outer_width_mm / 2
        + case_width_mm / 2 <= 256.0
    && printable_layout_cap_center_y_mm + capsule_outer_radius_mm
        - (printable_layout_body_center_y_mm - capsule_outer_radius_mm)
        <= 256.0,
    "The printable layout must fit nominally within a 256 x 256 mm plate");

// ======================================================
// Render Dispatch
// ======================================================

if (render_mode == "assembly") {
    voomy_power_s7_case_assembly();
} else if (render_mode == "case_body") {
    voomy_power_s7_case_body();
} else if (render_mode == "top_cap") {
    voomy_power_s7_top_cap();
} else if (render_mode == "usb_passthrough_clip") {
    voomy_power_s7_usb_passthrough_clip();
} else if (render_mode == "printable_layout") {
    voomy_power_s7_printable_layout();
} else {
    assert(false, str("Unsupported render_mode=\"", render_mode, "\""));
}

// ======================================================
// Production Modules
// ======================================================

module voomy_power_s7_case_assembly() {
    voomy_power_s7_case_body();

    translate([0, 0, case_height_mm])
        rotate([cap_installed_flip_x_deg, 0, 0])
            voomy_power_s7_top_cap();

    installed_usb_passthrough_clip();

    if (show_powerstrip_reference)
        color(powerstrip_reference_colour)
            voomy_power_s7_reference();
    if (show_cable_references)
        right_side_cable_references();
}

module voomy_power_s7_case_body() {
    color(case_body_colour)
        union() {
            difference() {
                capsule_shell_and_floor();
                front_usb_group_opening();
                rear_main_lead_slot();
                right_shared_cable_slot();
                cap_clip_receiver_holes();
            }
            cap_clip_receiver_catches();
        }
}

module voomy_power_s7_top_cap() {
    color(top_cap_colour)
        union() {
            difference() {
                capsule_prism(capsule_outer_radius_mm, cap_roof_thickness_mm);
                top_cap_ventilation_grid();
            }
            cap_alignment_skirt();
            cap_retention_clips();
        }
}

module voomy_power_s7_usb_passthrough_clip() {
    color(usb_clip_colour)
        usb_clip_print_geometry();
}

module voomy_power_s7_printable_layout() {
    translate([0, printable_layout_body_center_y_mm, 0])
        voomy_power_s7_case_body();

    translate([0, printable_layout_cap_center_y_mm, 0])
        voomy_power_s7_top_cap();

    translate([
        printable_layout_clip_center_x_mm,
        printable_layout_clip_center_y_mm,
        0
    ])
        rotate([0, 0, printable_layout_clip_rotation_deg])
            voomy_power_s7_usb_passthrough_clip();
}

module usb_clip_solid_panel() {
    translate([
        -usb_clip_outer_width_mm / 2,
        -usb_clip_outer_height_mm / 2,
        0
    ])
        cube([
            usb_clip_outer_width_mm,
            usb_clip_outer_height_mm,
            usb_clip_panel_thickness_mm
        ]);
}

module usb_clip_snap_tab(tab_x_mm, top_tab = true) {
    tab_inner_y_mm = usb_cutout_height_mm / 2 - cap_clip_thickness_mm;
    hook_start_z_mm = usb_clip_panel_thickness_mm + wall_thickness_mm
        + usb_clip_fit_clearance_mm;

    translate([tab_x_mm, 0, 0]) {
        translate([
            -usb_clip_tab_width_mm / 2,
            top_tab ? tab_inner_y_mm : -usb_cutout_height_mm / 2,
            usb_clip_panel_thickness_mm - eps_mm
        ])
            cube([
                usb_clip_tab_width_mm,
                cap_clip_thickness_mm,
                usb_clip_retention_depth_mm + eps_mm
            ]);

        hull() {
            translate([
                -usb_clip_tab_width_mm / 2,
                top_tab ? usb_cutout_height_mm / 2
                    : -usb_cutout_height_mm / 2 - usb_clip_hook_engagement_mm,
                hook_start_z_mm
            ])
                cube([
                    usb_clip_tab_width_mm,
                    usb_clip_hook_engagement_mm,
                    eps_mm
                ]);

            translate([
                -usb_clip_tab_width_mm / 2,
                top_tab ? usb_cutout_height_mm / 2
                    : -usb_cutout_height_mm / 2,
                hook_start_z_mm + usb_clip_hook_engagement_mm
            ])
                cube([
                    usb_clip_tab_width_mm,
                    eps_mm,
                    eps_mm
                ]);
        }

        translate([
            -usb_clip_tab_width_mm / 2,
            top_tab ? tab_inner_y_mm - cap_clip_press_pad_projection_mm
                : -usb_cutout_height_mm / 2 + cap_clip_thickness_mm,
            usb_clip_panel_thickness_mm + 0.8
        ])
            cube([
                usb_clip_tab_width_mm,
                cap_clip_press_pad_projection_mm,
                2.0
            ]);
    }
}

module usb_clip_print_geometry() {
    union() {
        usb_clip_solid_panel();
        usb_clip_snap_tab(-usb_cutout_width_mm / 4, true);
        usb_clip_snap_tab(usb_cutout_width_mm / 4, true);
        usb_clip_snap_tab(-usb_cutout_width_mm / 4, false);
        usb_clip_snap_tab(usb_cutout_width_mm / 4, false);
    }
}

module installed_usb_passthrough_clip() {
    translate([
        installed_usb_clip_center_x_mm,
        -capsule_outer_radius_mm,
        installed_usb_clip_center_z_mm
    ])
        rotate([-90, 0, 0])
            voomy_power_s7_usb_passthrough_clip();
}

module voomy_power_s7_reference() {
    translate([
        powerstrip_center_x_mm - powerstrip_width_mm / 2,
        powerstrip_center_y_mm - powerstrip_depth_mm / 2,
        powerstrip_bottom_z_mm
    ])
        cube([
            powerstrip_width_mm,
            powerstrip_depth_mm,
            powerstrip_height_mm
        ]);
}

// ======================================================
// Capsule Body Geometry
// ======================================================

module capsule_2d(radius_mm) {
    hull() {
        translate([-capsule_tangent_center_offset_x_mm, 0])
            circle(r = radius_mm);
        translate([capsule_tangent_center_offset_x_mm, 0])
            circle(r = radius_mm);
    }
}

module capsule_prism(radius_mm, height_mm) {
    linear_extrude(height = height_mm)
        capsule_2d(radius_mm);
}

module capsule_shell_and_floor() {
    union() {
        capsule_prism(
            floor_plate_contact_radius_mm,
            floor_thickness_mm
        );

        difference() {
            capsule_prism(smooth_wall_radius_mm, body_height_mm);
            translate([0, 0, floor_thickness_mm])
                capsule_prism(
                    smooth_wall_radius_mm - wall_thickness_mm,
                    body_height_mm - floor_thickness_mm + eps_mm
                );
        }
    }
}

function point_inside_cap_grid_keepout(point_x_mm, point_y_mm) =
    abs(point_x_mm) <= capsule_tangent_center_offset_x_mm
        ? abs(point_y_mm) <= cap_grid_keepout_radius_mm
        : pow(abs(point_x_mm) - capsule_tangent_center_offset_x_mm, 2)
                + pow(point_y_mm, 2)
            <= pow(cap_grid_keepout_radius_mm, 2);

function cap_grid_hex_inside_keepouts(center_x_mm, center_y_mm) =
    min([
        for (vertex_angle_deg = [0 : 60 : 300])
            point_inside_cap_grid_keepout(
                center_x_mm
                    + grid_hex_circumradius_mm * cos(vertex_angle_deg),
                center_y_mm
                    + grid_hex_circumradius_mm * sin(vertex_angle_deg)
            ) ? 1 : 0
    ]) == 1;

module top_cap_hex_aperture(center_x_mm, center_y_mm) {
    translate([center_x_mm, center_y_mm, -eps_mm])
        cylinder(
            h = cap_roof_thickness_mm + 2 * eps_mm,
            r = grid_hex_circumradius_mm,
            $fn = 6
        );
}

module top_cap_ventilation_grid() {
    for (row_index = [-cap_grid_row_index_max : cap_grid_row_index_max]) {
        center_y_mm = row_index * grid_row_pitch_mm;
        stagger_mm = (abs(row_index) % 2) * grid_column_pitch_mm / 2;

        for (column_index = [-cap_grid_column_index_max
                : cap_grid_column_index_max]) {
            center_x_mm = column_index * grid_column_pitch_mm + stagger_mm;

            if (cap_grid_hex_inside_keepouts(center_x_mm, center_y_mm))
                top_cap_hex_aperture(center_x_mm, center_y_mm);
        }
    }
}

// ======================================================
// Ventilated Capsule Cap And Durable Retention
// ======================================================

module cap_wall_local(origin_x_mm, origin_y_mm, angle_deg) {
    translate([origin_x_mm, origin_y_mm, 0])
        rotate([0, 0, angle_deg])
            children();
}

module cap_skirt_clip_pocket() {
    translate([
        -cap_clip_receiver_width_mm / 2,
        -cap_skirt_thickness_mm - cap_clip_release_travel_mm,
        cap_roof_thickness_mm - eps_mm
    ])
        cube([
            cap_clip_receiver_width_mm,
            cap_skirt_thickness_mm + cap_clip_release_travel_mm + eps_mm,
            cap_skirt_engagement_depth_mm + 2 * eps_mm
        ]);
}

module cap_skirt_pocket_bypass() {
    translate([
        -cap_clip_receiver_width_mm / 2 - cap_skirt_thickness_mm,
        -cap_skirt_thickness_mm - cap_clip_release_travel_mm,
        cap_roof_thickness_mm
    ])
        cube([
            cap_clip_receiver_width_mm + 2 * cap_skirt_thickness_mm,
            cap_skirt_thickness_mm,
            cap_skirt_engagement_depth_mm
        ]);
}

module cap_alignment_skirt() {
    union() {
        difference() {
            translate([0, 0, cap_roof_thickness_mm])
                difference() {
                    capsule_prism(
                        cap_skirt_outer_radius_mm,
                        cap_skirt_engagement_depth_mm
                    );
                    translate([0, 0, -eps_mm])
                        capsule_prism(
                            cap_skirt_inner_radius_mm,
                            cap_skirt_engagement_depth_mm + 2 * eps_mm
                        );
                }

            cap_wall_local(cap_front_right_source_x_mm,
                    cap_front_right_source_y_mm,
                    cap_front_right_source_angle_deg)
                cap_skirt_clip_pocket();
            cap_wall_local(cap_left_source_x_mm, cap_left_source_y_mm,
                    cap_left_source_angle_deg)
                cap_skirt_clip_pocket();
            cap_wall_local(cap_rear_left_source_x_mm,
                    cap_rear_left_source_y_mm,
                    cap_rear_left_source_angle_deg)
                cap_skirt_clip_pocket();
            cap_wall_local(cap_rear_right_source_x_mm,
                    cap_rear_right_source_y_mm,
                    cap_rear_right_source_angle_deg)
                cap_skirt_clip_pocket();
        }

        cap_wall_local(cap_front_right_source_x_mm,
                cap_front_right_source_y_mm,
                cap_front_right_source_angle_deg)
            cap_skirt_pocket_bypass();
        cap_wall_local(cap_left_source_x_mm, cap_left_source_y_mm,
                cap_left_source_angle_deg)
            cap_skirt_pocket_bypass();
        cap_wall_local(cap_rear_left_source_x_mm,
                cap_rear_left_source_y_mm,
                cap_rear_left_source_angle_deg)
            cap_skirt_pocket_bypass();
        cap_wall_local(cap_rear_right_source_x_mm,
                cap_rear_right_source_y_mm,
                cap_rear_right_source_angle_deg)
            cap_skirt_pocket_bypass();
    }
}

module cap_clip_hook() {
    rotate([0, -90, 0])
        linear_extrude(height = cap_clip_width_mm, center = true)
            polygon(points = [
                [cap_clip_hook_start_z_mm, cap_clip_thickness_mm],
                [cap_clip_hook_start_z_mm,
                    cap_clip_thickness_mm + cap_clip_hook_engagement_mm],
                [cap_roof_thickness_mm + cap_clip_flexible_length_mm,
                    cap_clip_thickness_mm]
            ]);
}

module cap_cantilever_clip() {
    union() {
        translate([
            -cap_clip_width_mm / 2,
            0,
            cap_roof_thickness_mm
        ])
            cube([
                cap_clip_width_mm,
                cap_clip_thickness_mm,
                cap_clip_flexible_length_mm
            ]);

        translate([
            -cap_clip_width_mm / 2,
            cap_clip_thickness_mm,
            cap_clip_press_pad_source_bottom_z_mm
        ])
            cube([
                cap_clip_width_mm,
                cap_clip_press_pad_projection_mm,
                cap_clip_press_pad_height_mm
            ]);

        cap_clip_hook();

        translate([
            -cap_clip_width_mm / 2,
            0,
            cap_roof_thickness_mm + cap_clip_root_fillet_radius_mm
        ])
            rotate([0, 90, 0])
                cylinder(
                    h = cap_clip_width_mm,
                    r = cap_clip_root_fillet_radius_mm
                );
    }
}

module cap_retention_clips() {
    cap_wall_local(cap_front_right_source_x_mm,
            cap_front_right_source_y_mm,
            cap_front_right_source_angle_deg)
        cap_cantilever_clip();
    cap_wall_local(cap_left_source_x_mm, cap_left_source_y_mm,
            cap_left_source_angle_deg)
        cap_cantilever_clip();
    cap_wall_local(cap_rear_left_source_x_mm,
            cap_rear_left_source_y_mm,
            cap_rear_left_source_angle_deg)
        cap_cantilever_clip();
    cap_wall_local(cap_rear_right_source_x_mm,
            cap_rear_right_source_y_mm,
            cap_rear_right_source_angle_deg)
        cap_cantilever_clip();
}

module cap_clip_receiver_hole() {
    translate([
        -cap_clip_receiver_width_mm / 2,
        -cap_skirt_clearance_mm - cap_clip_release_travel_mm,
        cap_clip_receiver_bottom_z_mm
    ])
        cube([
            cap_clip_receiver_width_mm,
            wall_thickness_mm + cap_skirt_clearance_mm
                + cap_clip_release_travel_mm + 2 * eps_mm,
            cap_clip_receiver_height_mm
        ]);
}

module cap_clip_receiver_holes() {
    for (receiver_transform = cap_clip_receiver_transforms)
        cap_wall_local(receiver_transform[0], receiver_transform[1],
                receiver_transform[2])
            cap_clip_receiver_hole();
}

module cap_clip_receiver_catch() {
    translate([
        -cap_clip_receiver_width_mm / 2 - wall_thickness_mm / 2,
        cap_clip_thickness_mm - cap_clip_interference_mm,
        cap_clip_catch_bottom_z_mm
    ])
        cube([
            cap_clip_receiver_width_mm + wall_thickness_mm,
            wall_thickness_mm - cap_clip_thickness_mm
                + cap_clip_interference_mm + eps_mm,
            cap_clip_thickness_mm
        ]);
}

module cap_clip_receiver_catches() {
    for (receiver_transform = cap_clip_receiver_transforms)
        cap_wall_local(receiver_transform[0], receiver_transform[1],
                receiver_transform[2])
            cap_clip_receiver_catch();
}

// ======================================================
// Device Placement And Cable Interfaces
// ======================================================

module front_usb_group_opening() {
    translate([
        usb_cutout_center_x_mm - usb_cutout_width_mm / 2,
        -capsule_outer_radius_mm - eps_mm,
        usb_cutout_effective_center_z_mm - usb_cutout_height_mm / 2
    ])
        cube([
            usb_cutout_width_mm,
            wall_thickness_mm + 2 * eps_mm,
            usb_cutout_height_mm
        ]);
}

module rear_slot_plan_profile(width_mm) {
    inner_half_width_mm = width_mm / 2 + cable_contact_edge_radius_mm;

    polygon(points = [
        [rear_passage_center_x_mm - width_mm / 2,
            smooth_wall_radius_mm + eps_mm],
        [rear_passage_center_x_mm + width_mm / 2,
            smooth_wall_radius_mm + eps_mm],
        [rear_passage_center_x_mm + inner_half_width_mm,
            interior_capsule_radius_mm - eps_mm],
        [rear_passage_center_x_mm - inner_half_width_mm,
            interior_capsule_radius_mm - eps_mm]
    ]);
}

module rear_main_lead_slot() {
    hull() {
        translate([0, 0, slot_bottom_z_mm])
            linear_extrude(height = eps_mm)
                rear_slot_plan_profile(
                    lay_in_passage_width_mm
                        + 2 * cable_contact_edge_radius_mm
                );
        translate([0, 0, slot_bottom_z_mm + cable_contact_edge_radius_mm])
            linear_extrude(height = body_height_mm - slot_bottom_z_mm
                - cable_contact_edge_radius_mm + 2 * eps_mm)
                rear_slot_plan_profile(lay_in_passage_width_mm);
    }
}

module right_slot_plan_profile(outer_half_angle_deg, inner_half_angle_deg,
        cut_outer_radius_mm) {
    right_center_x_mm = capsule_tangent_center_offset_x_mm;

    polygon(points = [
        [right_center_x_mm
                + right_passage_inner_radius_mm
                    * cos(right_passage_center_angle_deg - inner_half_angle_deg),
            right_passage_inner_radius_mm
                * sin(right_passage_center_angle_deg - inner_half_angle_deg)],
        [right_center_x_mm
                + cut_outer_radius_mm
                    * cos(right_passage_center_angle_deg - outer_half_angle_deg),
            cut_outer_radius_mm
                * sin(right_passage_center_angle_deg - outer_half_angle_deg)],
        [right_center_x_mm
                + cut_outer_radius_mm
                    * cos(right_passage_center_angle_deg + outer_half_angle_deg),
            cut_outer_radius_mm
                * sin(right_passage_center_angle_deg + outer_half_angle_deg)],
        [right_center_x_mm
                + right_passage_inner_radius_mm
                    * cos(right_passage_center_angle_deg + inner_half_angle_deg),
            right_passage_inner_radius_mm
                * sin(right_passage_center_angle_deg + inner_half_angle_deg)]
    ]);
}

module right_shared_cable_slot() {
    hull() {
        translate([0, 0, slot_bottom_z_mm])
            linear_extrude(height = eps_mm)
                right_slot_plan_profile(
                    right_passage_bottom_half_angle_deg,
                    right_passage_inner_half_angle_deg,
                    right_passage_bottom_cut_outer_radius_mm
                );
        translate([0, 0, slot_bottom_z_mm + cable_contact_edge_radius_mm])
            linear_extrude(height = body_height_mm - slot_bottom_z_mm
                - cable_contact_edge_radius_mm + 2 * eps_mm)
                right_slot_plan_profile(
                    right_passage_half_angle_deg,
                    right_passage_inner_half_angle_deg,
                    right_passage_top_cut_outer_radius_mm
                );
    }
}

module right_side_cable_reference(center_z_mm) {
    cable_start_x_mm = powerstrip_center_x_mm + powerstrip_width_mm / 2;
    cable_start_y_mm = powerstrip_center_y_mm;
    cable_end_x_mm = right_passage_center_x_mm
        + maximum_cable_diameter_mm * cos(right_passage_center_angle_deg);
    cable_end_y_mm = right_passage_center_y_mm
        + maximum_cable_diameter_mm * sin(right_passage_center_angle_deg);
    cable_delta_x_mm = cable_end_x_mm - cable_start_x_mm;
    cable_delta_y_mm = cable_end_y_mm - cable_start_y_mm;
    cable_length_mm = sqrt(
        pow(cable_delta_x_mm, 2) + pow(cable_delta_y_mm, 2)
    );
    cable_angle_deg = atan2(cable_delta_y_mm, cable_delta_x_mm);

    color("Orange")
        translate([cable_start_x_mm, cable_start_y_mm, center_z_mm])
            rotate([0, 0, cable_angle_deg])
                rotate([0, 90, 0])
                    cylinder(h = cable_length_mm, d = maximum_cable_diameter_mm);
}

module right_side_cable_references() {
    for (cable_index = [0 : right_routed_cable_count - 1])
        right_side_cable_reference(
            right_cable_first_center_z_mm
                + cable_index * maximum_cable_diameter_mm
        );
}
