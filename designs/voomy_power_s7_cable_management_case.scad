// Voomy Power S7 cable-management case.
//
// Units: mm
// Source axes: +X points toward visual right, +Y points from front to rear,
// and +Z points upward from the bottom face.
//
// Complete editable design with an upright case body, removable plain cap,
// USB passthrough clip, cable routing, ventilation, and printable layout.

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
powerstrip_support_height_mm = 3.0;
powerstrip_support_diameter_mm = 14.0;
powerstrip_stop_height_mm = 12.0;
powerstrip_stop_radius_mm = 3.0;

// Cable interfaces
lay_in_passage_width_mm = 20.0;
maximum_cable_diameter_mm = 12.0;
right_routed_cable_count = 4;
cable_lateral_clearance_mm = 4.0;
cable_contact_edge_radius_mm = 2.0;
rear_passage_center_x_mm = powerstrip_center_x_mm;

// Front USB group and removable clip (provisional)
usb_cutout_width_mm = 60.0;
usb_cutout_height_mm = 36.0;
usb_cutout_center_z_mm = 50.0;
usb_group_offset_x_mm = 0.0;
usb_group_offset_z_mm = 0.0;
usb_clip_clear_width_mm = 56.0;
usb_clip_clear_height_mm = 32.0;
usb_clip_wall_overlap_mm = 3.0;
usb_clip_fit_clearance_mm = 0.3;
usb_clip_bezel_thickness_mm = 3.0;
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

// Ventilation grid (provisional)
grid_hex_across_flats_mm = 12.0;
grid_minimum_rib_width_mm = 3.0;
grid_structural_border_mm = 12.0;

// Raised horizontal wall stripes (provisional)
wall_stripe_projection_mm = 1.0;
wall_stripe_height_mm = 4.0;
wall_stripe_pitch_mm = 9.0;
wall_stripe_margin_mm = 10.0;
wall_stripe_lower_transition_angle_deg = 45.0;

// Printable layout
printable_layout_spacing_mm = 8.0;
printable_layout_body_center_y_mm = -59.0;
printable_layout_cap_center_y_mm = 59.0;
printable_layout_clip_center_x_mm = 129.0;
printable_layout_clip_center_y_mm = 0.0;
printable_layout_clip_rotation_deg = 90.0;

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
smooth_wall_radius_mm = capsule_outer_radius_mm - wall_stripe_projection_mm;
smooth_wall_width_mm = case_width_mm - 2 * wall_stripe_projection_mm;
smooth_wall_depth_mm = case_depth_mm - 2 * wall_stripe_projection_mm;
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
right_cable_stack_height_mm =
    right_routed_cable_count * maximum_cable_diameter_mm;
powerstrip_bottom_z_mm = floor_thickness_mm + powerstrip_support_height_mm;
powerstrip_top_z_mm = powerstrip_bottom_z_mm + powerstrip_height_mm;
powerstrip_stop_offset_x_mm = powerstrip_width_mm / 2
    + powerstrip_fit_clearance_mm + powerstrip_stop_radius_mm;
powerstrip_stop_offset_y_mm = powerstrip_depth_mm / 2
    + powerstrip_fit_clearance_mm + powerstrip_stop_radius_mm;
powerstrip_support_offset_x_mm = powerstrip_width_mm / 2
    - powerstrip_support_diameter_mm / 2;
powerstrip_support_offset_y_mm = powerstrip_depth_mm / 2
    - powerstrip_support_diameter_mm / 2;
interior_capsule_radius_mm = smooth_wall_radius_mm - wall_thickness_mm;
right_passage_half_angle_deg = right_passage_arc_angle_deg / 2;
right_passage_inner_radius_mm = interior_capsule_radius_mm - eps_mm;
right_passage_inner_half_angle_deg =
    (lay_in_passage_width_mm + 2 * cable_contact_edge_radius_mm)
    / right_passage_inner_radius_mm * 180 / PI / 2;
right_passage_bottom_half_angle_deg =
    (lay_in_passage_width_mm + 2 * cable_contact_edge_radius_mm)
    / capsule_outer_radius_mm * 180 / PI / 2;
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
usb_clip_outer_width_mm = usb_cutout_width_mm + 2 * usb_clip_wall_overlap_mm;
usb_clip_outer_height_mm = usb_cutout_height_mm + 2 * usb_clip_wall_overlap_mm;
installed_usb_clip_center_x_mm = usb_cutout_center_x_mm;
installed_usb_clip_center_z_mm = usb_cutout_effective_center_z_mm;
stripe_first_center_z_mm = wall_stripe_margin_mm + wall_stripe_height_mm / 2;
stripe_last_center_z_mm =
    body_height_mm - wall_stripe_margin_mm - wall_stripe_height_mm / 2;
grid_hex_circumradius_mm = grid_hex_across_flats_mm / sqrt(3);
grid_column_pitch_mm = 2 * grid_hex_circumradius_mm + grid_minimum_rib_width_mm;
grid_row_pitch_mm = grid_hex_across_flats_mm + grid_minimum_rib_width_mm;
grid_front_min_x_mm = -capsule_tangent_center_offset_x_mm
    + grid_structural_border_mm + grid_hex_circumradius_mm;
grid_front_max_x_mm = capsule_tangent_center_offset_x_mm
    - grid_structural_border_mm - grid_hex_circumradius_mm;
grid_front_min_z_mm = usb_cutout_effective_center_z_mm
    + usb_cutout_height_mm / 2 + grid_structural_border_mm
    + grid_hex_across_flats_mm / 2;
grid_front_max_z_mm = body_height_mm - grid_structural_border_mm
    - grid_hex_across_flats_mm / 2;
cap_skirt_outer_radius_mm = interior_capsule_radius_mm - cap_skirt_clearance_mm;
cap_skirt_inner_radius_mm = cap_skirt_outer_radius_mm - cap_skirt_thickness_mm;
cap_clip_front_right_x_mm = 38.0;
cap_clip_left_x_mm = -capsule_tangent_center_offset_x_mm
    - cap_skirt_outer_radius_mm;
cap_clip_rear_left_x_mm = -42.0;
cap_clip_rear_right_x_mm = 20.0;
cap_clip_receiver_width_mm = cap_clip_width_mm + 4.0;
cap_clip_hook_start_z_mm = cap_roof_thickness_mm
    + cap_clip_flexible_length_mm - cap_clip_hook_engagement_mm;
cap_clip_receiver_bottom_z_mm = body_height_mm
    - cap_clip_flexible_length_mm + cap_clip_hook_engagement_mm;
cap_installed_flip_x_deg = 180;
cap_front_right_source_x_mm = cap_clip_front_right_x_mm;
cap_front_right_source_y_mm = cap_skirt_outer_radius_mm;
cap_front_right_source_angle_deg = 0;
cap_left_source_x_mm = cap_clip_left_x_mm;
cap_left_source_y_mm = 0;
cap_left_source_angle_deg = 90;
cap_rear_left_source_x_mm = cap_clip_rear_left_x_mm;
cap_rear_left_source_y_mm = -cap_skirt_outer_radius_mm;
cap_rear_left_source_angle_deg = 180;
cap_rear_right_source_x_mm = cap_clip_rear_right_x_mm;
cap_rear_right_source_y_mm = -cap_skirt_outer_radius_mm;
cap_rear_right_source_angle_deg = 180;

// ======================================================
// Top-Level Contract Assertions
// ======================================================

assert(case_width_mm == 210.0 && case_height_mm == 210.0 && case_depth_mm == 110.0,
    "The assembled exterior envelope must remain exactly 210 x 210 x 110 mm");
assert(capsule_outer_radius_mm == 55.0,
    "The stripe-peak capsule side radius must be 55 mm");
assert(capsule_straight_length_mm == 100.0,
    "The capsule front and rear tangent runs must be 100 mm");
assert(smooth_wall_radius_mm > wall_thickness_mm,
    "Wall thickness must fit inside the inset smooth-wall radius");
assert(wall_thickness_mm > 0 && floor_thickness_mm > 0 && cap_roof_thickness_mm > 0,
    "Shell thicknesses must be positive");
assert(wall_stripe_projection_mm >= 0 && wall_stripe_projection_mm < capsule_outer_radius_mm,
    "Stripe projection must preserve a positive smooth-wall radius");
assert(lay_in_passage_width_mm >= maximum_cable_diameter_mm + 2 * cable_lateral_clearance_mm,
    "The lay-in passage must preserve nominal cable lateral clearance");
assert(cable_contact_edge_radius_mm >= 2.0,
    "Cable-contact edge treatment must be at least 2 mm");
assert(usb_cutout_center_x_mm - usb_cutout_width_mm / 2 >= -capsule_tangent_center_offset_x_mm
    && usb_cutout_center_x_mm + usb_cutout_width_mm / 2 <= capsule_tangent_center_offset_x_mm,
    "The USB wall cutout must remain within the straight front-wall run");
assert(usb_clip_clear_width_mm >= 56.0 && usb_clip_clear_height_mm >= 32.0,
    "The USB clip shared clear opening is below its approved minimum");
assert(usb_clip_outer_width_mm - usb_cutout_width_mm
        == 2 * usb_clip_wall_overlap_mm
    && usb_clip_outer_height_mm - usb_cutout_height_mm
        == 2 * usb_clip_wall_overlap_mm,
    "The USB clip must overlap the body cutout by 3 mm on every edge");
assert(usb_clip_bezel_thickness_mm >= wall_thickness_mm
    && usb_clip_retention_depth_mm > wall_thickness_mm + usb_clip_fit_clearance_mm
    && usb_clip_hook_engagement_mm <= usb_clip_wall_overlap_mm,
    "The USB clip retention geometry must bridge and catch the front wall");
assert(cap_skirt_clearance_mm >= 0.3 && cap_skirt_engagement_depth_mm >= 6.0,
    "Cap skirt clearance or engagement is below the approved minimum");
assert(cap_clip_count == 4,
    "The cap requires exactly four retention clips");
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
assert(wall_stripe_height_mm == 4.0 && wall_stripe_pitch_mm == 9.0
    && wall_stripe_margin_mm == 10.0,
    "Wall stripe dimensions must retain the approved defaults");
assert(smooth_wall_width_mm == 208.0 && smooth_wall_depth_mm == 108.0
    && smooth_wall_radius_mm == 54.0,
    "The smooth wall datum must be inset by the stripe projection");
assert(floor_plate_contact_width_mm == 210.0
    && floor_plate_contact_depth_mm == 110.0,
    "The upright body plate-contact footprint must be exactly 210 x 110 mm");
assert(capsule_tangent_center_offset_x_mm * 2 == capsule_straight_length_mm,
    "Capsule end centers must preserve the 100 mm tangent runs");
assert(wall_thickness_mm >= 3.0 && floor_thickness_mm >= 3.0,
    "The body wall and floor must be at least 3 mm thick");
assert(wall_stripe_pitch_mm > wall_stripe_height_mm
    && wall_stripe_projection_mm <= wall_stripe_height_mm / 2,
    "Wall stripes require positive spacing and a self-supporting projection");
assert(grid_column_pitch_mm - 2 * grid_hex_circumradius_mm
        >= grid_minimum_rib_width_mm
    && grid_row_pitch_mm - grid_hex_across_flats_mm
        >= grid_minimum_rib_width_mm,
    "Ventilation apertures must preserve the minimum grid ribs");
assert(grid_front_min_x_mm <= grid_front_max_x_mm
    && grid_front_min_z_mm <= grid_front_max_z_mm,
    "The front ventilation field must fit within its structural keepouts");
assert(powerstrip_width_mm == 80.0 && powerstrip_depth_mm == 80.0
    && powerstrip_height_mm == 88.0,
    "The non-printable Voomy reference must remain exactly 80 x 80 x 88 mm");
assert(powerstrip_fit_clearance_mm == 1.5,
    "The Voomy locating stops must preserve 1.5 mm nominal clearance");
assert(pow(max(abs(powerstrip_center_x_mm) + powerstrip_clear_width_mm / 2
            - capsule_tangent_center_offset_x_mm, 0), 2)
        + pow(abs(powerstrip_center_y_mm) + powerstrip_clear_depth_mm / 2, 2)
        <= pow(interior_capsule_radius_mm, 2),
    "The Voomy clearance envelope must fit inside the body capsule");
assert(powerstrip_bottom_z_mm >= floor_thickness_mm
    && powerstrip_top_z_mm < body_height_mm,
    "The Voomy reference must fit below the open body top");
assert(powerstrip_stop_height_mm < powerstrip_height_mm
    && powerstrip_stop_radius_mm > 0,
    "Rounded floor stops must leave the vertical removal path unobstructed");
assert(powerstrip_stop_offset_x_mm - powerstrip_stop_radius_mm
        - powerstrip_width_mm / 2 == powerstrip_fit_clearance_mm
    && powerstrip_stop_offset_y_mm - powerstrip_stop_radius_mm
        - powerstrip_depth_mm / 2 == powerstrip_fit_clearance_mm,
    "Rounded stops must locate the Voomy reference at nominal clearance");
assert(powerstrip_support_offset_x_mm + powerstrip_support_diameter_mm / 2
        <= powerstrip_width_mm / 2
    && powerstrip_support_offset_y_mm + powerstrip_support_diameter_mm / 2
        <= powerstrip_depth_mm / 2,
    "Floor supports must remain beneath the Voomy reference footprint");
assert(usb_cutout_width_mm == 60.0 && usb_cutout_height_mm == 36.0
    && usb_cutout_center_from_left_tangent_mm == 38.0,
    "The USB group opening must retain its approved provisional size and offset");
assert(usb_cutout_center_x_mm == powerstrip_center_x_mm + usb_group_offset_x_mm,
    "The USB group opening must derive from the installed power-strip datum");
assert(installed_usb_clip_center_x_mm == usb_cutout_center_x_mm
    && installed_usb_clip_center_z_mm == usb_cutout_effective_center_z_mm,
    "The installed USB bezel and body cutout centers must align exactly");
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
    "The installed USB bezel must overlap the centered body cutout on every edge");
assert(rear_passage_center_x_mm - lay_in_passage_width_mm / 2
        >= -capsule_tangent_center_offset_x_mm
    && rear_passage_center_x_mm + lay_in_passage_width_mm / 2
        <= capsule_tangent_center_offset_x_mm,
    "The rear lead slot must remain within the straight rear wall run");
assert(right_passage_arc_angle_deg * capsule_outer_radius_mm
        * PI / 180 == lay_in_passage_width_mm,
    "The right slot must span 20 mm of tangential arc at the outer radius");
assert(slot_bottom_z_mm == floor_thickness_mm
    && body_height_mm > slot_bottom_z_mm,
    "Both lay-in slots must remain continuous from the wall top to the floor");
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
            + grid_structural_border_mm,
    "The front-right cap receiver must remain in solid wall beyond the USB keepout");
assert(cap_clip_rear_left_x_mm + cap_clip_receiver_width_mm / 2
        <= rear_passage_center_x_mm - lay_in_passage_width_mm / 2
            - grid_structural_border_mm
    && cap_clip_rear_right_x_mm - cap_clip_receiver_width_mm / 2
        >= rear_passage_center_x_mm + lay_in_passage_width_mm / 2
            + grid_structural_border_mm,
    "The rear cap receivers must remain split around the rear-passage keepout");
assert(cap_clip_thickness_mm
        + max(cap_clip_press_pad_projection_mm, cap_clip_hook_engagement_mm)
        <= wall_thickness_mm + cap_skirt_clearance_mm,
    "Clip pads and hooks must stay within the fixed cap outline");
assert(cap_installed_flip_x_deg == 180,
    "The cap must use a rigid 180-degree installed flip");
assert(cap_front_right_source_x_mm == cap_clip_front_right_x_mm
    && -cap_front_right_source_y_mm == -cap_skirt_outer_radius_mm
    && abs(abs(-cap_front_right_source_y_mm + interior_capsule_radius_mm)
        - cap_skirt_clearance_mm) < eps_mm
    && 180 - cap_front_right_source_angle_deg == 180
    && cap_left_source_x_mm == cap_clip_left_x_mm
    && -cap_left_source_y_mm == 0
    && abs(abs(cap_left_source_x_mm
            - (-capsule_tangent_center_offset_x_mm
                - interior_capsule_radius_mm))
        - cap_skirt_clearance_mm) < eps_mm
    && 180 - cap_left_source_angle_deg == 90
    && cap_rear_left_source_x_mm == cap_clip_rear_left_x_mm
    && -cap_rear_left_source_y_mm == cap_skirt_outer_radius_mm
    && abs(abs(-cap_rear_left_source_y_mm - interior_capsule_radius_mm)
        - cap_skirt_clearance_mm) < eps_mm
    && 180 - cap_rear_left_source_angle_deg == 0
    && cap_rear_right_source_x_mm == cap_clip_rear_right_x_mm
    && -cap_rear_right_source_y_mm == cap_skirt_outer_radius_mm
    && abs(abs(-cap_rear_right_source_y_mm - interior_capsule_radius_mm)
        - cap_skirt_clearance_mm) < eps_mm
    && 180 - cap_rear_right_source_angle_deg == 0,
    "Rigidly flipped cap-local hooks and skirt pockets must align all receivers");
assert(case_height_mm - cap_clip_hook_start_z_mm
        == cap_clip_receiver_bottom_z_mm,
    "Rigidly flipped cap hooks must align receiver catches vertically");
assert(printable_layout_cap_center_y_mm - capsule_outer_radius_mm
        >= printable_layout_body_center_y_mm + capsule_outer_radius_mm
            + printable_layout_spacing_mm,
    "Printable body and cap must remain separated by the requested spacing");
assert(sqrt(pow(printable_layout_clip_center_x_mm
            - usb_clip_outer_height_mm / 2
            - capsule_tangent_center_offset_x_mm, 2)
        + pow(printable_layout_cap_center_y_mm
            - usb_clip_outer_width_mm / 2, 2))
        >= capsule_outer_radius_mm + printable_layout_spacing_mm,
    "The rotated USB clip must remain separated from both capsule parts");
assert(printable_layout_clip_center_x_mm + usb_clip_outer_height_mm / 2
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
                union() {
                    capsule_shell_and_floor();
                    horizontal_wall_stripes();
                    powerstrip_floor_supports_and_stops();
                }
                front_wall_ventilation_grid();
                front_usb_group_opening();
                rear_main_lead_slot();
                right_shared_cable_slot();
                cap_clip_receiver_windows();
            }
            cap_clip_receiver_catches();
        }
}

module voomy_power_s7_top_cap() {
    color(top_cap_colour)
        union() {
            capsule_prism(capsule_outer_radius_mm, cap_roof_thickness_mm);
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

module usb_clip_bezel() {
    difference() {
        translate([
            -usb_clip_outer_width_mm / 2,
            -usb_clip_outer_height_mm / 2,
            0
        ])
            cube([
                usb_clip_outer_width_mm,
                usb_clip_outer_height_mm,
                usb_clip_bezel_thickness_mm
            ]);

        translate([
            -usb_clip_clear_width_mm / 2,
            -usb_clip_clear_height_mm / 2,
            -eps_mm
        ])
            cube([
                usb_clip_clear_width_mm,
                usb_clip_clear_height_mm,
                usb_clip_bezel_thickness_mm + 2 * eps_mm
            ]);
    }
}

module usb_clip_snap_tab(tab_x_mm, top_tab = true) {
    tab_inner_y_mm = usb_cutout_height_mm / 2 - cap_clip_thickness_mm;
    hook_start_z_mm = usb_clip_bezel_thickness_mm + wall_thickness_mm
        + usb_clip_fit_clearance_mm;

    translate([tab_x_mm, 0, 0]) {
        translate([
            -usb_clip_tab_width_mm / 2,
            top_tab ? tab_inner_y_mm : -usb_cutout_height_mm / 2,
            usb_clip_bezel_thickness_mm - eps_mm
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
            usb_clip_bezel_thickness_mm + 0.8
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
        usb_clip_bezel();
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
// D2 Capsule Body Geometry
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

module stripe_outer_profile(center_z_mm) {
    lower_z_mm = center_z_mm - wall_stripe_height_mm / 2;
    upper_z_mm = center_z_mm + wall_stripe_height_mm / 2;
    transition_height_mm = min(
        wall_stripe_projection_mm,
        wall_stripe_height_mm / 2 - eps_mm
    );

    hull() {
        translate([0, 0, lower_z_mm])
            capsule_prism(smooth_wall_radius_mm, eps_mm);
        translate([0, 0, lower_z_mm + transition_height_mm])
            capsule_prism(capsule_outer_radius_mm, eps_mm);
        translate([0, 0, upper_z_mm - transition_height_mm])
            capsule_prism(capsule_outer_radius_mm, eps_mm);
        translate([0, 0, upper_z_mm - eps_mm])
            capsule_prism(smooth_wall_radius_mm, eps_mm);
    }
}

module horizontal_wall_stripe(center_z_mm) {
    difference() {
        stripe_outer_profile(center_z_mm);
        translate([0, 0, center_z_mm - wall_stripe_height_mm / 2 - eps_mm])
            capsule_prism(
                smooth_wall_radius_mm - eps_mm,
                wall_stripe_height_mm + 2 * eps_mm
            );
    }
}

module horizontal_wall_stripes() {
    for (center_z_mm = [stripe_first_center_z_mm : wall_stripe_pitch_mm : stripe_last_center_z_mm])
        horizontal_wall_stripe(center_z_mm);
}

module front_wall_hex_aperture(center_x_mm, center_z_mm) {
    translate([center_x_mm, -smooth_wall_radius_mm + wall_thickness_mm + eps_mm,
            center_z_mm])
        rotate([90, 0, 0])
            cylinder(
                h = wall_thickness_mm + wall_stripe_projection_mm + 2 * eps_mm,
                r = grid_hex_circumradius_mm,
                $fn = 6
            );
}

module front_wall_ventilation_grid() {
    row_count = floor(
        (grid_front_max_z_mm - grid_front_min_z_mm) / grid_row_pitch_mm
    );

    for (row = [0 : row_count]) {
        center_z_mm = grid_front_min_z_mm + row * grid_row_pitch_mm;
        stagger_mm = (row % 2) * grid_column_pitch_mm / 2;

        for (center_x_mm = [grid_front_min_x_mm + stagger_mm
                : grid_column_pitch_mm : grid_front_max_x_mm])
            if (center_x_mm + grid_hex_circumradius_mm
                    <= cap_clip_front_right_x_mm
                        - cap_clip_receiver_width_mm / 2
                        - grid_structural_border_mm)
                front_wall_hex_aperture(center_x_mm, center_z_mm);
    }
}

// ======================================================
// D4 Plain Capsule Cap And Durable Retention
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
            cap_roof_thickness_mm + cap_clip_flexible_length_mm - 6.0
        ])
            cube([
                cap_clip_width_mm,
                cap_clip_press_pad_projection_mm,
                5.0
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

module cap_clip_receiver_window() {
    translate([
        -cap_clip_receiver_width_mm / 2,
        -cap_skirt_clearance_mm - cap_clip_release_travel_mm,
        cap_clip_receiver_bottom_z_mm - 5.0
    ])
        cube([
            cap_clip_receiver_width_mm,
            wall_thickness_mm + wall_stripe_projection_mm
                + cap_clip_release_travel_mm + 2 * eps_mm,
            body_height_mm - cap_clip_receiver_bottom_z_mm + 5.0 + eps_mm
        ]);
}

module cap_clip_receiver_windows() {
    cap_wall_local(cap_clip_front_right_x_mm, -interior_capsule_radius_mm, 180)
        cap_clip_receiver_window();
    cap_wall_local(-capsule_tangent_center_offset_x_mm
            - interior_capsule_radius_mm, 0, 90)
        cap_clip_receiver_window();
    cap_wall_local(cap_clip_rear_left_x_mm, interior_capsule_radius_mm, 0)
        cap_clip_receiver_window();
    cap_wall_local(cap_clip_rear_right_x_mm, interior_capsule_radius_mm, 0)
        cap_clip_receiver_window();
}

module cap_clip_receiver_catch() {
    translate([
        -cap_clip_receiver_width_mm / 2 - wall_thickness_mm / 2,
        cap_clip_thickness_mm - cap_clip_interference_mm,
        cap_clip_receiver_bottom_z_mm
    ])
        cube([
            cap_clip_receiver_width_mm + wall_thickness_mm,
            wall_thickness_mm - cap_clip_thickness_mm
                + cap_clip_interference_mm + eps_mm,
            cap_clip_thickness_mm
        ]);
}

module cap_clip_receiver_catches() {
    cap_wall_local(cap_clip_front_right_x_mm, -interior_capsule_radius_mm, 180)
        cap_clip_receiver_catch();
    cap_wall_local(-capsule_tangent_center_offset_x_mm
            - interior_capsule_radius_mm, 0, 90)
        cap_clip_receiver_catch();
    cap_wall_local(cap_clip_rear_left_x_mm, interior_capsule_radius_mm, 0)
        cap_clip_receiver_catch();
    cap_wall_local(cap_clip_rear_right_x_mm, interior_capsule_radius_mm, 0)
        cap_clip_receiver_catch();
}

// ======================================================
// D3 Device Placement And Cable Interfaces
// ======================================================

module powerstrip_floor_support(center_x_mm, center_y_mm) {
    translate([center_x_mm, center_y_mm, floor_thickness_mm - eps_mm])
        cylinder(
            h = powerstrip_support_height_mm + eps_mm,
            d = powerstrip_support_diameter_mm
        );
}

module powerstrip_rounded_stop(center_x_mm, center_y_mm) {
    translate([center_x_mm, center_y_mm, floor_thickness_mm - eps_mm])
        cylinder(
            h = powerstrip_stop_height_mm + eps_mm,
            r = powerstrip_stop_radius_mm
        );
}

module powerstrip_floor_supports_and_stops() {
    for (x_offset_mm = [-powerstrip_support_offset_x_mm,
            powerstrip_support_offset_x_mm])
        for (y_offset_mm = [-powerstrip_support_offset_y_mm,
                powerstrip_support_offset_y_mm])
            powerstrip_floor_support(
                powerstrip_center_x_mm + x_offset_mm,
                powerstrip_center_y_mm + y_offset_mm
            );

    for (x_offset_mm = [-powerstrip_stop_offset_x_mm,
            powerstrip_stop_offset_x_mm])
        for (y_offset_mm = [-powerstrip_depth_mm / 4,
                powerstrip_depth_mm / 4])
            powerstrip_rounded_stop(
                powerstrip_center_x_mm + x_offset_mm,
                powerstrip_center_y_mm + y_offset_mm
            );

    for (x_offset_mm = [-powerstrip_width_mm / 4,
            powerstrip_width_mm / 4])
        for (y_offset_mm = [-powerstrip_stop_offset_y_mm,
                powerstrip_stop_offset_y_mm])
            powerstrip_rounded_stop(
                powerstrip_center_x_mm + x_offset_mm,
                powerstrip_center_y_mm + y_offset_mm
            );
}

module front_usb_group_opening() {
    translate([
        usb_cutout_center_x_mm - usb_cutout_width_mm / 2,
        -capsule_outer_radius_mm - eps_mm,
        usb_cutout_effective_center_z_mm - usb_cutout_height_mm / 2
    ])
        cube([
            usb_cutout_width_mm,
            wall_thickness_mm + wall_stripe_projection_mm + 2 * eps_mm,
            usb_cutout_height_mm
        ]);
}

module rear_slot_plan_profile(width_mm) {
    inner_half_width_mm = width_mm / 2 + cable_contact_edge_radius_mm;

    polygon(points = [
        [rear_passage_center_x_mm - width_mm / 2,
            smooth_wall_radius_mm + wall_stripe_projection_mm + eps_mm],
        [rear_passage_center_x_mm + width_mm / 2,
            smooth_wall_radius_mm + wall_stripe_projection_mm + eps_mm],
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

module right_slot_plan_profile(outer_half_angle_deg, inner_half_angle_deg) {
    right_center_x_mm = capsule_tangent_center_offset_x_mm;

    polygon(points = [
        [right_center_x_mm
                + right_passage_inner_radius_mm * cos(-inner_half_angle_deg),
            right_passage_inner_radius_mm * sin(-inner_half_angle_deg)],
        [right_center_x_mm
                + (capsule_outer_radius_mm + eps_mm) * cos(-outer_half_angle_deg),
            (capsule_outer_radius_mm + eps_mm) * sin(-outer_half_angle_deg)],
        [right_center_x_mm
                + (capsule_outer_radius_mm + eps_mm) * cos(outer_half_angle_deg),
            (capsule_outer_radius_mm + eps_mm) * sin(outer_half_angle_deg)],
        [right_center_x_mm
                + right_passage_inner_radius_mm * cos(inner_half_angle_deg),
            right_passage_inner_radius_mm * sin(inner_half_angle_deg)]
    ]);
}

module right_shared_cable_slot() {
    hull() {
        translate([0, 0, slot_bottom_z_mm])
            linear_extrude(height = eps_mm)
                right_slot_plan_profile(
                    right_passage_bottom_half_angle_deg,
                    right_passage_inner_half_angle_deg
                );
        translate([0, 0, slot_bottom_z_mm + cable_contact_edge_radius_mm])
            linear_extrude(height = body_height_mm - slot_bottom_z_mm
                - cable_contact_edge_radius_mm + 2 * eps_mm)
                right_slot_plan_profile(
                    right_passage_half_angle_deg,
                    right_passage_inner_half_angle_deg
                );
    }
}

module right_side_cable_reference(center_z_mm) {
    cable_start_x_mm = powerstrip_center_x_mm + powerstrip_width_mm / 2;
    cable_length_mm = case_width_mm / 2 + capsule_outer_radius_mm
        - cable_start_x_mm + maximum_cable_diameter_mm;

    color("Orange")
        translate([cable_start_x_mm, 0, center_z_mm])
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
