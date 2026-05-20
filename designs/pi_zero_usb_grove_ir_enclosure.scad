/*
  Raspberry Pi Zero USB Ethernet Grove IR enclosure
  Target: OpenSCAD 2021.01
  Units: millimetres
*/

// ================================================================
// Adjustable Parameters
// ================================================================

// Render controls
render_mode = "assembly"; // assembly, bottom_tray, top_cover, gpio_hatch, printable_layout
show_electronics = true;
show_debug_clearances = false;

// Pi Zero dimensions
pi_board_length_mm = 65;
pi_board_width_mm = 30;
pi_board_thickness_mm = 1.6;
pi_mount_hole_offset_x_mm = 3.5;
pi_mount_hole_offset_y_mm = 3.5;
pi_mount_hole_diameter_mm = 2.75;
pi_micro_sd_cutout_width_mm = 14;
pi_micro_sd_cutout_height_mm = 4;
pi_micro_sd_cutout_y_mm = 0;
pi_mini_hdmi_cutout_width_mm = 12;
pi_mini_hdmi_cutout_height_mm = 7;
pi_mini_hdmi_cutout_x_mm = -18.5;
pi_micro_usb_cutout_width_mm = 10;
pi_micro_usb_cutout_height_mm = 6;
pi_mini_hdmi_to_micro_usb_margin_mm = 20;
pi_micro_usb_between_margin_mm = 5;
pi_camera_cutout_width_mm = 18;
pi_camera_cutout_height_mm = 5;
pi_camera_cutout_x_mm = 4;
pi_gpio_header_length_mm = 51;
pi_gpio_header_width_mm = 5.2;
pi_gpio_header_y_mm = 10.7;
pi_bottom_header_pin_protrusion_clearance_mm = 4;

// USB HAT dimensions
usb_hat_length_mm = 65;
usb_hat_width_mm = 30;
usb_hat_thickness_mm = 1.6;
usb_hat_mount_hole_diameter_mm = 3;
usb_hat_mount_hole_offset_x_mm = 3.5;
usb_hat_mount_hole_offset_y_mm = 3.5;
usb_hat_rj45_cutout_width_mm = 17;
usb_hat_rj45_cutout_height_mm = 15;
usb_hat_rj45_cutout_x_mm = -20;
usb_hat_front_usb_cutout_width_mm = 14;
usb_hat_front_usb_cutout_height_mm = 9;
usb_hat_front_usb_cutout_x_mm = 4;
usb_hat_left_usb_cutout_width_mm = 14;
usb_hat_left_usb_cutout_height_mm = 9;
usb_hat_left_usb_cutout_y_mm = 0;
usb_hat_right_usb_cutout_width_mm = 14;
usb_hat_right_usb_cutout_height_mm = 9;
usb_hat_right_usb_cutout_y_mm = 0;
usb_hat_bottom_bridge_clearance_width_mm = 8.5;
usb_hat_bottom_bridge_clearance_height_mm = 12;
usb_hat_stack_clearance_mm = 11.20;

// Grove HAT dimensions
grove_hat_length_mm = 65;
grove_hat_width_mm = 30;
grove_hat_thickness_mm = 1.6;
grove_hat_stack_clearance_mm = 10.5;
grove_gpio_access_length_mm = 54;
grove_gpio_access_width_mm = 9;
grove_gpio_access_x_mm = 0;
grove_gpio_access_y_mm = 10.2;
grove_connector_preview_count = 4;
grove_connector_width_mm = 12;
grove_connector_depth_mm = 8;
grove_connector_height_mm = 6;
grove_internal_cable_clearance_width_mm = 6;
grove_internal_cable_clearance_height_mm = 4;

// IR emitter dimensions
ir_board_length_mm = 20;
ir_board_width_mm = 20;
ir_board_thickness_mm = 1.6;
ir_led_diameter_mm = 5;
ir_led_protrusion_mm = 4;
ir_led_aperture_clearance_mm = 1;
ir_mount_screw_hole_diameter_mm = 2.2;
ir_mount_screw_spacing_mm = 14;
ir_cable_channel_width_mm = 6;
ir_cable_channel_height_mm = 4;

// Enclosure structure
case_wall_thickness_mm = 2.4;
case_base_thickness_mm = 2.6;
case_lid_thickness_mm = 2.4;
case_corner_radius_mm = 3;
case_board_edge_clearance_mm = 2;
case_internal_stack_height_clearance_mm = 3;
case_lid_skirt_height_mm = 5;
case_top_cover_side_height_mm = 5;
case_port_cutout_extra_width_mm = 1.4;
case_port_cutout_extra_height_mm = 1.2;

// Fasteners and tolerances
enclosure_screw_clearance_diameter_mm = 2.9;
enclosure_screw_boss_diameter_mm = 7.5;
standoff_diameter_mm = 6;
screw_boss_diameter_mm = 7.5;
fit_tolerance_mm = 0.35;
sliding_hatch_clearance_mm = 0.3;
minimum_printable_feature_mm = 1.2;

// ================================================================
// Derived Values
// ================================================================

$fn = 48;

board_stack_length_mm = max(pi_board_length_mm, max(usb_hat_length_mm, grove_hat_length_mm));
board_stack_width_mm = max(pi_board_width_mm, max(usb_hat_width_mm, grove_hat_width_mm));
case_inner_length_mm = board_stack_length_mm + 2 * case_board_edge_clearance_mm;
case_inner_width_mm = board_stack_width_mm + 2 * case_board_edge_clearance_mm;
case_outer_length_mm = case_inner_length_mm + 2 * case_wall_thickness_mm;
case_outer_width_mm = case_inner_width_mm + 2 * case_wall_thickness_mm;

pi_board_z_mm = case_base_thickness_mm + pi_bottom_header_pin_protrusion_clearance_mm + 3;
usb_hat_board_z_mm = pi_board_z_mm + pi_board_thickness_mm + usb_hat_stack_clearance_mm;
grove_hat_board_z_mm = usb_hat_board_z_mm + usb_hat_thickness_mm + grove_hat_stack_clearance_mm;
electronics_top_z_mm = grove_hat_board_z_mm + grove_hat_thickness_mm + grove_connector_height_mm;
tray_wall_height_mm = electronics_top_z_mm + case_internal_stack_height_clearance_mm;
top_cover_z_mm = tray_wall_height_mm + case_lid_thickness_mm / 2;

pi_micro_usb_power_x_mm = pi_mini_hdmi_cutout_x_mm
    + pi_mini_hdmi_cutout_width_mm / 2
    + pi_mini_hdmi_to_micro_usb_margin_mm
    + pi_micro_usb_cutout_width_mm / 2;
pi_micro_usb_data_x_mm = pi_micro_usb_power_x_mm
    + pi_micro_usb_cutout_width_mm
    + pi_micro_usb_between_margin_mm;

post_center_x_mm = pi_board_length_mm / 2 - pi_mount_hole_offset_x_mm;
post_center_y_mm = pi_board_width_mm / 2 - pi_mount_hole_offset_y_mm;
cover_screw_center_x_mm = case_outer_length_mm / 2 - case_wall_thickness_mm - enclosure_screw_boss_diameter_mm / 2;
cover_screw_center_y_mm = case_outer_width_mm / 2 - case_wall_thickness_mm - enclosure_screw_boss_diameter_mm / 2;

hatch_opening_length_mm = grove_gpio_access_length_mm + 2 * fit_tolerance_mm;
hatch_opening_width_mm = grove_gpio_access_width_mm + 2 * fit_tolerance_mm;
hatch_part_length_mm = hatch_opening_length_mm + 8;
hatch_part_width_mm = hatch_opening_width_mm + 6;
hatch_part_thickness_mm = case_lid_thickness_mm;
hatch_rail_height_mm = 1.6;
hatch_rail_width_mm = 2;

ir_mount_x_mm = 22;
ir_mount_y_mm = -case_inner_width_mm / 2 + case_wall_thickness_mm + ir_board_width_mm / 2 + 1;
ir_mount_z_mm = grove_hat_board_z_mm + 4;
ir_led_center_z_mm = ir_mount_z_mm + ir_board_thickness_mm / 2 + ir_led_diameter_mm / 2;

// ================================================================
// Top Level
// ================================================================

if (render_mode == "assembly") {
    full_assembly();
} else if (render_mode == "bottom_tray") {
    bottom_tray();
} else if (render_mode == "top_cover") {
    top_cover();
} else if (render_mode == "gpio_hatch") {
    gpio_hatch();
} else if (render_mode == "printable_layout") {
    printable_layout();
} else {
    full_assembly();
}

// ================================================================
// Assembly
// ================================================================

module full_assembly() {
    bottom_tray();

    translate([0, 0, tray_wall_height_mm])
        top_cover();

    translate([grove_gpio_access_x_mm, grove_gpio_access_y_mm, tray_wall_height_mm + case_lid_thickness_mm + hatch_rail_height_mm / 2])
        gpio_hatch();

    if (show_electronics) {
        electronics_preview();
    }

    if (show_debug_clearances) {
        clearance_preview();
    }
}

module printable_layout() {
    bottom_tray();

    translate([case_outer_length_mm + 16, 0, case_lid_thickness_mm / 2])
        top_cover();

    translate([case_outer_length_mm + 16, case_outer_width_mm / 2 + hatch_part_width_mm + 12, hatch_part_thickness_mm / 2])
        gpio_hatch();
}

// ================================================================
// Bottom Tray
// ================================================================

module bottom_tray() {
    difference() {
        union() {
            tray_shell();
            board_standoffs();
            cover_screw_bosses(tray_wall_height_mm);
            ir_emitter_mount();
            internal_cable_channel();
        }

        tray_inside_cutout();
        port_cutouts();
        cover_screw_holes(tray_wall_height_mm + 0.2);
        board_mount_holes();
        bottom_header_clearance();
        ir_led_aperture();
        ir_mount_screw_holes();
    }
}

module tray_shell() {
    translate([0, 0, tray_wall_height_mm / 2])
        rounded_box(case_outer_length_mm, case_outer_width_mm, tray_wall_height_mm, case_corner_radius_mm);
}

module tray_inside_cutout() {
    translate([0, 0, case_base_thickness_mm + (tray_wall_height_mm - case_base_thickness_mm) / 2 + 0.05])
        rounded_box(case_inner_length_mm, case_inner_width_mm, tray_wall_height_mm - case_base_thickness_mm + 0.2, max(0.1, case_corner_radius_mm - case_wall_thickness_mm));
}

module board_standoffs() {
    for (x_sign = [-1, 1]) {
        for (y_sign = [-1, 1]) {
            translate([x_sign * post_center_x_mm, y_sign * post_center_y_mm, case_base_thickness_mm])
                standoff(pi_board_z_mm - case_base_thickness_mm);
        }
    }
}

module standoff(height_mm) {
    cylinder(h = height_mm, d = standoff_diameter_mm);
}

module cover_screw_bosses(height_mm) {
    for (x_sign = [-1, 1]) {
        for (y_sign = [-1, 1]) {
            translate([x_sign * cover_screw_center_x_mm, y_sign * cover_screw_center_y_mm, height_mm / 2])
                cylinder(h = height_mm, d = screw_boss_diameter_mm, center = true);
        }
    }
}

module board_mount_holes() {
    for (x_sign = [-1, 1]) {
        for (y_sign = [-1, 1]) {
            translate([x_sign * post_center_x_mm, y_sign * post_center_y_mm, -0.1])
                cylinder(h = pi_board_z_mm + 0.3, d = enclosure_screw_clearance_diameter_mm);
        }
    }
}

module cover_screw_holes(height_mm) {
    for (x_sign = [-1, 1]) {
        for (y_sign = [-1, 1]) {
            translate([x_sign * cover_screw_center_x_mm, y_sign * cover_screw_center_y_mm, -0.1])
                cylinder(h = height_mm + 0.2, d = enclosure_screw_clearance_diameter_mm);
        }
    }
}

module bottom_header_clearance() {
    translate([0, pi_gpio_header_y_mm, case_base_thickness_mm + pi_bottom_header_pin_protrusion_clearance_mm / 2])
        rounded_box(pi_gpio_header_length_mm + 4, pi_gpio_header_width_mm + 4, pi_bottom_header_pin_protrusion_clearance_mm + 0.2, 1.2);
}

module port_cutouts() {
    pi_side_port_cutouts();
    usb_hat_port_cutouts();
    front_end_cutouts();
}

module pi_side_port_cutouts() {
    side_y = -case_outer_width_mm / 2 - 0.1;
    cutout_depth_mm = case_wall_thickness_mm + 0.4;
    cutout_z_mm = pi_board_z_mm + pi_board_thickness_mm + max(pi_micro_usb_cutout_height_mm, pi_mini_hdmi_cutout_height_mm) / 2 - 0.6;

    translate([pi_mini_hdmi_cutout_x_mm, side_y, cutout_z_mm])
        cube([pi_mini_hdmi_cutout_width_mm + case_port_cutout_extra_width_mm, cutout_depth_mm, pi_mini_hdmi_cutout_height_mm + case_port_cutout_extra_height_mm], center = true);

    translate([pi_micro_usb_power_x_mm, side_y, cutout_z_mm])
        cube([pi_micro_usb_cutout_width_mm + case_port_cutout_extra_width_mm, cutout_depth_mm, pi_micro_usb_cutout_height_mm + case_port_cutout_extra_height_mm], center = true);

    translate([pi_micro_usb_data_x_mm, side_y, cutout_z_mm])
        cube([pi_micro_usb_cutout_width_mm + case_port_cutout_extra_width_mm, cutout_depth_mm, pi_micro_usb_cutout_height_mm + case_port_cutout_extra_height_mm], center = true);

    translate([pi_camera_cutout_x_mm, case_outer_width_mm / 2 + 0.1, cutout_z_mm])
        cube([pi_camera_cutout_width_mm + case_port_cutout_extra_width_mm, cutout_depth_mm, pi_camera_cutout_height_mm + case_port_cutout_extra_height_mm], center = true);
}

module usb_hat_port_cutouts() {
    front_y = -case_outer_width_mm / 2 - 0.1;
    left_x = -case_outer_length_mm / 2 - 0.1;
    right_x = case_outer_length_mm / 2 + 0.1;
    cutout_depth_mm = case_wall_thickness_mm + 0.4;
    front_usb_cutout_z_mm = usb_hat_board_z_mm + usb_hat_thickness_mm + usb_hat_front_usb_cutout_height_mm / 2;
    side_usb_cutout_z_mm = usb_hat_board_z_mm + usb_hat_thickness_mm + max(usb_hat_left_usb_cutout_height_mm, usb_hat_right_usb_cutout_height_mm) / 2;

    translate([usb_hat_rj45_cutout_x_mm, front_y, usb_hat_board_z_mm + usb_hat_thickness_mm + usb_hat_rj45_cutout_height_mm / 2])
        cube([usb_hat_rj45_cutout_width_mm + case_port_cutout_extra_width_mm, cutout_depth_mm, usb_hat_rj45_cutout_height_mm + case_port_cutout_extra_height_mm], center = true);

    translate([usb_hat_front_usb_cutout_x_mm, front_y, front_usb_cutout_z_mm])
        cube([usb_hat_front_usb_cutout_width_mm + case_port_cutout_extra_width_mm, cutout_depth_mm, usb_hat_front_usb_cutout_height_mm + case_port_cutout_extra_height_mm], center = true);

    translate([left_x, usb_hat_left_usb_cutout_y_mm, side_usb_cutout_z_mm])
        cube([cutout_depth_mm, usb_hat_left_usb_cutout_width_mm + case_port_cutout_extra_width_mm, usb_hat_left_usb_cutout_height_mm + case_port_cutout_extra_height_mm], center = true);

    translate([right_x, usb_hat_right_usb_cutout_y_mm, side_usb_cutout_z_mm])
        cube([cutout_depth_mm, usb_hat_right_usb_cutout_width_mm + case_port_cutout_extra_width_mm, usb_hat_right_usb_cutout_height_mm + case_port_cutout_extra_height_mm], center = true);

    translate([usb_hat_front_usb_cutout_x_mm, 0, usb_hat_board_z_mm - usb_hat_bottom_bridge_clearance_height_mm / 2])
        cube([usb_hat_bottom_bridge_clearance_width_mm, case_outer_width_mm + 0.2, usb_hat_bottom_bridge_clearance_height_mm], center = true);
}

module front_end_cutouts() {
    front_x = -case_outer_length_mm / 2 - 0.1;
    cutout_depth_mm = case_wall_thickness_mm + 0.4;
    translate([front_x, pi_micro_sd_cutout_y_mm, pi_board_z_mm + pi_board_thickness_mm + pi_micro_sd_cutout_height_mm / 2])
        cube([cutout_depth_mm, pi_micro_sd_cutout_width_mm + case_port_cutout_extra_width_mm, pi_micro_sd_cutout_height_mm + case_port_cutout_extra_height_mm], center = true);
}

// ================================================================
// Top Cover And Hatch
// ================================================================

module top_cover() {
    difference() {
        union() {
            translate([0, 0, case_lid_thickness_mm / 2])
                rounded_box(case_outer_length_mm, case_outer_width_mm, case_lid_thickness_mm, case_corner_radius_mm);

            translate([0, 0, -case_lid_skirt_height_mm / 2])
                cover_skirt();

            hatch_rails();
        }

        translate([grove_gpio_access_x_mm, grove_gpio_access_y_mm, -0.2])
            rounded_box(hatch_opening_length_mm, hatch_opening_width_mm, case_lid_thickness_mm + 0.5, 1);

        translate([0, 0, -case_lid_skirt_height_mm - 0.1])
            cover_screw_holes(case_lid_thickness_mm + case_lid_skirt_height_mm + 0.4);
    }
}

module cover_skirt() {
    difference() {
        rounded_box(case_inner_length_mm - fit_tolerance_mm, case_inner_width_mm - fit_tolerance_mm, case_lid_skirt_height_mm, max(0.1, case_corner_radius_mm - case_wall_thickness_mm));
        rounded_box(case_inner_length_mm - 2 * case_wall_thickness_mm, case_inner_width_mm - 2 * case_wall_thickness_mm, case_lid_skirt_height_mm + 0.2, max(0.1, case_corner_radius_mm - 2 * case_wall_thickness_mm));
    }
}

module hatch_rails() {
    rail_y_offset_mm = hatch_opening_width_mm / 2 + sliding_hatch_clearance_mm + hatch_rail_width_mm / 2;
    for (y_sign = [-1, 1]) {
        translate([grove_gpio_access_x_mm, grove_gpio_access_y_mm + y_sign * rail_y_offset_mm, case_lid_thickness_mm + hatch_rail_height_mm / 2])
            rounded_box(hatch_part_length_mm, hatch_rail_width_mm, hatch_rail_height_mm, minimum_printable_feature_mm / 2);
    }
}

module gpio_hatch() {
    union() {
        rounded_box(hatch_part_length_mm, hatch_part_width_mm, hatch_part_thickness_mm, 1.5);
        translate([0, -hatch_part_width_mm / 2 + hatch_rail_width_mm / 2, -hatch_part_thickness_mm / 2 - hatch_rail_height_mm / 2])
            rounded_box(hatch_part_length_mm - 2, hatch_rail_width_mm, hatch_rail_height_mm, minimum_printable_feature_mm / 2);
        translate([0, hatch_part_width_mm / 2 - hatch_rail_width_mm / 2, -hatch_part_thickness_mm / 2 - hatch_rail_height_mm / 2])
            rounded_box(hatch_part_length_mm - 2, hatch_rail_width_mm, hatch_rail_height_mm, minimum_printable_feature_mm / 2);
        translate([hatch_part_length_mm / 2 - 6, 0, hatch_part_thickness_mm / 2 + minimum_printable_feature_mm / 2])
            rounded_box(6, hatch_part_width_mm - 4, minimum_printable_feature_mm, 0.8);
    }
}

// ================================================================
// IR Emitter And Cable Routing
// ================================================================

module ir_emitter_mount() {
    translate([ir_mount_x_mm, ir_mount_y_mm, ir_mount_z_mm])
        rotate([90, 0, 0])
            difference() {
                rounded_box(ir_board_length_mm + 4, ir_board_width_mm + 4, 3, 1.5);
                translate([0, 0, -0.1])
                    rounded_box(ir_board_length_mm + fit_tolerance_mm, ir_board_width_mm + fit_tolerance_mm, 3.2, 0.8);
            }

    translate([ir_mount_x_mm, -case_outer_width_mm / 2 + case_wall_thickness_mm / 2, ir_led_center_z_mm])
        rotate([90, 0, 0])
            cylinder(h = case_wall_thickness_mm, d = ir_led_diameter_mm + 3, center = true);
}

module ir_led_aperture() {
    translate([ir_mount_x_mm, -case_outer_width_mm / 2 - 0.2, ir_led_center_z_mm])
        rotate([90, 0, 0])
            cylinder(h = case_wall_thickness_mm + 0.6, d = ir_led_diameter_mm + ir_led_aperture_clearance_mm, center = true);
}

module ir_mount_screw_holes() {
    for (x_sign = [-1, 1]) {
        translate([ir_mount_x_mm + x_sign * ir_mount_screw_spacing_mm / 2, ir_mount_y_mm, ir_mount_z_mm])
            rotate([90, 0, 0])
                cylinder(h = 8, d = ir_mount_screw_hole_diameter_mm, center = true);
    }
}

module internal_cable_channel() {
    cable_start_y_mm = grove_gpio_access_y_mm - grove_gpio_access_width_mm / 2;
    cable_end_y_mm = ir_mount_y_mm + ir_board_width_mm / 2;
    cable_length_mm = abs(cable_start_y_mm - cable_end_y_mm);

    translate([ir_mount_x_mm, (cable_start_y_mm + cable_end_y_mm) / 2, grove_hat_board_z_mm + grove_hat_thickness_mm + ir_cable_channel_height_mm / 2])
        rounded_box(ir_cable_channel_width_mm + 2, cable_length_mm, ir_cable_channel_height_mm, 1);
}

// ================================================================
// Electronics Preview
// ================================================================

module electronics_preview() {
    color([0.05, 0.42, 0.18, 0.55])
        translate([0, 0, pi_board_z_mm + pi_board_thickness_mm / 2])
            board_preview(pi_board_length_mm, pi_board_width_mm, pi_board_thickness_mm, pi_mount_hole_diameter_mm);

    color([0.05, 0.32, 0.55, 0.5])
        translate([0, 0, usb_hat_board_z_mm + usb_hat_thickness_mm / 2])
            board_preview(usb_hat_length_mm, usb_hat_width_mm, usb_hat_thickness_mm, usb_hat_mount_hole_diameter_mm);

    color([0.1, 0.5, 0.2, 0.5])
        translate([0, 0, grove_hat_board_z_mm + grove_hat_thickness_mm / 2])
            board_preview(grove_hat_length_mm, grove_hat_width_mm, grove_hat_thickness_mm, usb_hat_mount_hole_diameter_mm);

    color([0.02, 0.02, 0.02, 0.45])
        translate([0, pi_gpio_header_y_mm, grove_hat_board_z_mm + grove_hat_thickness_mm + 3])
            cube([pi_gpio_header_length_mm, pi_gpio_header_width_mm, 6], center = true);

    grove_connectors_preview();
    usb_hat_ports_preview();
    pi_ports_preview();
    ir_emitter_preview();
}

module board_preview(length_mm, width_mm, thickness_mm, hole_diameter_mm) {
    difference() {
        cube([length_mm, width_mm, thickness_mm], center = true);
        for (x_sign = [-1, 1]) {
            for (y_sign = [-1, 1]) {
                translate([x_sign * post_center_x_mm, y_sign * post_center_y_mm, -thickness_mm / 2 - 0.1])
                    cylinder(h = thickness_mm + 0.2, d = hole_diameter_mm);
            }
        }
    }
}

module grove_connectors_preview() {
    for (connector_index = [0 : grove_connector_preview_count - 1]) {
        connector_x_mm = -grove_hat_length_mm / 2 + 10 + connector_index * ((grove_hat_length_mm - 20) / max(1, grove_connector_preview_count - 1));
        color([1, 1, 1, 0.55])
            translate([connector_x_mm, -grove_hat_width_mm / 2 + grove_connector_depth_mm / 2, grove_hat_board_z_mm + grove_hat_thickness_mm + grove_connector_height_mm / 2])
                cube([grove_connector_width_mm, grove_connector_depth_mm, grove_connector_height_mm], center = true);
    }
}

module usb_hat_ports_preview() {
    color([0.65, 0.65, 0.65, 0.55])
        translate([usb_hat_rj45_cutout_x_mm, -usb_hat_width_mm / 2 - 5, usb_hat_board_z_mm + usb_hat_thickness_mm + usb_hat_rj45_cutout_height_mm / 2])
            cube([usb_hat_rj45_cutout_width_mm, 10, usb_hat_rj45_cutout_height_mm], center = true);

    color([0.75, 0.75, 0.75, 0.55])
        translate([usb_hat_front_usb_cutout_x_mm, -usb_hat_width_mm / 2 - 4, usb_hat_board_z_mm + usb_hat_thickness_mm + usb_hat_front_usb_cutout_height_mm / 2])
            cube([usb_hat_front_usb_cutout_width_mm, 8, usb_hat_front_usb_cutout_height_mm], center = true);

    color([0.75, 0.75, 0.75, 0.55])
        translate([-usb_hat_length_mm / 2 - 4, usb_hat_left_usb_cutout_y_mm, usb_hat_board_z_mm + usb_hat_thickness_mm + usb_hat_left_usb_cutout_height_mm / 2])
            cube([8, usb_hat_left_usb_cutout_width_mm, usb_hat_left_usb_cutout_height_mm], center = true);

    color([0.75, 0.75, 0.75, 0.55])
        translate([usb_hat_length_mm / 2 + 4, usb_hat_right_usb_cutout_y_mm, usb_hat_board_z_mm + usb_hat_thickness_mm + usb_hat_right_usb_cutout_height_mm / 2])
            cube([8, usb_hat_right_usb_cutout_width_mm, usb_hat_right_usb_cutout_height_mm], center = true);
}

module pi_ports_preview() {
    color([0.15, 0.15, 0.15, 0.55])
        translate([pi_mini_hdmi_cutout_x_mm, -pi_board_width_mm / 2 - 2.5, pi_board_z_mm + pi_board_thickness_mm + pi_mini_hdmi_cutout_height_mm / 2])
            cube([pi_mini_hdmi_cutout_width_mm, 5, pi_mini_hdmi_cutout_height_mm], center = true);

    for (port_x_mm = [pi_micro_usb_power_x_mm, pi_micro_usb_data_x_mm]) {
        color([0.15, 0.15, 0.15, 0.55])
            translate([port_x_mm, -pi_board_width_mm / 2 - 2.5, pi_board_z_mm + pi_board_thickness_mm + pi_micro_usb_cutout_height_mm / 2])
                cube([pi_micro_usb_cutout_width_mm, 5, pi_micro_usb_cutout_height_mm], center = true);
    }
}

module ir_emitter_preview() {
    color([0.6, 0.15, 0.12, 0.55])
        translate([ir_mount_x_mm, ir_mount_y_mm, ir_mount_z_mm])
            rotate([90, 0, 0])
                cube([ir_board_length_mm, ir_board_width_mm, ir_board_thickness_mm], center = true);

    color([0.08, 0.08, 0.08, 0.7])
        translate([ir_mount_x_mm, -case_outer_width_mm / 2 - ir_led_protrusion_mm / 2, ir_led_center_z_mm])
            rotate([90, 0, 0])
                cylinder(h = ir_led_protrusion_mm, d = ir_led_diameter_mm, center = true);
}

module clearance_preview() {
    color([1, 0.45, 0.1, 0.2])
        translate([0, pi_gpio_header_y_mm, tray_wall_height_mm + case_lid_thickness_mm / 2])
            rounded_box(hatch_opening_length_mm, hatch_opening_width_mm, case_lid_thickness_mm + 3, 1);

    color([0.2, 0.5, 1, 0.2])
        translate([0, pi_gpio_header_y_mm, case_base_thickness_mm + pi_bottom_header_pin_protrusion_clearance_mm / 2])
            rounded_box(pi_gpio_header_length_mm + 4, pi_gpio_header_width_mm + 4, pi_bottom_header_pin_protrusion_clearance_mm, 1);
}

// ================================================================
// Helpers
// ================================================================

module rounded_box(length_mm, width_mm, height_mm, radius_mm) {
    actual_radius_mm = min(radius_mm, min(length_mm, width_mm) / 2 - 0.01);
    if (actual_radius_mm <= 0) {
        cube([length_mm, width_mm, height_mm], center = true);
    } else {
        hull() {
            for (x_sign = [-1, 1]) {
                for (y_sign = [-1, 1]) {
                    translate([
                        x_sign * (length_mm / 2 - actual_radius_mm),
                        y_sign * (width_mm / 2 - actual_radius_mm),
                        0
                    ])
                        cylinder(h = height_mm, r = actual_radius_mm, center = true);
                }
            }
        }
    }
}
