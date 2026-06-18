// Raspberry Pi 5 AI HAT+ 26T printable enclosure.
//
// Units: mm
// This enclosure uses local mirrored dimensions from rpi5.scad and
// rpi5_ai_hat_plus_26t.scad because OpenSCAD `use` imports modules/functions,
// not source variables.

use <rpi5.scad>
use <rpi5_ai_hat_plus_26t.scad>
use <rpi5_active_cooler.scad>

// ======================================================
// Adjustable Parameters
// ======================================================

// Render controls
$fn = 48;
render_mode = "printable_layout"; // [assembly/bottom_tray/top_cover/electronics/printable_layout]
show_rpi5_reference = true;
show_rpi5_active_cooler_reference = true;
show_ai_hat_reference = true;
show_ai_hat_cooler_reference = true;
show_clearance_guides = false;

// Enclosure shell
wall_thickness_mm = 2.2;
floor_thickness_mm = 2.4;
top_roof_thickness_mm = 2.2;
cover_skirt_drop_depth_mm = 6.0;
cover_fit_clearance_mm = 0.35;
component_clearance_xy_mm = 6.0;
component_clearance_z_mm = 3.2;
corner_radius_mm = 4.0;
preview_overlap_mm = 0.1;
solid_merge_overlap_mm = 0.05;

// Raspberry Pi 5 reference mirrors from designs/rpi5.scad
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
rpi5_micro_sd_slot_origin_mirror_mm = [5, 20, -1.8];
rpi5_micro_sd_slot_size_mirror_mm = [16, 14, 1.8];

// AI HAT+ 26T reference mirrors from designs/rpi5_ai_hat_plus_26t.scad
ai_hat_board_length_mirror_mm = 65.0;
ai_hat_board_width_mirror_mm = 56.5;
ai_hat_board_thickness_mirror_mm = 1.6;
ai_hat_stack_distance_mirror_mm = 20.0;
ai_hat_header_pin_height_mirror_mm = 23.0;
ai_hat_gpio_header_size_mirror_mm = [51.0, 5.0, 2.5];
ai_hat_header_cable_count = 3;
ai_hat_header_cable_error_margin_mm = 3.0;
ai_hat_pcb_top_to_cover_top_height_mm = 28.5;
ai_hat_cooler_origin_mirror_mm = [4.0, 8.5, ai_hat_board_thickness_mirror_mm + 1.2];
ai_hat_cooler_size_mirror_mm = [58.5, 35.0];
ai_hat_cooler_base_height_mirror_mm = 2.8;
ai_hat_cooler_fin_height_mirror_mm = 4.8;
ai_hat_cooler_fan_size_mirror_mm = 20.0;
ai_hat_cooler_fan_height_mirror_mm = 3.8;
ai_hat_cooler_fan_origin_offset_mirror_mm = [21.0, 7.4, -1.5];
ai_hat_pcie_connector_size_mirror_mm = [4.0, 6.0, 4.5];

// Board mounting/support
board_standoff_height_mm = 5.0;
board_standoff_outer_diameter_mm = 6.6;
board_standoff_screw_hole_diameter_mm = 2.4;
board_standoff_pilot_depth_mm = 4.2;

// Top-cover male pins and bottom-tray female sockets
cover_pin_diameter_mm = 3.2;
cover_pin_insertion_length_mm = 5.0;
cover_pin_count = 4;
cover_pin_offset_x_mm = 42.0;
cover_pin_offset_y_mm = 32.0;
cover_pin_root_diameter_mm = 5.6;
tray_socket_clearance_mm = 0.35;
tray_socket_depth_mm = 5.6;
tray_socket_receiver_diameter_mm = 7.0;

// Bottom anti-slide rubber foot recesses
enable_anti_slide_foot_recesses = true;
anti_slide_foot_recess_diameter_mm = 8.0;
anti_slide_foot_recess_depth_mm = 1.2;
anti_slide_foot_recess_centers_mm = [
    [-24.0, -30.0],
    [ 36.0, -30.0],
    [-24.0,  30.0],
    [ 36.0,  30.0]
];

// Port/service cutout clearances
edge_port_clearance_mm = 1.8;
service_cutout_clearance_mm = 2.0;
micro_sd_access_extension_mm = 8.0;
port_cutout_depth_mm = 2 * wall_thickness_mm + 2.0;

// Side ventilation
enable_left_side_ventilation = true;
enable_right_side_ventilation = true;
side_vent_count = 6;
side_vent_width_mm = 6.0;
side_vent_height_mm = 14.0;
side_vent_spacing_mm = 8.0;
side_vent_center_x_mm = 14.0;
side_vent_center_z_mm = 22.0;

// Top ventilation
enable_top_ventilation = true;
top_vent_columns = 4;
top_vent_rows = 3;
top_vent_hole_diameter_mm = 5.0;
top_vent_spacing_x_mm = 9.0;
top_vent_spacing_y_mm = 9.0;
top_vent_offset_x_mm = 8.0;
top_vent_offset_y_mm = 0.0;

// Printable layout
printable_layout_spacing_mm = 35.0;

// Visual settings
tray_colour = "DimGray";
cover_colour = "SlateGray";
standoff_colour = "Gainsboro";
cutout_guide_colour = [1.0, 0.35, 0.05, 0.28];
clearance_guide_colour = [0.0, 0.55, 1.0, 0.16];

// ======================================================
// Derived Values
// ======================================================

board_bottom_z_mm = floor_thickness_mm + board_standoff_height_mm;
ai_hat_board_stack_z_mm =
    board_bottom_z_mm
    + rpi5_board_thickness_mirror_mm
    + ai_hat_stack_distance_mirror_mm;
ai_hat_board_top_z_mm = ai_hat_board_stack_z_mm + ai_hat_board_thickness_mirror_mm;
ai_hat_header_total_height_above_pcb_mm =
    ai_hat_gpio_header_size_mirror_mm[2]
    + ai_hat_header_pin_height_mirror_mm;
ai_hat_header_required_height_above_pcb_mm =
    ai_hat_header_total_height_above_pcb_mm
    + ai_hat_header_cable_error_margin_mm;
ai_hat_pcb_top_to_cover_top_effective_height_mm =
    max(ai_hat_pcb_top_to_cover_top_height_mm, ai_hat_header_required_height_above_pcb_mm);
ai_hat_cooler_total_height_mm =
    ai_hat_cooler_base_height_mirror_mm + ai_hat_cooler_fin_height_mirror_mm;
ai_hat_cooler_fan_origin_mirror_mm = [
    ai_hat_cooler_origin_mirror_mm[0] + ai_hat_cooler_fan_origin_offset_mirror_mm[0],
    ai_hat_cooler_origin_mirror_mm[1] + ai_hat_cooler_fan_origin_offset_mirror_mm[1],
    ai_hat_cooler_origin_mirror_mm[2] + ai_hat_cooler_total_height_mm + ai_hat_cooler_fan_origin_offset_mirror_mm[2]
];
stack_top_z_mm =
    max(
        ai_hat_board_stack_z_mm
            + ai_hat_cooler_fan_origin_mirror_mm[2]
            + ai_hat_cooler_fan_height_mirror_mm
            + component_clearance_z_mm,
        ai_hat_board_top_z_mm
            + ai_hat_pcb_top_to_cover_top_effective_height_mm
    );

internal_length_mm = rpi5_board_length_mirror_mm + 2 * component_clearance_xy_mm;
internal_width_mm = max(rpi5_board_width_mirror_mm, ai_hat_board_width_mirror_mm) + 2 * component_clearance_xy_mm;
outer_length_mm = internal_length_mm + 2 * wall_thickness_mm;
outer_width_mm = internal_width_mm + 2 * wall_thickness_mm;
tray_wall_height_mm = board_bottom_z_mm + rpi5_usb_port_size_mirror_mm[2] + 2.5;
case_total_height_mm = max(tray_wall_height_mm + 9.0, stack_top_z_mm + top_roof_thickness_mm);
top_cover_height_mm = case_total_height_mm - tray_wall_height_mm + cover_skirt_drop_depth_mm;

cover_pin_centers_mm = [
    [-cover_pin_offset_x_mm, -cover_pin_offset_y_mm],
    [ cover_pin_offset_x_mm, -cover_pin_offset_y_mm],
    [-cover_pin_offset_x_mm,  cover_pin_offset_y_mm],
    [ cover_pin_offset_x_mm,  cover_pin_offset_y_mm]
];
active_cover_pin_count = min(cover_pin_count, len(cover_pin_centers_mm));
cover_skirt_bottom_z_mm = tray_wall_height_mm - cover_skirt_drop_depth_mm;
cover_pin_start_z_mm = cover_skirt_bottom_z_mm - cover_pin_insertion_length_mm;
cover_pin_base_z_mm = cover_skirt_bottom_z_mm - solid_merge_overlap_mm;
cover_pin_root_post_height_mm =
    case_total_height_mm - top_roof_thickness_mm - cover_pin_base_z_mm + solid_merge_overlap_mm;
tray_socket_hole_bottom_z_mm =
    min(tray_wall_height_mm - tray_socket_depth_mm, cover_pin_start_z_mm - preview_overlap_mm);
tray_socket_hole_depth_mm =
    tray_wall_height_mm - tray_socket_hole_bottom_z_mm + 2 * preview_overlap_mm;
tray_socket_hole_center_z_mm =
    tray_socket_hole_bottom_z_mm + tray_socket_hole_depth_mm / 2;
tray_socket_hole_diameter_mm = cover_pin_diameter_mm + 2 * tray_socket_clearance_mm;
anti_slide_foot_recess_effective_depth_mm =
    max(0, min(anti_slide_foot_recess_depth_mm, floor_thickness_mm - 0.4));
top_cutout_depth_mm = top_roof_thickness_mm + 2.0;
side_cutout_depth_mm = 2 * wall_thickness_mm + 2.0;

port_cutouts_mm = [
    ["usb_lower", rpi5_usb_port_lower_origin_mirror_mm, rpi5_usb_port_size_mirror_mm, "right"],
    ["usb_upper", rpi5_usb_port_upper_origin_mirror_mm, rpi5_usb_port_size_mirror_mm, "right"],
    ["ethernet", rpi5_ethernet_port_origin_mirror_mm, rpi5_ethernet_port_size_mirror_mm, "right"],
    ["usb_c_power", rpi5_usb_c_power_origin_mirror_mm, rpi5_usb_c_power_size_mirror_mm, "front"],
    ["micro_hdmi_left", rpi5_micro_hdmi_left_origin_mirror_mm, rpi5_micro_hdmi_size_mirror_mm, "front"],
    ["micro_hdmi_right", rpi5_micro_hdmi_right_origin_mirror_mm, rpi5_micro_hdmi_size_mirror_mm, "front"],
    ["camera_display_a", rpi5_camera_display_connector_a_origin_mirror_mm, rpi5_camera_display_connector_size_mirror_mm, "top"],
    ["camera_display_b", rpi5_camera_display_connector_b_origin_mirror_mm, rpi5_camera_display_connector_size_mirror_mm, "top"],
    ["pcie", rpi5_pcie_connector_origin_mirror_mm, rpi5_pcie_connector_size_mirror_mm, "top"],
    ["micro_sd", rpi5_micro_sd_slot_origin_mirror_mm, rpi5_micro_sd_slot_size_mirror_mm, "left"]
];

// ======================================================
// Render Dispatch
// ======================================================

if (render_mode == "assembly") {
    rpi5_ai_hat_plus_26t_enclosure_assembly();
} else if (render_mode == "bottom_tray") {
    rpi5_ai_hat_plus_26t_printable_bottom_tray();
} else if (render_mode == "top_cover") {
    rpi5_ai_hat_plus_26t_printable_top_cover();
} else if (render_mode == "electronics") {
    rpi5_ai_hat_plus_26t_enclosure_electronics_reference();
} else if (render_mode == "printable_layout") {
    rpi5_ai_hat_plus_26t_enclosure_printable_layout();
} else {
    rpi5_ai_hat_plus_26t_enclosure_printable_layout();
}

// ======================================================
// Main Assemblies
// ======================================================

module rpi5_ai_hat_plus_26t_enclosure_assembly() {
    rpi5_ai_hat_plus_26t_bottom_tray();
    rpi5_ai_hat_plus_26t_top_cover();

    if (show_rpi5_reference || show_ai_hat_reference) {
        rpi5_ai_hat_plus_26t_enclosure_electronics_reference();
    }

    if (show_clearance_guides) {
        rpi5_ai_hat_plus_26t_cutout_guides();
    }
}

module rpi5_ai_hat_plus_26t_enclosure_printable_layout() {
    translate([-(outer_length_mm + printable_layout_spacing_mm) / 2, 0, 0])
        rpi5_ai_hat_plus_26t_printable_bottom_tray();

    translate([(outer_length_mm + printable_layout_spacing_mm) / 2, 0, 0])
        rpi5_ai_hat_plus_26t_printable_top_cover();
}

module rpi5_ai_hat_plus_26t_enclosure_electronics_reference() {
    translate([
        -rpi5_board_length_mirror_mm / 2,
        -rpi5_board_width_mirror_mm / 2,
        board_bottom_z_mm
    ]) {
        if (show_rpi5_reference) {
            rpi5_reference_model(
                show_reference = true,
                show_gpio_pins = true,
                show_micro_sd_card = true,
                show_active_cooler = show_rpi5_active_cooler_reference
            );
        }

        if (show_ai_hat_reference) {
            rpi5_ai_hat_plus_26t_reference_model(
                show_rpi5_ref = false,
                show_active = false,
                show_ai_electronics = true,
                show_ai_cooler = show_ai_hat_cooler_reference,
                show_gpio = true,
                show_pcie = true,
                show_label = false,
                show_guides = false
            );
        }
    }
}

// ======================================================
// Printable Parts
// ======================================================

module rpi5_ai_hat_plus_26t_printable_bottom_tray() {
    rpi5_ai_hat_plus_26t_bottom_tray();
}

module rpi5_ai_hat_plus_26t_printable_top_cover() {
    translate([0, 0, case_total_height_mm])
        rotate([180, 0, 0])
            rpi5_ai_hat_plus_26t_top_cover();
}

module rpi5_ai_hat_plus_26t_bottom_tray() {
    color(tray_colour)
    difference() {
        union() {
            rpi5_ai_hat_plus_26t_tray_shell();
            rpi5_ai_hat_plus_26t_mounting_supports();
            rpi5_ai_hat_plus_26t_tray_socket_receiver_bosses();
        }

        rpi5_ai_hat_plus_26t_tray_socket_holes();
        rpi5_ai_hat_plus_26t_mounting_support_holes();
        rpi5_ai_hat_plus_26t_port_cutout_volumes(include_top_service = false);
        rpi5_ai_hat_plus_26t_side_ventilation_cutout_volumes();
        rpi5_ai_hat_plus_26t_anti_slide_foot_recesses();
    }
}

module rpi5_ai_hat_plus_26t_top_cover() {
    color(cover_colour)
    difference() {
        union() {
            rpi5_ai_hat_plus_26t_cover_shell();
            rpi5_ai_hat_plus_26t_cover_pin_root_posts();
            rpi5_ai_hat_plus_26t_cover_plug_pins();
        }

        rpi5_ai_hat_plus_26t_port_cutout_volumes(include_top_service = true);
        rpi5_ai_hat_plus_26t_side_ventilation_cutout_volumes();
        rpi5_ai_hat_plus_26t_top_ventilation_cutout_volumes();
    }
}

// ======================================================
// Tray And Cover Geometry
// ======================================================

module rpi5_ai_hat_plus_26t_tray_shell() {
    difference() {
        rpi5_ai_hat_plus_26t_rounded_box(
            [outer_length_mm, outer_width_mm, tray_wall_height_mm],
            corner_radius_mm,
            [0, 0, tray_wall_height_mm / 2]
        );

        translate([0, 0, floor_thickness_mm])
            rpi5_ai_hat_plus_26t_rounded_box(
                [
                    internal_length_mm,
                    internal_width_mm,
                    tray_wall_height_mm - floor_thickness_mm + preview_overlap_mm
                ],
                max(corner_radius_mm - wall_thickness_mm, 0.8),
                [0, 0, (tray_wall_height_mm - floor_thickness_mm + preview_overlap_mm) / 2]
            );
    }
}

module rpi5_ai_hat_plus_26t_cover_shell() {
    difference() {
        translate([0, 0, tray_wall_height_mm - cover_skirt_drop_depth_mm])
            rpi5_ai_hat_plus_26t_rounded_box(
                [outer_length_mm, outer_width_mm, top_cover_height_mm],
                corner_radius_mm,
                [0, 0, top_cover_height_mm / 2]
            );

        rpi5_ai_hat_plus_26t_cover_hollow_volume();
    }
}

module rpi5_ai_hat_plus_26t_cover_hollow_volume() {
    translate([0, 0, tray_wall_height_mm - cover_skirt_drop_depth_mm - preview_overlap_mm])
        rpi5_ai_hat_plus_26t_rounded_box(
            [
                internal_length_mm + 2 * cover_fit_clearance_mm,
                internal_width_mm + 2 * cover_fit_clearance_mm,
                top_cover_height_mm - top_roof_thickness_mm + preview_overlap_mm
            ],
            max(corner_radius_mm - wall_thickness_mm, 0.8),
            [0, 0, (top_cover_height_mm - top_roof_thickness_mm + preview_overlap_mm) / 2]
        );
}

module rpi5_ai_hat_plus_26t_cover_plug_pins() {
    color(standoff_colour)
    for (pin_index = [0:active_cover_pin_count - 1]) {
        rpi5_ai_hat_plus_26t_cover_plug_pin(cover_pin_centers_mm[pin_index]);
    }
}

module rpi5_ai_hat_plus_26t_cover_pin_root_posts() {
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

module rpi5_ai_hat_plus_26t_cover_plug_pin(pin_center_mm) {
    translate([pin_center_mm[0], pin_center_mm[1], cover_pin_start_z_mm])
        cylinder(
            h = cover_pin_insertion_length_mm + 2 * solid_merge_overlap_mm,
            d = cover_pin_diameter_mm
        );
}

module rpi5_ai_hat_plus_26t_tray_socket_holes() {
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

module rpi5_ai_hat_plus_26t_tray_socket_receiver_bosses() {
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

module rpi5_ai_hat_plus_26t_anti_slide_foot_recesses() {
    if (enable_anti_slide_foot_recesses) {
        for (foot_center_mm = anti_slide_foot_recess_centers_mm) {
            translate([
                foot_center_mm[0],
                foot_center_mm[1],
                -preview_overlap_mm
            ])
                cylinder(
                    h = anti_slide_foot_recess_effective_depth_mm + preview_overlap_mm,
                    d = anti_slide_foot_recess_diameter_mm
                );
        }
    }
}

// ======================================================
// Mounting Supports
// ======================================================

module rpi5_ai_hat_plus_26t_mounting_supports() {
    color(standoff_colour)
    for (hole_position_mm = rpi5_mounting_hole_positions_mirror_mm) {
        translate([
            rpi5_ai_hat_plus_26t_world_x(hole_position_mm[0]),
            rpi5_ai_hat_plus_26t_world_y(hole_position_mm[1]),
            floor_thickness_mm
        ])
            cylinder(h = board_standoff_height_mm, d = board_standoff_outer_diameter_mm);
    }
}

module rpi5_ai_hat_plus_26t_mounting_support_holes() {
    for (hole_position_mm = rpi5_mounting_hole_positions_mirror_mm) {
        translate([
            rpi5_ai_hat_plus_26t_world_x(hole_position_mm[0]),
            rpi5_ai_hat_plus_26t_world_y(hole_position_mm[1]),
            floor_thickness_mm + board_standoff_height_mm - board_standoff_pilot_depth_mm
        ])
            cylinder(
                h = board_standoff_pilot_depth_mm + preview_overlap_mm,
                d = board_standoff_screw_hole_diameter_mm
            );
    }
}

// ======================================================
// Cutouts And Ventilation
// ======================================================

module rpi5_ai_hat_plus_26t_port_cutout_volumes(include_top_service = true) {
    for (port_mm = port_cutouts_mm) {
        if (port_mm[3] == "right" || port_mm[3] == "front" || port_mm[3] == "left" || include_top_service) {
            rpi5_ai_hat_plus_26t_port_cutout_volume(port_mm);
        }
    }
}

module rpi5_ai_hat_plus_26t_port_cutout_volume(port_mm) {
    origin_mm = port_mm[1];
    size_mm = port_mm[2];
    side = port_mm[3];
    center_x_mm = rpi5_ai_hat_plus_26t_world_x(origin_mm[0] + size_mm[0] / 2);
    center_y_mm = rpi5_ai_hat_plus_26t_world_y(origin_mm[1] + size_mm[1] / 2);
    center_z_mm = board_bottom_z_mm + origin_mm[2] + size_mm[2] / 2;

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
                    size_mm[0] + 2 * edge_port_clearance_mm,
                    port_cutout_depth_mm,
                    size_mm[2] + 2 * edge_port_clearance_mm
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
            case_total_height_mm - top_roof_thickness_mm / 2
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

module rpi5_ai_hat_plus_26t_side_ventilation_cutout_volumes() {
    if (enable_left_side_ventilation) {
        rpi5_ai_hat_plus_26t_side_ventilation_cutout_volume(-1);
    }

    if (enable_right_side_ventilation) {
        rpi5_ai_hat_plus_26t_side_ventilation_cutout_volume(1);
    }
}

module rpi5_ai_hat_plus_26t_side_ventilation_cutout_volume(side_sign) {
    for (vent_index = [0:side_vent_count - 1]) {
        translate([
            side_vent_center_x_mm + (vent_index - (side_vent_count - 1) / 2) * side_vent_spacing_mm,
            side_sign * outer_width_mm / 2,
            side_vent_center_z_mm
        ])
            cube(
                [
                    side_vent_width_mm,
                    side_cutout_depth_mm,
                    side_vent_height_mm
                ],
                center = true
            );
    }
}

module rpi5_ai_hat_plus_26t_top_ventilation_cutout_volumes() {
    if (enable_top_ventilation) {
        for (column_index = [0:top_vent_columns - 1])
        for (row_index = [0:top_vent_rows - 1]) {
            translate([
                rpi5_ai_hat_plus_26t_world_x(ai_hat_cooler_fan_origin_mirror_mm[0] + ai_hat_cooler_fan_size_mirror_mm / 2)
                    + top_vent_offset_x_mm
                    + (column_index - (top_vent_columns - 1) / 2) * top_vent_spacing_x_mm,
                rpi5_ai_hat_plus_26t_world_y(ai_hat_cooler_fan_origin_mirror_mm[1] + ai_hat_cooler_fan_size_mirror_mm / 2)
                    + top_vent_offset_y_mm
                    + (row_index - (top_vent_rows - 1) / 2) * top_vent_spacing_y_mm,
                case_total_height_mm - top_roof_thickness_mm / 2
            ])
                cylinder(
                    h = top_cutout_depth_mm,
                    d = top_vent_hole_diameter_mm,
                    center = true
                );
        }
    }
}

module rpi5_ai_hat_plus_26t_cutout_guides() {
    color(cutout_guide_colour)
        rpi5_ai_hat_plus_26t_port_cutout_volumes(include_top_service = true);

    color(cutout_guide_colour)
        rpi5_ai_hat_plus_26t_side_ventilation_cutout_volumes();

    color(cutout_guide_colour)
        rpi5_ai_hat_plus_26t_top_ventilation_cutout_volumes();

    color(clearance_guide_colour)
        rpi5_ai_hat_plus_26t_stack_clearance_guide();
}

module rpi5_ai_hat_plus_26t_stack_clearance_guide() {
    translate([0, 0, board_bottom_z_mm])
        rpi5_ai_hat_plus_26t_rounded_box(
            [
                rpi5_board_length_mirror_mm,
                max(rpi5_board_width_mirror_mm, ai_hat_board_width_mirror_mm),
                stack_top_z_mm - board_bottom_z_mm
            ],
            rpi5_board_corner_radius_mirror_mm,
            [0, 0, (stack_top_z_mm - board_bottom_z_mm) / 2]
        );
}

// ======================================================
// Helper Modules And Functions
// ======================================================

function rpi5_ai_hat_plus_26t_world_x(source_x_mm) =
    source_x_mm - rpi5_board_length_mirror_mm / 2;

function rpi5_ai_hat_plus_26t_world_y(source_y_mm) =
    source_y_mm - rpi5_board_width_mirror_mm / 2;

module rpi5_ai_hat_plus_26t_rounded_box(size_mm, radius_mm, center_mm = [0, 0, 0]) {
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
