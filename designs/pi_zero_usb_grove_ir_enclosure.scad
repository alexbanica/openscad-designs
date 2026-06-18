// Pi Zero USB Grove IR enclosure.
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
use <grove_infrared_emitter.scad>

// ======================================================
// Adjustable Parameters
// ======================================================

// Render controls
$fn = 48;
render_mode = "printable_layout"; // [assembly/bottom_tray/top_cover/ir_pod/ir_pod_cap/printable_layout/electronics]
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

// Port cutout dimensions and offsets
micro_sd_card_width_mm = 11.0;
micro_sd_card_total_clearance_mm = 2.0;
micro_sd_wall_through_overlap_mm = 2.0;
pi_micro_sd_cutout_depth_mm = 14.0;
pi_micro_sd_cutout_height_mm = 5.0;
pi_micro_sd_cutout_center_x_mm = -32.5;
pi_micro_sd_cutout_center_y_mm = 1.1;
pi_micro_sd_cutout_local_center_z_mm = 1.4;
pi_mini_hdmi_cutout_size_mm = [13.5, 7.5, 7.0];
pi_mini_hdmi_cutout_center_x_mm = -20.1;
pi_mini_hdmi_cutout_center_y_offset_mm = 0.0;
pi_mini_hdmi_cutout_local_center_z_mm = 1.8;
pi_micro_usb_power_cutout_size_mm = [9.5, 7.5, 6.0];
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

// External IR emitter pod dimensions and attachment interface
pod_attachment_side = "front"; // [front/rear]
pod_outer_width_mm = 31.8;
pod_outer_depth_mm = 32.0;
pod_outer_height_mm = 24.0;
pod_wall_thickness_mm = 2.4;
pod_roof_thickness_mm = 2.0;
pod_floor_thickness_mm = 2.4;
pod_corner_radius_mm = 2.0;
pod_cap_thickness_mm = pod_roof_thickness_mm;
pod_cap_fit_clearance_mm = 0.25;
pod_cap_insert_diameter_mm = 3.2;
pod_cap_insert_insertion_depth_mm = 6.0;
pod_cap_insert_socket_clearance_mm = 0.35;
pod_cap_insert_socket_depth_mm = 5.1;
pod_cap_insert_receiver_wall_thickness_mm = 1.0;
pod_cap_insert_existing_receiver_lock_insert_depth_mm = 4.5;
// Cap-side root shoulder is a short, direct transition from the cap underside into the pin body.
pod_cap_insert_pin_root_diameter_mm = 3.8;
pod_cap_insert_pin_root_depth_mm = 0.4;
pod_cap_insert_keeper_pin_diameter_mm = 1.2;
pod_cap_insert_keeper_pin_clearance_mm = 0.45;
pod_cap_insert_lock_wrap_clearance_mm = 1.2;
pod_cap_insert_lock_bridge_depth_mm = 1.2;
pod_cap_insert_lock_bridge_height_mm = 1.2;
pod_cap_insert_count = 2;
pod_cap_insert_spacing_mm = 33.8;
pod_cap_insert_external_wall_overlap_mm = 0.2;
pod_cap_insert_tab_margin_mm = 0.8;
pod_attachment_gap_mm = 0.4;
pod_center_offset_x_mm = 24.5;
pod_center_offset_z_mm = 0.0;
pod_attachment_post_count = 2;
pod_attachment_post_spacing_x_mm = 20.0;
pod_attachment_post_x_offset_mm = 0.0;
pod_attachment_post_local_y_offset_mm = 2.0;
pod_attachment_post_root_overlap_mm = 2.0; // Root overlap into pod wall for default male posts
pod_attachment_post_center_z_from_bottom_mm = 8.0;
pod_attachment_post_diameter_mm = 3.0;
pod_attachment_post_insertion_length_mm = 6.0;
pod_attachment_post_lock_pin_diameter_mm = 1.2;
pod_attachment_post_lock_pin_clearance_mm = 0.45;
pod_attachment_post_lock_pin_engagement_depth_mm = 4.0;
pod_attachment_post_lock_bridge_depth_mm = 1.2;
pod_attachment_post_lock_bridge_height_mm = 1.2;
pod_attachment_socket_clearance_mm = 0.35;
pod_attachment_socket_depth_mm = 6.0;
pod_attachment_socket_reinforcement_thickness_mm = 1.2;
pod_attachment_socket_reinforcement_length_mm = 1.5;

// IR emitter pod board mount
// Source-of-truth defaults for connector/connector geometry and default cable clearances still come from
// designs/grove_infrared_emitter.scad, but pod-fit width for this enclosure now uses a local 23.65 mm
// earlobe-inclusive override for the support boss/pilot-hole spacing and cap-to-pod alignment.
ir_pcb_width_mm = 23.65;
ir_pcb_length_mm = 23.75;
ir_pcb_thickness_mm = 1.6;
emitter_board_center_local_x_mm = 0.0;
emitter_board_center_local_y_mm = 1.5;
emitter_board_bottom_from_pod_floor_mm = 5.0;
emitter_board_rotation_deg = 0.0;
ir_mount_standoff_outer_diameter_mm = 4.8;
ir_mount_screw_hole_diameter_mm = 2.1;
ir_mount_pilot_hole_depth_mm = 7.5;
enable_ir_mount_optional_pilot_holes = true;
ir_mounting_hole_edge_offset_x_mm = 1.75;
ir_grove_connector_local_x_mm = 0.0;
ir_grove_connector_local_y_mm = -8.1;
ir_grove_connector_total_top_envelope_mm = 9.65;
ir_grove_connector_local_cable_z_allowance_mm = 1.55;
ir_grove_connector_local_cable_z_mm =
    ir_grove_connector_total_top_envelope_mm
    + ir_grove_connector_local_cable_z_allowance_mm;

// IR LED aperture
ir_led_diameter_mm = 5.0;
ir_led_body_length_mm = 7.0;
ir_led_extension_beyond_pcb_mm = 7.5;
ir_led_aperture_diameter_mm = 6.2;
ir_led_local_center_x_mm = 0.0;
ir_led_local_center_z_mm = 4.0;
ir_led_aperture_center_offset_x_mm = 0.0;
ir_led_aperture_center_offset_z_mm = 0.0;
ir_led_aperture_wall_clearance_depth_mm = 6.0;
ir_led_aperture_pass_through_overlap_mm = 2.0;
ir_led_aperture_external_guide_length_mm = 20.0;

// Main-to-pod Grove cable path
grove_selected_socket_coordinate_x_mm = 9.4;
grove_selected_socket_coordinate_y_mm = 12.6;
grove_selected_socket_offset_x_mm = 0.0;
grove_selected_socket_offset_y_mm = -0.8;
grove_hat_coordinate_origin_x_mm = -15.0;
grove_hat_coordinate_origin_y_mm = -32.5;
grove_hat_connector_top_local_z_mm = 9.6;
grove_cable_path_width_mm = 10.0;
grove_cable_path_height_mm = 6.0;
grove_cable_path_start_local_z_offset_mm = 4.2;
grove_cable_path_start_offset_x_mm = 0.0;
grove_cable_path_start_offset_y_mm = 0.0;
main_cable_exit_size_mm = [12.0, 8.0, 7.0];
main_cable_exit_offset_x_mm = 0.0;
main_cable_exit_offset_z_mm = 0.0;
pod_cable_entry_size_mm = [12.0, 8.0, 7.0];
pod_cable_entry_local_x_mm = 0.0;
pod_cable_entry_local_z_mm = 10.0;
grove_cable_path_end_offset_x_mm = 0.0;
grove_cable_path_end_offset_y_mm = 0.0;
grove_cable_path_end_z_offset_mm = 0.0;
grove_cable_path_clearance_lift_mm = 0.4;

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
pod_cap_print_gap_mm = 10.0;

// Visual settings
tray_colour = "Gainsboro";
cover_colour = "LightSteelBlue";
pod_colour = "MistyRose";
standoff_colour = "Silver";
cutout_guide_colour = "Orange";
cable_guide_colour = "DeepSkyBlue";
ir_guide_colour = "Red";

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

grove_selected_socket_local_x_mm =
    grove_hat_coordinate_origin_x_mm
    + grove_selected_socket_coordinate_x_mm
    + grove_selected_socket_offset_x_mm;
grove_selected_socket_local_y_mm =
    grove_hat_coordinate_origin_y_mm
    + grove_selected_socket_coordinate_y_mm
    + grove_selected_socket_offset_y_mm;
grove_selected_socket_center_x_mm =
    rotate_x_mm(grove_selected_socket_local_x_mm, grove_selected_socket_local_y_mm, grove_hat_rotation_deg);
grove_selected_socket_center_y_mm =
    rotate_y_mm(grove_selected_socket_local_x_mm, grove_selected_socket_local_y_mm, grove_hat_rotation_deg);
grove_cable_path_start_x_mm = grove_selected_socket_center_x_mm + grove_cable_path_start_offset_x_mm;
grove_cable_path_start_y_mm = grove_selected_socket_center_y_mm + grove_cable_path_start_offset_y_mm;
grove_cable_path_start_z_mm =
    grove_hat_bottom_z_mm
    + grove_hat_connector_top_local_z_mm
    + grove_cable_path_start_local_z_offset_mm;

pod_base_rotation_deg = (pod_attachment_side == "rear") ? 0 : 180;
pod_center_x_mm = pod_center_offset_x_mm;
pod_center_y_mm =
    rotate_y_mm(0, outer_width_mm / 2 + pod_outer_depth_mm / 2 + pod_attachment_gap_mm, pod_base_rotation_deg);
pod_internal_width_mm = pod_outer_width_mm - 2 * pod_wall_thickness_mm;
pod_internal_depth_mm = pod_outer_depth_mm - 2 * pod_wall_thickness_mm;
pod_internal_height_mm = pod_outer_height_mm - pod_floor_thickness_mm;
pod_cap_outer_width_mm = pod_outer_width_mm - 2 * pod_cap_fit_clearance_mm;
pod_cap_outer_depth_mm = pod_outer_depth_mm - 2 * pod_cap_fit_clearance_mm;
pod_attachment_post_local_centers_mm = [
    [
        -pod_attachment_post_spacing_x_mm / 2 + pod_attachment_post_x_offset_mm,
        -pod_outer_depth_mm / 2 + pod_attachment_post_root_overlap_mm - pod_attachment_post_local_y_offset_mm
    ],
    [
        pod_attachment_post_spacing_x_mm / 2 + pod_attachment_post_x_offset_mm,
        -pod_outer_depth_mm / 2 + pod_attachment_post_root_overlap_mm - pod_attachment_post_local_y_offset_mm
    ]
];
active_pod_attachment_post_count = min(pod_attachment_post_count, len(pod_attachment_post_local_centers_mm));
pod_attachment_axis_sign_mm = (pod_attachment_side == "front") ? 1 : -1;
pod_attachment_socket_diameter_mm =
    pod_attachment_post_diameter_mm + 2 * pod_attachment_socket_clearance_mm;
pod_attachment_socket_reinforcement_diameter_mm =
    pod_attachment_post_diameter_mm
    + 2 * pod_attachment_socket_reinforcement_thickness_mm;
pod_attachment_post_socket_reinforcement_extent_mm =
    pod_attachment_socket_reinforcement_length_mm + pod_attachment_post_insertion_length_mm;
pod_attachment_socket_through_depth_mm =
    max(pod_attachment_socket_depth_mm, pod_attachment_post_socket_reinforcement_extent_mm);
pod_attachment_cover_face_y_mm =
    rotate_y_mm(0, outer_width_mm / 2, pod_base_rotation_deg);
pod_attachment_post_lock_hole_diameter_mm =
    pod_attachment_post_lock_pin_diameter_mm + 2 * pod_attachment_post_lock_pin_clearance_mm;
pod_attachment_post_lock_center_y_mm =
    pod_attachment_cover_face_y_mm
    + pod_attachment_axis_sign_mm * pod_attachment_socket_through_depth_mm / 2;
pod_attachment_post_lock_bridge_width_mm =
    pod_attachment_post_spacing_x_mm + pod_attachment_post_lock_pin_diameter_mm;
pod_cap_corner_radius_mm = max(pod_corner_radius_mm - pod_cap_fit_clearance_mm, 0.8);
pod_cap_insert_local_x_positions_mm = [
    for (insert_index = [0:pod_cap_insert_count - 1])
        (pod_cap_insert_count == 1)
            ? 0
            : (insert_index - (pod_cap_insert_count - 1) / 2) * pod_cap_insert_spacing_mm
];
pod_cap_insert_receiver_outer_diameter_mm =
    pod_cap_insert_diameter_mm + 2 * pod_cap_insert_receiver_wall_thickness_mm;
pod_cap_insert_center_y_mm = 0.0;
pod_cap_insert_tab_width_mm =
    pod_cap_insert_receiver_outer_diameter_mm + 2 * pod_cap_insert_tab_margin_mm;
pod_cap_insert_tab_depth_mm =
    pod_cap_insert_receiver_outer_diameter_mm + 2 * pod_cap_insert_tab_margin_mm;
pod_cap_insert_socket_bore_diameter_mm =
    pod_cap_insert_diameter_mm + 2 * pod_cap_insert_socket_clearance_mm;
pod_cap_insert_socket_through_depth_mm =
    pod_cap_insert_socket_depth_mm + 2 * pod_cap_insert_external_wall_overlap_mm;
pod_cap_insert_lock_hole_diameter_mm =
    pod_cap_insert_keeper_pin_diameter_mm + 2 * pod_cap_insert_keeper_pin_clearance_mm;
pod_cap_insert_lock_leg_length_mm =
    pod_outer_depth_mm
    + 2 * pod_cap_insert_lock_wrap_clearance_mm;
pod_cap_insert_lock_bridge_center_y_mm =
    -pod_cap_insert_lock_leg_length_mm / 2
    - pod_cap_insert_lock_bridge_depth_mm / 2
    + solid_merge_overlap_mm / 2;
pod_cap_insert_lock_bridge_width_mm =
    pod_cap_insert_spacing_mm + pod_cap_insert_keeper_pin_diameter_mm;
pod_cap_insert_pin_root_depth_clamped_mm =
    min(
        pod_cap_insert_pin_root_depth_mm,
        pod_cap_insert_insertion_depth_mm
    );
pod_cap_insert_pin_shaft_depth_mm =
    max(
        pod_cap_insert_insertion_depth_mm - pod_cap_insert_pin_root_depth_clamped_mm,
        0
    );
pod_cap_insert_pin_root_start_z_mm = pod_cap_insert_pin_shaft_depth_mm;

pod_cable_entry_center_x_mm =
    pod_center_x_mm
    + rotate_x_mm(pod_cable_entry_local_x_mm, -pod_outer_depth_mm / 2 + pod_wall_thickness_mm / 2, pod_base_rotation_deg);
pod_cable_entry_center_y_mm =
    pod_center_y_mm
    + rotate_y_mm(pod_cable_entry_local_x_mm, -pod_outer_depth_mm / 2 + pod_wall_thickness_mm / 2, pod_base_rotation_deg);

main_cable_exit_center_x_mm = pod_cable_entry_center_x_mm + main_cable_exit_offset_x_mm;
main_cable_exit_center_y_mm =
    rotate_y_mm(0, outer_width_mm / 2 + wall_thickness_mm / 2, pod_base_rotation_deg);
main_cable_exit_center_z_mm =
    grove_cable_path_start_z_mm
    + main_cable_exit_offset_z_mm;

pod_center_z_mm =
    main_cable_exit_center_z_mm
    - pod_cable_entry_local_z_mm
    + pod_outer_height_mm / 2
    + pod_center_offset_z_mm;
pod_cable_entry_center_z_mm = pod_center_z_mm - pod_outer_height_mm / 2 + pod_cable_entry_local_z_mm;
pod_cap_installed_top_z_mm = pod_center_z_mm + pod_outer_height_mm / 2;
pod_attachment_post_lock_center_z_mm =
    pod_center_z_mm
    - pod_outer_height_mm / 2
    + pod_attachment_post_center_z_from_bottom_mm;

emitter_board_center_x_mm =
    pod_center_x_mm
    + rotate_x_mm(emitter_board_center_local_x_mm, emitter_board_center_local_y_mm, pod_base_rotation_deg);
emitter_board_center_y_mm =
    pod_center_y_mm
    + rotate_y_mm(emitter_board_center_local_x_mm, emitter_board_center_local_y_mm, pod_base_rotation_deg);
emitter_board_bottom_z_mm = pod_center_z_mm - pod_outer_height_mm / 2 + pod_floor_thickness_mm + emitter_board_bottom_from_pod_floor_mm;
emitter_board_top_z_mm = emitter_board_bottom_z_mm + ir_pcb_thickness_mm;
emitter_board_rotation_global_deg = pod_base_rotation_deg + emitter_board_rotation_deg;

ir_led_local_center_y_mm =
    ir_pcb_length_mm / 2
    + ir_led_extension_beyond_pcb_mm
    - ir_led_body_length_mm / 2;

ir_led_center_x_mm =
    emitter_board_center_x_mm
    + rotate_x_mm(ir_led_local_center_x_mm, ir_led_local_center_y_mm, emitter_board_rotation_global_deg);
ir_led_center_y_mm =
    emitter_board_center_y_mm
    + rotate_y_mm(ir_led_local_center_x_mm, ir_led_local_center_y_mm, emitter_board_rotation_global_deg);
ir_led_center_z_mm = emitter_board_bottom_z_mm + ir_led_local_center_z_mm;
ir_led_aperture_center_x_mm = ir_led_center_x_mm + ir_led_aperture_center_offset_x_mm;
ir_led_aperture_center_y_mm =
    pod_center_y_mm
    + rotate_y_mm(0, pod_outer_depth_mm / 2, pod_base_rotation_deg);
ir_led_aperture_center_z_mm = ir_led_center_z_mm + ir_led_aperture_center_offset_z_mm;

grove_cable_path_end_x_mm =
    emitter_board_center_x_mm
    + rotate_x_mm(ir_grove_connector_local_x_mm, ir_grove_connector_local_y_mm, emitter_board_rotation_global_deg)
    + grove_cable_path_end_offset_x_mm;
grove_cable_path_end_y_mm =
    emitter_board_center_y_mm
    + rotate_y_mm(ir_grove_connector_local_x_mm, ir_grove_connector_local_y_mm, emitter_board_rotation_global_deg)
    + grove_cable_path_end_offset_y_mm;
grove_cable_path_end_z_mm =
    emitter_board_bottom_z_mm
    + ir_grove_connector_local_cable_z_mm
    + grove_cable_path_end_z_offset_mm;

grove_cable_path_top_z_mm =
    max(
        grove_cable_path_start_z_mm,
        max(main_cable_exit_center_z_mm, max(pod_cable_entry_center_z_mm, grove_cable_path_end_z_mm))
    )
    + grove_cable_path_clearance_lift_mm
    + grove_cable_path_height_mm / 2;
internal_clearance_top_z_mm = max(stack_planned_top_z_mm, grove_cable_path_top_z_mm);
case_total_height_mm =
    internal_clearance_top_z_mm
    + top_roof_thickness_mm
    + top_cover_internal_clearance_mm;
top_cover_height_mm = case_total_height_mm - tray_wall_height_mm;
pod_attachment_post_lock_hole_bottom_z_mm =
    pod_attachment_post_lock_center_z_mm
    - pod_attachment_post_lock_pin_engagement_depth_mm;
pod_attachment_post_lock_hole_center_z_mm =
    (case_total_height_mm + pod_attachment_post_lock_hole_bottom_z_mm) / 2;
pod_attachment_post_lock_hole_depth_mm =
    case_total_height_mm - pod_attachment_post_lock_hole_bottom_z_mm;
pod_attachment_post_lock_pin_lower_length_mm =
    pod_attachment_post_lock_hole_depth_mm;
pod_attachment_post_lock_pin_length_mm =
    pod_attachment_post_lock_pin_lower_length_mm;
pod_attachment_post_lock_bridge_center_z_mm =
    case_total_height_mm + pod_attachment_post_lock_bridge_height_mm / 2;
pod_cap_insert_lock_center_z_from_pod_center_mm =
    pod_outer_height_mm / 2
    - pod_cap_thickness_mm
    - pod_cap_insert_existing_receiver_lock_insert_depth_mm / 2;
pod_cap_insert_lock_center_z_from_cap_top_mm =
    -pod_cap_thickness_mm
    - pod_cap_insert_insertion_depth_mm
    + pod_cap_insert_lock_hole_diameter_mm / 2;

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

// IR pod bosses and optional pilot holes derive from the measured width via this edge inset.
ir_mounting_hole_x_mm = ir_pcb_width_mm / 2 - ir_mounting_hole_edge_offset_x_mm;
ir_mounting_hole_centerline_y_mm = 0.0;
ir_mounting_hole_centers_mm = [
    [-ir_mounting_hole_x_mm, ir_mounting_hole_centerline_y_mm],
    [ir_mounting_hole_x_mm, ir_mounting_hole_centerline_y_mm]
];

ir_led_aperture_to_pose_depth_mm =
    distance_2d_mm(ir_led_center_x_mm, ir_led_center_y_mm, ir_led_aperture_center_x_mm, ir_led_aperture_center_y_mm)
    + pod_wall_thickness_mm
    + 2 * ir_led_aperture_pass_through_overlap_mm;

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
} else if (render_mode == "ir_pod") {
    pi_zero_usb_grove_ir_printable_ir_pod_assembly();
} else if (render_mode == "ir_pod_cap") {
    pi_zero_usb_grove_ir_printable_pod_top_cap();
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
    pi_zero_usb_grove_ir_ir_pod();
    pi_zero_usb_grove_ir_pod_top_cap();
    pi_zero_usb_grove_ir_pod_attachment_post_lock();
    pi_zero_usb_grove_ir_pod_cap_insert_lock();

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

    translate([outer_length_mm + printable_layout_spacing_mm, 0, 0])
        pi_zero_usb_grove_ir_printable_ir_pod();

    translate([
        outer_length_mm + printable_layout_spacing_mm,
        -(pod_outer_depth_mm / 2
            + pod_cap_outer_depth_mm / 2
            + pod_cap_print_gap_mm),
        0
    ])
        pi_zero_usb_grove_ir_printable_pod_top_cap();

    translate([
        outer_length_mm + printable_layout_spacing_mm + pod_outer_width_mm + pod_cap_outer_width_mm + 2 * pod_cap_print_gap_mm,
        0,
        0
    ])
        pi_zero_usb_grove_ir_printable_pod_cap_insert_lock();

    translate([
        outer_length_mm + printable_layout_spacing_mm
            + pod_outer_width_mm + pod_cap_outer_width_mm
            + 2 * pod_cap_print_gap_mm
            + pod_cap_insert_lock_bridge_width_mm
            + printable_layout_spacing_mm,
        0,
        0
    ])
        pi_zero_usb_grove_ir_printable_pod_attachment_post_lock();
}

module pi_zero_usb_grove_ir_electronics_reference(
    show_pi = true,
    show_waveshare = true,
    show_grove = true,
    show_ir = true
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

    if (show_ir) {
        translate([emitter_board_center_x_mm, emitter_board_center_y_mm, emitter_board_bottom_z_mm])
            rotate([0, 0, emitter_board_rotation_global_deg])
                grove_infrared_emitter_reference_model(
                    show_electronics_preview = true,
                    show_grove_connector_preview = true,
                    show_ir_led_preview = true,
                    show_label_preview = false,
                    show_clearance_preview = true
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

module pi_zero_usb_grove_ir_printable_ir_pod() {
    translate([
        -pod_center_x_mm,
        -pod_center_y_mm,
        -(pod_center_z_mm - pod_outer_height_mm / 2)
    ])
        pi_zero_usb_grove_ir_ir_pod();
}

module pi_zero_usb_grove_ir_printable_ir_pod_assembly() {
    translate([
        -pod_center_x_mm,
        -pod_center_y_mm,
        -(pod_center_z_mm - pod_outer_height_mm / 2)
    ]) {
        pi_zero_usb_grove_ir_ir_pod();
        pi_zero_usb_grove_ir_pod_top_cap();
    }
}

module pi_zero_usb_grove_ir_printable_pod_top_cap() {
    color(pod_colour)
        rotate([180, 0, 0])
            pi_zero_usb_grove_ir_pod_top_cap_geometry();
}

module pi_zero_usb_grove_ir_printable_pod_cap_insert_lock() {
    color(standoff_colour)
    translate([
        0,
        0,
        max(pod_cap_insert_keeper_pin_diameter_mm, pod_cap_insert_lock_bridge_height_mm) / 2
    ])
        pi_zero_usb_grove_ir_pod_cap_insert_lock_geometry();
}

module pi_zero_usb_grove_ir_printable_pod_attachment_post_lock() {
    color(standoff_colour)
    translate([
        0,
        0,
        max(pod_attachment_post_lock_pin_diameter_mm, pod_attachment_post_lock_bridge_depth_mm) / 2
    ])
        rotate([90, 0, 0])
            pi_zero_usb_grove_ir_pod_attachment_post_lock_geometry();
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
            pi_zero_usb_grove_ir_cover_pod_attachment_reinforcement();
        }

        pi_zero_usb_grove_ir_top_cover_port_cutout_volumes();
        pi_zero_usb_grove_ir_main_cable_exit_volume();
        pi_zero_usb_grove_ir_main_internal_cable_path_volume();
        pi_zero_usb_grove_ir_top_vent_holes();
        pi_zero_usb_grove_ir_cover_pod_attachment_socket_holes();
        pi_zero_usb_grove_ir_pod_attachment_post_lock_holes();
    }
}

module pi_zero_usb_grove_ir_ir_pod() {
    color(pod_colour)
        difference() {
            union() {
                pi_zero_usb_grove_ir_pod_shell();
                pi_zero_usb_grove_ir_pod_board_mount();
                pi_zero_usb_grove_ir_pod_attachment_posts();
                pi_zero_usb_grove_ir_pod_top_cap_socket_volumes();
            }

            if (enable_ir_mount_optional_pilot_holes) {
                pi_zero_usb_grove_ir_pod_mount_holes();
            }
            pi_zero_usb_grove_ir_pod_cable_entry_volume();
            pi_zero_usb_grove_ir_ir_led_aperture();
            pi_zero_usb_grove_ir_pod_internal_cable_path_volume();
            pi_zero_usb_grove_ir_pod_top_cap_socket_bores();
            pi_zero_usb_grove_ir_pod_cap_insert_lock_holes();
            pi_zero_usb_grove_ir_pod_attachment_post_lock_holes();
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

        translate([vent_x_mm, vent_y_mm, case_total_height_mm - top_roof_thickness_mm / 2])
            cylinder(
                h = top_roof_thickness_mm + 2 * preview_overlap_mm,
                d = cover_vent_hole_diameter_mm,
                center = true
            );
    }
}

// ======================================================
// Standoffs, Pod Attachment, And Anti-Slide Features
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

module pi_zero_usb_grove_ir_cover_pod_attachment_reinforcement() {
    if (active_pod_attachment_post_count > 0) {
        color(standoff_colour)
            for (post_index = [0:active_pod_attachment_post_count - 1]) {
                post_local_center_mm = pod_attachment_post_local_centers_mm[post_index];
                post_world_x_mm = pod_center_x_mm + rotate_x_mm(post_local_center_mm[0], post_local_center_mm[1], pod_base_rotation_deg);
                post_world_z_mm = pod_center_z_mm - pod_outer_height_mm / 2 + pod_attachment_post_center_z_from_bottom_mm;
                post_socket_wall_y_mm =
                    pod_attachment_cover_face_y_mm
                    + pod_attachment_axis_sign_mm * pod_attachment_post_socket_reinforcement_extent_mm / 2;

                translate([post_world_x_mm, post_socket_wall_y_mm, post_world_z_mm])
                    rotate([90, 0, 0])
                        cylinder(
                            h = pod_attachment_post_socket_reinforcement_extent_mm,
                            d = pod_attachment_socket_reinforcement_diameter_mm,
                            center = true
                        );
            }
    }
}

module pi_zero_usb_grove_ir_cover_pod_attachment_socket_holes() {
    if (active_pod_attachment_post_count > 0) {
        for (post_index = [0:active_pod_attachment_post_count - 1]) {
            post_local_center_mm = pod_attachment_post_local_centers_mm[post_index];
            post_world_x_mm = pod_center_x_mm + rotate_x_mm(post_local_center_mm[0], post_local_center_mm[1], pod_base_rotation_deg);
            post_world_z_mm = pod_center_z_mm - pod_outer_height_mm / 2 + pod_attachment_post_center_z_from_bottom_mm;
            post_socket_wall_y_mm =
                pod_attachment_cover_face_y_mm
                + pod_attachment_axis_sign_mm * pod_attachment_socket_through_depth_mm / 2;

            translate([post_world_x_mm, post_socket_wall_y_mm, post_world_z_mm])
                rotate([90, 0, 0])
                    cylinder(
                        h = pod_attachment_socket_through_depth_mm + 2 * preview_overlap_mm,
                        d = pod_attachment_socket_diameter_mm,
                        center = true
                    );
        }
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
// External IR Pod
// ======================================================

module pi_zero_usb_grove_ir_pod_top_cap() {
    color(pod_colour)
    translate([pod_center_x_mm, pod_center_y_mm, pod_cap_installed_top_z_mm])
        rotate([0, 0, pod_base_rotation_deg])
            pi_zero_usb_grove_ir_pod_top_cap_geometry();
}

module pi_zero_usb_grove_ir_pod_top_cap_geometry() {
    difference() {
        union() {
            pi_zero_usb_grove_ir_rounded_box(
                [pod_cap_outer_width_mm, pod_cap_outer_depth_mm, pod_cap_thickness_mm],
                pod_cap_corner_radius_mm,
                [0, 0, -pod_cap_thickness_mm / 2]
            );

            pi_zero_usb_grove_ir_pod_top_cap_insert_pins();
            pi_zero_usb_grove_ir_pod_top_cap_insert_tab();
        }

        pi_zero_usb_grove_ir_pod_top_cap_insert_lock_holes_local();
    }
}

module pi_zero_usb_grove_ir_pod_top_cap_insert_tab() {
    if (pod_cap_insert_count > 0) {
        for (insert_x_mm = pod_cap_insert_local_x_positions_mm) {
            pi_zero_usb_grove_ir_rounded_box(
                [pod_cap_insert_tab_width_mm, pod_cap_insert_tab_depth_mm, pod_cap_thickness_mm],
                min(pod_cap_corner_radius_mm, pod_cap_insert_tab_depth_mm / 2, pod_cap_insert_tab_width_mm / 2),
                [insert_x_mm, pod_cap_insert_center_y_mm, -pod_cap_thickness_mm / 2]
            );
        }
    }
}

module pi_zero_usb_grove_ir_pod_top_cap_insert_pins() {
    for (insert_x_mm = pod_cap_insert_local_x_positions_mm) {
        translate([
            insert_x_mm,
            pod_cap_insert_center_y_mm,
            -pod_cap_thickness_mm - pod_cap_insert_insertion_depth_mm
        ])
            union() {
                if (pod_cap_insert_pin_shaft_depth_mm > 0) {
                    cylinder(
                        h = pod_cap_insert_pin_shaft_depth_mm,
                        d = pod_cap_insert_diameter_mm
                    );
                }

                if (pod_cap_insert_pin_root_depth_clamped_mm > 0) {
                    hull() {
                        translate([0, 0, pod_cap_insert_insertion_depth_mm])
                            cylinder(h = solid_merge_overlap_mm, d = pod_cap_insert_diameter_mm);
                        translate([0, 0, pod_cap_insert_pin_root_start_z_mm])
                            cylinder(
                                h = pod_cap_insert_pin_root_depth_clamped_mm,
                                d = pod_cap_insert_pin_root_diameter_mm
                            );
                    }
                }
            }
    }
}

module pi_zero_usb_grove_ir_pod_top_cap_socket_volumes() {
    for (insert_x_mm = pod_cap_insert_local_x_positions_mm) {
        translate([pod_center_x_mm, pod_center_y_mm, pod_center_z_mm])
            rotate([0, 0, pod_base_rotation_deg])
                translate([
                    insert_x_mm,
                    pod_cap_insert_center_y_mm,
                    pod_outer_height_mm / 2 - pod_cap_insert_socket_depth_mm / 2
                ])
                    cylinder(
                        h = pod_cap_insert_socket_through_depth_mm,
                        d = pod_cap_insert_receiver_outer_diameter_mm,
                        center = true
                    );
    }
}

module pi_zero_usb_grove_ir_pod_top_cap_socket_bores() {
    translate([pod_center_x_mm, pod_center_y_mm, pod_center_z_mm])
        rotate([0, 0, pod_base_rotation_deg])
            for (insert_x_mm = pod_cap_insert_local_x_positions_mm) {
                if (pod_cap_insert_socket_depth_mm > 0) {
                    translate([
                        insert_x_mm,
                        pod_cap_insert_center_y_mm,
                        pod_outer_height_mm / 2 - pod_cap_insert_socket_depth_mm / 2
                    ])
                        cylinder(
                            h = pod_cap_insert_socket_through_depth_mm + 2 * preview_overlap_mm,
                            d = pod_cap_insert_socket_bore_diameter_mm,
                            center = true
                        );
                }
            }
}

module pi_zero_usb_grove_ir_pod_top_cap_insert_lock_holes_local() {
    for (insert_x_mm = pod_cap_insert_local_x_positions_mm) {
        translate([
            insert_x_mm,
            pod_cap_insert_center_y_mm,
            pod_cap_insert_lock_center_z_from_cap_top_mm
        ])
            rotate([90, 0, 0])
                cylinder(
                    h = pod_cap_insert_lock_leg_length_mm + 2 * preview_overlap_mm,
                    d = pod_cap_insert_lock_hole_diameter_mm,
                    center = true
                );
    }
}

module pi_zero_usb_grove_ir_pod_cap_insert_lock_holes() {
    translate([pod_center_x_mm, pod_center_y_mm, pod_center_z_mm])
        rotate([0, 0, pod_base_rotation_deg])
            for (insert_x_mm = pod_cap_insert_local_x_positions_mm) {
                translate([
                    insert_x_mm,
                    pod_cap_insert_center_y_mm,
                    pod_cap_insert_lock_center_z_from_pod_center_mm
                ])
                    rotate([90, 0, 0])
                        cylinder(
                            h = pod_cap_insert_lock_leg_length_mm + 2 * preview_overlap_mm,
                            d = pod_cap_insert_lock_hole_diameter_mm,
                            center = true
                        );
            }
}

module pi_zero_usb_grove_ir_pod_cap_insert_lock_geometry() {
    for (insert_x_mm = pod_cap_insert_local_x_positions_mm) {
        translate([
            insert_x_mm,
            pod_cap_insert_center_y_mm,
            0
        ])
            rotate([90, 0, 0])
            cylinder(
                h = pod_cap_insert_lock_leg_length_mm + solid_merge_overlap_mm,
                d = pod_cap_insert_keeper_pin_diameter_mm,
                center = true
            );
    }

    pi_zero_usb_grove_ir_rounded_box(
        [
            pod_cap_insert_lock_bridge_width_mm,
            pod_cap_insert_lock_bridge_depth_mm,
            pod_cap_insert_lock_bridge_height_mm
        ],
        min(
            pod_cap_insert_keeper_pin_diameter_mm / 2,
            pod_cap_insert_lock_bridge_depth_mm / 2,
            pod_cap_insert_lock_bridge_height_mm / 2
        ),
        [
            0,
            pod_cap_insert_lock_bridge_center_y_mm,
            0
        ]
    );
}

module pi_zero_usb_grove_ir_pod_cap_insert_lock() {
    color(standoff_colour)
    translate([pod_center_x_mm, pod_center_y_mm, pod_center_z_mm])
        rotate([0, 0, pod_base_rotation_deg])
            translate([
                0,
                0,
                pod_cap_insert_lock_center_z_from_pod_center_mm
            ])
                pi_zero_usb_grove_ir_pod_cap_insert_lock_geometry();
}

module pi_zero_usb_grove_ir_pod_shell() {
    translate([pod_center_x_mm, pod_center_y_mm, pod_center_z_mm])
        rotate([0, 0, pod_base_rotation_deg])
            difference() {
                pi_zero_usb_grove_ir_rounded_box(
                    [pod_outer_width_mm, pod_outer_depth_mm, pod_outer_height_mm],
                    pod_corner_radius_mm,
                    [0, 0, 0]
                );

                translate([0, 0, pod_floor_thickness_mm / 2 + preview_overlap_mm / 2])
                    pi_zero_usb_grove_ir_rounded_box(
                        [
                            pod_internal_width_mm,
                            pod_internal_depth_mm,
                            pod_internal_height_mm + preview_overlap_mm
                        ],
                        max(pod_corner_radius_mm - pod_wall_thickness_mm, 0.8),
                        [0, 0, 0]
                    );
            }
}

module pi_zero_usb_grove_ir_pod_attachment_posts() {
    if (active_pod_attachment_post_count > 0) {
        for (post_index = [0:active_pod_attachment_post_count - 1]) {
            post_local_center_mm = pod_attachment_post_local_centers_mm[post_index];
            post_world_x_mm = pod_center_x_mm + rotate_x_mm(post_local_center_mm[0], post_local_center_mm[1], pod_base_rotation_deg);
            post_world_y_mm = pod_center_y_mm + rotate_y_mm(post_local_center_mm[0], post_local_center_mm[1], pod_base_rotation_deg);
            post_world_z_mm = pod_center_z_mm - pod_outer_height_mm / 2 + pod_attachment_post_center_z_from_bottom_mm;
            post_world_center_y_mm =
                post_world_y_mm
                + pod_attachment_axis_sign_mm
                    * (pod_attachment_post_insertion_length_mm - pod_attachment_post_root_overlap_mm) / 2;

            color(standoff_colour)
                translate([post_world_x_mm, post_world_center_y_mm, post_world_z_mm])
                    rotate([90, 0, 0])
                cylinder(
                    h = pod_attachment_post_insertion_length_mm + pod_attachment_post_root_overlap_mm,
                    d = pod_attachment_post_diameter_mm,
                    center = true
                );
        }
    }
}

module pi_zero_usb_grove_ir_pod_attachment_post_lock_holes() {
    if (active_pod_attachment_post_count > 0) {
        for (post_index = [0:active_pod_attachment_post_count - 1]) {
            post_local_center_mm = pod_attachment_post_local_centers_mm[post_index];
            post_world_x_mm = pod_center_x_mm + rotate_x_mm(post_local_center_mm[0], post_local_center_mm[1], pod_base_rotation_deg);

            translate([
                post_world_x_mm,
                pod_attachment_post_lock_center_y_mm,
                pod_attachment_post_lock_hole_center_z_mm
            ])
                    cylinder(
                        h = pod_attachment_post_lock_hole_depth_mm + 2 * preview_overlap_mm,
                        d = pod_attachment_post_lock_hole_diameter_mm,
                        center = true
                    );
        }
    }
}

module pi_zero_usb_grove_ir_pod_attachment_post_lock_geometry() {
    if (active_pod_attachment_post_count > 0) {
        for (post_index = [0:active_pod_attachment_post_count - 1]) {
            post_local_center_mm = pod_attachment_post_local_centers_mm[post_index];

            translate([
                post_local_center_mm[0] - pod_attachment_post_x_offset_mm,
                0,
                -pod_attachment_post_lock_bridge_height_mm / 2
                - pod_attachment_post_lock_pin_lower_length_mm / 2
                + solid_merge_overlap_mm / 2
            ])
                cylinder(
                    h = pod_attachment_post_lock_pin_lower_length_mm + solid_merge_overlap_mm,
                    d = pod_attachment_post_lock_pin_diameter_mm,
                    center = true
                );
        }

        pi_zero_usb_grove_ir_rounded_box(
            [
                pod_attachment_post_lock_bridge_width_mm,
                pod_attachment_post_lock_bridge_depth_mm,
                pod_attachment_post_lock_bridge_height_mm
            ],
            min(
                pod_attachment_post_lock_pin_diameter_mm / 2,
                pod_attachment_post_lock_bridge_depth_mm / 2,
                pod_attachment_post_lock_bridge_height_mm / 2
            ),
            [
                0,
                0,
                0
            ]
        );
    }
}

module pi_zero_usb_grove_ir_pod_attachment_post_lock() {
    if (active_pod_attachment_post_count > 0) {
        color(standoff_colour)
            translate([
                pod_center_x_mm + rotate_x_mm(pod_attachment_post_x_offset_mm, 0, pod_base_rotation_deg),
                pod_attachment_post_lock_center_y_mm,
                pod_attachment_post_lock_bridge_center_z_mm
            ])
                pi_zero_usb_grove_ir_pod_attachment_post_lock_geometry();
    }
}

module pi_zero_usb_grove_ir_pod_board_mount() {
    color(standoff_colour)
    for (hole_center_mm = ir_mounting_hole_centers_mm) {
        translate([emitter_board_center_x_mm, emitter_board_center_y_mm, pod_center_z_mm - pod_outer_height_mm / 2 + pod_floor_thickness_mm])
            rotate([0, 0, emitter_board_rotation_global_deg])
                translate([hole_center_mm[0], hole_center_mm[1], 0])
                    cylinder(h = emitter_board_bottom_from_pod_floor_mm, d = ir_mount_standoff_outer_diameter_mm);
    }
}

module pi_zero_usb_grove_ir_pod_mount_holes() {
    pilot_hole_height_mm =
        min(
            ir_mount_pilot_hole_depth_mm,
            pod_floor_thickness_mm + emitter_board_bottom_from_pod_floor_mm + preview_overlap_mm
        );

    for (hole_center_mm = ir_mounting_hole_centers_mm) {
        translate([emitter_board_center_x_mm, emitter_board_center_y_mm, pod_center_z_mm - pod_outer_height_mm / 2 - preview_overlap_mm])
            rotate([0, 0, emitter_board_rotation_global_deg])
                translate([hole_center_mm[0], hole_center_mm[1], 0])
                    cylinder(
                        h = pilot_hole_height_mm + preview_overlap_mm,
                        d = ir_mount_screw_hole_diameter_mm
                    );
    }
}

// ======================================================
// Cutouts, Cable Path, And Guides
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

module pi_zero_usb_grove_ir_main_cable_exit_volume() {
    translate([main_cable_exit_center_x_mm, main_cable_exit_center_y_mm, main_cable_exit_center_z_mm])
        rotate([0, 0, pod_base_rotation_deg])
            cube(
                [
                    main_cable_exit_size_mm[0],
                    main_cable_exit_size_mm[1] + wall_thickness_mm + 2 * preview_overlap_mm,
                    main_cable_exit_size_mm[2]
                ],
                center = true
            );
}

module pi_zero_usb_grove_ir_pod_cable_entry_volume() {
    translate([pod_cable_entry_center_x_mm, pod_cable_entry_center_y_mm, pod_cable_entry_center_z_mm])
        rotate([0, 0, pod_base_rotation_deg])
            cube(
                [
                    pod_cable_entry_size_mm[0],
                    pod_cable_entry_size_mm[1] + pod_wall_thickness_mm + 2 * preview_overlap_mm,
                    pod_cable_entry_size_mm[2]
                ],
                center = true
            );
}

module pi_zero_usb_grove_ir_ir_led_aperture() {
    translate([
        ir_led_aperture_center_x_mm,
        (ir_led_aperture_center_y_mm + ir_led_center_y_mm) / 2,
        ir_led_aperture_center_z_mm
    ])
        rotate([90, 0, 0])
            cylinder(
                h = max(ir_led_aperture_wall_clearance_depth_mm, ir_led_aperture_to_pose_depth_mm),
                d = ir_led_aperture_diameter_mm,
                center = true
            );
}

module pi_zero_usb_grove_ir_main_internal_cable_path_volume() {
    hull() {
        translate([grove_cable_path_start_x_mm, grove_cable_path_start_y_mm, grove_cable_path_start_z_mm])
            cube([grove_cable_path_width_mm, grove_cable_path_width_mm, grove_cable_path_height_mm], center = true);

        translate([main_cable_exit_center_x_mm, main_cable_exit_center_y_mm, main_cable_exit_center_z_mm + grove_cable_path_clearance_lift_mm])
            cube([main_cable_exit_size_mm[0], grove_cable_path_width_mm, grove_cable_path_height_mm], center = true);
    }
}

module pi_zero_usb_grove_ir_pod_internal_cable_path_volume() {
    hull() {
        translate([pod_cable_entry_center_x_mm, pod_cable_entry_center_y_mm, pod_cable_entry_center_z_mm])
            cube([pod_cable_entry_size_mm[0], grove_cable_path_width_mm, grove_cable_path_height_mm], center = true);

        translate([grove_cable_path_end_x_mm, grove_cable_path_end_y_mm, grove_cable_path_end_z_mm + grove_cable_path_clearance_lift_mm])
            cube([grove_cable_path_width_mm, grove_cable_path_width_mm, grove_cable_path_height_mm], center = true);
    }
}

module pi_zero_usb_grove_ir_cutout_guides() {
    color(cutout_guide_colour, guide_alpha)
        pi_zero_usb_grove_ir_port_cutout_volumes();

    color(cable_guide_colour, guide_alpha)
    union() {
        pi_zero_usb_grove_ir_main_cable_exit_volume();
        pi_zero_usb_grove_ir_pod_cable_entry_volume();
        pi_zero_usb_grove_ir_main_internal_cable_path_volume();
        pi_zero_usb_grove_ir_pod_internal_cable_path_volume();
    }

    color(ir_guide_colour, guide_alpha)
    union() {
        pi_zero_usb_grove_ir_ir_led_aperture();

        translate([
            ir_led_aperture_center_x_mm,
            (ir_led_aperture_center_y_mm + ir_led_center_y_mm) / 2,
            ir_led_aperture_center_z_mm
        ])
            cube(
                [
                    ir_led_aperture_diameter_mm,
                    abs(ir_led_aperture_center_y_mm - ir_led_center_y_mm),
                    ir_led_aperture_diameter_mm
                ],
                center = true
            );

        translate([
            ir_led_aperture_center_x_mm,
            ir_led_aperture_center_y_mm
            + rotate_y_mm(0, ir_led_aperture_external_guide_length_mm / 2, pod_base_rotation_deg),
            ir_led_aperture_center_z_mm
        ])
            rotate([0, 0, pod_base_rotation_deg])
                cube(
                    [
                        ir_led_aperture_diameter_mm,
                        ir_led_aperture_external_guide_length_mm,
                        ir_led_aperture_diameter_mm
                    ],
                    center = true
                );
    }
}

// ======================================================
// Helper Geometry
// ======================================================

function rotate_x_mm(x_mm, y_mm, angle_deg) =
    x_mm * cos(angle_deg) - y_mm * sin(angle_deg);

function rotate_y_mm(x_mm, y_mm, angle_deg) =
    x_mm * sin(angle_deg) + y_mm * cos(angle_deg);

function distance_2d_mm(x1_mm, y1_mm, x2_mm, y2_mm) =
    sqrt((x2_mm - x1_mm) * (x2_mm - x1_mm) + (y2_mm - y1_mm) * (y2_mm - y1_mm));

function front_wall_cutout_center_y_mm(cutout_depth_mm) =
    -outer_width_mm / 2 + (cutout_depth_mm + port_cutout_extra_clearance_mm) / 2 - preview_overlap_mm;

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
