// Raspberry Pi 5 five-board stack enclosure
//
// - one printable bottom tray, one printable top cover
// - adjustable per-gap spacing for five PCB positions, with PCB 4 from top as Pi 5 by default
// - male/female removable top-cover connection
// - air-gap aligned side ventilation for every inter-board gap
// - anti-slip recesses on tray underside
//
// Units: mm
// Origin: board center on the stack footprint (PCB XY origin), Z=0 at tray floor exterior.

use <rpi5.scad>

// ======================================================
// Adjustable Parameters
// ======================================================

// Render controls
$fn = 48;
render_mode = "printable_layout"; // [assembly/bottom_tray/top_cover/electronics/printable_layout]
show_rpi5_reference = true;
show_rpi5_active_cooler_reference = false;
show_rpi5_gpio_pins = true;
show_rpi5_micro_sd_card = true;
show_clearance_guides = false;

// Stack geometry
stack_board_count = 5;
pi5_five_stack_gap_count = 4;
pi5_stack_gap_z_mm = [15.0, 15.0, 15.0, 15.0];
rpi5_stack_index_from_top = 4;
top_of_fifth_board_to_top_cover_clearance_mm = 7.0;
electronics_preview_lift_mm = 0.0;

// Raspberry Pi 5 mirrored reference (from designs/rpi5.scad)
rpi5_board_length_mirror_mm = 85.0;
rpi5_board_width_mirror_mm = 56.0;
rpi5_board_thickness_mirror_mm = 1.6;
rpi5_board_corner_radius_mirror_mm = 3.0;
rpi5_board_mounting_hole_diameter_mirror_mm = 2.75;
rpi5_board_mounting_hole_positions_mirror_mm = [
    [3.5, 3.5],
    [61.5, 3.5],
    [3.5, 52.5],
    [61.5, 52.5]
];
rpi5_usb_port_lower_origin_mirror_mm = [70.0, 6.0, rpi5_board_thickness_mirror_mm];
rpi5_usb_port_lower_size_mirror_mm = [15.0, 13.0, 15.0];
rpi5_usb_port_upper_origin_mirror_mm = [70.0, 22.0, rpi5_board_thickness_mirror_mm];
rpi5_usb_port_upper_size_mirror_mm = [15.0, 13.0, 15.0];
rpi5_ethernet_port_origin_mirror_mm = [66.0, 39.0, rpi5_board_thickness_mirror_mm];
rpi5_ethernet_port_size_mirror_mm = [19.0, 15.0, 13.0];
rpi5_usb_c_power_origin_mirror_mm = [5.0, -2.0, rpi5_board_thickness_mirror_mm];
rpi5_usb_c_power_size_mirror_mm = [9.0, 4.0, 3.0];
rpi5_micro_hdmi_left_origin_mirror_mm = [22.0, -2.0, rpi5_board_thickness_mirror_mm];
rpi5_micro_hdmi_right_origin_mirror_mm = [35.0, -2.0, rpi5_board_thickness_mirror_mm];
rpi5_micro_hdmi_size_mirror_mm = [7.0, 4.0, 3.0];
rpi5_camera_display_connector_a_origin_mirror_mm = [45.0, 4.0, rpi5_board_thickness_mirror_mm];
rpi5_camera_display_connector_b_origin_mirror_mm = [45.0, 14.0, rpi5_board_thickness_mirror_mm];
rpi5_camera_display_connector_size_mirror_mm = [17.0, 3.0, 3.0];
rpi5_pcie_connector_origin_mirror_mm = [10.0, 25.0, rpi5_board_thickness_mirror_mm];
rpi5_pcie_connector_size_mirror_mm = [22.0, 3.0, 3.0];
rpi5_gpio_header_origin_mirror_mm = [7.0, 49.0, rpi5_board_thickness_mirror_mm];
rpi5_gpio_header_size_mirror_mm = [51.0, 5.0, 2.5];
rpi5_gpio_header_pin_height_mirror_mm = 6.0;
rpi5_gpio_header_pin_size_mirror_mm = 0.64;
rpi5_micro_sd_slot_origin_mirror_mm = [5.0, 20.0, -1.8];
rpi5_micro_sd_slot_size_mirror_mm = [16.0, 14.0, 1.8];

// Enclosure dimensions
wall_thickness_mm = 2.8;
floor_thickness_mm = 2.2;
top_roof_thickness_mm = 2.2;
tray_wall_height_mm = 16.0;
cover_skirt_drop_depth_mm = 4.0;
cover_fit_clearance_mm = 0.35;
cover_airtight_clearance_mm = 0.5;
corner_radius_mm = 4.0;
preview_overlap_mm = 0.05;
solid_merge_overlap_mm = 0.08;

// Bottom-board mounting standoffs
board_mount_standoff_height_mm = 4.6;
board_mount_standoff_outer_diameter_mm = 6.5;
board_mount_screw_hole_diameter_mm = rpi5_board_mounting_hole_diameter_mirror_mm;
board_mount_screw_hole_depth_mm = 4.2;
enable_board_mount_inserts = false;
board_mount_insert_diameter_mm = 4.2;
board_mount_insert_depth_mm = 3.4;

// Top cover pins and tray sockets
cover_pin_diameter_mm = 3.2;
cover_pin_insertion_length_mm = 5.2;
cover_pin_root_diameter_mm = 5.6;
cover_pin_count = 4;
cover_pin_offset_x_mm = 45.5;
cover_pin_offset_y_mm = 31.0;
tray_socket_clearance_mm = 0.35;
tray_socket_depth_mm = 5.6;
tray_socket_receiver_diameter_mm = 7.0;

// Bottom anti-slip recesses
enable_anti_slip_recesses = true;
anti_slip_recess_diameter_mm = 10.0;
anti_slip_recess_depth_mm = 1.1;
anti_slip_recess_offset_x_mm = 28.0;
anti_slip_recess_offset_y_mm = 18.0;

// Per-gap inter-PCB airflow
enable_left_side_inter_pcb_airflow = true;
enable_right_side_inter_pcb_airflow = true;
inter_pcb_airflow_slot_count = 4;
inter_pcb_airflow_slot_spacing_mm = 11.0;
inter_pcb_airflow_slot_width_mm = 6.0;
inter_pcb_airflow_slot_height_mm = 8.0;
inter_pcb_airflow_slot_length_mm = 18.0;
inter_pcb_airflow_side_margin_mm = 5.0;

// Service access tuning
base_board_micro_sd_access_board_indices = [1];
enable_additional_micro_sd_openings = false;
micro_sd_access_z_clearance_mm = 2.0;
top_service_clearance_mm = 1.8;
edge_port_clearance_mm = 1.8;
service_cutout_clearance_mm = 1.0;
port_front_head_min_size_mm = [12.0, 7.0];
micro_hdmi_head_min_size_mm = [12.0, 6.7];
show_tray_port_access = true;
show_top_cover_port_access = true;

// Derived from stack and clearances
printable_layout_spacing_mm = 34.0;

assert(
    stack_board_count == 5,
    "pi5_five_stack_enclosure is intentionally constrained to five boards."
);
assert(
    rpi5_stack_index_from_top >= 1 && rpi5_stack_index_from_top <= stack_board_count,
    "rpi5_stack_index_from_top must select one of the five PCB positions."
);
assert(
    len(pi5_stack_gap_z_mm) == pi5_five_stack_gap_count,
    "pi5_stack_gap_z_mm must contain exactly four values for the five-board stack."
);

// Visual styles
tray_colour = "DimGray";
cover_colour = "SlateGray";
standoff_colour = "Gainsboro";
cutout_guide_colour = [0.0, 0.58, 1.0, 0.16];
generic_pcb_colour = "DarkOliveGreen";

// ======================================================
// Derived Values
// ======================================================

function rpi5_five_stack_world_x(source_x_mm) =
    source_x_mm - rpi5_board_length_mirror_mm / 2;
function rpi5_five_stack_world_y(source_y_mm) =
    source_y_mm - rpi5_board_width_mirror_mm / 2;

function rpi5_five_stack_prefix_sum_mm(values_mm, count_mm, index_mm = 0, total_mm = 0) =
    index_mm >= min(count_mm, len(values_mm))
    ? total_mm
    : rpi5_five_stack_prefix_sum_mm(
        values_mm,
        count_mm,
        index_mm + 1,
        total_mm + values_mm[index_mm]
    );

function rpi5_five_stack_board_enabled(board_index_1_based, index_list) =
    len([for (candidate = index_list) if (candidate == board_index_1_based) 1]) > 0;

rpi5_stack_index = stack_board_count - rpi5_stack_index_from_top + 1;

base_board_bottom_z_mm = floor_thickness_mm + board_mount_standoff_height_mm;
stack_board_bottom_z_mm = [
    for (board_index = [0:stack_board_count - 1])
        base_board_bottom_z_mm
        + board_index * rpi5_board_thickness_mirror_mm
        + rpi5_five_stack_prefix_sum_mm(pi5_stack_gap_z_mm, board_index)
];

stack_board_top_z_mm = [
    for (board_index = [0:stack_board_count - 1])
        stack_board_bottom_z_mm[board_index] + rpi5_board_thickness_mirror_mm
];

stack_highest_board_top_z_mm = stack_board_top_z_mm[stack_board_count - 1];
inter_pcb_gap_centers_z_mm = [
    for (gap_index = [0:pi5_five_stack_gap_count - 1])
        (stack_board_top_z_mm[gap_index] + stack_board_bottom_z_mm[gap_index + 1]) / 2
];

internal_length_mm = rpi5_board_length_mirror_mm + 2 * (wall_thickness_mm + 2.0);
internal_width_mm = rpi5_board_width_mirror_mm + 2 * (wall_thickness_mm + 2.0);
outer_length_mm = internal_length_mm + 2 * wall_thickness_mm;
outer_width_mm = internal_width_mm + 2 * wall_thickness_mm;

stacked_case_inner_roof_z_mm = stack_highest_board_top_z_mm + top_of_fifth_board_to_top_cover_clearance_mm;
case_total_height_mm = max(
    stacked_case_inner_roof_z_mm + top_roof_thickness_mm,
    tray_wall_height_mm + 10.0
);
top_cover_height_mm = case_total_height_mm - tray_wall_height_mm + cover_skirt_drop_depth_mm;

top_cover_hollow_start_z_mm = tray_wall_height_mm - cover_skirt_drop_depth_mm;
top_cover_clearance_length_mm = 2 * (wall_thickness_mm + cover_fit_clearance_mm);

cover_pin_centers_mm = [
    [-cover_pin_offset_x_mm, -cover_pin_offset_y_mm],
    [ cover_pin_offset_x_mm, -cover_pin_offset_y_mm],
    [-cover_pin_offset_x_mm,  cover_pin_offset_y_mm],
    [ cover_pin_offset_x_mm,  cover_pin_offset_y_mm]
];
active_cover_pin_count = min(cover_pin_count, len(cover_pin_centers_mm));
cover_skirt_bottom_z_mm = tray_wall_height_mm - cover_skirt_drop_depth_mm;
cover_pin_start_z_mm = cover_skirt_bottom_z_mm - cover_pin_insertion_length_mm;
cover_pin_root_base_z_mm = cover_skirt_bottom_z_mm - solid_merge_overlap_mm;
cover_pin_root_post_height_mm = case_total_height_mm - top_roof_thickness_mm - cover_pin_root_base_z_mm + solid_merge_overlap_mm;
tray_socket_hole_bottom_z_mm = min(
    tray_wall_height_mm - tray_socket_depth_mm,
    cover_pin_start_z_mm - preview_overlap_mm
);
tray_socket_hole_depth_mm = tray_wall_height_mm - tray_socket_hole_bottom_z_mm + 2 * preview_overlap_mm;
tray_socket_hole_center_z_mm = tray_socket_hole_bottom_z_mm + tray_socket_hole_depth_mm / 2;
tray_socket_hole_diameter_mm = cover_pin_diameter_mm + 2 * tray_socket_clearance_mm;

anti_slip_recess_centers_mm = [
    [-internal_length_mm / 2 + anti_slip_recess_offset_x_mm, -internal_width_mm / 2 + anti_slip_recess_offset_y_mm],
    [ internal_length_mm / 2 - anti_slip_recess_offset_x_mm, -internal_width_mm / 2 + anti_slip_recess_offset_y_mm],
    [-internal_length_mm / 2 + anti_slip_recess_offset_x_mm,  internal_width_mm / 2 - anti_slip_recess_offset_y_mm],
    [ internal_length_mm / 2 - anti_slip_recess_offset_x_mm,  internal_width_mm / 2 - anti_slip_recess_offset_y_mm]
];
anti_slip_recess_effective_depth_mm = max(
    0,
    min(
        anti_slip_recess_depth_mm,
        max(floor_thickness_mm - 0.4, 0)
    )
);

side_airflow_cutout_depth_mm = 2 * wall_thickness_mm + 2.0;
front_airflow_cutout_depth_mm = 2 * wall_thickness_mm + 2.0;
top_airflow_cutout_depth_mm = top_roof_thickness_mm + 2.0;
right_side_port_cutout_depth_mm = 2 * wall_thickness_mm + 2.0;
front_side_port_cutout_depth_mm = 2 * wall_thickness_mm + 2.0;
left_side_port_cutout_depth_mm = 2 * wall_thickness_mm + 2.0;
top_cutout_depth_mm = top_roof_thickness_mm + 2.0;

top_cover_usb_front_min_size_mm = [max(port_front_head_min_size_mm[0], rpi5_usb_c_power_size_mirror_mm[0]), max(port_front_head_min_size_mm[1], rpi5_usb_c_power_size_mirror_mm[1])];
top_cover_micro_hdmi_front_min_size_mm = [max(micro_hdmi_head_min_size_mm[0], rpi5_micro_hdmi_size_mirror_mm[0]), max(micro_hdmi_head_min_size_mm[1], rpi5_micro_hdmi_size_mirror_mm[1])];

rpi5_usb_micro_sd_cutout_z_mm =
    rpi5_micro_sd_slot_origin_mirror_mm[2]
    + rpi5_micro_sd_slot_size_mirror_mm[2]
    + micro_sd_access_z_clearance_mm;
rpi5_usb_micro_sd_clearance_top_z_mm =
    case_total_height_mm - top_roof_thickness_mm / 2 - 0.2;

// ======================================================
// Render Dispatch
// ======================================================

if (render_mode == "assembly") {
    pi5_five_stack_enclosure_assembly();
} else if (render_mode == "bottom_tray") {
    pi5_five_stack_printable_bottom_tray();
} else if (render_mode == "top_cover") {
    pi5_five_stack_printable_top_cover();
} else if (render_mode == "electronics") {
    if (show_rpi5_reference) {
        pi5_five_stack_reference_only();
    }
} else if (render_mode == "printable_layout") {
    pi5_five_stack_printable_layout();
} else {
    pi5_five_stack_printable_layout();
}

// ======================================================
// Main Assemblies
// ======================================================

module pi5_five_stack_enclosure_assembly() {
    pi5_five_stack_bottom_tray();
    pi5_five_stack_top_cover();

    if (show_rpi5_reference) {
        pi5_five_stack_reference_only();
    }
    if (show_clearance_guides) {
        pi5_five_stack_cutout_guides();
    }
}

module pi5_five_stack_printable_layout() {
    translate([-(outer_length_mm + printable_layout_spacing_mm) / 2, 0, 0])
        pi5_five_stack_printable_bottom_tray();

    translate([(outer_length_mm + printable_layout_spacing_mm) / 2, 0, 0])
        pi5_five_stack_printable_top_cover();
}

module pi5_five_stack_reference_only() {
    for (board_index = [0:stack_board_count - 1]) {
        if (board_index + 1 == rpi5_stack_index) {
            translate([
                -rpi5_board_length_mirror_mm / 2,
                -rpi5_board_width_mirror_mm / 2,
                stack_board_bottom_z_mm[board_index] + electronics_preview_lift_mm
            ]) {
                rpi5_reference_model(
                    show_reference = true,
                    show_gpio_pins = show_rpi5_gpio_pins,
                    show_micro_sd_card = show_rpi5_micro_sd_card,
                    show_active_cooler = show_rpi5_active_cooler_reference
                );
            }
        } else {
            color(generic_pcb_colour)
            translate([
                0,
                0,
                stack_board_bottom_z_mm[board_index] + electronics_preview_lift_mm
            ])
                pi5_five_stack_rounded_box(
                    [
                        rpi5_board_length_mirror_mm,
                        rpi5_board_width_mirror_mm,
                        rpi5_board_thickness_mirror_mm
                    ],
                    rpi5_board_corner_radius_mirror_mm,
                    [0, 0, rpi5_board_thickness_mirror_mm / 2]
                );
        }
    }
}

module pi5_five_stack_printable_bottom_tray() {
    pi5_five_stack_bottom_tray();
}

module pi5_five_stack_printable_top_cover() {
    translate([0, 0, case_total_height_mm])
        rotate([180, 0, 0])
            pi5_five_stack_top_cover();
}

// ======================================================
// Printable Bodies
// ======================================================

module pi5_five_stack_bottom_tray() {
    color(tray_colour)
    difference() {
        union() {
            pi5_five_stack_tray_shell();
            pi5_five_stack_mounting_standoffs();
            pi5_five_stack_tray_socket_receiver_bosses();
            if (enable_board_mount_inserts) {
                pi5_five_stack_mounting_standoff_rails();
            }
        }

        pi5_five_stack_tray_cutouts();
        if (enable_anti_slip_recesses) {
            pi5_five_stack_anti_slip_recesses();
        }
    }
}

module pi5_five_stack_top_cover() {
    color(cover_colour)
    difference() {
        union() {
            pi5_five_stack_top_cover_shell();
            pi5_five_stack_cover_pin_root_posts();
            pi5_five_stack_cover_pins();
        }

        pi5_five_stack_top_cover_cutouts();
    }
}

// ======================================================
// Tray Shell And Features
// ======================================================

module pi5_five_stack_tray_shell() {
    difference() {
        pi5_five_stack_rounded_box(
            [outer_length_mm, outer_width_mm, tray_wall_height_mm],
            corner_radius_mm,
            [0, 0, tray_wall_height_mm / 2]
        );

        translate([0, 0, floor_thickness_mm])
            pi5_five_stack_rounded_box(
                [internal_length_mm, internal_width_mm, tray_wall_height_mm - floor_thickness_mm + preview_overlap_mm],
                max(corner_radius_mm - wall_thickness_mm, 0.8),
                [0, 0, (tray_wall_height_mm - floor_thickness_mm + preview_overlap_mm) / 2]
            );
    }
}

module pi5_five_stack_tray_cutouts() {
    pi5_five_stack_tray_socket_holes();
    pi5_five_stack_mounting_holes();

    if (show_tray_port_access) {
        pi5_five_stack_tray_port_cutouts();
    }
}

module pi5_five_stack_mounting_standoffs() {
    color(standoff_colour)
    for (hole_position_mm = rpi5_board_mounting_hole_positions_mirror_mm) {
        translate([
            rpi5_five_stack_world_x(hole_position_mm[0]),
            rpi5_five_stack_world_y(hole_position_mm[1]),
            floor_thickness_mm
        ])
            cylinder(
                h = board_mount_standoff_height_mm,
                d = board_mount_standoff_outer_diameter_mm
            );
    }
}

module pi5_five_stack_mounting_standoff_rails() {
    color(standoff_colour)
    for (hole_position_mm = rpi5_board_mounting_hole_positions_mirror_mm) {
        translate([
            rpi5_five_stack_world_x(hole_position_mm[0]),
            rpi5_five_stack_world_y(hole_position_mm[1]),
            floor_thickness_mm + board_mount_standoff_height_mm - board_mount_screw_hole_depth_mm
        ])
            cylinder(
                h = board_mount_screw_hole_depth_mm + preview_overlap_mm,
                d = board_mount_screw_hole_diameter_mm
            );
    }
}

module pi5_five_stack_mounting_holes() {
    if (enable_board_mount_inserts) {
        for (hole_position_mm = rpi5_board_mounting_hole_positions_mirror_mm) {
            translate([
                rpi5_five_stack_world_x(hole_position_mm[0]),
                rpi5_five_stack_world_y(hole_position_mm[1]),
                floor_thickness_mm + board_mount_standoff_height_mm - board_mount_insert_depth_mm
            ])
                cylinder(
                    h = board_mount_insert_depth_mm + preview_overlap_mm,
                    d = board_mount_insert_diameter_mm
                );
        }
    } else {
        for (hole_position_mm = rpi5_board_mounting_hole_positions_mirror_mm) {
            translate([
                rpi5_five_stack_world_x(hole_position_mm[0]),
                rpi5_five_stack_world_y(hole_position_mm[1]),
                floor_thickness_mm + board_mount_standoff_height_mm - board_mount_screw_hole_depth_mm
            ])
                cylinder(
                    h = board_mount_screw_hole_depth_mm + preview_overlap_mm,
                    d = board_mount_screw_hole_diameter_mm
                );
        }
    }
}

module pi5_five_stack_tray_socket_holes() {
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

module pi5_five_stack_tray_socket_receiver_bosses() {
    color(standoff_colour)
    for (pin_index = [0:active_cover_pin_count - 1]) {
        translate([
            cover_pin_centers_mm[pin_index][0],
            cover_pin_centers_mm[pin_index][1],
            floor_thickness_mm - solid_merge_overlap_mm
        ])
            cylinder(
                h = tray_wall_height_mm - floor_thickness_mm + solid_merge_overlap_mm,
                d = tray_socket_receiver_diameter_mm
            );
    }
}

module pi5_five_stack_anti_slip_recesses() {
    for (foot_center_mm = anti_slip_recess_centers_mm) {
        translate([
            foot_center_mm[0],
            foot_center_mm[1],
            -preview_overlap_mm
        ])
            cylinder(
                h = anti_slip_recess_effective_depth_mm + preview_overlap_mm,
                d = anti_slip_recess_diameter_mm
            );
    }
}

module pi5_five_stack_tray_port_cutouts() {
    if (rpi5_stack_index == 1) {
        let (base_board_bottom_z_mm = stack_board_bottom_z_mm[0]) {
            // Base-board side/front cutouts inside tray wall volume.
            pi5_five_stack_right_side_port_cutout(
                base_board_bottom_z_mm,
                rpi5_usb_port_lower_origin_mirror_mm,
                rpi5_usb_port_lower_size_mirror_mm,
                edge_port_clearance_mm,
                right_side_port_cutout_depth_mm
            );
            pi5_five_stack_right_side_port_cutout(
                base_board_bottom_z_mm,
                rpi5_usb_port_upper_origin_mirror_mm,
                rpi5_usb_port_upper_size_mirror_mm,
                edge_port_clearance_mm,
                right_side_port_cutout_depth_mm
            );
            pi5_five_stack_right_side_port_cutout(
                base_board_bottom_z_mm,
                rpi5_ethernet_port_origin_mirror_mm,
                rpi5_ethernet_port_size_mirror_mm,
                edge_port_clearance_mm,
                right_side_port_cutout_depth_mm
            );
            pi5_five_stack_front_side_port_cutout(
                base_board_bottom_z_mm,
                rpi5_usb_c_power_origin_mirror_mm,
                rpi5_usb_c_power_size_mirror_mm,
                top_cover_usb_front_min_size_mm,
                front_side_port_cutout_depth_mm
            );
            pi5_five_stack_front_side_port_cutout(
                base_board_bottom_z_mm,
                rpi5_micro_hdmi_left_origin_mirror_mm,
                rpi5_micro_hdmi_size_mirror_mm,
                top_cover_micro_hdmi_front_min_size_mm,
                front_side_port_cutout_depth_mm
            );
            pi5_five_stack_front_side_port_cutout(
                base_board_bottom_z_mm,
                rpi5_micro_hdmi_right_origin_mirror_mm,
                rpi5_micro_hdmi_size_mirror_mm,
                top_cover_micro_hdmi_front_min_size_mm,
                front_side_port_cutout_depth_mm
            );
            pi5_five_stack_left_side_port_cutout(
                base_board_bottom_z_mm,
                rpi5_micro_sd_slot_origin_mirror_mm,
                rpi5_micro_sd_slot_size_mirror_mm,
                edge_port_clearance_mm,
                left_side_port_cutout_depth_mm
            );
        }
    }
}

// ======================================================
// Top Cover Shell And Features
// ======================================================

module pi5_five_stack_top_cover_shell() {
    difference() {
        translate([0, 0, top_cover_hollow_start_z_mm])
            pi5_five_stack_rounded_box(
                [outer_length_mm, outer_width_mm, top_cover_height_mm],
                corner_radius_mm,
                [0, 0, top_cover_height_mm / 2]
            );

        pi5_five_stack_top_cover_hollow_volume();
    }
}

module pi5_five_stack_top_cover_hollow_volume() {
    translate([
        0, 0, top_cover_hollow_start_z_mm - preview_overlap_mm
    ])
        pi5_five_stack_rounded_box(
            [
                internal_length_mm + top_cover_hollow_length_allowance_mm(),
                internal_width_mm + top_cover_hollow_length_allowance_mm(),
                top_cover_height_mm - top_roof_thickness_mm + preview_overlap_mm
            ],
            max(corner_radius_mm - wall_thickness_mm, 0.8),
            [0, 0, (top_cover_height_mm - top_roof_thickness_mm + preview_overlap_mm) / 2]
        );
}

function top_cover_hollow_length_allowance_mm() = 2 * (cover_fit_clearance_mm + cover_airtight_clearance_mm);

module pi5_five_stack_cover_pins() {
    color(standoff_colour)
    for (pin_index = [0:active_cover_pin_count - 1]) {
        pi5_five_stack_cover_pin(cover_pin_centers_mm[pin_index]);
    }
}

module pi5_five_stack_cover_pin_root_posts() {
    color(standoff_colour)
    for (pin_index = [0:active_cover_pin_count - 1]) {
        translate([
            cover_pin_centers_mm[pin_index][0],
            cover_pin_centers_mm[pin_index][1],
            cover_pin_root_base_z_mm
        ])
            cylinder(
                h = cover_pin_root_post_height_mm,
                d = cover_pin_root_diameter_mm
            );
    }
}

module pi5_five_stack_cover_pin(pin_center_mm) {
    translate([pin_center_mm[0], pin_center_mm[1], cover_pin_start_z_mm])
        cylinder(
            h = cover_pin_insertion_length_mm + 2 * solid_merge_overlap_mm,
            d = cover_pin_diameter_mm
        );
}

module pi5_five_stack_top_cover_cutouts() {
    if (show_top_cover_port_access) {
        pi5_five_stack_top_cover_port_cutouts();
    }
    pi5_five_stack_inter_gap_side_airflow();
}

module pi5_five_stack_top_cover_port_cutouts() {
    for (board_index = [0:stack_board_count - 1]) {
        let (
            board_bottom_z_mm = stack_board_bottom_z_mm[board_index],
            board_top_z_mm = stack_board_top_z_mm[board_index],
            board_index_1_based = board_index + 1
        ) {
            if (board_index_1_based == rpi5_stack_index) {
                // Right-side USB-A and Ethernet access
                pi5_five_stack_right_side_port_cutout(
                    board_bottom_z_mm,
                    rpi5_usb_port_lower_origin_mirror_mm,
                    rpi5_usb_port_lower_size_mirror_mm,
                    edge_port_clearance_mm,
                    right_side_port_cutout_depth_mm
                );
                pi5_five_stack_right_side_port_cutout(
                    board_bottom_z_mm,
                    rpi5_usb_port_upper_origin_mirror_mm,
                    rpi5_usb_port_upper_size_mirror_mm,
                    edge_port_clearance_mm,
                    right_side_port_cutout_depth_mm
                );
                pi5_five_stack_right_side_port_cutout(
                    board_bottom_z_mm,
                    rpi5_ethernet_port_origin_mirror_mm,
                    rpi5_ethernet_port_size_mirror_mm,
                    edge_port_clearance_mm,
                    right_side_port_cutout_depth_mm
                );

                // Front USB-C and micro-HDMI access
                pi5_five_stack_front_side_port_cutout(
                    board_bottom_z_mm,
                    rpi5_usb_c_power_origin_mirror_mm,
                    rpi5_usb_c_power_size_mirror_mm,
                    top_cover_usb_front_min_size_mm,
                    front_side_port_cutout_depth_mm
                );
                pi5_five_stack_front_side_port_cutout(
                    board_bottom_z_mm,
                    rpi5_micro_hdmi_left_origin_mirror_mm,
                    rpi5_micro_hdmi_size_mirror_mm,
                    top_cover_micro_hdmi_front_min_size_mm,
                    front_side_port_cutout_depth_mm
                );
                pi5_five_stack_front_side_port_cutout(
                    board_bottom_z_mm,
                    rpi5_micro_hdmi_right_origin_mirror_mm,
                    rpi5_micro_hdmi_size_mirror_mm,
                    top_cover_micro_hdmi_front_min_size_mm,
                    front_side_port_cutout_depth_mm
                );

                // Top-side GPIO/header and extension services
                pi5_five_stack_top_side_port_cutout(
                    board_bottom_z_mm,
                    rpi5_camera_display_connector_a_origin_mirror_mm,
                    rpi5_camera_display_connector_size_mirror_mm,
                    service_cutout_clearance_mm
                );
                pi5_five_stack_top_side_port_cutout(
                    board_bottom_z_mm,
                    rpi5_camera_display_connector_b_origin_mirror_mm,
                    rpi5_camera_display_connector_size_mirror_mm,
                    service_cutout_clearance_mm
                );
                pi5_five_stack_top_side_port_cutout(
                    board_bottom_z_mm,
                    rpi5_pcie_connector_origin_mirror_mm,
                    rpi5_pcie_connector_size_mirror_mm,
                    service_cutout_clearance_mm
                );
                pi5_five_stack_top_side_port_cutout(
                    board_bottom_z_mm,
                    rpi5_gpio_header_origin_mirror_mm,
                    rpi5_gpio_header_size_mirror_mm,
                    top_service_clearance_mm
                );
                pi5_five_stack_top_micro_sd_cutout(
                    board_top_z_mm
                );
            }
        }
    }
}

module pi5_five_stack_top_micro_sd_cutout(
    board_top_z_mm
) {
    translate([
        rpi5_five_stack_world_x(rpi5_micro_sd_slot_origin_mirror_mm[0] + rpi5_micro_sd_slot_size_mirror_mm[0] / 2),
        rpi5_five_stack_world_y(rpi5_micro_sd_slot_origin_mirror_mm[1] + rpi5_micro_sd_slot_size_mirror_mm[1] / 2),
        min(
            board_top_z_mm + rpi5_usb_micro_sd_cutout_z_mm,
            rpi5_usb_micro_sd_clearance_top_z_mm
        )
    ])
        cube(
            [
                rpi5_micro_sd_slot_size_mirror_mm[0] + service_cutout_clearance_mm,
                rpi5_micro_sd_slot_size_mirror_mm[1] + service_cutout_clearance_mm,
                top_cutout_depth_mm
            ],
            center = true
        );
}

// ======================================================
// Side Airflow
// ======================================================

module pi5_five_stack_inter_gap_side_airflow() {
    if (enable_left_side_inter_pcb_airflow) {
        for (gap_index = [0:len(inter_pcb_gap_centers_z_mm) - 1]) {
            pi5_five_stack_side_gap_airflow(
                inter_pcb_gap_centers_z_mm[gap_index],
                -1
            );
        }
    }

    if (enable_right_side_inter_pcb_airflow) {
        for (gap_index = [0:len(inter_pcb_gap_centers_z_mm) - 1]) {
            pi5_five_stack_side_gap_airflow(
                inter_pcb_gap_centers_z_mm[gap_index],
                1
            );
        }
    }
}

module pi5_five_stack_side_gap_airflow(gap_center_z_mm, side_sign) {
    for (slot_index = [0:inter_pcb_airflow_slot_count - 1]) {
        let (
            slot_center_y_mm = (slot_index - (inter_pcb_airflow_slot_count - 1) / 2)
                * inter_pcb_airflow_slot_spacing_mm
        ) {
            if (
                abs(slot_center_y_mm) <= (internal_width_mm / 2 - inter_pcb_airflow_slot_width_mm / 2 - inter_pcb_airflow_side_margin_mm)
            ) {
                translate([
                    side_sign * (outer_length_mm / 2),
                    slot_center_y_mm,
                    gap_center_z_mm
                ])
                    cube(
                        [
                            side_airflow_cutout_depth_mm,
                            inter_pcb_airflow_slot_width_mm,
                            inter_pcb_airflow_slot_height_mm
                        ],
                        center = true
                    );
            }
        }
    }
}

// ======================================================
// Port Cutout Modules
// ======================================================

module pi5_five_stack_right_side_port_cutout(
    board_bottom_z_mm,
    connector_origin_mm,
    connector_size_mm,
    clearance_mm,
    cutout_depth_mm
) {
    translate([
        outer_length_mm / 2,
        rpi5_five_stack_world_y(connector_origin_mm[1] + connector_size_mm[1] / 2),
        board_bottom_z_mm + connector_origin_mm[2] + connector_size_mm[2] / 2
    ])
        cube(
            [
                cutout_depth_mm,
                connector_size_mm[1] + 2 * clearance_mm,
                connector_size_mm[2] + 2 * clearance_mm
            ],
            center = true
        );
}

module pi5_five_stack_left_side_port_cutout(
    board_bottom_z_mm,
    connector_origin_mm,
    connector_size_mm,
    clearance_mm,
    cutout_depth_mm
) {
    translate([
        -outer_length_mm / 2,
        rpi5_five_stack_world_y(connector_origin_mm[1] + connector_size_mm[1] / 2),
        board_bottom_z_mm + connector_origin_mm[2] + connector_size_mm[2] / 2
    ])
        cube(
            [
                cutout_depth_mm,
                connector_size_mm[1] + 2 * clearance_mm,
                connector_size_mm[2] + 2 * clearance_mm
            ],
            center = true
        );
}

module pi5_five_stack_front_side_port_cutout(
    board_bottom_z_mm,
    connector_origin_mm,
    connector_size_mm,
    adapter_min_size_mm,
    cutout_depth_mm
) {
    translate([
        rpi5_five_stack_world_x(connector_origin_mm[0] + connector_size_mm[0] / 2),
        -outer_width_mm / 2,
        board_bottom_z_mm + connector_origin_mm[2] + connector_size_mm[2] / 2
    ])
        cube(
            [
                max(connector_size_mm[0], adapter_min_size_mm[0]) + 2 * edge_port_clearance_mm,
                max(connector_size_mm[1], adapter_min_size_mm[1]) + 2 * edge_port_clearance_mm,
                connector_size_mm[2] + 2 * edge_port_clearance_mm
            ],
            center = true
        );
}

module pi5_five_stack_top_side_port_cutout(
    board_bottom_z_mm,
    connector_origin_mm,
    connector_size_mm,
    clearance_mm
) {
    translate([
        rpi5_five_stack_world_x(connector_origin_mm[0] + connector_size_mm[0] / 2),
        rpi5_five_stack_world_y(connector_origin_mm[1] + connector_size_mm[1] / 2),
        case_total_height_mm - top_roof_thickness_mm / 2
    ])
        cube(
            [
                connector_size_mm[0] + 2 * clearance_mm,
                connector_size_mm[1] + 2 * clearance_mm,
                top_cutout_depth_mm
            ],
            center = true
        );
}

// ======================================================
// Guides
// ======================================================

module pi5_five_stack_cutout_guides() {
    color(cutout_guide_colour)
        pi5_five_stack_reference_cutout_guides();
}

module pi5_five_stack_reference_cutout_guides() {
    color(cutout_guide_colour) {
        if (show_top_cover_port_access) {
            pi5_five_stack_top_cover_port_cutouts();
        }
        if (show_tray_port_access) {
            pi5_five_stack_tray_port_cutouts();
        }
    }

    if (enable_left_side_inter_pcb_airflow || enable_right_side_inter_pcb_airflow) {
        pi5_five_stack_inter_gap_side_airflow();
    }
}

// ======================================================
// Helper Geometry
// ======================================================

module pi5_five_stack_rounded_box(size_mm, radius_mm, center_mm = [0, 0, 0]) {
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
