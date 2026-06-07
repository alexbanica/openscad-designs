// Seeed Grove Base Hat for Raspberry Pi Zero reference model.
//
// Units: mm
// Origin: centre of PCB, bottom face. X follows board length, Y follows board width,
// Z points upward from the PCB bottom face.
// This is an adjustable fit and clearance reference, not a vendor-certified model.

use <pi_zero.scad>

// ======================================================
// Adjustable Parameters
// ======================================================

// Render controls
$fn = 48;
render_mode = "assembly"; // [assembly/hat/connectors/printable_layout]
show_electronics = true;
show_gpio_header = true;
show_grove_labels = true;
show_pi_zero_reference = false;

// Board dimensions
hat_board_length_mm = 65.0;
hat_board_width_mm = 30.0;
hat_board_thickness_mm = 1.6;
hat_board_corner_radius_mm = 1.5;
hat_overall_height_envelope_mm = 20.0;

// Mounting holes
hat_mounting_hole_diameter_mm = 3.0;
hat_mounting_hole_edge_offset_mm = 3.5;

// Stack and Pi Zero reference offsets
pi_zero_stack_gap_mm = 11.0;
pi_zero_reference_header_position = 1;

// GPIO header/reference dimensions
hat_gpio_pin_columns = 20;
hat_gpio_pin_rows = 2;
hat_gpio_pin_pitch_mm = 2.54;
hat_gpio_pin_size_mm = 0.64;
hat_gpio_pin_height_mm = 8.5;
hat_gpio_pad_diameter_mm = 1.45;
hat_gpio_pad_height_mm = 0.12;
hat_gpio_through_hole_diameter_mm = 0.72;
hat_gpio_header_block_length_mm = 51.0;
hat_gpio_header_block_width_mm = 5.1;
hat_gpio_header_block_height_mm = 0.45;
hat_gpio_header_center_x_mm = 3.81;
hat_gpio_header_center_y_mm = 11.43;

// Grove connector dimensions and positions
// Defaults are layout-based references; tune socket positions after physical measurement.
grove_socket_size_mm = [8.2, 6.0, 5.0];
grove_socket_label_offset_y_mm = -4.7;
grove_socket_label_height_mm = 0.2;
grove_socket_label_size_mm = 2.2;
grove_digital_sockets_mm = [
    ["D5", -24.0, 4.8],
    ["D16", -24.0, -9.5]
];
grove_analog_sockets_mm = [
    ["A0", -13.5, 4.8],
    ["A2", -3.0, 4.8],
    ["A4", 9.0, 4.8]
];
grove_i2c_sockets_mm = [
    ["I2C", -3.0, -9.5]
];
grove_pwm_sockets_mm = [
    ["PWM", -13.5, -9.5]
];
grove_uart_sockets_mm = [
    ["UART", 9.0, -9.5]
];

// Grove cable-exit clearance dimensions and positions
// Defaults are enclosure-planning references; tune cable exits after physical measurement.
grove_digital_cable_exit_size_mm = [8.4, 10.0, 4.0];
grove_digital_cable_exit_center_y_mm = -18.0;
grove_analog_cable_exit_size_mm = [8.4, 10.0, 4.0];
grove_analog_cable_exit_center_y_mm = 18.0;
grove_i2c_cable_exit_size_mm = [8.4, 10.0, 4.0];
grove_i2c_cable_exit_center_y_mm = -18.0;
grove_pwm_cable_exit_size_mm = [8.4, 10.0, 4.0];
grove_pwm_cable_exit_center_y_mm = -18.0;
grove_uart_cable_exit_size_mm = [8.4, 10.0, 4.0];
grove_uart_cable_exit_center_y_mm = -18.0;

// Right-edge GPIO/SWD reference dimensions
gpio_swd_reference_center_x_mm = 25.2;
gpio_swd_reference_center_y_mm = -1.0;
gpio_swd_reference_block_size_mm = [4.2, 10.8, 1.4];
gpio_swd_pin_count = 6;
gpio_swd_pin_pitch_mm = 1.55;
gpio_swd_pin_size_mm = 0.48;
gpio_swd_pin_height_mm = 2.8;
gpio_swd_pad_diameter_mm = 1.1;
gpio_swd_pad_height_mm = 0.12;

// Controller, component, and LED preview dimensions
controller_block_mm = [-4.5, -1.0, 8.0, 8.0, 1.4, "Black"];
component_clearance_blocks_mm = [
    [-17.0, -1.2, 7.5, 4.0, 1.2, "DimGray"],
    [9.0, -1.0, 6.0, 4.0, 1.1, "DarkSlateGray"],
    [20.5, -4.2, 5.0, 3.0, 1.0, "DimGray"]
];
led_size_mm = [1.4, 0.9, 0.6];
led_positions_mm = [
    ["PWR", 24.0, -5.8, "Red"],
    ["TX", 21.5, -7.8, "GreenYellow"],
    ["RX", 19.0, -7.8, "Lime"]
];

// Printable layout
printable_layout_spacing_mm = 24.0;

// Visual settings
hat_board_colour = "LimeGreen";
hat_mounting_hole_colour = "White";
hat_gpio_header_colour = "DarkSlateGray";
hat_gpio_pad_colour = "Silver";
hat_gpio_through_hole_colour = "Black";
hat_gpio_pin_colour = "Gold";
grove_socket_colour = "Ivory";
grove_cable_exit_colour = "LightSkyBlue";
gpio_swd_reference_colour = "Navy";
component_colour = "DimGray";
height_envelope_colour = "LightSteelBlue";
hat_label_colour = "White";

// ======================================================
// Derived Values
// ======================================================

hat_board_half_length_mm = hat_board_length_mm / 2;
hat_board_half_width_mm = hat_board_width_mm / 2;
hat_board_half_thickness_mm = hat_board_thickness_mm / 2;
hat_mounting_hole_radius_mm = hat_mounting_hole_diameter_mm / 2;
hat_mounting_hole_span_x_mm = hat_board_length_mm - 2 * hat_mounting_hole_edge_offset_mm;
hat_mounting_hole_span_y_mm = hat_board_width_mm - 2 * hat_mounting_hole_edge_offset_mm;
hat_mounting_hole_x_mm = hat_mounting_hole_span_x_mm / 2;
hat_mounting_hole_y_mm = hat_mounting_hole_span_y_mm / 2;
hat_gpio_header_origin_x_mm = hat_gpio_header_center_x_mm - hat_gpio_header_block_length_mm / 2;
hat_gpio_header_origin_y_mm = hat_gpio_header_center_y_mm - hat_gpio_header_block_width_mm / 2;
hat_gpio_pin_first_x_mm = hat_gpio_header_center_x_mm - (hat_gpio_pin_columns - 1) * hat_gpio_pin_pitch_mm / 2;
hat_gpio_pin_first_y_mm = hat_gpio_header_center_y_mm - hat_gpio_pin_pitch_mm / 2;
hat_top_component_base_z_mm = hat_board_thickness_mm;
hat_overall_height_center_z_mm = hat_overall_height_envelope_mm / 2;
pi_zero_reference_z_mm = -(pi_zero_stack_gap_mm + hat_board_thickness_mm);
gpio_swd_pin_first_y_mm = gpio_swd_reference_center_y_mm - (gpio_swd_pin_count - 1) * gpio_swd_pin_pitch_mm / 2;

// ======================================================
// Render Dispatch
// ======================================================

if (render_mode == "assembly") {
    seeed_grove_base_hat_zero_reference_model();
} else if (render_mode == "hat") {
    seeed_grove_base_hat_zero_reference_model(
        show_hat_electronics = false,
        show_header = show_gpio_header,
        show_labels = false,
        show_pi_reference = false
    );
} else if (render_mode == "connectors") {
    seeed_grove_base_hat_zero_connector_clearance_reference();
} else if (render_mode == "printable_layout") {
    seeed_grove_base_hat_zero_printable_layout();
} else {
    seeed_grove_base_hat_zero_reference_model();
}

// ======================================================
// Main Reference Model
// ======================================================

module seeed_grove_base_hat_zero_reference_model(
    show_hat_electronics = show_electronics,
    show_header = show_gpio_header,
    show_labels = show_grove_labels,
    show_pi_reference = show_pi_zero_reference
) {
    if (show_pi_reference) {
        seeed_grove_base_hat_zero_pi_stack_reference();
    }

    seeed_grove_base_hat_zero_board_reference();

    if (show_hat_electronics) {
        seeed_grove_base_hat_zero_grove_socket_reference(show_labels = show_labels);
        seeed_grove_base_hat_zero_gpio_swd_reference(show_labels = show_labels);
        seeed_grove_base_hat_zero_component_reference(show_labels = show_labels);
        seeed_grove_base_hat_zero_led_reference(show_labels = show_labels);
        seeed_grove_base_hat_zero_height_envelope_reference();
    } else if (show_labels) {
        seeed_grove_base_hat_zero_board_label_reference();
    }

    if (show_header) {
        seeed_grove_base_hat_zero_gpio_reference();
    }
}

module seeed_grove_base_hat_zero_connector_clearance_reference() {
    seeed_grove_base_hat_zero_board_reference();

    if (show_electronics) {
        seeed_grove_base_hat_zero_grove_socket_reference(show_labels = show_grove_labels);
        seeed_grove_base_hat_zero_gpio_swd_reference(show_labels = show_grove_labels);
        seeed_grove_base_hat_zero_component_reference(show_labels = show_grove_labels);
        seeed_grove_base_hat_zero_led_reference(show_labels = show_grove_labels);
        seeed_grove_base_hat_zero_height_envelope_reference();
    }

    if (show_gpio_header) {
        seeed_grove_base_hat_zero_gpio_reference();
    }

    if (show_pi_zero_reference) {
        seeed_grove_base_hat_zero_pi_stack_reference();
    }
}

module seeed_grove_base_hat_zero_board_reference() {
    color(hat_board_colour)
    difference() {
        seeed_centered_rounded_box(
            [hat_board_length_mm, hat_board_width_mm, hat_board_thickness_mm],
            hat_board_corner_radius_mm
        );

        for (hole_x_mm = [-hat_mounting_hole_x_mm, hat_mounting_hole_x_mm])
        for (hole_y_mm = [-hat_mounting_hole_y_mm, hat_mounting_hole_y_mm]) {
            seeed_pcb_hole(hole_x_mm, hole_y_mm, hat_mounting_hole_diameter_mm);
        }
    }

    for (hole_x_mm = [-hat_mounting_hole_x_mm, hat_mounting_hole_x_mm])
    for (hole_y_mm = [-hat_mounting_hole_y_mm, hat_mounting_hole_y_mm]) {
        color(hat_mounting_hole_colour)
        translate([hole_x_mm, hole_y_mm, hat_board_thickness_mm + 0.03])
            cylinder(h = 0.06, d = hat_mounting_hole_diameter_mm, center = true);
    }
}

module seeed_grove_base_hat_zero_pi_stack_reference() {
    translate([0, 0, pi_zero_reference_z_mm])
        pi_zero_reference_model(
            show_reference = true,
            show_test_pads = false,
            show_gpio_header_position = pi_zero_reference_header_position,
            show_gpio_sound_vision_pads = false,
            show_gpio_pin_colours = false
        );
}

module seeed_grove_base_hat_zero_gpio_reference() {
    color(hat_gpio_header_colour, 0.65)
    translate([
        hat_gpio_header_origin_x_mm,
        hat_gpio_header_origin_y_mm,
        hat_board_thickness_mm
    ])
        cube([
            hat_gpio_header_block_length_mm,
            hat_gpio_header_block_width_mm,
            hat_gpio_header_block_height_mm
        ]);

    for (pin_column = [0:hat_gpio_pin_columns - 1])
    for (pin_row = [0:hat_gpio_pin_rows - 1]) {
        pin_center_x_mm = hat_gpio_pin_first_x_mm + pin_column * hat_gpio_pin_pitch_mm;
        pin_center_y_mm = hat_gpio_pin_first_y_mm + pin_row * hat_gpio_pin_pitch_mm;
        pad_center_z_mm = hat_board_thickness_mm + hat_gpio_header_block_height_mm + hat_gpio_pad_height_mm / 2;

        color(hat_gpio_pad_colour)
        translate([pin_center_x_mm, pin_center_y_mm, pad_center_z_mm])
            cylinder(h = hat_gpio_pad_height_mm, d = hat_gpio_pad_diameter_mm, center = true);

        color(hat_gpio_through_hole_colour)
        translate([pin_center_x_mm, pin_center_y_mm, pad_center_z_mm + 0.01])
            cylinder(h = hat_gpio_pad_height_mm + 0.03, d = hat_gpio_through_hole_diameter_mm, center = true);

        color(hat_gpio_pin_colour)
        translate([
            pin_center_x_mm,
            pin_center_y_mm,
            hat_board_thickness_mm + hat_gpio_header_block_height_mm + hat_gpio_pad_height_mm + hat_gpio_pin_height_mm / 2
        ])
            cube([
                hat_gpio_pin_size_mm,
                hat_gpio_pin_size_mm,
                hat_gpio_pin_height_mm
            ], center = true);
    }
}

module seeed_grove_base_hat_zero_grove_socket_reference(show_labels = show_grove_labels) {
    seeed_grove_socket_group(
        grove_digital_sockets_mm,
        "Digital",
        grove_digital_cable_exit_size_mm,
        grove_digital_cable_exit_center_y_mm,
        "row_edges",
        show_labels
    );
    seeed_grove_socket_group(
        grove_analog_sockets_mm,
        "Analog",
        grove_analog_cable_exit_size_mm,
        grove_analog_cable_exit_center_y_mm,
        "back",
        show_labels
    );
    seeed_grove_socket_group(
        grove_i2c_sockets_mm,
        "I2C",
        grove_i2c_cable_exit_size_mm,
        grove_i2c_cable_exit_center_y_mm,
        "back",
        show_labels
    );
    seeed_grove_socket_group(
        grove_pwm_sockets_mm,
        "PWM",
        grove_pwm_cable_exit_size_mm,
        grove_pwm_cable_exit_center_y_mm,
        "back",
        show_labels
    );
    seeed_grove_socket_group(
        grove_uart_sockets_mm,
        "UART",
        grove_uart_cable_exit_size_mm,
        grove_uart_cable_exit_center_y_mm,
        "back",
        show_labels
    );
}

module seeed_grove_base_hat_zero_gpio_swd_reference(show_labels = show_grove_labels) {
    seeed_top_component(
        [gpio_swd_reference_center_x_mm, gpio_swd_reference_center_y_mm],
        gpio_swd_reference_block_size_mm,
        gpio_swd_reference_colour
    );

    for (pin_index = [0:gpio_swd_pin_count - 1]) {
        pin_center_y_mm = gpio_swd_pin_first_y_mm + pin_index * gpio_swd_pin_pitch_mm;
        pad_center_z_mm = hat_board_thickness_mm + gpio_swd_reference_block_size_mm[2] + gpio_swd_pad_height_mm / 2;

        color(hat_gpio_pad_colour)
        translate([
            gpio_swd_reference_center_x_mm,
            pin_center_y_mm,
            pad_center_z_mm
        ])
            cylinder(h = gpio_swd_pad_height_mm, d = gpio_swd_pad_diameter_mm, center = true);

        color(hat_gpio_pin_colour)
        translate([
            gpio_swd_reference_center_x_mm,
            pin_center_y_mm,
            hat_board_thickness_mm + gpio_swd_reference_block_size_mm[2] + gpio_swd_pad_height_mm + gpio_swd_pin_height_mm / 2
        ])
            cube([
                gpio_swd_pin_size_mm,
                gpio_swd_pin_size_mm,
                gpio_swd_pin_height_mm
            ], center = true);
    }

    if (show_labels) {
        seeed_top_label("GPIO/SWD", [
            gpio_swd_reference_center_x_mm,
            gpio_swd_reference_center_y_mm + gpio_swd_reference_block_size_mm[1] / 2 + 2.2,
            hat_board_thickness_mm + gpio_swd_reference_block_size_mm[2] + 0.1
        ], halign_value = "center");
    }
}

module seeed_grove_base_hat_zero_component_reference(show_labels = show_grove_labels) {
    seeed_top_component(
        [controller_block_mm[0], controller_block_mm[1]],
        [controller_block_mm[2], controller_block_mm[3], controller_block_mm[4]],
        controller_block_mm[5]
    );
    if (show_labels) {
        seeed_top_label("MCU", [
            controller_block_mm[0],
            controller_block_mm[1],
            hat_board_thickness_mm + controller_block_mm[4] + 0.1
        ], halign_value = "center");
    }

    for (component_mm = component_clearance_blocks_mm) {
        seeed_top_component(
            [component_mm[0], component_mm[1]],
            [component_mm[2], component_mm[3], component_mm[4]],
            component_mm[5]
        );
    }
}

module seeed_grove_base_hat_zero_led_reference(show_labels = show_grove_labels) {
    for (led_mm = led_positions_mm) {
        color(led_mm[3])
        translate([led_mm[1], led_mm[2], hat_board_thickness_mm + led_size_mm[2] / 2])
            cube(led_size_mm, center = true);

        if (show_labels) {
            seeed_top_label(
                led_mm[0],
                [led_mm[1] - 1.9, led_mm[2], hat_board_thickness_mm + led_size_mm[2] + 0.1],
                halign_value = "right"
            );
        }
    }
}

module seeed_grove_base_hat_zero_height_envelope_reference() {
    color(height_envelope_colour, 0.18)
    translate([0, 0, hat_overall_height_center_z_mm])
        cube([
            hat_board_length_mm,
            hat_board_width_mm,
            hat_overall_height_envelope_mm
        ], center = true);
}

module seeed_grove_base_hat_zero_board_label_reference() {
    seeed_top_label("Grove Base HAT Zero", [
        -2.0,
        -1.0,
        hat_board_thickness_mm + grove_socket_label_height_mm
    ], halign_value = "center");
}

module seeed_grove_base_hat_zero_printable_layout() {
    translate([
        -hat_board_half_length_mm - printable_layout_spacing_mm / 2,
        0,
        0
    ])
        seeed_grove_base_hat_zero_reference_model(show_pi_reference = false);

    if (show_pi_zero_reference) {
        translate([
            hat_board_half_length_mm + printable_layout_spacing_mm / 2,
            0,
            0
        ])
            pi_zero_reference_model(
                show_reference = true,
                show_test_pads = false,
                show_gpio_header_position = pi_zero_reference_header_position,
                show_gpio_sound_vision_pads = false,
                show_gpio_pin_colours = false
            );
    }
}

// ======================================================
// Helper Modules
// ======================================================

module seeed_grove_socket_group(
    socket_data_mm,
    group_name,
    cable_exit_size_mm,
    cable_exit_y_mm,
    exit_side,
    show_labels
) {
    for (socket_mm = socket_data_mm) {
        seeed_grove_socket(socket_mm, cable_exit_size_mm, cable_exit_y_mm, exit_side);

        if (show_labels) {
            seeed_top_label(
                socket_mm[0],
                [
                    socket_mm[1],
                    socket_mm[2] + grove_socket_label_offset_y_mm,
                    hat_board_thickness_mm + grove_socket_size_mm[2] + 0.1
                ],
                halign_value = "center"
            );
        }
    }

    if (show_labels) {
        seeed_top_label(group_name, [
            socket_data_mm[0][1],
            socket_data_mm[0][2] + 4.9,
            hat_board_thickness_mm + grove_socket_size_mm[2] + 0.1
        ], halign_value = "center");
    }
}

module seeed_grove_socket(socket_mm, cable_exit_size_mm, cable_exit_y_mm, exit_side) {
    seeed_top_component(
        [socket_mm[1], socket_mm[2]],
        grove_socket_size_mm,
        grove_socket_colour
    );

    if (exit_side == "row_edges") {
        if (socket_mm[2] > 0) {
            seeed_grove_front_back_cable_exit(socket_mm[1], abs(cable_exit_y_mm), cable_exit_size_mm);
        } else {
            seeed_grove_front_back_cable_exit(socket_mm[1], -abs(cable_exit_y_mm), cable_exit_size_mm);
        }
    } else {
        seeed_grove_front_back_cable_exit(socket_mm[1], cable_exit_y_mm, cable_exit_size_mm);
    }
}

module seeed_grove_front_back_cable_exit(center_x_mm, center_y_mm, size_mm) {
    color(grove_cable_exit_colour, 0.35)
    translate([
        center_x_mm,
        center_y_mm,
        hat_board_thickness_mm + size_mm[2] / 2
    ])
        cube(size_mm, center = true);
}

module seeed_centered_rounded_box(size_mm, radius_mm) {
    translate([0, 0, size_mm[2] / 2])
    hull() {
        for (x_position_mm = [
            -size_mm[0] / 2 + radius_mm,
            size_mm[0] / 2 - radius_mm
        ])
        for (y_position_mm = [
            -size_mm[1] / 2 + radius_mm,
            size_mm[1] / 2 - radius_mm
        ]) {
            translate([x_position_mm, y_position_mm, 0])
                cylinder(h = size_mm[2], r = radius_mm, center = true);
        }
    }
}

module seeed_pcb_hole(x_position_mm, y_position_mm, diameter_mm) {
    translate([x_position_mm, y_position_mm, hat_board_half_thickness_mm])
        cylinder(
            h = hat_board_thickness_mm + 0.2,
            d = diameter_mm,
            center = true
        );
}

module seeed_top_component(center_xy_mm, size_mm, colour = component_colour) {
    color(colour)
    translate([
        center_xy_mm[0],
        center_xy_mm[1],
        hat_top_component_base_z_mm + size_mm[2] / 2
    ])
        cube(size_mm, center = true);
}

module seeed_top_label(label_text, origin_mm, halign_value = "left") {
    color(hat_label_colour)
    translate(origin_mm)
        linear_extrude(height = grove_socket_label_height_mm)
            text(label_text, size = grove_socket_label_size_mm, halign = halign_value, valign = "center");
}
