// Raspberry Pi 5 approximate model with GPIO pins, microSD card,
// and optional official Raspberry Pi Active Cooler.
//
// Units: mm

// ======================================================
// Adjustable Parameters
// ======================================================

// Render controls
$fn = 48;
show_rpi5_reference = true;
show_rpi5_gpio_pins = true;
show_rpi5_micro_sd_card = true;
show_rpi5_active_cooler = true;

// Raspberry Pi 5 board dimensions
rpi5_board_length_mm = 85;
rpi5_board_width_mm = 56;
rpi5_board_thickness_mm = 1.6;
rpi5_board_corner_radius_mm = 3;

// Mounting holes
rpi5_mounting_hole_diameter_mm = 2.75;
rpi5_mounting_hole_positions_mm = [
    [3.5, 3.5],
    [61.5, 3.5],
    [3.5, 52.5],
    [61.5, 52.5]
];

// GPIO header dimensions
rpi5_gpio_header_origin_mm = [7, 49, rpi5_board_thickness_mm];
rpi5_gpio_header_size_mm = [51, 5, 2.5];
rpi5_gpio_pin_origin_x_mm = 8;
rpi5_gpio_pin_origin_y_mm = 50;
rpi5_gpio_pin_pitch_mm = 2.54;
rpi5_gpio_pin_size_mm = 0.64;
rpi5_gpio_pin_height_mm = 6;

// Connector and component preview dimensions
rpi5_usb_port_lower_origin_mm = [70, 6, rpi5_board_thickness_mm];
rpi5_usb_port_upper_origin_mm = [70, 22, rpi5_board_thickness_mm];
rpi5_usb_port_size_mm = [15, 13, 15];
rpi5_ethernet_port_origin_mm = [66, 39, rpi5_board_thickness_mm];
rpi5_ethernet_port_size_mm = [19, 15, 13];
rpi5_usb_c_power_origin_mm = [5, -2, rpi5_board_thickness_mm];
rpi5_usb_c_power_size_mm = [9, 4, 3];
rpi5_micro_hdmi_left_origin_mm = [22, -2, rpi5_board_thickness_mm];
rpi5_micro_hdmi_right_origin_mm = [35, -2, rpi5_board_thickness_mm];
rpi5_micro_hdmi_size_mm = [7, 4, 3];
rpi5_camera_display_connector_a_origin_mm = [45, 4, rpi5_board_thickness_mm];
rpi5_camera_display_connector_b_origin_mm = [45, 14, rpi5_board_thickness_mm];
rpi5_camera_display_connector_size_mm = [17, 3, 3];
rpi5_pcie_connector_origin_mm = [10, 25, rpi5_board_thickness_mm];
rpi5_pcie_connector_size_mm = [22, 3, 3];
rpi5_soc_origin_mm = [35, 25, rpi5_board_thickness_mm];
rpi5_soc_size_mm = [14, 14, 1.5];
rpi5_rp1_origin_mm = [50, 30, rpi5_board_thickness_mm];
rpi5_rp1_size_mm = [10, 10, 1.2];
rpi5_ram_origin_mm = [35, 42, rpi5_board_thickness_mm];
rpi5_ram_size_mm = [10, 12, 1.2];

// microSD preview dimensions
rpi5_micro_sd_slot_origin_mm = [5, 20, -1.8];
rpi5_micro_sd_slot_size_mm = [16, 14, 1.8];
rpi5_micro_sd_card_origin_mm = [7, 19.5, -2.8];
rpi5_micro_sd_card_size_mm = [11, 15, 1];
rpi5_micro_sd_contact_origin_mm = [8, 31.5, -1.9];
rpi5_micro_sd_contact_count = 8;
rpi5_micro_sd_contact_pitch_mm = 1.1;
rpi5_micro_sd_contact_size_mm = [0.6, 1.5, 0.2];

// Active cooler preview dimensions
rpi5_active_cooler_origin_mm = [17, 8, rpi5_board_thickness_mm + 1.2];
rpi5_active_cooler_size_mm = [63.5, 42.5];
rpi5_active_cooler_base_height_mm = 3.0;
rpi5_active_cooler_fin_height_mm = 5.0;
rpi5_active_cooler_fin_count = 10;
rpi5_active_cooler_fin_spacing_mm = 4.5;
rpi5_active_cooler_fin_origin_offset_mm = [3, 2];
rpi5_active_cooler_fin_size_mm = [1.0, rpi5_active_cooler_size_mm[1] - 4, rpi5_active_cooler_fin_height_mm];
rpi5_active_cooler_fan_size_mm = 22;
rpi5_active_cooler_fan_height_mm = 4;
rpi5_active_cooler_fan_origin_offset_mm = [21, 10, -1.5];
rpi5_active_cooler_fan_opening_height_mm = 0.6;
rpi5_active_cooler_fan_opening_diameter_mm = 16;
rpi5_active_cooler_fan_hub_height_mm = 1;
rpi5_active_cooler_fan_hub_diameter_mm = 5;
rpi5_active_cooler_push_pin_positions_mm = [
    [22, 14],
    [73, 47]
];
rpi5_active_cooler_push_pin_height_mm = 8;
rpi5_active_cooler_push_pin_diameter_mm = 3.5;
rpi5_active_cooler_soc_pad_origin_mm = [35, 27, rpi5_board_thickness_mm + 0.2];
rpi5_active_cooler_soc_pad_size_mm = [14, 14, 0.6];
rpi5_active_cooler_rp1_pad_origin_mm = [50, 30, rpi5_board_thickness_mm + 0.2];
rpi5_active_cooler_rp1_pad_size_mm = [10, 10, 0.6];
rpi5_active_cooler_fan_cable_offset_mm = [18, 3, 1];
rpi5_active_cooler_fan_cable_spacing_mm = 1.5;
rpi5_active_cooler_fan_cable_size_mm = [8, 0.8, 0.8];

// Visual settings
rpi5_board_colour = "green";
rpi5_connector_colour = "silver";
rpi5_black_component_colour = "black";
rpi5_chip_colour = "dimgray";
rpi5_gpio_pin_colour = "gold";
rpi5_micro_sd_card_colour = "navy";
rpi5_active_cooler_base_colour = "silver";
rpi5_active_cooler_fin_colour = "gainsboro";
rpi5_active_cooler_fan_colour = "black";
rpi5_active_cooler_fan_opening_colour = "dimgray";
rpi5_active_cooler_thermal_pad_colour = [0.5, 0.8, 1, 0.4];

// ======================================================
// Derived Values
// ======================================================

rpi5_active_cooler_total_height_mm =
    rpi5_active_cooler_base_height_mm + rpi5_active_cooler_fin_height_mm;

rpi5_active_cooler_fan_origin_mm = [
    rpi5_active_cooler_origin_mm[0] + rpi5_active_cooler_fan_origin_offset_mm[0],
    rpi5_active_cooler_origin_mm[1] + rpi5_active_cooler_fan_origin_offset_mm[1],
    rpi5_active_cooler_origin_mm[2] + rpi5_active_cooler_total_height_mm + rpi5_active_cooler_fan_origin_offset_mm[2]
];

rpi5_active_cooler_red_cable_origin_mm = [
    rpi5_active_cooler_fan_origin_mm[0] + rpi5_active_cooler_fan_cable_offset_mm[0],
    rpi5_active_cooler_fan_origin_mm[1] + rpi5_active_cooler_fan_cable_offset_mm[1],
    rpi5_active_cooler_fan_origin_mm[2] + rpi5_active_cooler_fan_cable_offset_mm[2]
];

rpi5_active_cooler_black_cable_origin_mm = [
    rpi5_active_cooler_red_cable_origin_mm[0],
    rpi5_active_cooler_red_cable_origin_mm[1] + rpi5_active_cooler_fan_cable_spacing_mm,
    rpi5_active_cooler_red_cable_origin_mm[2]
];

// ======================================================
// Main Raspberry Pi 5 Reference Model
// ======================================================

module rpi5_reference_model(
    show_reference = show_rpi5_reference,
    show_gpio_pins = show_rpi5_gpio_pins,
    show_micro_sd_card = show_rpi5_micro_sd_card,
    show_active_cooler = show_rpi5_active_cooler
) {
    if (show_reference) {
        rpi5_board_reference();
        rpi5_connector_and_component_reference();

        if (show_gpio_pins) {
            rpi5_gpio_header_reference();
        }

        if (show_micro_sd_card) {
            rpi5_micro_sd_card_reference();
        }

        if (show_active_cooler) {
            rpi5_active_cooler_reference();
        }
    }
}

module rpi5_board_reference() {
    difference() {
        color(rpi5_board_colour)
            rpi5_rounded_box([rpi5_board_length_mm, rpi5_board_width_mm, rpi5_board_thickness_mm], rpi5_board_corner_radius_mm);

        for (hole_position_mm = rpi5_mounting_hole_positions_mm) {
            translate([hole_position_mm[0], hole_position_mm[1], -0.1])
                cylinder(
                    h = rpi5_board_thickness_mm + 0.2,
                    d = rpi5_mounting_hole_diameter_mm
                );
        }
    }
}

module rpi5_connector_and_component_reference() {
    rpi5_component_reference(rpi5_usb_port_lower_origin_mm, rpi5_usb_port_size_mm);
    rpi5_component_reference(rpi5_usb_port_upper_origin_mm, rpi5_usb_port_size_mm);
    rpi5_component_reference(rpi5_ethernet_port_origin_mm, rpi5_ethernet_port_size_mm);
    rpi5_component_reference(rpi5_usb_c_power_origin_mm, rpi5_usb_c_power_size_mm);
    rpi5_component_reference(rpi5_micro_hdmi_left_origin_mm, rpi5_micro_hdmi_size_mm);
    rpi5_component_reference(rpi5_micro_hdmi_right_origin_mm, rpi5_micro_hdmi_size_mm);
    rpi5_component_reference(rpi5_camera_display_connector_a_origin_mm, rpi5_camera_display_connector_size_mm, rpi5_black_component_colour);
    rpi5_component_reference(rpi5_camera_display_connector_b_origin_mm, rpi5_camera_display_connector_size_mm, rpi5_black_component_colour);
    rpi5_component_reference(rpi5_pcie_connector_origin_mm, rpi5_pcie_connector_size_mm, rpi5_black_component_colour);
    rpi5_component_reference(rpi5_soc_origin_mm, rpi5_soc_size_mm, rpi5_chip_colour);
    rpi5_component_reference(rpi5_rp1_origin_mm, rpi5_rp1_size_mm, rpi5_chip_colour);
    rpi5_component_reference(rpi5_ram_origin_mm, rpi5_ram_size_mm, rpi5_chip_colour);
}

module rpi5_gpio_header_reference() {
    color(rpi5_black_component_colour)
    translate(rpi5_gpio_header_origin_mm)
        cube(rpi5_gpio_header_size_mm);

    for (pin_row = [0:1])
    for (pin_column = [0:19]) {
        color(rpi5_gpio_pin_colour)
        translate([
            rpi5_gpio_pin_origin_x_mm + pin_column * rpi5_gpio_pin_pitch_mm,
            rpi5_gpio_pin_origin_y_mm + pin_row * rpi5_gpio_pin_pitch_mm,
            rpi5_board_thickness_mm + rpi5_gpio_header_size_mm[2]
        ])
            cube([rpi5_gpio_pin_size_mm, rpi5_gpio_pin_size_mm, rpi5_gpio_pin_height_mm]);
    }
}

module rpi5_micro_sd_card_reference() {
    color(rpi5_connector_colour)
    translate(rpi5_micro_sd_slot_origin_mm)
        cube(rpi5_micro_sd_slot_size_mm);

    color(rpi5_micro_sd_card_colour)
    translate(rpi5_micro_sd_card_origin_mm)
        cube(rpi5_micro_sd_card_size_mm);

    for (contact_index = [0:rpi5_micro_sd_contact_count - 1]) {
        color(rpi5_gpio_pin_colour)
        translate([
            rpi5_micro_sd_contact_origin_mm[0] + contact_index * rpi5_micro_sd_contact_pitch_mm,
            rpi5_micro_sd_contact_origin_mm[1],
            rpi5_micro_sd_contact_origin_mm[2]
        ])
            cube(rpi5_micro_sd_contact_size_mm);
    }
}

module rpi5_active_cooler_reference() {
    color(rpi5_active_cooler_base_colour)
    translate(rpi5_active_cooler_origin_mm)
        cube([
            rpi5_active_cooler_size_mm[0],
            rpi5_active_cooler_size_mm[1],
            rpi5_active_cooler_base_height_mm
        ]);

    for (fin_index = [0:rpi5_active_cooler_fin_count - 1]) {
        color(rpi5_active_cooler_fin_colour)
        translate([
            rpi5_active_cooler_origin_mm[0] + rpi5_active_cooler_fin_origin_offset_mm[0] + fin_index * rpi5_active_cooler_fin_spacing_mm,
            rpi5_active_cooler_origin_mm[1] + rpi5_active_cooler_fin_origin_offset_mm[1],
            rpi5_active_cooler_origin_mm[2] + rpi5_active_cooler_base_height_mm
        ])
            cube(rpi5_active_cooler_fin_size_mm);
    }

    color(rpi5_active_cooler_fan_colour)
    translate(rpi5_active_cooler_fan_origin_mm)
        cube([
            rpi5_active_cooler_fan_size_mm,
            rpi5_active_cooler_fan_size_mm,
            rpi5_active_cooler_fan_height_mm
        ]);

    color(rpi5_active_cooler_fan_opening_colour)
    translate([
        rpi5_active_cooler_fan_origin_mm[0] + rpi5_active_cooler_fan_size_mm / 2,
        rpi5_active_cooler_fan_origin_mm[1] + rpi5_active_cooler_fan_size_mm / 2,
        rpi5_active_cooler_fan_origin_mm[2] + rpi5_active_cooler_fan_height_mm
    ])
        cylinder(
            h = rpi5_active_cooler_fan_opening_height_mm,
            d = rpi5_active_cooler_fan_opening_diameter_mm
        );

    color(rpi5_active_cooler_fan_colour)
    translate([
        rpi5_active_cooler_fan_origin_mm[0] + rpi5_active_cooler_fan_size_mm / 2,
        rpi5_active_cooler_fan_origin_mm[1] + rpi5_active_cooler_fan_size_mm / 2,
        rpi5_active_cooler_fan_origin_mm[2] + rpi5_active_cooler_fan_height_mm + 0.2
    ])
        cylinder(
            h = rpi5_active_cooler_fan_hub_height_mm,
            d = rpi5_active_cooler_fan_hub_diameter_mm
        );

    for (push_pin_position_mm = rpi5_active_cooler_push_pin_positions_mm) {
        color(rpi5_active_cooler_fan_colour)
        translate([push_pin_position_mm[0], push_pin_position_mm[1], rpi5_board_thickness_mm])
            cylinder(
                h = rpi5_active_cooler_push_pin_height_mm,
                d = rpi5_active_cooler_push_pin_diameter_mm
            );
    }

    color(rpi5_active_cooler_thermal_pad_colour)
    translate(rpi5_active_cooler_soc_pad_origin_mm)
        cube(rpi5_active_cooler_soc_pad_size_mm);

    color(rpi5_active_cooler_thermal_pad_colour)
    translate(rpi5_active_cooler_rp1_pad_origin_mm)
        cube(rpi5_active_cooler_rp1_pad_size_mm);

    color("red")
    translate(rpi5_active_cooler_red_cable_origin_mm)
        cube(rpi5_active_cooler_fan_cable_size_mm);

    color("black")
    translate(rpi5_active_cooler_black_cable_origin_mm)
        cube(rpi5_active_cooler_fan_cable_size_mm);
}

// ======================================================
// Helper Modules
// ======================================================

module rpi5_rounded_box(size_mm, radius_mm) {
    hull() {
        for (x_position_mm = [radius_mm, size_mm[0] - radius_mm])
        for (y_position_mm = [radius_mm, size_mm[1] - radius_mm]) {
            translate([x_position_mm, y_position_mm, 0])
                cylinder(h = size_mm[2], r = radius_mm);
        }
    }
}

module rpi5_component_reference(origin_mm, size_mm, colour = rpi5_connector_colour) {
    color(colour)
    translate(origin_mm)
        cube(size_mm);
}

// ======================================================
// Standalone Preview
// ======================================================

rpi5_reference_model();
