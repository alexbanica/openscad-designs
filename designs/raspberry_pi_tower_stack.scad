// Raspberry Pi 5 tower stack enclosure.
//
// Units: mm.
// Origin: board stack origin on the bottom-center of each PCB
// (matching `rpi5.scad` local board origin convention).
// X and Y are plan dimensions, +Z is vertical stack height.
//
// This is a geometry envelope and fit-preparation source for a five-PCB stack.
//
use <rpi5.scad>
use <rpi5_active_cooler.scad>

// ======================================================
// Adjustable Parameters
// ======================================================

// Render controls
$fn = 48;
render_mode = "assembly"; // [assembly/bottom_tray/top_cover/display_cover/electronics/printable_layout]
valid_render_modes = [
    "assembly",
    "bottom_tray",
    "top_cover",
    "display_cover",
    "electronics",
    "printable_layout"
];

function is_valid_render_mode(mode) =
    mode == "assembly"
    || mode == "bottom_tray"
    || mode == "top_cover"
    || mode == "display_cover"
    || mode == "electronics"
    || mode == "printable_layout";

show_tower_reference = true;
show_stack_references = true;
show_rpi5_reference = true;
show_rpi5_active_cooler_reference = true;
show_nvme_references = true;
show_cluster_hat_reference = true;
show_placeholder_board_headers = true;
show_header_splitter_preview = true;
show_fan_previews = true;
show_display_preview = true;
show_display_cover_preview = true;
show_clearance_guides = false;

// Stack count and spacing
stack_board_count = 5;
nvme_stack_indices = [1, 3]; // 1-based indices; PCB 1 and PCB 3 are NVMe boards
rpi5_stack_index = 4; // 1-based index, defaulting the fourth board
cluster_hat_stack_index = 5; // 1-based index, top PCB above the Pi 5
pcb_stack_gap_z_mm = [14.0, 12.0, 14.0, 13.0];
top_of_highest_board_to_top_cover_clearance_mm = 7.0;
board_height_envelope_margin_mm = 1.4;
stack_internal_height_safety_mm = 1.0;

// Generic Raspberry Pi-size placeholder PCB geometry
placeholder_board_length_mm = 85.0;
placeholder_board_width_mm = 56.0;
placeholder_board_thickness_mm = 1.6;
placeholder_board_corner_radius_mm = 3.0;
placeholder_board_mounting_hole_diameter_mm = 2.75;
placeholder_board_mounting_hole_positions_mm = [
    [3.5, 3.5],
    [61.5, 3.5],
    [3.5, 52.5],
    [61.5, 52.5]
];
placeholder_board_header_origin_mm = [8, 50, placeholder_board_thickness_mm];
placeholder_board_header_size_mm = [51.0, 5.0, 2.5];
placeholder_board_header_pin_pitch_mm = 2.54;
placeholder_board_header_pin_size_mm = 0.64;
placeholder_board_header_pin_height_mm = 6.0;

// NVMe board references for PCB 1 and PCB 3.
nvme_board_length_mm = 85.0;
nvme_board_width_mm = 56.0;
nvme_board_thickness_mm = 1.6;
nvme_board_corner_radius_mm = 3.0;
nvme_module_size_mm = [62.0, 22.0, 4.0];
nvme_module_center_y_mm = 25.0;
nvme_heatsink_size_mm = [54.0, 18.0, 5.0];
nvme_heatsink_offset_z_mm = 3.9;

// Top Cluster HAT-style PCB reference.
cluster_hat_board_length_mm = 85.0;
cluster_hat_board_width_mm = 56.0;
cluster_hat_board_thickness_mm = 1.6;
cluster_hat_board_corner_radius_mm = 3.0;
cluster_hat_mounting_hole_diameter_mm = 2.75;
cluster_hat_header_origin_mm = [8, 50, cluster_hat_board_thickness_mm];
cluster_hat_header_size_mm = [51.0, 5.0, 2.5];
cluster_hat_gpio_socket_size_mm = [51.0, 7.0, 4.0];
cluster_hat_gpio_socket_origin_mm = [7.0, 47.5, cluster_hat_board_thickness_mm];
cluster_hat_downstream_socket_count = 4;
cluster_hat_downstream_socket_size_mm = [17.0, 7.0, 4.0];
cluster_hat_downstream_socket_spacing_x_mm = 19.0;
cluster_hat_downstream_socket_center_y_mm = 18.0;

// Raspberry Pi 5 mirrored reference values from designs/rpi5.scad.
// OpenSCAD `use` imports modules but not raw variables.
rpi5_board_length_mirror_mm = 85.0;
rpi5_board_width_mirror_mm = 56.0;
rpi5_board_thickness_mirror_mm = 1.6;
rpi5_board_corner_radius_mirror_mm = 3.0;
rpi5_mounting_hole_diameter_mirror_mm = 2.75;
rpi5_mounting_hole_positions_mirror_mm = [
    [3.5, 3.5],
    [61.5, 3.5],
    [3.5, 52.5],
    [61.5, 52.5]
];
rpi5_gpio_header_origin_mirror_mm = [7, 49, rpi5_board_thickness_mirror_mm];
rpi5_gpio_header_size_mirror_mm = [51, 5, 2.5];
rpi5_gpio_pin_origin_x_mirror_mm = 8;
rpi5_gpio_pin_origin_y_mirror_mm = 50;
rpi5_gpio_pin_pitch_mirror_mm = 2.54;
rpi5_gpio_pin_size_mirror_mm = 0.64;
rpi5_gpio_pin_height_mirror_mm = 6;
rpi5_usb_port_lower_origin_mirror_mm = [70, 6, rpi5_board_thickness_mirror_mm];
rpi5_usb_port_upper_origin_mirror_mm = [70, 22, rpi5_board_thickness_mirror_mm];
rpi5_usb_port_size_mirror_mm = [15, 13, 15];
rpi5_ethernet_port_origin_mirror_mm = [66, 39, rpi5_board_thickness_mirror_mm];
rpi5_ethernet_port_size_mirror_mm = [19, 15, 13];
rpi5_usb_c_power_origin_mirror_mm = [5, -2, rpi5_board_thickness_mirror_mm];
rpi5_usb_c_power_size_mirror_mm = [9, 4, 3];
rpi5_micro_hdmi_left_origin_mirror_mm = [22, -2, rpi5_board_thickness_mirror_mm];
rpi5_micro_hdmi_right_origin_mirror_mm = [35, -2, rpi5_board_thickness_mirror_mm];
rpi5_micro_hdmi_size_mirror_mm = [7, 4, 3];
rpi5_camera_display_connector_a_origin_mirror_mm = [45, 4, rpi5_board_thickness_mirror_mm];
rpi5_camera_display_connector_b_origin_mirror_mm = [45, 14, rpi5_board_thickness_mirror_mm];
rpi5_camera_display_connector_size_mirror_mm = [17, 3, 3];
rpi5_pcie_connector_origin_mirror_mm = [10, 25, rpi5_board_thickness_mirror_mm];
rpi5_pcie_connector_size_mirror_mm = [22, 3, 3];
rpi5_soc_origin_mirror_mm = [35, 25, rpi5_board_thickness_mirror_mm];
rpi5_soc_size_mirror_mm = [14, 14, 1.5];
rpi5_micro_sd_slot_origin_mirror_mm = [5, 20, -1.8];
rpi5_micro_sd_slot_size_mirror_mm = [16, 14, 1.8];

// Enclosure shell
wall_thickness_mm = 2.2;
floor_thickness_mm = 2.4;
bottom_tray_side_wall_height_mm = 9.0;
top_roof_thickness_mm = 2.2;
cover_skirt_drop_depth_mm = 6.0;
cover_fit_clearance_mm = 0.35;
component_clearance_xy_mm = 6.0;
component_clearance_z_mm = 3.2;
tray_top_margin_mm = 2.5;
cover_internal_clearance_padding_mm = 0.8;
corner_radius_mm = 4.0;
solid_merge_overlap_mm = 0.05;
preview_overlap_mm = 0.1;

// Board support stack geometry (bottom board standoffs)
board_standoff_height_mm = 4.0;
board_standoff_outer_diameter_mm = 6.5;
pcb_mount_insert_outer_diameter_mm = 4.2;
pcb_mount_insert_depth_mm = 3.8;
pcb_mount_screw_pilot_diameter_mm = 2.2;
pcb_mount_screw_pilot_depth_mm = 5.0;

// Anti-slip rubber foot recesses on the bottom tray underside
enable_anti_slip_recesses = true;
anti_slip_recess_diameter_mm = 10.0;
anti_slip_recess_depth_mm = 1.1;
anti_slip_recess_offset_x_mm = 32.0;
anti_slip_recess_offset_y_mm = 20.0;

// Top-cover plug pin and bottom-tray socket system
cover_pin_diameter_mm = 3.2;
cover_pin_insertion_length_mm = 5.0;
cover_pin_count = 4;
cover_pin_offset_x_mm = 42.0;
cover_pin_offset_y_mm = 28.0;
cover_pin_root_diameter_mm = 5.6;
tray_socket_clearance_mm = 0.35;
tray_socket_depth_mm = 5.8;
tray_socket_receiver_diameter_mm = 7.0;

// Port and service cutout sizing
edge_port_clearance_mm = 1.8;
service_cutout_clearance_mm = 2.0;
hat_pin_access_clearance_mm = 2.5;
hat_pin_lateral_exit_width_mm = 58.0;
hat_pin_lateral_exit_height_mm = 14.0;
hat_pin_lateral_exit_z_offset_mm = 5.5;
micro_sd_access_extension_mm = 8.0;
front_cable_cutout_error_margin_mm = 0.6;
usb_c_cable_head_required_size_mm = [12.0, 7.0];
micro_hdmi_adapter_head_required_size_mm = [12.0, 6.66];
port_cutout_depth_mm = 2 * wall_thickness_mm + 2.0;
top_cutout_depth_mm = top_roof_thickness_mm + 2.0;

// Raspberry Pi 5-zone ventilation
enable_pi5_side_ventilation = true;
enable_pi5_top_ventilation = true;
pi5_side_vent_count = 6;
pi5_side_vent_width_mm = 6.0;
pi5_side_vent_height_mm = 12.0;
pi5_side_vent_spacing_mm = 8.0;
pi5_side_vent_center_z_mm = 22.0;
pi5_vent_x_offset_from_soc_mm = 0.0;
pi5_vent_y_offset_from_soc_mm = 0.0;

pi5_top_vent_columns = 5;
pi5_top_vent_rows = 2;
pi5_top_vent_hole_diameter_mm = 5.0;
pi5_top_vent_spacing_x_mm = 9.0;
pi5_top_vent_spacing_y_mm = 10.0;
pi5_top_vent_offset_x_mm = 0.0;
pi5_top_vent_offset_y_mm = 0.0;

// Under-Pi5 NVMe/heatsink/PCI splitter airflow
enable_under_pi5_airflow = true;
enable_under_pi5_bottom_airflow = true;
under_pi5_airflow_count = 3;
under_pi5_airflow_slot_width_mm = 8.0;
under_pi5_airflow_slot_length_mm = 32.0;
under_pi5_airflow_slot_spacing_x_mm = 13.0;
under_pi5_airflow_offset_x_mm = 0.0;
under_pi5_airflow_offset_y_mm = -2.0;
under_pi5_airflow_lower_side_count = 4;
under_pi5_airflow_lower_side_width_mm = 7.0;
under_pi5_airflow_lower_side_height_mm = 7.0;
under_pi5_airflow_lower_side_spacing_mm = 10.0;
under_pi5_airflow_offset_below_pi5_board_mm = 6.0;

// NVMe board airflow for PCB 1 and PCB 3
enable_nvme_board_airflow = true;
enable_bottom_nvme_airflow = true;
nvme_airflow_slot_count = 4;
nvme_airflow_slot_width_mm = 7.0;
nvme_airflow_slot_length_mm = 34.0;
nvme_airflow_slot_spacing_x_mm = 11.0;
nvme_airflow_offset_y_mm = -2.0;
nvme_side_vent_count = 4;
nvme_side_vent_width_mm = 7.0;
nvme_side_vent_height_mm = 8.0;
nvme_side_vent_spacing_mm = 11.0;
nvme_side_vent_center_above_board_mm = 8.0;

// Fan mounts and airflow previews (two usable mounts, intake + exhaust by default)
fan_mount_centers_mm = [
    [-18.0, -20.0],
    [18.0, -20.0]
];
fan_mount_enabled_flags = [true, true];
fan_airflow_direction_labels = ["intake", "exhaust"];
fan_body_size_mm = 30.0;
fan_thickness_mm = 7.0;
fan_body_clearance_mm = 0.6;
fan_hole_spacing_mm = 24.0;
fan_screw_hole_diameter_mm = 3.0;
fan_boss_outer_diameter_mm = 6.0;
fan_boss_height_mm = 6.0;
fan_mount_wall_hole_diameter_mm = 4.2;
fan_mount_wall_cutout_padding_mm = 1.6;

// Display assembly and perpendicular cover
display_body_length_mm = 50.0;
display_body_width_mm = 32.0;
display_body_thickness_mm = 2.2;
display_body_height_mm = 20.0;
display_body_body_depth_mm = 1.2;
display_body_offset_x_from_splitter_mm = 1.0;
display_body_offset_z_from_header_mm = 0.8;
display_window_length_mm = 28.0;
display_window_height_mm = 12.0;
display_window_clearance_mm = 0.6;
display_cover_wall_thickness_mm = 2.0;
display_cover_front_clearance_mm = 1.2;
display_cover_z_lift_mm = 6.0;
display_splitter_vertical_length_mm = 22.0;
display_splitter_lateral_length_mm = 20.0;
display_splitter_cross_section_mm = 4.0;

// Header splitter preview
header_splitter_pin_count_x = 4;
header_splitter_pin_count_y = 2;
header_splitter_pin_offset_x_mm = 1.2;
header_splitter_pin_offset_y_mm = 1.2;

// Printable layout controls
printable_layout_spacing_mm = 38.0;

// Visual settings
tray_colour = "DimGray";
cover_colour = "SlateGray";
standoff_colour = "Gainsboro";
pcb_colour = "LimeGreen";
connector_colour = "Silver";
guide_colour = [1.0, 0.35, 0.05, 0.24];
vent_colour = [0.0, 0.55, 1.0, 0.19];

// ======================================================
// Derived Values
// ======================================================

board_bottom_z_mm = floor_thickness_mm + board_standoff_height_mm;

function tower_board_thickness_mm(index) =
    (index + 1 == rpi5_stack_index)
        ? rpi5_board_thickness_mirror_mm
        : (index + 1 == cluster_hat_stack_index)
            ? cluster_hat_board_thickness_mm
        : placeholder_board_thickness_mm;

function tower_board_width_mm() = placeholder_board_width_mm;
function tower_board_length_mm() = placeholder_board_length_mm;

function tower_board_world_x(source_x_mm) =
    source_x_mm - tower_board_length_mm() / 2;

function tower_board_world_y(source_y_mm) =
    source_y_mm - tower_board_width_mm() / 2;

function tower_stack_bottom_z_mm(board_index) =
    board_index == 0
        ? board_bottom_z_mm
        : tower_stack_bottom_z_mm(board_index - 1)
            + tower_board_thickness_mm(board_index - 1)
            + pcb_stack_gap_z_mm[min(board_index - 1, len(pcb_stack_gap_z_mm) - 1)];

function tower_stack_top_z_mm(board_index) =
    tower_stack_bottom_z_mm(board_index) + tower_board_thickness_mm(board_index);

function tower_stack_top_cover_clearance_z_mm() =
    tower_stack_top_z_mm(stack_board_count - 1) + top_of_highest_board_to_top_cover_clearance_mm;

function tower_stack_clearance_span_mm() =
    tower_stack_top_z_mm(stack_board_count - 1) - board_bottom_z_mm + component_clearance_z_mm;

stack_top_board_index = stack_board_count - 1;
stack_top_z_mm = tower_stack_top_z_mm(stack_top_board_index);
case_internal_top_z_mm = tower_stack_top_cover_clearance_z_mm() + board_height_envelope_margin_mm;
tray_wall_height_mm = floor_thickness_mm + board_standoff_height_mm + bottom_tray_side_wall_height_mm;
case_total_height_mm = max(
    case_internal_top_z_mm + top_roof_thickness_mm + board_height_envelope_margin_mm,
    tray_wall_height_mm + top_roof_thickness_mm + cover_skirt_drop_depth_mm
);

internal_length_mm = tower_board_length_mm() + 2 * component_clearance_xy_mm;
internal_width_mm = tower_board_width_mm() + 2 * component_clearance_xy_mm;
outer_length_mm = internal_length_mm + 2 * wall_thickness_mm;
outer_width_mm = internal_width_mm + 2 * wall_thickness_mm;
top_cover_height_mm = case_total_height_mm - tray_wall_height_mm + cover_skirt_drop_depth_mm;
case_body_z_top_mm = case_total_height_mm - top_roof_thickness_mm;

cover_pin_centers_mm = [
    [-cover_pin_offset_x_mm, -cover_pin_offset_y_mm],
    [cover_pin_offset_x_mm, -cover_pin_offset_y_mm],
    [-cover_pin_offset_x_mm, cover_pin_offset_y_mm],
    [cover_pin_offset_x_mm, cover_pin_offset_y_mm]
];
active_cover_pin_count = min(cover_pin_count, len(cover_pin_centers_mm));
cover_pin_start_z_mm = tray_wall_height_mm - cover_pin_insertion_length_mm;
cover_pin_root_post_height_mm = case_total_height_mm - top_roof_thickness_mm - (tray_wall_height_mm - preview_overlap_mm) + solid_merge_overlap_mm;
cover_pin_base_z_mm = cover_pin_start_z_mm - solid_merge_overlap_mm;
anti_slip_recess_centers_mm = [
    [-anti_slip_recess_offset_x_mm, -anti_slip_recess_offset_y_mm],
    [anti_slip_recess_offset_x_mm, -anti_slip_recess_offset_y_mm],
    [-anti_slip_recess_offset_x_mm, anti_slip_recess_offset_y_mm],
    [anti_slip_recess_offset_x_mm, anti_slip_recess_offset_y_mm]
];

tray_socket_hole_bottom_z_mm = max(
    floor_thickness_mm,
    min(tray_wall_height_mm - tray_socket_depth_mm, cover_pin_start_z_mm - preview_overlap_mm)
);
tray_socket_hole_depth_mm = tray_wall_height_mm - tray_socket_hole_bottom_z_mm + 2 * preview_overlap_mm;
tray_socket_hole_center_z_mm = tray_socket_hole_bottom_z_mm + tray_socket_hole_depth_mm / 2;
tray_socket_hole_diameter_mm = cover_pin_diameter_mm + 2 * tray_socket_clearance_mm;

right_usb_ethernet_cutout_origin_mm = [
    min(
        rpi5_usb_port_lower_origin_mirror_mm[0],
        rpi5_usb_port_upper_origin_mirror_mm[0],
        rpi5_ethernet_port_origin_mirror_mm[0]
    ),
    min(
        rpi5_usb_port_lower_origin_mirror_mm[1],
        rpi5_usb_port_upper_origin_mirror_mm[1],
        rpi5_ethernet_port_origin_mirror_mm[1]
    ),
    min(
        rpi5_usb_port_lower_origin_mirror_mm[2],
        rpi5_usb_port_upper_origin_mirror_mm[2],
        rpi5_ethernet_port_origin_mirror_mm[2]
    )
];

right_usb_ethernet_cutout_size_mm = [
    max(
        rpi5_usb_port_lower_origin_mirror_mm[0] + rpi5_usb_port_size_mirror_mm[0],
        rpi5_usb_port_upper_origin_mirror_mm[0] + rpi5_usb_port_size_mirror_mm[0],
        rpi5_ethernet_port_origin_mirror_mm[0] + rpi5_ethernet_port_size_mirror_mm[0]
    ) - right_usb_ethernet_cutout_origin_mm[0],
    max(
        rpi5_usb_port_lower_origin_mirror_mm[1] + rpi5_usb_port_size_mirror_mm[1],
        rpi5_usb_port_upper_origin_mirror_mm[1] + rpi5_usb_port_size_mirror_mm[1],
        rpi5_ethernet_port_origin_mirror_mm[1] + rpi5_ethernet_port_size_mirror_mm[1]
    ) - right_usb_ethernet_cutout_origin_mm[1],
    max(
        rpi5_usb_port_lower_origin_mirror_mm[2] + rpi5_usb_port_size_mirror_mm[2],
        rpi5_usb_port_upper_origin_mirror_mm[2] + rpi5_usb_port_size_mirror_mm[2],
        rpi5_ethernet_port_origin_mirror_mm[2] + rpi5_ethernet_port_size_mirror_mm[2]
    ) - right_usb_ethernet_cutout_origin_mm[2]
];

usb_c_cable_cutout_size_mm = [
    usb_c_cable_head_required_size_mm[0] + front_cable_cutout_error_margin_mm,
    usb_c_cable_head_required_size_mm[1] + front_cable_cutout_error_margin_mm
];
micro_hdmi_adapter_cutout_size_mm = [
    micro_hdmi_adapter_head_required_size_mm[0] + front_cable_cutout_error_margin_mm,
    micro_hdmi_adapter_head_required_size_mm[1] + front_cable_cutout_error_margin_mm
];

// Port definitions:
// [id, origin_xyz, size_xyz, side, [optional front_size_xy]]
pi5_port_cutouts_mm = [
    ["right_usb_ethernet", right_usb_ethernet_cutout_origin_mm, right_usb_ethernet_cutout_size_mm, "right"],
    ["usb_c_power", rpi5_usb_c_power_origin_mirror_mm, rpi5_usb_c_power_size_mirror_mm, "front", usb_c_cable_cutout_size_mm],
    ["micro_hdmi_left", rpi5_micro_hdmi_left_origin_mirror_mm, rpi5_micro_hdmi_size_mirror_mm, "front", micro_hdmi_adapter_cutout_size_mm],
    ["micro_hdmi_right", rpi5_micro_hdmi_right_origin_mirror_mm, rpi5_micro_hdmi_size_mirror_mm, "front", micro_hdmi_adapter_cutout_size_mm],
    ["camera_display_a", rpi5_camera_display_connector_a_origin_mirror_mm, rpi5_camera_display_connector_size_mirror_mm, "top"],
    ["camera_display_b", rpi5_camera_display_connector_b_origin_mirror_mm, rpi5_camera_display_connector_size_mirror_mm, "top"],
    ["pcie", rpi5_pcie_connector_origin_mirror_mm, rpi5_pcie_connector_size_mirror_mm, "top"],
    ["micro_sd", rpi5_micro_sd_slot_origin_mirror_mm, rpi5_micro_sd_slot_size_mirror_mm, "left"]
];

// Derived Pi 5 fan/vent area references for targetting ventilation
pi5_soc_world_x_mm = tower_board_world_x(rpi5_soc_origin_mirror_mm[0] + rpi5_soc_size_mirror_mm[0] / 2);
pi5_soc_world_y_mm = tower_board_world_y(rpi5_soc_origin_mirror_mm[1] + rpi5_soc_size_mirror_mm[1] / 2);
pi5_top_vent_center_x_mm = pi5_soc_world_x_mm + pi5_vent_x_offset_from_soc_mm;
pi5_top_vent_center_y_mm = pi5_soc_world_y_mm + pi5_vent_y_offset_from_soc_mm;
pi5_board_bottom_z_mm = tower_stack_bottom_z_mm(rpi5_stack_index - 1);
pi5_side_vent_world_center_z_mm = pi5_board_bottom_z_mm + pi5_side_vent_center_z_mm;
under_pi5_airflow_center_z_mm = max(
    floor_thickness_mm + under_pi5_airflow_lower_side_height_mm / 2 + 1.0,
    pi5_board_bottom_z_mm - under_pi5_airflow_offset_below_pi5_board_mm
);
bottom_nvme_board_bottom_z_mm = tower_stack_bottom_z_mm(nvme_stack_indices[0] - 1);

fan_mount_centers_count = len(fan_mount_centers_mm);
fan_mount_body_opening_size_mm = fan_body_size_mm + fan_body_clearance_mm;

display_cover_length_mm = display_body_thickness_mm + display_cover_wall_thickness_mm + display_cover_front_clearance_mm;
display_cover_width_mm = display_body_width_mm + 2 * display_cover_wall_thickness_mm + display_window_clearance_mm;
display_cover_height_mm = display_body_height_mm + 2 * display_cover_wall_thickness_mm + display_window_clearance_mm;

if (top_cover_height_mm < 0) {
    echo("WARNING: Derived top cover height is negative; increase top_of_highest_board_to_top_cover_clearance_mm");
}

assert(
    stack_board_count == 5,
    "Invariant check failed: stack_board_count must be 5 for this tower design."
);

assert(
    len(valid_render_modes) == 6,
    "Invariant check failed: valid_render_modes must contain exactly six render modes."
);

assert(
    rpi5_stack_index == 4,
    "Invariant check failed: rpi5_stack_index must be 4 by default and by design contract."
);

assert(
    cluster_hat_stack_index == 5,
    "Invariant check failed: cluster_hat_stack_index must be 5 so the top PCB is the Cluster HAT."
);

assert(
    len(pcb_stack_gap_z_mm) >= 4,
    "Invariant check failed: pcb_stack_gap_z_mm must contain at least 4 gap values for a 5-PCB stack."
);

assert(
    len(nvme_stack_indices) == 2,
    "Invariant check failed: nvme_stack_indices must identify PCB 1 and PCB 3."
);

assert(
    nvme_stack_indices[0] == 1 && nvme_stack_indices[1] == 3,
    "Invariant check failed: PCB 1 and PCB 3 must be NVMe boards."
);

assert(
    len(fan_mount_centers_mm) >= 2,
    "Invariant check failed: fan_mount_centers_mm must include at least two fan mounts."
);

assert(
    len(fan_mount_enabled_flags) >= 2,
    "Invariant check failed: fan_mount_enabled_flags must include at least two mount flags."
);

assert(
    active_cover_pin_count == min(cover_pin_count, len(cover_pin_centers_mm)),
    "Invariant check failed: active_cover_pin_count must be min(cover_pin_count, len(cover_pin_centers_mm))."
);

assert(
    active_cover_pin_count >= 0,
    "Invariant check failed: active_cover_pin_count must be non-negative."
);

// ======================================================
// Render Dispatch
// ======================================================

assert(
    is_valid_render_mode(render_mode),
    str("Unsupported render_mode=\"", render_mode, "\". Valid values are: ", valid_render_modes)
);

if (render_mode == "assembly") {
    raspberry_pi_tower_stack_assembly();
} else if (render_mode == "bottom_tray") {
    raspberry_pi_tower_stack_printable_bottom_tray();
} else if (render_mode == "top_cover") {
    raspberry_pi_tower_stack_printable_top_cover();
} else if (render_mode == "display_cover") {
    raspberry_pi_tower_stack_display_cover();
} else if (render_mode == "electronics") {
    raspberry_pi_tower_stack_electronics_reference();
} else if (render_mode == "printable_layout") {
    raspberry_pi_tower_stack_printable_layout();
} else {
    assert(false, "Unreachable render mode branch after render-mode validation.");
}

// ======================================================
// Main Assembly
// ======================================================

module raspberry_pi_tower_stack_assembly() {
    raspberry_pi_tower_stack_bottom_tray();
    raspberry_pi_tower_stack_top_cover();

    if (show_fan_previews) {
        raspberry_pi_tower_stack_fan_mounts(show_structure_only = false);
    }

    if (show_tower_reference) {
        raspberry_pi_tower_stack_electronics_reference();
    }

    if (show_clearance_guides) {
        raspberry_pi_tower_stack_clearance_guides();
    }
}

module raspberry_pi_tower_stack_printable_layout() {
    translate([-(outer_length_mm + printable_layout_spacing_mm) / 2, 0, 0])
        raspberry_pi_tower_stack_printable_bottom_tray();

    translate([(outer_length_mm + printable_layout_spacing_mm) / 2, 0, 0])
        translate([0, 0, case_total_height_mm])
            rotate([180, 0, 0])
                raspberry_pi_tower_stack_printable_top_cover();

    translate([0, outer_width_mm / 2 + 22.0, 0])
        raspberry_pi_tower_stack_display_cover();
}

module raspberry_pi_tower_stack_printable_bottom_tray() {
    color(tray_colour)
    difference() {
        union() {
            raspberry_pi_tower_stack_tray_shell();
            raspberry_pi_tower_stack_mounting_supports();
            raspberry_pi_tower_stack_tray_socket_receiver_bosses();
        }

        raspberry_pi_tower_stack_tray_socket_holes();
        raspberry_pi_tower_stack_mounting_holes();
        raspberry_pi_tower_stack_anti_slip_recesses();
        raspberry_pi_tower_stack_port_cutout_volumes(include_top_service = false);
        raspberry_pi_tower_stack_pi5_zone_ventilation();
        raspberry_pi_tower_stack_under_pi5_airflow();
        raspberry_pi_tower_stack_nvme_board_airflow();
    }
}

module raspberry_pi_tower_stack_printable_top_cover() {
    color(cover_colour)
    difference() {
        union() {
            raspberry_pi_tower_stack_cover_shell();
            raspberry_pi_tower_stack_cover_pin_root_posts();
            raspberry_pi_tower_stack_cover_plug_pins();
            raspberry_pi_tower_stack_fan_mounts(show_structure_only = true);
        }

        raspberry_pi_tower_stack_port_cutout_volumes(include_top_service = true);
        raspberry_pi_tower_stack_hat_pin_access_cutouts();
        raspberry_pi_tower_stack_pi5_zone_ventilation();
        raspberry_pi_tower_stack_fan_cutouts();
    }
}

module raspberry_pi_tower_stack_display_cover() {
    color(cover_colour)
    raspberry_pi_tower_stack_display_cover_geometry();
}

module raspberry_pi_tower_stack_electronics_reference() {
    if (show_stack_references) {
        for (board_index = [0:stack_board_count - 1]) {
            board_bottom_z = tower_stack_bottom_z_mm(board_index);
            is_rpi5 = (board_index + 1 == rpi5_stack_index);
            is_nvme = (board_index + 1 == nvme_stack_indices[0])
                || (board_index + 1 == nvme_stack_indices[1]);
            is_cluster_hat = (board_index + 1 == cluster_hat_stack_index);

            translate([
                0,
                0,
                board_bottom_z
            ]) {
                if (is_rpi5) {
                    translate([
                        -rpi5_board_length_mirror_mm / 2,
                        -rpi5_board_width_mirror_mm / 2,
                        0
                    ])
                        rpi5_reference_model(
                            show_reference = show_rpi5_reference,
                            show_gpio_pins = true,
                            show_micro_sd_card = true,
                            show_active_cooler = show_rpi5_active_cooler_reference
                        );

                    if (show_header_splitter_preview) {
                        raspberry_pi_tower_splitter_and_display_preview(board_index);
                    }
                } else if (is_nvme) {
                    raspberry_pi_tower_stack_nvme_board_reference();
                } else if (is_cluster_hat) {
                    raspberry_pi_tower_stack_cluster_hat_reference();
                } else {
                    raspberry_pi_tower_placeholder_board_reference();
                    if (show_placeholder_board_headers) {
                        raspberry_pi_tower_placeholder_board_header();
                    }
                }
            }
        }
    }
}

module raspberry_pi_tower_placeholder_board_reference() {
    raspberry_pi_tower_stack_placeholder_board_reference();
}

module raspberry_pi_tower_placeholder_board_header() {
    raspberry_pi_tower_stack_placeholder_board_header();
}

module raspberry_pi_tower_stack_bottom_tray() {
    raspberry_pi_tower_stack_printable_bottom_tray();
}

module raspberry_pi_tower_stack_top_cover() {
    raspberry_pi_tower_stack_printable_top_cover();
}

module raspberry_pi_tower_stack_clearance_guides() {
    color(guide_colour)
        raspberry_pi_tower_stack_port_cutout_volumes(include_top_service = true);
    color(vent_colour)
        raspberry_pi_tower_stack_pi5_zone_ventilation();
}

// ======================================================
// Tray Shells And Ports
// ======================================================

module raspberry_pi_tower_stack_tray_shell() {
    difference() {
        raspberry_pi_tower_rounded_box(
            [outer_length_mm, outer_width_mm, tray_wall_height_mm],
            corner_radius_mm
        );

        translate([0, 0, floor_thickness_mm])
            raspberry_pi_tower_rounded_box(
                [
                    internal_length_mm,
                    internal_width_mm,
                    tray_wall_height_mm - floor_thickness_mm + preview_overlap_mm
                ],
                max(corner_radius_mm - wall_thickness_mm, 0.8)
            );
    }
}

module raspberry_pi_tower_stack_cover_shell() {
    difference() {
        translate([0, 0, tray_wall_height_mm - cover_skirt_drop_depth_mm])
            raspberry_pi_tower_rounded_box(
                [outer_length_mm, outer_width_mm, top_cover_height_mm],
                corner_radius_mm
            );

        raspberry_pi_tower_stack_cover_hollow_volume();
    }
}

module raspberry_pi_tower_stack_cover_hollow_volume() {
    translate([0, 0, tray_wall_height_mm - cover_skirt_drop_depth_mm - preview_overlap_mm])
        raspberry_pi_tower_rounded_box(
            [
                internal_length_mm + 2 * cover_fit_clearance_mm,
                internal_width_mm + 2 * cover_fit_clearance_mm,
                top_cover_height_mm - top_roof_thickness_mm + cover_internal_clearance_padding_mm
            ],
            max(corner_radius_mm - wall_thickness_mm, 0.8)
        );
}

module raspberry_pi_tower_stack_cover_pin_root_posts() {
    color(standoff_colour)
    for (pin_index = [0:active_cover_pin_count - 1]) {
        translate([
            cover_pin_centers_mm[pin_index][0],
            cover_pin_centers_mm[pin_index][1],
            cover_pin_base_z_mm
        ])
            cylinder(
                h = cover_pin_root_post_height_mm,
                d = cover_pin_root_diameter_mm
            );
    }
}

module raspberry_pi_tower_stack_cover_plug_pins() {
    color(standoff_colour)
    for (pin_index = [0:active_cover_pin_count - 1]) {
        translate([
            cover_pin_centers_mm[pin_index][0],
            cover_pin_centers_mm[pin_index][1],
            cover_pin_start_z_mm
        ])
            cylinder(
                h = cover_pin_insertion_length_mm + 2 * preview_overlap_mm,
                d = cover_pin_diameter_mm
            );
    }
}

module raspberry_pi_tower_stack_tray_socket_receiver_bosses() {
    color(standoff_colour)
    for (pin_index = [0:active_cover_pin_count - 1]) {
        translate([
            cover_pin_centers_mm[pin_index][0],
            cover_pin_centers_mm[pin_index][1],
            floor_thickness_mm
        ])
            cylinder(
                h = tray_wall_height_mm - floor_thickness_mm + preview_overlap_mm,
                d = tray_socket_receiver_diameter_mm
            );
    }
}

module raspberry_pi_tower_stack_tray_socket_holes() {
    for (pin_index = [0:active_cover_pin_count - 1]) {
        translate([
            cover_pin_centers_mm[pin_index][0],
            cover_pin_centers_mm[pin_index][1],
            tray_socket_hole_center_z_mm
        ])
            cylinder(
                h = tray_socket_hole_depth_mm,
                d = tray_socket_hole_diameter_mm,
                center = true
            );
    }
}

module raspberry_pi_tower_stack_mounting_supports() {
    color(standoff_colour)
    for (hole_position_mm = rpi5_mounting_hole_positions_mirror_mm) {
        translate([
            tower_board_world_x(hole_position_mm[0]),
            tower_board_world_y(hole_position_mm[1]),
            floor_thickness_mm
        ])
            cylinder(h = board_standoff_height_mm, d = board_standoff_outer_diameter_mm);
    }
}

module raspberry_pi_tower_stack_mounting_holes() {
    for (hole_position_mm = rpi5_mounting_hole_positions_mirror_mm) {
        translate([
            tower_board_world_x(hole_position_mm[0]),
            tower_board_world_y(hole_position_mm[1]),
            floor_thickness_mm + board_standoff_height_mm - pcb_mount_insert_depth_mm
        ])
            cylinder(
                h = pcb_mount_insert_depth_mm + preview_overlap_mm,
                d = pcb_mount_insert_outer_diameter_mm
            );

        translate([
            tower_board_world_x(hole_position_mm[0]),
            tower_board_world_y(hole_position_mm[1]),
            floor_thickness_mm + board_standoff_height_mm - pcb_mount_screw_pilot_depth_mm
        ])
            cylinder(
                h = pcb_mount_screw_pilot_depth_mm + preview_overlap_mm,
                d = pcb_mount_screw_pilot_diameter_mm
            );
    }
}

module raspberry_pi_tower_stack_anti_slip_recesses() {
    if (enable_anti_slip_recesses) {
        for (recess_center_mm = anti_slip_recess_centers_mm) {
            translate([
                recess_center_mm[0],
                recess_center_mm[1],
                -preview_overlap_mm
            ])
                cylinder(
                    h = anti_slip_recess_depth_mm + preview_overlap_mm,
                    d = anti_slip_recess_diameter_mm
                );
        }
    }
}

module raspberry_pi_tower_stack_port_cutout_volumes(include_top_service = true) {
    for (port_entry = pi5_port_cutouts_mm) {
        port_side = port_entry[3];
        if (port_side == "right" || port_side == "front" || port_side == "left" || (include_top_service && port_side == "top")) {
            raspberry_pi_tower_stack_port_cutout_volume(
                origin_mm = port_entry[1],
                size_mm = port_entry[2],
                side = port_side,
                front_size_mm = len(port_entry) > 4 ? port_entry[4] : [0, 0]
            );
        }
    }
}

module raspberry_pi_tower_stack_port_cutout_volume(
    origin_mm,
    size_mm,
    side,
    front_size_mm = [0, 0]
) {
    center_x_mm = tower_board_world_x(origin_mm[0] + size_mm[0] / 2);
    center_y_mm = tower_board_world_y(origin_mm[1] + size_mm[1] / 2);
    center_z_mm = pi5_board_bottom_z_mm + origin_mm[2] + size_mm[2] / 2;
    front_size_x_mm = max(size_mm[0], front_size_mm[0]);
    front_size_y_mm = max(size_mm[1], front_size_mm[1]);

    if (side == "right") {
        translate([
            outer_length_mm / 2,
            center_y_mm,
            center_z_mm
        ])
            cube(
                [
                    port_cutout_depth_mm,
                    size_mm[1] + 2 * edge_port_clearance_mm,
                    size_mm[2] + 2 * edge_port_clearance_mm
                ],
                center = true
            );
    } else if (side == "front") {
        translate([
            center_x_mm,
            -outer_width_mm / 2,
            center_z_mm
        ])
            cube(
                [
                    max(size_mm[0] + 2 * edge_port_clearance_mm, front_size_x_mm),
                    port_cutout_depth_mm,
                    max(size_mm[2] + 2 * edge_port_clearance_mm, front_size_y_mm)
                ],
                center = true
            );
    } else if (side == "left") {
        translate([
            -outer_length_mm / 2,
            center_y_mm,
            max(floor_thickness_mm / 2, center_z_mm)
        ])
            cube(
                [
                    port_cutout_depth_mm,
                    size_mm[1] + micro_sd_access_extension_mm,
                    max(size_mm[2] + 2 * edge_port_clearance_mm, floor_thickness_mm + 1.2)
                ],
                center = true
            );
    } else if (side == "top") {
        translate([
            center_x_mm,
            center_y_mm,
            case_body_z_top_mm
        ])
            cube(
                [
                    size_mm[0] + 2 * service_cutout_clearance_mm,
                    size_mm[1] + 2 * service_cutout_clearance_mm,
                    top_cutout_depth_mm
                ],
                center = true
            );
    }
}

module raspberry_pi_tower_stack_hat_pin_access_cutouts() {
    header_center_x_mm = tower_board_world_x(rpi5_gpio_header_origin_mirror_mm[0] + rpi5_gpio_header_size_mirror_mm[0] / 2);
    header_center_y_mm = tower_board_world_y(rpi5_gpio_header_origin_mirror_mm[1] + rpi5_gpio_header_size_mirror_mm[1] / 2);
    header_top_z_mm = pi5_board_bottom_z_mm
        + rpi5_board_thickness_mirror_mm
        + rpi5_gpio_header_size_mirror_mm[2]
        + rpi5_gpio_pin_height_mirror_mm;
    lateral_exit_center_z_mm = header_top_z_mm + hat_pin_lateral_exit_z_offset_mm;

    // Top access above the Pi 5 GPIO/HAT pin region.
    translate([
        header_center_x_mm,
        header_center_y_mm,
        case_body_z_top_mm
    ])
        cube([
            rpi5_gpio_header_size_mirror_mm[0] + 2 * hat_pin_access_clearance_mm,
            rpi5_gpio_header_size_mirror_mm[1] + 2 * hat_pin_access_clearance_mm,
            top_cutout_depth_mm
        ], center = true);

    // Side pass-through for the perpendicular HAT-pin/display branch.
    translate([
        header_center_x_mm,
        outer_width_mm / 2,
        lateral_exit_center_z_mm
    ])
        cube([
            hat_pin_lateral_exit_width_mm,
            2 * wall_thickness_mm + 2.0,
            hat_pin_lateral_exit_height_mm
        ], center = true);
}

module raspberry_pi_tower_stack_pi5_zone_ventilation() {
    if (enable_pi5_side_ventilation) {
        for (vent_index = [0:pi5_side_vent_count - 1]) {
            for (side_sign = [-1, 1]) {
                translate([
                    pi5_top_vent_center_x_mm + (vent_index - (pi5_side_vent_count - 1) / 2) * pi5_side_vent_spacing_mm,
                    side_sign * outer_width_mm / 2,
                    pi5_side_vent_world_center_z_mm
                ])
                    cube(
                        [pi5_side_vent_width_mm, 2 * wall_thickness_mm + 2.0, pi5_side_vent_height_mm],
                        center = true
                    );
            }
        }
    }

    if (enable_pi5_top_ventilation) {
        for (column_index = [0:pi5_top_vent_columns - 1])
        for (row_index = [0:pi5_top_vent_rows - 1]) {
            translate([
                pi5_top_vent_center_x_mm
                    + pi5_top_vent_offset_x_mm
                    + (column_index - (pi5_top_vent_columns - 1) / 2) * pi5_top_vent_spacing_x_mm,
                pi5_top_vent_center_y_mm
                    + pi5_top_vent_offset_y_mm
                    + (row_index - (pi5_top_vent_rows - 1) / 2) * pi5_top_vent_spacing_y_mm,
                case_body_z_top_mm - top_roof_thickness_mm / 2
            ])
                cube([pi5_top_vent_hole_diameter_mm, pi5_top_vent_hole_diameter_mm, top_roof_thickness_mm + 1.0], center = true);
        }
    }
}

module raspberry_pi_tower_stack_under_pi5_airflow() {
    if (enable_under_pi5_airflow) {
        if (enable_under_pi5_bottom_airflow) {
            for (slot_index = [0:under_pi5_airflow_count - 1]) {
                translate([
                    pi5_top_vent_center_x_mm
                        + under_pi5_airflow_offset_x_mm
                        + (slot_index - (under_pi5_airflow_count - 1) / 2) * under_pi5_airflow_slot_spacing_x_mm,
                    pi5_top_vent_center_y_mm + under_pi5_airflow_offset_y_mm,
                    floor_thickness_mm / 2
                ])
                    cube([
                        under_pi5_airflow_slot_width_mm,
                        under_pi5_airflow_slot_length_mm,
                        floor_thickness_mm + 1.0
                    ], center = true);
            }
        }

        for (vent_index = [0:under_pi5_airflow_lower_side_count - 1]) {
            for (side_sign = [-1, 1]) {
                translate([
                    pi5_top_vent_center_x_mm
                        + under_pi5_airflow_offset_x_mm
                        + (vent_index - (under_pi5_airflow_lower_side_count - 1) / 2) * under_pi5_airflow_lower_side_spacing_mm,
                    side_sign * outer_width_mm / 2,
                    under_pi5_airflow_center_z_mm
                ])
                    cube([
                        under_pi5_airflow_lower_side_width_mm,
                        2 * wall_thickness_mm + 2.0,
                        under_pi5_airflow_lower_side_height_mm
                    ], center = true);
            }
        }
    }
}

module raspberry_pi_tower_stack_nvme_board_airflow() {
    if (enable_nvme_board_airflow) {
        if (enable_bottom_nvme_airflow) {
            for (slot_index = [0:nvme_airflow_slot_count - 1]) {
                translate([
                    (slot_index - (nvme_airflow_slot_count - 1) / 2) * nvme_airflow_slot_spacing_x_mm,
                    tower_board_world_y(nvme_module_center_y_mm) + nvme_airflow_offset_y_mm,
                    floor_thickness_mm / 2
                ])
                    cube([
                        nvme_airflow_slot_width_mm,
                        nvme_airflow_slot_length_mm,
                        floor_thickness_mm + 1.0
                    ], center = true);
            }
        }

        for (nvme_stack_index = nvme_stack_indices) {
            board_index = nvme_stack_index - 1;
            vent_center_z_mm = tower_stack_bottom_z_mm(board_index) + nvme_side_vent_center_above_board_mm;

            for (vent_index = [0:nvme_side_vent_count - 1]) {
                for (side_sign = [-1, 1]) {
                    translate([
                        (vent_index - (nvme_side_vent_count - 1) / 2) * nvme_side_vent_spacing_mm,
                        side_sign * outer_width_mm / 2,
                        vent_center_z_mm
                    ])
                        cube([
                            nvme_side_vent_width_mm,
                            2 * wall_thickness_mm + 2.0,
                            nvme_side_vent_height_mm
                        ], center = true);
                }
            }
        }
    }
}

// ======================================================
// Fan Mounts
// ======================================================

module raspberry_pi_tower_stack_fan_mounts(show_structure_only = true) {
    for (mount_index = [0:fan_mount_centers_count - 1]) {
        mount_position_mm = fan_mount_centers_mm[mount_index];
        is_installed = (mount_index < len(fan_mount_enabled_flags))
            ? fan_mount_enabled_flags[mount_index]
            : true;

        translate([mount_position_mm[0], mount_position_mm[1], case_body_z_top_mm])
            raspberry_pi_tower_stack_single_fan_mount(
                index = mount_index,
                is_installed = is_installed,
                show_structure_only = show_structure_only
            );
    }
}

module raspberry_pi_tower_stack_single_fan_mount(index, is_installed = true, show_structure_only = true) {
    body_size_mm = fan_body_size_mm;
    body_origin_z_mm = case_body_z_top_mm - fan_thickness_mm - fan_mount_wall_hole_diameter_mm;

    if (show_structure_only) {
        color(standoff_colour)
        for (corner_x = [-0.5, 0.5])
        for (corner_y = [-0.5, 0.5]) {
            translate([
                corner_x * fan_hole_spacing_mm,
                corner_y * fan_hole_spacing_mm,
                body_origin_z_mm - fan_boss_height_mm
            ])
                cylinder(
                    h = fan_boss_height_mm,
                    d = fan_boss_outer_diameter_mm,
                    center = false
                );
        }
    } else {
        color(standoff_colour)
            translate([
                -body_size_mm / 2,
                -body_size_mm / 2,
                case_body_z_top_mm - fan_thickness_mm
            ])
                cube([body_size_mm, body_size_mm, fan_thickness_mm]);

        // Fan body preview mounting screw access
        if (is_installed) {
            color(connector_colour)
            for (corner_x = [-0.5, 0.5])
            for (corner_y = [-0.5, 0.5]) {
                translate([
                    corner_x * fan_hole_spacing_mm,
                    corner_y * fan_hole_spacing_mm,
                    case_body_z_top_mm - fan_mount_wall_cutout_padding_mm
                ])
                    cylinder(
                        h = fan_mount_wall_cutout_padding_mm + 2,
                        d = fan_screw_hole_diameter_mm,
                        center = false
                    );
            }
        }
    }
}

module raspberry_pi_tower_stack_fan_cutouts() {
    for (mount_index = [0:fan_mount_centers_count - 1]) {
        mount_position_mm = fan_mount_centers_mm[mount_index];
        is_installed = (mount_index < len(fan_mount_enabled_flags))
            ? fan_mount_enabled_flags[mount_index]
            : false;

        // Airflow through top cover roof
        translate([
            mount_position_mm[0],
            mount_position_mm[1],
            case_body_z_top_mm
        ])
            cube(
                [
                    fan_mount_body_opening_size_mm,
                    fan_mount_body_opening_size_mm,
                    top_roof_thickness_mm + 0.1
                ],
                center = true
            );

        // Both slots keep screw clearances so either fan position can be populated.
        for (corner_x = [-0.5, 0.5])
        for (corner_y = [-0.5, 0.5]) {
            translate([
                mount_position_mm[0] + corner_x * fan_hole_spacing_mm,
                mount_position_mm[1] + corner_y * fan_hole_spacing_mm,
                case_body_z_top_mm
            ])
                cylinder(
                    h = top_roof_thickness_mm + 0.2,
                    d = fan_mount_wall_hole_diameter_mm,
                    center = false
                );
        }
    }
}

// ======================================================
// Placeholder PCBs And Stack Geometry
// ======================================================

module raspberry_pi_tower_stack_placeholder_board_reference() {
    color(pcb_colour)
    difference() {
        raspberry_pi_tower_rounded_box(
            [placeholder_board_length_mm, placeholder_board_width_mm, placeholder_board_thickness_mm],
            placeholder_board_corner_radius_mm,
            [0, 0, placeholder_board_thickness_mm / 2]
        );

        for (hole_position_mm = placeholder_board_mounting_hole_positions_mm) {
            translate([
                tower_board_world_x(hole_position_mm[0]),
                tower_board_world_y(hole_position_mm[1]),
                -0.1
            ])
                cylinder(
                    h = placeholder_board_thickness_mm + 0.2,
                    d = placeholder_board_mounting_hole_diameter_mm
                );
        }
    }
}

module raspberry_pi_tower_stack_nvme_board_reference() {
    color("SeaGreen")
    difference() {
        raspberry_pi_tower_rounded_box(
            [nvme_board_length_mm, nvme_board_width_mm, nvme_board_thickness_mm],
            nvme_board_corner_radius_mm,
            [0, 0, nvme_board_thickness_mm / 2]
        );

        for (hole_position_mm = placeholder_board_mounting_hole_positions_mm) {
            translate([
                tower_board_world_x(hole_position_mm[0]),
                tower_board_world_y(hole_position_mm[1]),
                -0.1
            ])
                cylinder(
                    h = nvme_board_thickness_mm + 0.2,
                    d = placeholder_board_mounting_hole_diameter_mm
                );
        }
    }

    if (show_nvme_references) {
        color("DarkSlateGray")
        translate([
            -nvme_module_size_mm[0] / 2,
            tower_board_world_y(nvme_module_center_y_mm) - nvme_module_size_mm[1] / 2,
            nvme_board_thickness_mm - preview_overlap_mm
        ])
            cube(nvme_module_size_mm);

        color("Silver")
        translate([
            -nvme_heatsink_size_mm[0] / 2,
            tower_board_world_y(nvme_module_center_y_mm) - nvme_heatsink_size_mm[1] / 2,
            nvme_board_thickness_mm + nvme_heatsink_offset_z_mm - preview_overlap_mm
        ])
            cube(nvme_heatsink_size_mm);
    }

    if (show_placeholder_board_headers) {
        raspberry_pi_tower_placeholder_board_header();
    }
}

module raspberry_pi_tower_stack_cluster_hat_reference() {
    color("DarkGreen")
    difference() {
        raspberry_pi_tower_rounded_box(
            [cluster_hat_board_length_mm, cluster_hat_board_width_mm, cluster_hat_board_thickness_mm],
            cluster_hat_board_corner_radius_mm,
            [0, 0, cluster_hat_board_thickness_mm / 2]
        );

        for (hole_position_mm = placeholder_board_mounting_hole_positions_mm) {
            translate([
                tower_board_world_x(hole_position_mm[0]),
                tower_board_world_y(hole_position_mm[1]),
                -0.1
            ])
                cylinder(
                    h = cluster_hat_board_thickness_mm + 0.2,
                    d = cluster_hat_mounting_hole_diameter_mm
                );
        }
    }

    if (show_placeholder_board_headers) {
        color(connector_colour)
        translate([
            tower_board_world_x(cluster_hat_header_origin_mm[0]),
            tower_board_world_y(cluster_hat_header_origin_mm[1]),
            cluster_hat_header_origin_mm[2] - preview_overlap_mm
        ])
            cube(cluster_hat_header_size_mm);

        color("Black")
        translate([
            tower_board_world_x(cluster_hat_gpio_socket_origin_mm[0]),
            tower_board_world_y(cluster_hat_gpio_socket_origin_mm[1]),
            cluster_hat_gpio_socket_origin_mm[2] - preview_overlap_mm
        ])
            cube(cluster_hat_gpio_socket_size_mm);

        for (socket_index = [0:cluster_hat_downstream_socket_count - 1]) {
            translate([
                (socket_index - (cluster_hat_downstream_socket_count - 1) / 2) * cluster_hat_downstream_socket_spacing_x_mm
                    - cluster_hat_downstream_socket_size_mm[0] / 2,
                tower_board_world_y(cluster_hat_downstream_socket_center_y_mm)
                    - cluster_hat_downstream_socket_size_mm[1] / 2,
                cluster_hat_board_thickness_mm - preview_overlap_mm
            ])
                cube(cluster_hat_downstream_socket_size_mm);
        }
    }
}

module raspberry_pi_tower_placeholder_board_header() {
    color(connector_colour)
    translate([
        tower_board_world_x(placeholder_board_header_origin_mm[0]),
        tower_board_world_y(placeholder_board_header_origin_mm[1]),
        placeholder_board_header_origin_mm[2]
    ])
        cube(placeholder_board_header_size_mm);

    if (show_placeholder_board_headers) {
        for (pin_row = [0:1])
        for (pin_col = [0:19]) {
            color(connector_colour)
            translate([
                tower_board_world_x(placeholder_board_header_origin_mm[0] + pin_col * placeholder_board_header_pin_pitch_mm),
                tower_board_world_y(placeholder_board_header_origin_mm[1] + pin_row * placeholder_board_header_pin_pitch_mm),
                placeholder_board_header_origin_mm[2] + placeholder_board_header_size_mm[2]
            ])
                cube([
                    placeholder_board_header_pin_size_mm,
                    placeholder_board_header_pin_size_mm,
                    placeholder_board_header_pin_height_mm
                ]);
        }
    }
}

module raspberry_pi_tower_splitter_and_display_preview(stack_index) {
    if (stack_index + 1 == rpi5_stack_index) {
        header_origin_x_mm = tower_board_world_x(rpi5_gpio_pin_origin_x_mirror_mm);
        header_origin_y_mm = tower_board_world_y(rpi5_gpio_pin_origin_y_mirror_mm);
        header_top_z_mm = rpi5_gpio_header_size_mirror_mm[2] + rpi5_board_thickness_mirror_mm;
        header_next_board_bottom_z = tower_stack_bottom_z_mm(stack_index + 1) - tower_stack_bottom_z_mm(stack_index);
        vertical_height_mm = max(
            display_splitter_vertical_length_mm,
            header_next_board_bottom_z - header_top_z_mm - preview_overlap_mm
        );

        // Vertical header leg supports board above Pi 5.
        color(guide_colour)
        translate([
            header_origin_x_mm,
            header_origin_y_mm,
            header_top_z_mm
            ])
            cube([
                display_splitter_cross_section_mm,
                display_splitter_cross_section_mm,
                vertical_height_mm
            ]);

        // Lateral header leg toward display branch.
        color(guide_colour)
        translate([
            header_origin_x_mm,
            header_origin_y_mm + display_splitter_lateral_length_mm / 2,
            header_top_z_mm + 0.1
            ])
            cube([
                display_splitter_lateral_length_mm,
                display_splitter_cross_section_mm,
                display_splitter_cross_section_mm
            ]);

        if (show_display_preview) {
            display_origin_x_mm = header_origin_x_mm + display_splitter_lateral_length_mm + display_body_offset_x_from_splitter_mm;
            display_origin_y_mm = header_origin_y_mm + display_splitter_lateral_length_mm / 2 - display_body_width_mm / 2;
            display_origin_z_mm = header_top_z_mm + display_body_offset_z_from_header_mm + display_cover_z_lift_mm;

            // Perpendicular display body preview
            color("black")
                translate([
                    display_origin_x_mm,
                    display_origin_y_mm,
                    display_origin_z_mm
                ])
                    cube([
                        display_body_thickness_mm,
                        display_body_width_mm,
                        display_body_height_mm
                    ]);
        }

        if (show_display_cover_preview && render_mode != "electronics") {
            // Cover is shown separately in `display_cover` render mode and can be
            // shown inside assembly as an independent printed part.
            if (render_mode != "display_cover") {
                translate([
                    header_origin_x_mm + display_splitter_lateral_length_mm,
                    header_origin_y_mm + display_splitter_lateral_length_mm / 2 - display_cover_width_mm / 2,
                    header_top_z_mm + display_body_offset_z_from_header_mm + display_cover_z_lift_mm
                ])
                    raspberry_pi_tower_stack_display_cover_geometry();
            }
        }
    }
}

module raspberry_pi_tower_stack_display_cover_geometry() {
    difference() {
        // outer shell
        color(cover_colour)
        cube([
            display_cover_length_mm,
            display_cover_width_mm,
            display_cover_height_mm
        ]);

        // inner body cavity
        translate([
            display_cover_wall_thickness_mm,
            display_cover_wall_thickness_mm,
            display_cover_wall_thickness_mm
        ])
            cube([
                display_cover_length_mm - 2 * display_cover_wall_thickness_mm,
                display_cover_width_mm - 2 * display_cover_wall_thickness_mm,
                display_cover_height_mm - 2 * display_cover_wall_thickness_mm
            ]);

        // display window on the exposed face
        translate([
            -0.02,
            (display_cover_width_mm - display_window_length_mm) / 2,
            (display_cover_height_mm - display_window_height_mm) / 2
        ])
            cube([
                display_cover_wall_thickness_mm + 0.04,
                display_window_length_mm + display_window_clearance_mm,
                display_window_height_mm + display_window_clearance_mm
            ]);
    }
}

// ======================================================
// Helpers
// ======================================================

module raspberry_pi_tower_rounded_box(size_mm, radius_mm, center_mm = [0, 0, 0]) {
    translate(center_mm)
        hull() {
            for (x_position_mm = [
                -size_mm[0] / 2 + radius_mm,
                size_mm[0] / 2 - radius_mm
            ])
            for (y_position_mm = [
                -size_mm[1] / 2 + radius_mm,
                size_mm[1] / 2 - radius_mm
            ]) {
                translate([x_position_mm, y_position_mm, -size_mm[2] / 2])
                    cylinder(h = size_mm[2], r = radius_mm);
            }
        }
}
