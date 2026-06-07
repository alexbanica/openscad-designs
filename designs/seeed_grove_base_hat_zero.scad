// Seeed Grove Base Hat for Raspberry Pi Zero reference model
// Units: mm
//
// User Grove connector coordinates use the bottom-left PCB origin:
// X runs across the 30 mm board width and Y runs along the 65 mm board length.
// The OpenSCAD model origin is the board center on the PCB bottom face.
//
// This is an adjustable fit and clearance reference, not a vendor-certified
// mechanical model.

use <pi_zero.scad>

// ======================================================
// Adjustable Parameters
// ======================================================

// Render controls
$fn = 48;
render_mode = "assembly"; // [assembly/hat/connectors/printable_layout]
show_electronics = true;
show_gpio_header = true;
show_gpio_socket_clearance = true;
show_grove_labels = true;
show_pi_zero_reference = false;
show_height_envelope = false;
gpio_pin_preview_mode = "above"; // [above/below/hidden]

// Board dimensions
hat_board_width_mm = 30.0;
hat_board_length_mm = 65.0;
hat_board_thickness_mm = 1.6;
hat_board_corner_radius_mm = 1.5;
hat_overall_height_envelope_mm = 20.0;

// Mounting holes
hat_mounting_hole_edge_offset_mm = 3.5;
hat_mounting_hole_diameter_mm = 3.0;
hat_mounting_hole_clearance_radius_mm = 3.0;

// Stack and optional Pi Zero reference offsets
pi_zero_reference_z_offset_mm = -8.0;
pi_zero_reference_rotation_deg = -90;
pi_zero_reference_x_offset_mm = 0.0;
pi_zero_reference_y_offset_mm = 0.0;

// GPIO header/passthrough dimensions
gpio_pin_columns = 20;
gpio_pin_rows = 2;
gpio_pin_pitch_mm = 2.54;
gpio_pin_half_pitch_mm = 1.27;
gpio_pad_width_mm = 2.5;
gpio_pad_length_mm = 2.5;
gpio_pad_height_mm = 0.35;
gpio_hole_diameter_mm = 1.2;
gpio_pin_width_mm = 0.7;
gpio_pin_length_mm = 0.7;
gpio_pin_height_mm = 11.75;
gpio_pin_vertical_offset_mm = 3.0;

// Underside GPIO socket/receptacle clearance dimensions
gpio_socket_clearance_size_x_mm = 5.8;
gpio_socket_clearance_size_y_mm = 52.5;
gpio_socket_clearance_height_mm = 8.5;
gpio_socket_clearance_z_offset_mm = 0.0;

// Grove connector coordinate table and transform offsets
grove_coordinate_origin_x_mm = -hat_board_width_mm / 2;
grove_coordinate_origin_y_mm = -hat_board_length_mm / 2;
grove_coordinate_offset_x_mm = 0.0;
grove_coordinate_offset_y_mm = 0.0;
grove_socket_centers_mm = [
    ["UART", 9.4, 12.6],
    ["A3/A4", 17.8, 12.6],
    ["I2C", 9.6, 28.3],
    ["A2", 17.8, 28.3],
    ["D16", 9.6, 44.1],
    ["D26", 17.8, 44.1],
    ["D5", 9.6, 59.1],
    ["D6", 17.8, 59.1]
];

// Grove connector body dimensions
grove_connector_body_width_mm = 8.0;
grove_connector_body_length_mm = 10.0;
grove_connector_body_height_mm = 8.0;
grove_connector_corner_radius_mm = 0.8;
grove_connector_z_clearance_mm = 0.0;

// UART printed-case cutout guidance
uart_cutout_guidance_width_mm = 11.0;
uart_cutout_guidance_length_mm = 9.0;
show_uart_cutout_guidance = true;

// SWD/debug preview dimensions
swd_debug_center_x_mm = 12.8;
swd_debug_center_y_mm = 33.0;
swd_debug_block_size_mm = [3.2, 10.0, 2.8];
swd_debug_pin_diameter_mm = 0.75;
swd_debug_pin_pitch_mm = 1.27;
swd_debug_pin_count = 6;

// Component, LED, and label preview dimensions
component_clearance_blocks_mm = [
    [14.0, 47.5, 5.0, 4.0, 1.3, "DimGray"],
    [14.5, 20.8, 4.5, 3.5, 1.2, "DimGray"],
    [23.5, 54.0, 3.0, 5.5, 1.4, "Silver"]
];
led_markers_mm = [
    [24.8, 9.0, 1.3, "GreenYellow"],
    [24.8, 13.0, 1.3, "Red"]
];
label_size_mm = 2.2;
label_height_mm = 0.35;
label_z_offset_mm = 0.2;

// Printable layout
printable_layout_spacing_mm = 44.0;

// Visual settings
hat_board_colour = "ForestGreen";
hat_hole_colour = "Silver";
gpio_pad_colour = "Black";
gpio_pin_colour = "Gold";
gpio_socket_clearance_colour = "LightSteelBlue";
grove_connector_colour = "White";
uart_cutout_guidance_colour = "Orange";
swd_debug_colour = "Black";
height_envelope_colour = "LightCoral";
label_colour = "Black";

// ======================================================
// Derived Values
// ======================================================

hat_board_half_width_mm = hat_board_width_mm / 2;
hat_board_half_length_mm = hat_board_length_mm / 2;
hat_board_half_thickness_mm = hat_board_thickness_mm / 2;
hat_mounting_hole_radius_mm = hat_mounting_hole_diameter_mm / 2;
hat_mounting_hole_x_mm = hat_board_half_width_mm - hat_mounting_hole_edge_offset_mm;
hat_mounting_hole_y_mm = hat_board_half_length_mm - hat_mounting_hole_edge_offset_mm;
gpio_column_span_half_mm = (gpio_pin_columns - 1) * gpio_pin_half_pitch_mm;
gpio_pin_row_zero_x_mm = hat_mounting_hole_x_mm - gpio_pin_half_pitch_mm;
gpio_pad_center_z_mm = hat_board_thickness_mm + gpio_pad_height_mm / 2;
gpio_pin_center_above_z_mm = hat_board_thickness_mm + gpio_pin_height_mm / 2 - gpio_pin_vertical_offset_mm;
gpio_pin_center_below_z_mm = -gpio_pin_height_mm / 2 + gpio_pin_vertical_offset_mm;
gpio_grid_center_x_mm = gpio_pin_row_zero_x_mm + gpio_pin_half_pitch_mm;
gpio_socket_clearance_center_x_mm = gpio_grid_center_x_mm;
gpio_socket_clearance_center_y_mm = 0;
gpio_socket_clearance_center_z_mm = -gpio_socket_clearance_height_mm / 2 + gpio_socket_clearance_z_offset_mm;
grove_connector_center_z_mm = hat_board_thickness_mm + grove_connector_body_height_mm / 2 + grove_connector_z_clearance_mm;
uart_cutout_guidance_center_z_mm = hat_board_thickness_mm + 0.12;
height_envelope_center_z_mm = hat_overall_height_envelope_mm / 2;

// ======================================================
// Main Render Dispatch
// ======================================================

if (render_mode == "assembly") {
    seeed_grove_base_hat_zero_reference_model();
} else if (render_mode == "hat") {
    seeed_grove_base_hat_zero_reference_model(
        show_electronics_preview = false,
        show_gpio_socket_preview = false,
        show_grove_label_preview = false,
        show_pi_zero_preview = false
    );
} else if (render_mode == "connectors") {
    seeed_grove_base_hat_zero_reference_model(
        show_electronics_preview = true,
        show_gpio_header_preview = false,
        show_pi_zero_preview = false
    );
} else if (render_mode == "printable_layout") {
    seeed_grove_base_hat_zero_printable_layout();
} else {
    seeed_grove_base_hat_zero_reference_model();
}

// ======================================================
// Main Reference Model
// ======================================================

module seeed_grove_base_hat_zero_reference_model(
    show_electronics_preview = show_electronics,
    show_gpio_header_preview = show_gpio_header,
    show_gpio_socket_preview = show_gpio_socket_clearance,
    show_grove_label_preview = show_grove_labels,
    show_pi_zero_preview = show_pi_zero_reference
) {
    if (show_pi_zero_preview) {
        seeed_optional_pi_zero_stack_preview();
    }

    seeed_hat_board_reference();

    if (show_gpio_header_preview) {
        seeed_gpio_reference();
    }

    if (show_gpio_socket_preview) {
        seeed_gpio_socket_clearance();
    }

    if (show_electronics_preview) {
        seeed_grove_connector_previews();
        if (show_uart_cutout_guidance) {
            seeed_uart_cutout_guidance_preview();
        }
        seeed_swd_debug_reference();
        seeed_component_previews();
        if (show_height_envelope) {
            seeed_height_envelope_preview();
        }
    }

    if (show_grove_label_preview) {
        seeed_label_previews(show_electronics_preview);
    }
}

// ======================================================
// Board And Mounting Holes
// ======================================================

module seeed_hat_board_reference() {
    color(hat_board_colour)
    difference() {
        seeed_rounded_box(
            [hat_board_width_mm, hat_board_length_mm, hat_board_thickness_mm],
            hat_board_corner_radius_mm,
            [0, 0, hat_board_half_thickness_mm]
        );

        for (x_position_mm = [-hat_mounting_hole_x_mm, hat_mounting_hole_x_mm])
        for (y_position_mm = [-hat_mounting_hole_y_mm, hat_mounting_hole_y_mm]) {
            translate([x_position_mm, y_position_mm, hat_board_half_thickness_mm])
                cylinder(
                    h = hat_board_thickness_mm * 2.5,
                    d = hat_mounting_hole_diameter_mm,
                    center = true
                );
        }

        for (pin_column = [0:gpio_pin_columns - 1])
        for (pin_row = [0:gpio_pin_rows - 1]) {
            translate([
                seeed_gpio_pin_x_mm(pin_row),
                seeed_gpio_pin_y_mm(pin_column),
                hat_board_half_thickness_mm
            ])
                cylinder(
                    h = hat_board_thickness_mm * 2.5,
                    d = gpio_hole_diameter_mm,
                    center = true
                );
        }
    }
}

// ======================================================
// GPIO Header And Socket Clearance
// ======================================================

module seeed_gpio_reference() {
    if (gpio_pin_preview_mode != "hidden") {
        for (pin_column = [0:gpio_pin_columns - 1])
        for (pin_row = [0:gpio_pin_rows - 1]) {
            seeed_gpio_pin_reference(pin_column, pin_row, gpio_pin_preview_mode);
        }
    }
}

module seeed_gpio_pin_reference(pin_column, pin_row, pin_preview_mode) {
    pin_x_mm = seeed_gpio_pin_x_mm(pin_row);
    pin_y_mm = seeed_gpio_pin_y_mm(pin_column);
    pin_center_z_mm = (pin_preview_mode == "below") ? gpio_pin_center_below_z_mm : gpio_pin_center_above_z_mm;

    translate([pin_x_mm, pin_y_mm, gpio_pad_center_z_mm])
        color(gpio_pad_colour)
            cube([gpio_pad_width_mm, gpio_pad_length_mm, gpio_pad_height_mm], center = true);

    translate([pin_x_mm, pin_y_mm, pin_center_z_mm])
        color(gpio_pin_colour)
            cube([gpio_pin_width_mm, gpio_pin_length_mm, gpio_pin_height_mm], center = true);
}

module seeed_gpio_socket_clearance() {
    translate([
        gpio_socket_clearance_center_x_mm,
        gpio_socket_clearance_center_y_mm,
        gpio_socket_clearance_center_z_mm
    ])
        color(gpio_socket_clearance_colour, 0.45)
            cube([
                gpio_socket_clearance_size_x_mm,
                gpio_socket_clearance_size_y_mm,
                gpio_socket_clearance_height_mm
            ], center = true);
}

// ======================================================
// Grove Connectors
// ======================================================

module seeed_grove_connector_previews() {
    for (socket_data_mm = grove_socket_centers_mm) {
        seeed_grove_connector_preview(socket_data_mm);
    }
}

module seeed_grove_connector_preview(socket_data_mm) {
    translate([
        grove_center_x_mm(socket_data_mm),
        grove_center_y_mm(socket_data_mm),
        grove_connector_center_z_mm
    ])
        color(grove_connector_colour)
            seeed_rounded_box(
                [
                    grove_connector_body_width_mm,
                    grove_connector_body_length_mm,
                    grove_connector_body_height_mm
                ],
                grove_connector_corner_radius_mm,
                [0, 0, 0]
            );
}

module seeed_uart_cutout_guidance_preview() {
    uart_data_mm = grove_socket_centers_mm[0];
    translate([
        grove_center_x_mm(uart_data_mm),
        grove_center_y_mm(uart_data_mm),
        uart_cutout_guidance_center_z_mm
    ])
        color(uart_cutout_guidance_colour, 0.5)
            cube([
                uart_cutout_guidance_width_mm,
                uart_cutout_guidance_length_mm,
                0.24
            ], center = true);
}

// ======================================================
// Component References
// ======================================================

module seeed_swd_debug_reference() {
    translate([
        seeed_user_x_to_model_x_mm(swd_debug_center_x_mm),
        seeed_user_y_to_model_y_mm(swd_debug_center_y_mm),
        hat_board_thickness_mm + swd_debug_block_size_mm[2] / 2
    ])
        color(swd_debug_colour)
            cube(swd_debug_block_size_mm, center = true);

    for (pin_index = [0:swd_debug_pin_count - 1]) {
        translate([
            seeed_user_x_to_model_x_mm(swd_debug_center_x_mm),
            seeed_user_y_to_model_y_mm(swd_debug_center_y_mm) - (swd_debug_pin_count - 1) * swd_debug_pin_pitch_mm / 2 + pin_index * swd_debug_pin_pitch_mm,
            hat_board_thickness_mm + swd_debug_block_size_mm[2] + 0.2
        ])
            color(gpio_pin_colour)
                cylinder(h = 0.4, d = swd_debug_pin_diameter_mm, center = true);
    }
}

module seeed_component_previews() {
    for (component_data_mm = component_clearance_blocks_mm) {
        seeed_component_block(component_data_mm);
    }

    for (led_data_mm = led_markers_mm) {
        translate([
            seeed_user_x_to_model_x_mm(led_data_mm[0]),
            seeed_user_y_to_model_y_mm(led_data_mm[1]),
            hat_board_thickness_mm + led_data_mm[2] / 2
        ])
            color(led_data_mm[3])
                cube([led_data_mm[2], led_data_mm[2], led_data_mm[2]], center = true);
    }
}

module seeed_component_block(component_data_mm) {
    translate([
        seeed_user_x_to_model_x_mm(component_data_mm[0]),
        seeed_user_y_to_model_y_mm(component_data_mm[1]),
        hat_board_thickness_mm + component_data_mm[4] / 2
    ])
        color(component_data_mm[5])
            cube([
                component_data_mm[2],
                component_data_mm[3],
                component_data_mm[4]
            ], center = true);
}

module seeed_height_envelope_preview() {
    translate([0, 0, height_envelope_center_z_mm])
        color(height_envelope_colour, 0.12)
            cube([
                hat_board_width_mm,
                hat_board_length_mm,
                hat_overall_height_envelope_mm
            ], center = true);
}

// ======================================================
// Labels
// ======================================================

module seeed_label_previews(show_electronics_preview) {
    if (show_electronics_preview) {
        for (socket_data_mm = grove_socket_centers_mm) {
            seeed_text_label(
                socket_data_mm[0],
                [
                    grove_center_x_mm(socket_data_mm),
                    grove_center_y_mm(socket_data_mm),
                    hat_board_thickness_mm + grove_connector_body_height_mm + label_z_offset_mm
                ],
                label_size_mm
            );
        }

        seeed_text_label(
            "SWD",
            [
                seeed_user_x_to_model_x_mm(swd_debug_center_x_mm),
                seeed_user_y_to_model_y_mm(swd_debug_center_y_mm),
                hat_board_thickness_mm + swd_debug_block_size_mm[2] + label_z_offset_mm
            ],
            label_size_mm
        );

    }

    seeed_text_label(
        "GPIO",
        [
            gpio_grid_center_x_mm,
            0,
            hat_board_thickness_mm + label_z_offset_mm
        ],
        label_size_mm
    );
}

// ======================================================
// Optional Pi Zero Stack Preview And Layout
// ======================================================

module seeed_optional_pi_zero_stack_preview() {
    translate([
        pi_zero_reference_x_offset_mm,
        pi_zero_reference_y_offset_mm,
        pi_zero_reference_z_offset_mm
    ])
        rotate([0, 0, pi_zero_reference_rotation_deg])
            pi_zero_reference_model(
                show_reference = true,
                show_test_pads = false,
                show_gpio_header_position = 1,
                show_gpio_sound_vision_pads = false,
                show_gpio_pin_colours = false
            );
}

module seeed_grove_base_hat_zero_printable_layout() {
    translate([-printable_layout_spacing_mm / 2, 0, 0])
        seeed_grove_base_hat_zero_reference_model(
            show_electronics_preview = true,
            show_gpio_header_preview = true,
            show_gpio_socket_preview = true,
            show_grove_label_preview = true,
            show_pi_zero_preview = false
        );

    if (show_pi_zero_reference) {
        translate([printable_layout_spacing_mm / 2, 0, 0])
            seeed_optional_pi_zero_stack_preview();
    }
}

// ======================================================
// Helper Modules And Functions
// ======================================================

module seeed_rounded_box(size_mm, radius_mm, center_position_mm) {
    translate(center_position_mm)
        hull()
        for (x_position_mm = [-size_mm[0] / 2 + radius_mm, size_mm[0] / 2 - radius_mm])
        for (y_position_mm = [-size_mm[1] / 2 + radius_mm, size_mm[1] / 2 - radius_mm]) {
            translate([x_position_mm, y_position_mm, 0])
                cylinder(h = size_mm[2], r = radius_mm, center = true);
        }
}

module seeed_text_label(label_text, label_position_mm, size_mm) {
    translate(label_position_mm)
        color(label_colour)
            linear_extrude(height = label_height_mm)
                text(
                    label_text,
                    size = size_mm,
                    halign = "center",
                    valign = "center"
                );
}

function seeed_user_x_to_model_x_mm(user_x_mm) =
    grove_coordinate_origin_x_mm + user_x_mm + grove_coordinate_offset_x_mm;

function seeed_user_y_to_model_y_mm(user_y_mm) =
    grove_coordinate_origin_y_mm + user_y_mm + grove_coordinate_offset_y_mm;

function grove_center_x_mm(socket_data_mm) =
    seeed_user_x_to_model_x_mm(socket_data_mm[1]);

function grove_center_y_mm(socket_data_mm) =
    seeed_user_y_to_model_y_mm(socket_data_mm[2]);

function seeed_gpio_pin_x_mm(pin_row) =
    gpio_pin_row_zero_x_mm + pin_row * gpio_pin_pitch_mm;

function seeed_gpio_pin_y_mm(pin_column) =
    -gpio_column_span_half_mm + pin_column * gpio_pin_pitch_mm;
