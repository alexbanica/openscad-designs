// Waveshare ETH/USB HUB HAT reference model.
//
// Units: mm
// Origin: centre of PCB, bottom face. X follows board length, Y follows board width.
// Orientation: GPIO header is near +Y, RJ45 and front USB-A connectors face -Y,
// side USB-A connectors face +/-X.
// This is an adjustable fit and clearance reference, not a vendor-certified model.

// ======================================================
// Adjustable Parameters
// ======================================================

// Render controls
$fn = 48;
render_mode = "assembly"; // [assembly/hat/micro_usb_adapter/printable_layout]
show_electronics = true;
show_micro_usb_adapter = true;
show_gpio_header = true;

// Board dimensions
hat_board_length_mm = 65.0;
hat_board_width_mm = 30.0;
hat_board_thickness_mm = 1.6;
hat_board_corner_radius_mm = 1.5;

// Mounting holes
hat_mounting_hole_diameter_mm = 3.0;
hat_mounting_hole_edge_offset_mm = 3.5;

// GPIO header/reference dimensions
hat_gpio_pin_columns = 20;
hat_gpio_pin_rows = 2;
hat_gpio_pin_pitch_mm = 2.54;
hat_gpio_pin_size_mm = 0.64;
hat_gpio_pin_height_mm = 8.5;
hat_gpio_header_block_length_mm = 51.0;
hat_gpio_header_block_width_mm = 5.1;
hat_gpio_header_block_height_mm = 2.5;

// Connector dimensions and positions
hat_rj45_center_x_mm = -16.0;
hat_rj45_width_x_mm = 14.7;
hat_rj45_depth_y_mm = 11.7;
hat_rj45_height_mm = 13.0;
hat_rj45_below_board_extent_mm = 1.3;

hat_front_rj45_to_usb_a_margin_mm = 3.75;
hat_front_usb_a_width_x_mm = 13.2;
hat_front_usb_a_depth_y_mm = 5.7;
hat_front_usb_a_height_mm = 7.0;

hat_side_usb_a_center_y_mm = -4.5;
hat_side_usb_a_depth_x_mm = 5.7;
hat_side_usb_a_width_y_mm = 13.2;
hat_side_usb_a_height_mm = 7.0;

hat_bottom_micro_usb_center_x_mm = 8.9;
hat_bottom_micro_usb_center_y_mm = -11.0;
hat_bottom_micro_usb_size_mm = [7.5, 5.5, 3.0];

// LED and component preview dimensions
hat_led_size_mm = [1.6, 0.9, 0.7];
hat_led_label_height_mm = 0.2;
hat_led_label_size_mm = 1.8;
hat_led_positions_mm = [
    ["PWR", 24.5, 8.5, "Red"],
    ["ACT", 24.5, 6.0, "GreenYellow"],
    ["D1", 24.5, 3.5, "Lime"],
    ["D2", 24.5, 1.0, "Lime"],
    ["D3", 24.5, -1.5, "Lime"]
];

hat_component_clearance_blocks_mm = [
    [-6.0, 5.6, 9.0, 4.0, 1.8, "DimGray"],
    [14.5, 5.2, 7.0, 4.0, 1.4, "Black"],
    [-24.0, 5.4, 5.0, 4.0, 1.4, "Black"],
    [3.0, 4.4, 6.0, 3.0, 1.2, "DarkSlateGray"]
];

// Micro USB bridge adapter dimensions
micro_usb_adapter_body_width_x_mm = 8.6;
micro_usb_adapter_body_depth_y_mm = 1.0;
micro_usb_adapter_body_height_z_mm = 12.2;
micro_usb_adapter_plug_width_x_mm = 6.5;
micro_usb_adapter_plug_depth_y_mm = 8.0;
micro_usb_adapter_plug_height_z_mm = 1.46;
micro_usb_adapter_plug_center_spacing_z_mm = 8.70;

// Printable layout
printable_layout_spacing_mm = 28.0;

// Visual settings
hat_board_colour = "LimeGreen";
hat_connector_colour = "Silver";
hat_component_colour = "DimGray";
hat_gpio_header_colour = "Black";
hat_gpio_pin_colour = "Gold";
hat_mounting_hole_colour = "White";
hat_label_colour = "White";
micro_usb_adapter_plug_colour = "Silver";
micro_usb_adapter_body_colour = "MidnightBlue";

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
hat_gpio_pin_first_x_mm = -(19 * hat_gpio_pin_pitch_mm / 2);
hat_gpio_pin_first_y_mm = hat_mounting_hole_y_mm - hat_gpio_pin_pitch_mm / 2;
hat_gpio_grid_center_x_mm =
    hat_gpio_pin_first_x_mm + (hat_gpio_pin_columns - 1) * hat_gpio_pin_pitch_mm / 2;
hat_gpio_grid_center_y_mm =
    hat_gpio_pin_first_y_mm + (hat_gpio_pin_rows - 1) * hat_gpio_pin_pitch_mm / 2;
hat_gpio_header_origin_x_mm = hat_gpio_grid_center_x_mm - hat_gpio_header_block_length_mm / 2;
hat_gpio_header_origin_y_mm = hat_gpio_grid_center_y_mm - hat_gpio_header_block_width_mm / 2;
hat_rj45_center_y_mm = -hat_board_half_width_mm + hat_rj45_depth_y_mm / 2;
hat_rj45_total_height_mm = hat_board_thickness_mm + hat_rj45_height_mm + hat_rj45_below_board_extent_mm;
hat_rj45_center_z_mm = (hat_board_thickness_mm + hat_rj45_height_mm - hat_rj45_below_board_extent_mm) / 2;
hat_rj45_size_mm = [
    hat_rj45_width_x_mm,
    hat_rj45_depth_y_mm,
    hat_rj45_total_height_mm
];
hat_front_usb_a_center_x_mm =
    hat_rj45_center_x_mm
    + hat_rj45_width_x_mm / 2
    + hat_front_rj45_to_usb_a_margin_mm
    + hat_front_usb_a_width_x_mm / 2;
hat_front_usb_a_center_y_mm = -hat_board_half_width_mm + hat_front_usb_a_depth_y_mm / 2;
hat_front_usb_a_size_mm = [
    hat_front_usb_a_width_x_mm,
    hat_front_usb_a_depth_y_mm,
    hat_front_usb_a_height_mm
];
hat_side_usb_a_size_mm = [
    hat_side_usb_a_depth_x_mm,
    hat_side_usb_a_width_y_mm,
    hat_side_usb_a_height_mm
];
hat_left_usb_a_center_x_mm = -hat_board_half_length_mm;
hat_right_usb_a_center_x_mm = hat_board_half_length_mm;
hat_bottom_micro_usb_center_z_mm = -hat_bottom_micro_usb_size_mm[2] / 2;
micro_usb_adapter_center_x_mm = hat_bottom_micro_usb_center_x_mm;
micro_usb_adapter_center_y_mm =
    -hat_board_half_width_mm - micro_usb_adapter_body_depth_y_mm / 2;
micro_usb_adapter_top_plug_offset_z_mm = micro_usb_adapter_plug_center_spacing_z_mm / 2;
micro_usb_adapter_bottom_plug_offset_z_mm = -micro_usb_adapter_plug_center_spacing_z_mm / 2;
micro_usb_adapter_center_z_mm = hat_bottom_micro_usb_center_z_mm - micro_usb_adapter_top_plug_offset_z_mm;
micro_usb_adapter_plug_center_y_offset_mm =
    (micro_usb_adapter_plug_depth_y_mm + micro_usb_adapter_body_depth_y_mm) / 2;

// ======================================================
// Render Dispatch
// ======================================================

if (render_mode == "assembly") {
    waveshare_eth_usb_hub_hat_reference_model();
} else if (render_mode == "hat") {
    waveshare_eth_usb_hub_hat_reference_model(show_adapter = false);
} else if (render_mode == "micro_usb_adapter") {
    waveshare_micro_usb_bridge_adapter_reference();
} else if (render_mode == "printable_layout") {
    waveshare_eth_usb_hub_hat_printable_layout();
} else {
    waveshare_eth_usb_hub_hat_reference_model();
}

// ======================================================
// Main Reference Model
// ======================================================

module waveshare_eth_usb_hub_hat_reference_model(
    show_hat_electronics = show_electronics,
    show_adapter = show_micro_usb_adapter,
    show_header = show_gpio_header
) {
    waveshare_eth_usb_hub_hat_board_reference();

    if (show_hat_electronics) {
        waveshare_eth_usb_hub_hat_connector_reference();
        waveshare_eth_usb_hub_hat_component_reference();
        waveshare_eth_usb_hub_hat_led_reference();
        waveshare_eth_usb_hub_hat_bottom_micro_usb_interface();
    }

    if (show_header) {
        waveshare_eth_usb_hub_hat_gpio_reference();
    }

    if (show_adapter) {
        waveshare_micro_usb_bridge_adapter_reference(
            center_x_mm = micro_usb_adapter_center_x_mm,
            center_y_mm = micro_usb_adapter_center_y_mm,
            center_z_mm = micro_usb_adapter_center_z_mm
        );
    }
}

module waveshare_eth_usb_hub_hat_board_reference() {
    color(hat_board_colour)
    difference() {
        waveshare_centered_rounded_box(
            [hat_board_length_mm, hat_board_width_mm, hat_board_thickness_mm],
            hat_board_corner_radius_mm
        );

        for (hole_x_mm = [-hat_mounting_hole_x_mm, hat_mounting_hole_x_mm])
        for (hole_y_mm = [-hat_mounting_hole_y_mm, hat_mounting_hole_y_mm]) {
            waveshare_pcb_hole(hole_x_mm, hole_y_mm, hat_mounting_hole_diameter_mm);
        }
    }

    for (hole_x_mm = [-hat_mounting_hole_x_mm, hat_mounting_hole_x_mm])
    for (hole_y_mm = [-hat_mounting_hole_y_mm, hat_mounting_hole_y_mm]) {
        color(hat_mounting_hole_colour)
        translate([hole_x_mm, hole_y_mm, hat_board_thickness_mm + 0.03])
            cylinder(h = 0.06, d = hat_mounting_hole_diameter_mm, center = true);
    }
}

module waveshare_eth_usb_hub_hat_connector_reference() {
    waveshare_through_board_component(
        [hat_rj45_center_x_mm, hat_rj45_center_y_mm],
        hat_rj45_size_mm,
        hat_rj45_center_z_mm,
        hat_connector_colour
    );

    waveshare_top_component(
        [hat_front_usb_a_center_x_mm, hat_front_usb_a_center_y_mm],
        hat_front_usb_a_size_mm,
        hat_connector_colour
    );

    waveshare_top_component(
        [hat_left_usb_a_center_x_mm, hat_side_usb_a_center_y_mm],
        hat_side_usb_a_size_mm,
        hat_connector_colour
    );

    waveshare_top_component(
        [hat_right_usb_a_center_x_mm, hat_side_usb_a_center_y_mm],
        hat_side_usb_a_size_mm,
        hat_connector_colour
    );
}

module waveshare_eth_usb_hub_hat_bottom_micro_usb_interface() {
    color(hat_connector_colour)
    translate([
        hat_bottom_micro_usb_center_x_mm,
        hat_bottom_micro_usb_center_y_mm,
        hat_bottom_micro_usb_center_z_mm
    ])
        cube(hat_bottom_micro_usb_size_mm, center = true);
}

module waveshare_eth_usb_hub_hat_component_reference() {
    for (component_mm = hat_component_clearance_blocks_mm) {
        waveshare_top_component(
            [component_mm[0], component_mm[1]],
            [component_mm[2], component_mm[3], component_mm[4]],
            component_mm[5]
        );
    }
}

module waveshare_eth_usb_hub_hat_led_reference() {
    for (led_mm = hat_led_positions_mm) {
        color(led_mm[3])
        translate([led_mm[1], led_mm[2], hat_board_thickness_mm + hat_led_size_mm[2] / 2])
            cube(hat_led_size_mm, center = true);

        waveshare_top_label(
            led_mm[0],
            [led_mm[1] - 2.6, led_mm[2] - hat_led_size_mm[1] / 2, hat_board_thickness_mm + hat_led_size_mm[2]]
        );
    }
}

module waveshare_eth_usb_hub_hat_gpio_reference() {
    color(hat_gpio_header_colour)
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
        color(hat_gpio_pin_colour)
        translate([
            hat_gpio_pin_first_x_mm + pin_column * hat_gpio_pin_pitch_mm - hat_gpio_pin_size_mm / 2,
            hat_gpio_pin_first_y_mm + pin_row * hat_gpio_pin_pitch_mm - hat_gpio_pin_size_mm / 2,
            hat_board_thickness_mm + hat_gpio_header_block_height_mm
        ])
            cube([
                hat_gpio_pin_size_mm,
                hat_gpio_pin_size_mm,
                hat_gpio_pin_height_mm
            ]);
    }
}

module waveshare_micro_usb_bridge_adapter_reference(
    center_x_mm = 0,
    center_y_mm = 0,
    center_z_mm = 0
) {
    color(micro_usb_adapter_body_colour)
    translate([center_x_mm, center_y_mm, center_z_mm])
        cube([
            micro_usb_adapter_body_width_x_mm,
            micro_usb_adapter_body_depth_y_mm,
            micro_usb_adapter_body_height_z_mm
        ], center = true);

    for (plug_offset_z_mm = [
        micro_usb_adapter_top_plug_offset_z_mm,
        micro_usb_adapter_bottom_plug_offset_z_mm
    ]) {
        color(micro_usb_adapter_plug_colour)
        translate([
            center_x_mm,
            center_y_mm + micro_usb_adapter_plug_center_y_offset_mm,
            center_z_mm + plug_offset_z_mm
        ])
            cube([
                micro_usb_adapter_plug_width_x_mm,
                micro_usb_adapter_plug_depth_y_mm,
                micro_usb_adapter_plug_height_z_mm
            ], center = true);
    }
}

module waveshare_eth_usb_hub_hat_printable_layout() {
    translate([
        -hat_board_half_length_mm - printable_layout_spacing_mm / 2,
        0,
        0
    ])
        waveshare_eth_usb_hub_hat_reference_model(show_adapter = false);

    translate([
        hat_board_half_length_mm + printable_layout_spacing_mm / 2,
        0,
        micro_usb_adapter_body_height_z_mm / 2
    ])
        waveshare_micro_usb_bridge_adapter_reference(
            center_x_mm = 0,
            center_y_mm = 0,
            center_z_mm = 0
        );
}

// ======================================================
// Helper Modules
// ======================================================

module waveshare_centered_rounded_box(size_mm, radius_mm) {
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

module waveshare_pcb_hole(x_position_mm, y_position_mm, diameter_mm) {
    translate([x_position_mm, y_position_mm, hat_board_half_thickness_mm])
        cylinder(
            h = hat_board_thickness_mm + 0.2,
            d = diameter_mm,
            center = true
        );
}

module waveshare_top_component(center_xy_mm, size_mm, colour = hat_component_colour) {
    color(colour)
    translate([
        center_xy_mm[0],
        center_xy_mm[1],
        hat_board_thickness_mm + size_mm[2] / 2
    ])
        cube(size_mm, center = true);
}

module waveshare_through_board_component(center_xy_mm, size_mm, center_z_mm, colour = hat_component_colour) {
    color(colour)
    translate([
        center_xy_mm[0],
        center_xy_mm[1],
        center_z_mm
    ])
        cube(size_mm, center = true);
}

module waveshare_top_label(label_text, origin_mm) {
    color(hat_label_colour)
    translate(origin_mm)
        linear_extrude(height = hat_led_label_height_mm)
            text(label_text, size = hat_led_label_size_mm, halign = "right", valign = "center");
}
