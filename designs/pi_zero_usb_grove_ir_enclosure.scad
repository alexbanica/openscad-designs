// Pi Zero USB Grove enclosure.
//
// Units: mm.
// Origin: board stack center in X/Y, bottom exterior of the printed tray at Z=0.
// Orientation: Pi Zero and Waveshare board X follows the 65 mm board length,
// Y follows the 30 mm board width. Waveshare RJ45/front USB-A ports face -Y.
// This is an adjustable printable case and fit reference; measure and test-fit
// the actual hardware stack before relying on final tolerances.

use <pi_zero.scad>
use <waveshare_eth_usb_hub_hat.scad>
use <seeed_grove_base_hat_zero.scad>

// ======================================================
// Adjustable Parameters
// ======================================================

// Render controls
$fn = 48;
render_mode = "printable_layout"; // [assembly/bottom_tray/top_cover/printable_layout/electronics]
show_electronics = true;
show_cutout_guides = true;

// Stack dimensions and offsets
board_length_mm = 65.0;
board_width_mm = 30.0;
board_thickness_mm = 1.6;
measured_stack_height_mm = 35.0;
extra_upward_headroom_mm = 8.0;
board_clearance_x_mm = 5.0;
board_clearance_y_mm = 5.0;
pi_zero_standoff_height_mm = 4.0;
pi_zero_to_waveshare_hat_z_offset_mm = 11.2;
waveshare_to_grove_hat_z_offset_mm = 10.8;
electronics_preview_lift_mm = 0.0;
grove_hat_rotation_deg = 90.0;

// Enclosure wall/floor/cover dimensions
wall_thickness_mm = 6.0;
floor_thickness_mm = 2.4;
top_roof_thickness_mm = 2.4;
tray_wall_height_mm = 16.0;
corner_radius_mm = 3.0;
cover_skirt_drop_depth_mm = 4.0;
cover_fit_clearance_mm = 0.35;
top_cover_internal_clearance_mm = 0.8;

// Pi Zero stack mounting standoffs
pi_mounting_hole_edge_offset_mm = 3.5;
pi_standoff_outer_diameter_mm = 6.5;
pi_standoff_screw_hole_diameter_mm = 2.7;
pi_standoff_pilot_depth_mm = 5.5;

// Plug-in top cover pin/socket features
cover_pin_diameter_mm = 3.0;
cover_pin_insertion_length_mm = 5.2;
cover_pin_offset_x_mm = 40.5;
cover_pin_offset_y_mm = 29.9;
cover_pin_count = 4;
tray_socket_clearance_mm = 0.35;
tray_socket_depth_mm = 5.8;

// IR PCB top-cover screw mount
enable_top_cover_ir_pcb_mount = true;
ir_top_cover_pcb_center_x_mm = 24.0;
ir_top_cover_pcb_center_y_mm = -16.7;
ir_top_cover_pcb_length_mm = 23.75;
ir_top_cover_pcb_thickness_mm = 1.6;
ir_top_cover_mount_hole_spacing_x_mm = 20.15;
ir_top_cover_mount_boss_outer_diameter_mm = 5.2;
ir_top_cover_mount_screw_hole_diameter_mm = 2.1;
ir_top_cover_mount_max_screw_length_including_head_mm = 5.0;
ir_top_cover_mount_screw_head_height_allowance_mm = 1.2;
ir_top_cover_led_local_x_mm = 0.0;
ir_top_cover_led_local_y_mm = -(ir_top_cover_pcb_length_mm / 2 + 7.5 - 7.0 / 2);
ir_top_cover_led_center_above_component_face_mm = 4.0;
ir_top_cover_led_aperture_diameter_mm = 6.2;
ir_top_cover_led_aperture_wall_overtravel_mm = 0.04;
ir_top_cover_feature_vent_clearance_mm = 0.8;

// Port cutout dimensions and offsets
micro_sd_card_width_mm = 11.0;
micro_sd_card_total_clearance_mm = 2.0;
micro_sd_wall_through_overlap_mm = 2.0;
pi_micro_sd_cutout_depth_mm = 14.0;
pi_micro_sd_cutout_height_mm = 5.0;
pi_micro_sd_cutout_center_x_mm = -32.5;
pi_micro_sd_cutout_center_y_mm = 1.1;
pi_micro_sd_cutout_local_center_z_mm = 1.4;
pi_mini_hdmi_head_length_mm = 20.80;
pi_mini_hdmi_head_height_mm = 11.30;
pi_mini_hdmi_cutout_depth_mm = 7.5;
pi_mini_hdmi_cutout_size_mm = [
    pi_mini_hdmi_head_length_mm,
    pi_mini_hdmi_cutout_depth_mm,
    pi_mini_hdmi_head_height_mm
];
pi_mini_hdmi_cutout_center_x_mm = -20.1;
pi_mini_hdmi_cutout_center_y_offset_mm = 0.0;
pi_mini_hdmi_cutout_local_center_z_mm = 1.8;
pi_micro_usb_power_head_length_mm = 10.30;
pi_micro_usb_power_head_height_mm = 7.15;
pi_micro_usb_power_cutout_depth_mm = 7.5;
pi_micro_usb_power_cutout_size_mm = [
    pi_micro_usb_power_head_length_mm,
    pi_micro_usb_power_cutout_depth_mm,
    pi_micro_usb_power_head_height_mm
];
pi_micro_usb_power_cutout_center_x_mm = 21.5;
pi_micro_usb_power_cutout_center_y_offset_mm = 0.0;
pi_micro_usb_power_cutout_local_center_z_mm = 1.4;
pi_camera_cutout_size_mm = [8.0, 20.0, 5.0];
pi_camera_cutout_center_x_mm = 32.5;
pi_camera_cutout_center_y_mm = 0.0;
pi_camera_cutout_local_center_z_mm = 2.6;
waveshare_rj45_cutout_size_mm = [16.68, 12.3, 16.0];
waveshare_rj45_cutout_center_x_mm = -7.76;
waveshare_rj45_cutout_center_y_offset_mm = 0.0;
waveshare_rj45_cutout_local_center_z_mm = 8.1;
waveshare_front_usb_a_cutout_size_mm = [13.3, 5.7, 10.0];
waveshare_front_usb_a_cutout_center_x_mm = 10.83;
waveshare_front_usb_a_cutout_center_y_offset_mm = 0.0;
waveshare_front_usb_a_cutout_local_center_z_mm = 5.1;
waveshare_left_usb_a_cutout_size_mm = [5.7, 13.3, 11.0];
waveshare_left_usb_a_cutout_center_x_mm = -39.9;
waveshare_left_usb_a_cutout_center_y_mm = 0.0;
waveshare_left_usb_a_cutout_local_center_z_mm = 5.1;
waveshare_right_usb_a_cutout_size_mm = [5.7, 13.3, 12.0];
waveshare_right_usb_a_cutout_center_x_mm = 40.8;
waveshare_right_usb_a_cutout_center_y_mm = 0.0;
waveshare_right_usb_a_cutout_local_center_z_mm = 5.1;
wireless_dongle_extra_clearance_x_mm = 3.0;
port_cutout_extra_clearance_mm = 0.6;
top_cover_usb_effective_width_mm = 15.4;
top_cover_usb_effective_height_mm = 7.4;

// Micro USB bridge/addon outside-PCB clearance
micro_usb_bridge_outside_pcb_y_mm = 10.9;
micro_usb_bridge_fit_clearance_mm = 1.0;

// Top ventilation/access hole pattern
cover_vent_columns = 5;
cover_vent_rows = 4;
cover_vent_hole_diameter_mm = 4.0;
cover_vent_spacing_x_mm = 10.5;
cover_vent_spacing_y_mm = 6.0;
cover_vent_offset_x_mm = 0.0;
cover_vent_offset_y_mm = 0.0;

// Anti-slide recesses/feet
use_rubber_foot_recesses = true;
rubber_foot_recess_diameter_mm = 9.0;
rubber_foot_recess_depth_mm = 0.9;
rubber_foot_recess_edge_inset_x_mm = 10.0;
rubber_foot_recess_edge_inset_y_mm = 7.5;
printed_foot_diameter_mm = 8.0;
printed_foot_height_mm = 1.0;

// Tolerances and print clearances
fit_tolerance_mm = 0.25;
solid_merge_overlap_mm = 0.4;
preview_overlap_mm = 0.02;
guide_alpha = 0.28;

// Printable layout
printable_layout_spacing_mm = 28.0;

// Visual settings
tray_colour = "Gainsboro";
cover_colour = "LightSteelBlue";
standoff_colour = "Silver";
cutout_guide_colour = "Orange";

// ======================================================
// Derived Values
// ======================================================

internal_length_mm = board_length_mm + 2 * board_clearance_x_mm;
micro_usb_bridge_required_internal_width_mm =
    board_width_mm
    + 2 * (micro_usb_bridge_outside_pcb_y_mm + micro_usb_bridge_fit_clearance_mm);
internal_width_mm =
    max(
        board_width_mm + 2 * board_clearance_y_mm,
        micro_usb_bridge_required_internal_width_mm
    );
outer_length_mm = internal_length_mm + 2 * wall_thickness_mm;
outer_width_mm = internal_width_mm + 2 * wall_thickness_mm;

pi_zero_bottom_z_mm = floor_thickness_mm + pi_zero_standoff_height_mm + electronics_preview_lift_mm;
waveshare_hat_bottom_z_mm = pi_zero_bottom_z_mm + pi_zero_to_waveshare_hat_z_offset_mm;
grove_hat_bottom_z_mm = waveshare_hat_bottom_z_mm + waveshare_to_grove_hat_z_offset_mm;

stack_clearance_height_mm = measured_stack_height_mm + extra_upward_headroom_mm;
stack_planned_top_z_mm = floor_thickness_mm + pi_zero_standoff_height_mm + stack_clearance_height_mm;

internal_clearance_top_z_mm = stack_planned_top_z_mm;
case_total_height_mm =
    internal_clearance_top_z_mm
    + top_roof_thickness_mm
    + top_cover_internal_clearance_mm;
top_cover_height_mm = case_total_height_mm - tray_wall_height_mm;

pi_micro_sd_cutout_width_mm =
    micro_sd_card_width_mm + micro_sd_card_total_clearance_mm;
pi_micro_sd_wall_pierce_depth_mm =
    2 * (outer_length_mm / 2 - abs(pi_micro_sd_cutout_center_x_mm))
    + 2 * micro_sd_wall_through_overlap_mm;
pi_micro_sd_cutout_through_depth_mm =
    max(pi_micro_sd_cutout_depth_mm, pi_micro_sd_wall_pierce_depth_mm);
pi_micro_sd_cutout_center_z_mm = pi_zero_bottom_z_mm + pi_micro_sd_cutout_local_center_z_mm;
pi_mini_hdmi_cutout_center_y_mm =
    front_wall_cutout_center_y_mm(pi_mini_hdmi_cutout_size_mm[1])
    + pi_mini_hdmi_cutout_center_y_offset_mm;
pi_mini_hdmi_cutout_center_z_mm = pi_zero_bottom_z_mm + pi_mini_hdmi_cutout_local_center_z_mm;
pi_micro_usb_power_cutout_center_y_mm =
    front_wall_cutout_center_y_mm(pi_micro_usb_power_cutout_size_mm[1])
    + pi_micro_usb_power_cutout_center_y_offset_mm;
pi_micro_usb_power_cutout_center_z_mm = pi_zero_bottom_z_mm + pi_micro_usb_power_cutout_local_center_z_mm;
pi_camera_cutout_center_z_mm = pi_zero_bottom_z_mm + pi_camera_cutout_local_center_z_mm;
waveshare_rj45_cutout_center_y_mm =
    front_wall_cutout_center_y_mm(waveshare_rj45_cutout_size_mm[1])
    + waveshare_rj45_cutout_center_y_offset_mm;
waveshare_rj45_cutout_center_z_mm = waveshare_hat_bottom_z_mm + waveshare_rj45_cutout_local_center_z_mm;
waveshare_front_usb_a_cutout_center_y_mm =
    front_wall_cutout_center_y_mm(waveshare_front_usb_a_cutout_size_mm[1])
    + waveshare_front_usb_a_cutout_center_y_offset_mm;
waveshare_front_usb_a_cutout_center_z_mm = waveshare_hat_bottom_z_mm + waveshare_front_usb_a_cutout_local_center_z_mm;
waveshare_left_usb_a_cutout_center_z_mm = waveshare_hat_bottom_z_mm + waveshare_left_usb_a_cutout_local_center_z_mm;
waveshare_right_usb_a_cutout_center_z_mm = waveshare_hat_bottom_z_mm + waveshare_right_usb_a_cutout_local_center_z_mm;

pi_mounting_hole_x_mm = board_length_mm / 2 - pi_mounting_hole_edge_offset_mm;
pi_mounting_hole_y_mm = board_width_mm / 2 - pi_mounting_hole_edge_offset_mm;
pi_mounting_hole_centers_mm = [
    [-pi_mounting_hole_x_mm, -pi_mounting_hole_y_mm],
    [pi_mounting_hole_x_mm, -pi_mounting_hole_y_mm],
    [-pi_mounting_hole_x_mm, pi_mounting_hole_y_mm],
    [pi_mounting_hole_x_mm, pi_mounting_hole_y_mm]
];

cover_pin_centers_mm = [
    [-cover_pin_offset_x_mm, -cover_pin_offset_y_mm],
    [cover_pin_offset_x_mm, -cover_pin_offset_y_mm],
    [-cover_pin_offset_x_mm, cover_pin_offset_y_mm],
    [cover_pin_offset_x_mm, cover_pin_offset_y_mm]
];
active_cover_pin_count = min(cover_pin_count, len(cover_pin_centers_mm));
cover_pin_start_z_mm = tray_wall_height_mm - cover_pin_insertion_length_mm;
tray_socket_hole_center_z_mm =
    tray_wall_height_mm
    - tray_socket_depth_mm / 2
    + preview_overlap_mm / 2;
tray_socket_hole_diameter_mm = cover_pin_diameter_mm + tray_socket_clearance_mm;

top_cover_roof_inner_z_mm = case_total_height_mm - top_roof_thickness_mm;
ir_top_cover_mount_usable_screw_depth_mm =
    max(
        ir_top_cover_mount_max_screw_length_including_head_mm
        - ir_top_cover_mount_screw_head_height_allowance_mm
        - ir_top_cover_pcb_thickness_mm,
        1.0
    );
ir_top_cover_mount_boss_height_mm = ir_top_cover_mount_usable_screw_depth_mm;
ir_top_cover_mount_pilot_depth_mm = ir_top_cover_mount_usable_screw_depth_mm;
ir_top_cover_mount_boss_start_z_mm =
    top_cover_roof_inner_z_mm - ir_top_cover_mount_boss_height_mm;
ir_top_cover_mount_hole_centers_mm = [
    [
        ir_top_cover_pcb_center_x_mm - ir_top_cover_mount_hole_spacing_x_mm / 2,
        ir_top_cover_pcb_center_y_mm
    ],
    [
        ir_top_cover_pcb_center_x_mm + ir_top_cover_mount_hole_spacing_x_mm / 2,
        ir_top_cover_pcb_center_y_mm
    ]
];
ir_top_cover_led_aperture_center_x_mm =
    ir_top_cover_pcb_center_x_mm + ir_top_cover_led_local_x_mm;
ir_top_cover_led_aperture_depth_mm =
    wall_thickness_mm + ir_top_cover_led_aperture_wall_overtravel_mm;
ir_top_cover_led_aperture_effective_depth_mm =
    ir_top_cover_led_aperture_depth_mm + port_cutout_extra_clearance_mm;
ir_top_cover_led_aperture_center_y_mm =
    front_wall_cutout_center_y_mm(ir_top_cover_led_aperture_depth_mm);
ir_top_cover_led_center_below_roof_inner_mm =
    ir_top_cover_mount_boss_height_mm
    + ir_top_cover_pcb_thickness_mm
    + ir_top_cover_led_center_above_component_face_mm;
ir_top_cover_led_aperture_center_z_mm =
    top_cover_roof_inner_z_mm - ir_top_cover_led_center_below_roof_inner_mm;
ir_top_cover_mount_vent_keepout_radius_mm =
    ir_top_cover_mount_boss_outer_diameter_mm / 2
    + cover_vent_hole_diameter_mm / 2
    + ir_top_cover_feature_vent_clearance_mm;

rubber_foot_recess_x_mm = outer_length_mm / 2 - rubber_foot_recess_edge_inset_x_mm;
rubber_foot_recess_y_mm = outer_width_mm / 2 - rubber_foot_recess_edge_inset_y_mm;
anti_slide_centers_mm = [
    [-rubber_foot_recess_x_mm, -rubber_foot_recess_y_mm],
    [rubber_foot_recess_x_mm, -rubber_foot_recess_y_mm],
    [-rubber_foot_recess_x_mm, rubber_foot_recess_y_mm],
    [rubber_foot_recess_x_mm, rubber_foot_recess_y_mm]
];

port_cutouts_mm = [
    ["pi_micro_sd", pi_micro_sd_cutout_center_x_mm, pi_micro_sd_cutout_center_y_mm, pi_micro_sd_cutout_center_z_mm, pi_micro_sd_cutout_through_depth_mm, pi_micro_sd_cutout_width_mm, pi_micro_sd_cutout_height_mm],
    ["pi_mini_hdmi", pi_mini_hdmi_cutout_center_x_mm, pi_mini_hdmi_cutout_center_y_mm, pi_mini_hdmi_cutout_center_z_mm, pi_mini_hdmi_cutout_size_mm[0], pi_mini_hdmi_cutout_size_mm[1], pi_mini_hdmi_cutout_size_mm[2]],
    ["pi_micro_usb_power", pi_micro_usb_power_cutout_center_x_mm, pi_micro_usb_power_cutout_center_y_mm, pi_micro_usb_power_cutout_center_z_mm, pi_micro_usb_power_cutout_size_mm[0], pi_micro_usb_power_cutout_size_mm[1], pi_micro_usb_power_cutout_size_mm[2]],
    ["pi_camera", pi_camera_cutout_center_x_mm, pi_camera_cutout_center_y_mm, pi_camera_cutout_center_z_mm, pi_camera_cutout_size_mm[0], pi_camera_cutout_size_mm[1], pi_camera_cutout_size_mm[2]],
    ["waveshare_rj45", waveshare_rj45_cutout_center_x_mm, waveshare_rj45_cutout_center_y_mm, waveshare_rj45_cutout_center_z_mm, waveshare_rj45_cutout_size_mm[0], waveshare_rj45_cutout_size_mm[1], waveshare_rj45_cutout_size_mm[2]],
    ["waveshare_front_usb_a", waveshare_front_usb_a_cutout_center_x_mm, waveshare_front_usb_a_cutout_center_y_mm, waveshare_front_usb_a_cutout_center_z_mm, waveshare_front_usb_a_cutout_size_mm[0], waveshare_front_usb_a_cutout_size_mm[1], waveshare_front_usb_a_cutout_size_mm[2]],
    ["waveshare_left_usb_a", waveshare_left_usb_a_cutout_center_x_mm, waveshare_left_usb_a_cutout_center_y_mm, waveshare_left_usb_a_cutout_center_z_mm, waveshare_left_usb_a_cutout_size_mm[0], waveshare_left_usb_a_cutout_size_mm[1], waveshare_left_usb_a_cutout_size_mm[2]],
    ["waveshare_right_usb_a_dongle", waveshare_right_usb_a_cutout_center_x_mm, waveshare_right_usb_a_cutout_center_y_mm, waveshare_right_usb_a_cutout_center_z_mm, waveshare_right_usb_a_cutout_size_mm[0] + wireless_dongle_extra_clearance_x_mm, waveshare_right_usb_a_cutout_size_mm[1], waveshare_right_usb_a_cutout_size_mm[2]]
];

top_cover_usb_cutout_width_mm =
    top_cover_usb_effective_width_mm - port_cutout_extra_clearance_mm;
top_cover_usb_cutout_height_mm =
    top_cover_usb_effective_height_mm - port_cutout_extra_clearance_mm;
function top_cover_side_wall_cutout_depth_x_mm(center_x_mm) =
    max(
        2 * (outer_length_mm / 2 - abs(center_x_mm))
            + 2 * preview_overlap_mm
            - port_cutout_extra_clearance_mm,
        0
    );
top_cover_pi_micro_usb_power_cutout_size_mm = [
    max(pi_micro_usb_power_cutout_size_mm[0], top_cover_usb_cutout_width_mm),
    pi_micro_usb_power_cutout_size_mm[1],
    max(pi_micro_usb_power_cutout_size_mm[2], top_cover_usb_cutout_height_mm)
];
top_cover_waveshare_front_usb_a_cutout_size_mm = [
    max(waveshare_front_usb_a_cutout_size_mm[0], top_cover_usb_cutout_width_mm),
    waveshare_front_usb_a_cutout_size_mm[1],
    max(waveshare_front_usb_a_cutout_size_mm[2], top_cover_usb_cutout_height_mm)
];
top_cover_waveshare_left_usb_a_cutout_size_mm = [
    max(
        waveshare_left_usb_a_cutout_size_mm[0],
        top_cover_side_wall_cutout_depth_x_mm(waveshare_left_usb_a_cutout_center_x_mm)
    ),
    max(waveshare_left_usb_a_cutout_size_mm[1], top_cover_usb_cutout_width_mm),
    max(waveshare_left_usb_a_cutout_size_mm[2], top_cover_usb_cutout_height_mm)
];
top_cover_waveshare_right_usb_a_cutout_size_mm = [
    max(
        waveshare_right_usb_a_cutout_size_mm[0] + wireless_dongle_extra_clearance_x_mm,
        top_cover_side_wall_cutout_depth_x_mm(waveshare_right_usb_a_cutout_center_x_mm)
    ),
    max(waveshare_right_usb_a_cutout_size_mm[1], top_cover_usb_cutout_width_mm),
    max(waveshare_right_usb_a_cutout_size_mm[2], top_cover_usb_cutout_height_mm)
];
top_cover_port_cutouts_mm = [
    ["pi_micro_sd", pi_micro_sd_cutout_center_x_mm, pi_micro_sd_cutout_center_y_mm, pi_micro_sd_cutout_center_z_mm, pi_micro_sd_cutout_through_depth_mm, pi_micro_sd_cutout_width_mm, pi_micro_sd_cutout_height_mm],
    ["pi_mini_hdmi", pi_mini_hdmi_cutout_center_x_mm, pi_mini_hdmi_cutout_center_y_mm, pi_mini_hdmi_cutout_center_z_mm, pi_mini_hdmi_cutout_size_mm[0], pi_mini_hdmi_cutout_size_mm[1], pi_mini_hdmi_cutout_size_mm[2]],
    ["pi_micro_usb_power", pi_micro_usb_power_cutout_center_x_mm, pi_micro_usb_power_cutout_center_y_mm, pi_micro_usb_power_cutout_center_z_mm, top_cover_pi_micro_usb_power_cutout_size_mm[0], top_cover_pi_micro_usb_power_cutout_size_mm[1], top_cover_pi_micro_usb_power_cutout_size_mm[2]],
    ["pi_camera", pi_camera_cutout_center_x_mm, pi_camera_cutout_center_y_mm, pi_camera_cutout_center_z_mm, pi_camera_cutout_size_mm[0], pi_camera_cutout_size_mm[1], pi_camera_cutout_size_mm[2]],
    ["waveshare_rj45", waveshare_rj45_cutout_center_x_mm, waveshare_rj45_cutout_center_y_mm, waveshare_rj45_cutout_center_z_mm, waveshare_rj45_cutout_size_mm[0], waveshare_rj45_cutout_size_mm[1], waveshare_rj45_cutout_size_mm[2]],
    ["waveshare_front_usb_a", waveshare_front_usb_a_cutout_center_x_mm, waveshare_front_usb_a_cutout_center_y_mm, waveshare_front_usb_a_cutout_center_z_mm, top_cover_waveshare_front_usb_a_cutout_size_mm[0], top_cover_waveshare_front_usb_a_cutout_size_mm[1], top_cover_waveshare_front_usb_a_cutout_size_mm[2]],
    ["waveshare_left_usb_a", waveshare_left_usb_a_cutout_center_x_mm, waveshare_left_usb_a_cutout_center_y_mm, waveshare_left_usb_a_cutout_center_z_mm, top_cover_waveshare_left_usb_a_cutout_size_mm[0], top_cover_waveshare_left_usb_a_cutout_size_mm[1], top_cover_waveshare_left_usb_a_cutout_size_mm[2]],
    ["waveshare_right_usb_a_dongle", waveshare_right_usb_a_cutout_center_x_mm, waveshare_right_usb_a_cutout_center_y_mm, waveshare_right_usb_a_cutout_center_z_mm, top_cover_waveshare_right_usb_a_cutout_size_mm[0], top_cover_waveshare_right_usb_a_cutout_size_mm[1], top_cover_waveshare_right_usb_a_cutout_size_mm[2]]
];

// ======================================================
// Render Dispatch
// ======================================================

if (render_mode == "assembly") {
    pi_zero_usb_grove_ir_enclosure_assembly();
} else if (render_mode == "bottom_tray") {
    pi_zero_usb_grove_ir_printable_bottom_tray();
} else if (render_mode == "top_cover") {
    pi_zero_usb_grove_ir_printable_top_cover();
} else if (render_mode == "printable_layout") {
    pi_zero_usb_grove_ir_printable_layout();
} else if (render_mode == "electronics") {
    pi_zero_usb_grove_ir_electronics_reference();
} else {
    pi_zero_usb_grove_ir_enclosure_assembly();
}

// ======================================================
// Main Assemblies
// ======================================================

module pi_zero_usb_grove_ir_enclosure_assembly(
    show_case_electronics = show_electronics,
    show_guides = show_cutout_guides
) {
    pi_zero_usb_grove_ir_bottom_tray();
    pi_zero_usb_grove_ir_top_cover();

    if (show_case_electronics) {
        pi_zero_usb_grove_ir_electronics_reference();
    }

    if (show_guides) {
        pi_zero_usb_grove_ir_cutout_guides();
    }
}

module pi_zero_usb_grove_ir_printable_layout() {
    translate([-(outer_length_mm + printable_layout_spacing_mm), 0, 0])
        pi_zero_usb_grove_ir_printable_bottom_tray();

    pi_zero_usb_grove_ir_printable_top_cover();
}

module pi_zero_usb_grove_ir_electronics_reference(
    show_pi = true,
    show_waveshare = true,
    show_grove = true
) {
    if (show_pi) {
        translate([0, 0, pi_zero_bottom_z_mm])
            pi_zero_reference_model(
                show_reference = true,
                show_test_pads = true,
                show_gpio_header_position = 1,
                show_gpio_sound_vision_pads = false,
                show_gpio_pin_colours = false
            );
    }

    if (show_waveshare) {
        translate([0, 0, waveshare_hat_bottom_z_mm])
            waveshare_eth_usb_hub_hat_reference_model(
                show_hat_electronics = true,
                show_adapter = true,
                show_header = true
            );
    }

    if (show_grove) {
        translate([0, 0, grove_hat_bottom_z_mm])
            rotate([0, 0, grove_hat_rotation_deg])
                seeed_grove_base_hat_zero_reference_model(
                    show_electronics_preview = true,
                    show_gpio_header_preview = true,
                    show_gpio_socket_preview = true,
                    show_grove_label_preview = true,
                    show_pi_zero_preview = false
                );
    }
}

// ======================================================
// Printable Parts
// ======================================================

module pi_zero_usb_grove_ir_printable_bottom_tray() {
    pi_zero_usb_grove_ir_bottom_tray();
}

module pi_zero_usb_grove_ir_printable_top_cover() {
    translate([0, 0, case_total_height_mm])
        rotate([180, 0, 0])
            pi_zero_usb_grove_ir_top_cover();
}

module pi_zero_usb_grove_ir_bottom_tray() {
    color(tray_colour)
    difference() {
        union() {
            pi_zero_usb_grove_ir_tray_shell();
            pi_zero_usb_grove_ir_stack_standoffs();

            if (!use_rubber_foot_recesses) {
                pi_zero_usb_grove_ir_printed_feet();
            }
        }

        pi_zero_usb_grove_ir_port_cutout_volumes();
        pi_zero_usb_grove_ir_stack_standoff_holes();
        pi_zero_usb_grove_ir_tray_socket_holes();

        if (use_rubber_foot_recesses) {
            pi_zero_usb_grove_ir_anti_slide_features();
        }
    }
}

module pi_zero_usb_grove_ir_top_cover() {
    color(cover_colour)
    difference() {
        union() {
            pi_zero_usb_grove_ir_cover_shell();
            pi_zero_usb_grove_ir_cover_plug_pins();
            pi_zero_usb_grove_ir_top_cover_ir_pcb_mount_bosses();
        }

        pi_zero_usb_grove_ir_top_cover_port_cutout_volumes();
        pi_zero_usb_grove_ir_top_vent_holes();
        pi_zero_usb_grove_ir_top_cover_ir_pcb_mount_screw_holes();
        pi_zero_usb_grove_ir_top_cover_ir_led_aperture();
    }
}

// ======================================================
// Tray And Cover Geometry
// ======================================================

module pi_zero_usb_grove_ir_tray_shell() {
    difference() {
        pi_zero_usb_grove_ir_rounded_box(
            [outer_length_mm, outer_width_mm, tray_wall_height_mm],
            corner_radius_mm,
            [0, 0, tray_wall_height_mm / 2]
        );

        translate([0, 0, floor_thickness_mm + (tray_wall_height_mm - floor_thickness_mm) / 2])
            pi_zero_usb_grove_ir_rounded_box(
                [internal_length_mm, internal_width_mm, tray_wall_height_mm - floor_thickness_mm + preview_overlap_mm],
                max(corner_radius_mm - wall_thickness_mm, 0.8),
                [0, 0, 0]
            );
    }
}

module pi_zero_usb_grove_ir_cover_shell() {
    difference() {
        translate([0, 0, tray_wall_height_mm])
            pi_zero_usb_grove_ir_rounded_box(
                [outer_length_mm, outer_width_mm, top_cover_height_mm],
                corner_radius_mm,
                [0, 0, top_cover_height_mm / 2]
            );

        pi_zero_usb_grove_ir_cover_hollow_volume();
    }
}

module pi_zero_usb_grove_ir_cover_hollow_volume() {
    translate([0, 0, tray_wall_height_mm - cover_skirt_drop_depth_mm])
        pi_zero_usb_grove_ir_rounded_box(
            [
                internal_length_mm + 2 * cover_fit_clearance_mm,
                internal_width_mm + 2 * cover_fit_clearance_mm,
                top_cover_height_mm + cover_skirt_drop_depth_mm - top_roof_thickness_mm + preview_overlap_mm
            ],
            max(corner_radius_mm - wall_thickness_mm, 0.8),
            [
                0,
                0,
                (top_cover_height_mm + cover_skirt_drop_depth_mm - top_roof_thickness_mm + preview_overlap_mm) / 2
            ]
        );
}

module pi_zero_usb_grove_ir_cover_plug_pins() {
    color(standoff_colour)
    if (active_cover_pin_count > 0) {
        for (pin_index = [0:active_cover_pin_count - 1]) {
            pi_zero_usb_grove_ir_cover_plug_pin(cover_pin_centers_mm[pin_index]);
        }
    }
}

module pi_zero_usb_grove_ir_cover_plug_pin(pin_center_mm) {
    translate([pin_center_mm[0], pin_center_mm[1], cover_pin_start_z_mm])
        cylinder(
            h = cover_pin_insertion_length_mm + solid_merge_overlap_mm,
            d = cover_pin_diameter_mm
        );
}

module pi_zero_usb_grove_ir_tray_socket_holes() {
    if (active_cover_pin_count > 0) {
        for (pin_index = [0:active_cover_pin_count - 1]) {
            translate([
                cover_pin_centers_mm[pin_index][0],
                cover_pin_centers_mm[pin_index][1],
                tray_socket_hole_center_z_mm
            ])
                cylinder(
                    h = tray_socket_depth_mm + preview_overlap_mm,
                    d = tray_socket_hole_diameter_mm,
                    center = true
                );
        }
    }
}

module pi_zero_usb_grove_ir_top_vent_holes() {
    for (column_index = [0:cover_vent_columns - 1])
    for (row_index = [0:cover_vent_rows - 1]) {
        vent_x_mm =
            (column_index - (cover_vent_columns - 1) / 2) * cover_vent_spacing_x_mm
            + cover_vent_offset_x_mm;
        vent_y_mm =
            (row_index - (cover_vent_rows - 1) / 2) * cover_vent_spacing_y_mm
            + cover_vent_offset_y_mm;

        if (!top_cover_vent_reserved_by_ir_mount(vent_x_mm, vent_y_mm)) {
            translate([vent_x_mm, vent_y_mm, case_total_height_mm - top_roof_thickness_mm / 2])
                cylinder(
                    h = top_roof_thickness_mm + 2 * preview_overlap_mm,
                    d = cover_vent_hole_diameter_mm,
                    center = true
                );
        }
    }
}

module pi_zero_usb_grove_ir_top_cover_ir_pcb_mount_bosses() {
    color(standoff_colour)
    if (enable_top_cover_ir_pcb_mount) {
        for (hole_center_mm = ir_top_cover_mount_hole_centers_mm) {
            translate([hole_center_mm[0], hole_center_mm[1], ir_top_cover_mount_boss_start_z_mm])
                cylinder(
                    h = ir_top_cover_mount_boss_height_mm + solid_merge_overlap_mm,
                    d = ir_top_cover_mount_boss_outer_diameter_mm
                );
        }
    }
}

module pi_zero_usb_grove_ir_top_cover_ir_pcb_mount_screw_holes() {
    if (enable_top_cover_ir_pcb_mount) {
        for (hole_center_mm = ir_top_cover_mount_hole_centers_mm) {
            translate([
                hole_center_mm[0],
                hole_center_mm[1],
                ir_top_cover_mount_boss_start_z_mm
                    + ir_top_cover_mount_pilot_depth_mm / 2
                    - preview_overlap_mm
            ])
                cylinder(
                    h = ir_top_cover_mount_pilot_depth_mm + 2 * preview_overlap_mm,
                    d = ir_top_cover_mount_screw_hole_diameter_mm,
                    center = true
                );
        }
    }
}

module pi_zero_usb_grove_ir_top_cover_ir_led_aperture() {
    if (enable_top_cover_ir_pcb_mount) {
        translate([
            ir_top_cover_led_aperture_center_x_mm,
            ir_top_cover_led_aperture_center_y_mm,
            ir_top_cover_led_aperture_center_z_mm
        ])
            rotate([90, 0, 0])
            cylinder(
                h = ir_top_cover_led_aperture_effective_depth_mm,
                d = ir_top_cover_led_aperture_diameter_mm,
                center = true
            );
    }
}

// ======================================================
// Standoffs And Anti-Slide Features
// ======================================================

module pi_zero_usb_grove_ir_stack_standoffs() {
    color(standoff_colour)
    for (hole_center_mm = pi_mounting_hole_centers_mm) {
        translate([hole_center_mm[0], hole_center_mm[1], floor_thickness_mm])
            cylinder(h = pi_zero_standoff_height_mm, d = pi_standoff_outer_diameter_mm);
    }
}

module pi_zero_usb_grove_ir_stack_standoff_holes() {
    for (hole_center_mm = pi_mounting_hole_centers_mm) {
        translate([hole_center_mm[0], hole_center_mm[1], floor_thickness_mm + pi_zero_standoff_height_mm - pi_standoff_pilot_depth_mm])
            cylinder(
                h = pi_standoff_pilot_depth_mm + preview_overlap_mm,
                d = pi_standoff_screw_hole_diameter_mm
            );
    }
}

module pi_zero_usb_grove_ir_anti_slide_features() {
    for (foot_center_mm = anti_slide_centers_mm) {
        translate([foot_center_mm[0], foot_center_mm[1], -preview_overlap_mm])
            cylinder(
                h = rubber_foot_recess_depth_mm + preview_overlap_mm,
                d = rubber_foot_recess_diameter_mm
            );
    }
}

module pi_zero_usb_grove_ir_printed_feet() {
    for (foot_center_mm = anti_slide_centers_mm) {
        translate([foot_center_mm[0], foot_center_mm[1], -printed_foot_height_mm])
            cylinder(h = printed_foot_height_mm, d = printed_foot_diameter_mm);
    }
}

// ======================================================
// Cutouts And Guides
// ======================================================

module pi_zero_usb_grove_ir_port_cutout_volumes() {
    for (port_mm = port_cutouts_mm) {
        pi_zero_usb_grove_ir_port_cutout_volume(port_mm);
    }
}

module pi_zero_usb_grove_ir_top_cover_port_cutout_volumes() {
    for (port_mm = top_cover_port_cutouts_mm) {
        pi_zero_usb_grove_ir_port_cutout_volume(port_mm);
    }
}

module pi_zero_usb_grove_ir_port_cutout_volume(port_mm) {
    translate([port_mm[1], port_mm[2], port_mm[3]])
        cube(
            [
                port_mm[4] + port_cutout_extra_clearance_mm,
                port_mm[5] + port_cutout_extra_clearance_mm,
                port_mm[6] + port_cutout_extra_clearance_mm
            ],
            center = true
        );
}

module pi_zero_usb_grove_ir_cutout_guides() {
    color(cutout_guide_colour, guide_alpha)
        union() {
            pi_zero_usb_grove_ir_port_cutout_volumes();
            pi_zero_usb_grove_ir_top_cover_ir_led_aperture();
            pi_zero_usb_grove_ir_top_cover_ir_pcb_mount_screw_holes();
        }
}

// ======================================================
// Helper Geometry
// ======================================================

function front_wall_cutout_center_y_mm(cutout_depth_mm) =
    -outer_width_mm / 2 + (cutout_depth_mm + port_cutout_extra_clearance_mm) / 2 - preview_overlap_mm;

function distance_2d_mm(x1_mm, y1_mm, x2_mm, y2_mm) =
    sqrt((x2_mm - x1_mm) * (x2_mm - x1_mm) + (y2_mm - y1_mm) * (y2_mm - y1_mm));

function top_cover_vent_reserved_by_ir_mount(vent_x_mm, vent_y_mm) =
    enable_top_cover_ir_pcb_mount
    && (
        distance_2d_mm(
            vent_x_mm,
            vent_y_mm,
            ir_top_cover_mount_hole_centers_mm[0][0],
            ir_top_cover_mount_hole_centers_mm[0][1]
        ) < ir_top_cover_mount_vent_keepout_radius_mm
        || distance_2d_mm(
            vent_x_mm,
            vent_y_mm,
            ir_top_cover_mount_hole_centers_mm[1][0],
            ir_top_cover_mount_hole_centers_mm[1][1]
        ) < ir_top_cover_mount_vent_keepout_radius_mm
    );

module pi_zero_usb_grove_ir_rounded_box(size_mm, radius_mm, center_mm) {
    translate(center_mm)
        hull()
            for (x_sign = [-1, 1])
            for (y_sign = [-1, 1]) {
                translate([
                    x_sign * (size_mm[0] / 2 - radius_mm),
                    y_sign * (size_mm[1] / 2 - radius_mm),
                    0
                ])
                    cylinder(h = size_mm[2], r = radius_mm, center = true);
            }
}
