//  Pi Zero model for checking other models
//  0,0,0 is centre of PCB, bottom face
//  This model is for V1.2, 1.3, W1.1 & WH

// By misterC @ thingiverse

// Units: mm

// ======================================================
// Adjustable Parameters
// ======================================================

// Render controls
$fn = 60;
show_pi_zero_reference = true;

// Pi Zero version and feature visibility
pi_zero_version = "1.3"; // [1.2/1.3/W1.1/WH]
show_pi_zero_test_pads = true;
show_pi_zero_gpio_header = 1; // 0 = hide, 1 = show above, -1 = show below; WH always shows above
show_pi_zero_gpio_sound_vision_pads = false;
show_pi_zero_gpio_pin_colours = false;

// Board dimensions
pi_zero_board_length_mm = 65;
pi_zero_board_width_mm = 30;
pi_zero_board_thickness_mm = 1.6;
pi_zero_board_corner_radius_mm = 3.0;

// Mounting holes
pi_zero_mounting_hole_edge_offset_mm = 3.5;
pi_zero_mounting_hole_diameter_mm = 2.75;
pi_zero_mounting_hole_clearance_radius_mm = 3.0;

// GPIO header and pin dimensions
pi_zero_gpio_header_block_length_mm = 2.5;
pi_zero_gpio_header_block_width_mm = 2.5;
pi_zero_gpio_header_block_height_mm = 2.5;
pi_zero_gpio_pin_length_mm = 0.7;
pi_zero_gpio_pin_width_mm = 0.7;
pi_zero_gpio_pin_height_mm = 11.75;
pi_zero_gpio_pin_vertical_offset_mm = 3; // measured, pins are not symmetrical
pi_zero_gpio_pin_pitch_mm = 2.54;
pi_zero_gpio_pin_half_pitch_mm = 1.27;
pi_zero_gpio_hole_diameter_mm = 1.2;

// Connector and component preview dimensions
pi_zero_micro_sd_holder_mm = [-24.5, 1.9, 11.5, 12.0, 1.3, "Silver"];
pi_zero_usb_data_connector_mm = [8.9, -13, 7.5, 5.0, 2.5, "Silver"];
pi_zero_usb_power_connector_mm = [21.5, -13, 7.5, 5.0, 2.5, "Silver"];
pi_zero_hdmi_connector_mm = [-20.1, -11.4, 11.25, 7.25, 3.3, "Silver"];
pi_zero_camera_connector_body_mm = [30, 0, 3, 17, 1.3, "Ivory"];
pi_zero_camera_connector_latch_mm = [32, 0, 1.6, 17, 1.3, "DimGray"];
pi_zero_activity_led_v12_mm = [30.9, -7.2, 1, 2.3, 1, "GreenYellow"];
pi_zero_activity_led_later_mm = [26.5, -8, 2.3, 1, 1, "GreenYellow"];
pi_zero_soc_standard_x_mm = -2.5;
pi_zero_soc_wireless_x_mm = -7.1;
pi_zero_soc_mm = [12, 12, 1.2, "Black"];
pi_zero_wifi_antenna_points_mm = [
    [-6.5, -11.4],
    [1.5, -11.4],
    [-1.5, -13.5],
    [-4, -13.5],
    [-6.5, -11.4]
];

// Test-pad preview data
pi_zero_test_pad_data_mm = [
    [1, "+5V", 21.0, -8.7, 2.25, "Red"], // PP1 X varies slightly but only about 0.5mm
    [6, "GND", 21.25, -11.1, 2.25, "Black"],
    [22, "Data +", 9.4, -13, 1.75, "White"],
    [23, "Data -", 7.4, -13, 1.75, "SpringGreen"]
];

// Visual settings
pi_zero_board_colour = "LimeGreen";
pi_zero_gpio_header_colour = "Black";
pi_zero_gpio_pin_colour = "Gold";
pi_zero_wifi_antenna_colour = "DarkGreen";
pi_zero_gpio_reference_colours = [
    ["Orange", "Red"],
    ["Cyan", "Red"],
    ["Cyan", "Black"],
    ["DarkGreen", "PaleGreen"],
    ["Black", "PaleGreen"],
    ["DarkGreen", "DarkGreen"],
    ["DarkGreen", "Black"],
    ["DarkGreen", "DarkGreen"],
    ["Orange", "DarkGreen"],
    ["Magenta", "Black"],
    ["Magenta", "DarkGreen"],
    ["Magenta", "Magenta"],
    ["Black", "Magenta"],
    ["Yellow", "Yellow"],
    ["DarkGreen", "Black"],
    ["DarkGreen", "DarkGreen"],
    ["DarkGreen", "Black"],
    ["DarkGreen", "DarkGreen"],
    ["DarkGreen", "DarkGreen"],
    ["Black", "DarkGreen"]
];

// ======================================================
// Derived Values
// ======================================================

pi_zero_mounting_hole_radius_mm = pi_zero_mounting_hole_diameter_mm / 2;
pi_zero_mounting_hole_x_mm = pi_zero_board_length_mm / 2 - pi_zero_mounting_hole_edge_offset_mm;
pi_zero_mounting_hole_y_mm = pi_zero_board_width_mm / 2 - pi_zero_mounting_hole_edge_offset_mm;
pi_zero_board_half_thickness_mm = pi_zero_board_thickness_mm / 2;
pi_zero_gpio_pad_center_offset_mm = pi_zero_board_half_thickness_mm + pi_zero_gpio_header_block_height_mm / 2;
pi_zero_gpio_pin_center_offset_mm = pi_zero_board_half_thickness_mm + pi_zero_gpio_pin_height_mm / 2 - pi_zero_gpio_pin_vertical_offset_mm;
pi_zero_activity_led_mm = (pi_zero_version == "1.2") ? pi_zero_activity_led_v12_mm : pi_zero_activity_led_later_mm;
pi_zero_soc_x_mm = is_pi_zero_wireless_version() ? pi_zero_soc_wireless_x_mm : pi_zero_soc_standard_x_mm;
pi_zero_soc_component_mm = [
    pi_zero_soc_x_mm,
    -2,
    pi_zero_soc_mm[0],
    pi_zero_soc_mm[1],
    pi_zero_soc_mm[2],
    pi_zero_soc_mm[3]
];

// ======================================================
// Main Reference Model
// ======================================================

module pi_zero_reference_model(
    show_reference = show_pi_zero_reference,
    show_test_pads = show_pi_zero_test_pads,
    show_gpio_header_position = show_pi_zero_gpio_header,
    show_gpio_sound_vision_pads = show_pi_zero_gpio_sound_vision_pads,
    show_gpio_pin_colours = show_pi_zero_gpio_pin_colours
) {
    if (show_reference) {
        pi_zero_board_reference();

        if (show_test_pads) {
            pi_zero_test_pad_reference();
        }

        if (pi_zero_version == "WH") {
            pi_zero_gpio_reference(
                header_position = 1,
                show_sound_vision_pads = show_gpio_sound_vision_pads,
                show_pin_colours = show_gpio_pin_colours
            );
        } else if (show_gpio_header_position != 0) {
            pi_zero_gpio_reference(
                header_position = show_gpio_header_position,
                show_sound_vision_pads = show_gpio_sound_vision_pads,
                show_pin_colours = show_gpio_pin_colours
            );
        }
    }
}

module pi_zero_board_reference() {
    color(pi_zero_board_colour)
    difference() {
        hull()
        for (x_position_mm = [-pi_zero_mounting_hole_x_mm, pi_zero_mounting_hole_x_mm])
        for (y_position_mm = [-pi_zero_mounting_hole_y_mm, pi_zero_mounting_hole_y_mm]) {
            translate([x_position_mm, y_position_mm, pi_zero_board_half_thickness_mm])
                cylinder(
                    r = pi_zero_board_corner_radius_mm,
                    h = pi_zero_board_thickness_mm,
                    center = true
                );
        }

        for (x_position_mm = [-pi_zero_mounting_hole_x_mm, pi_zero_mounting_hole_x_mm])
        for (y_position_mm = [-pi_zero_mounting_hole_y_mm, pi_zero_mounting_hole_y_mm]) {
            pi_zero_pcb_hole(x_position_mm, y_position_mm, pi_zero_mounting_hole_diameter_mm);
        }

        for (pin_column = [0:19])
        for (pin_row = [0, 1]) {
            pi_zero_pcb_hole(
                pi_zero_gpio_pin_x_mm(pin_column),
                pi_zero_gpio_pin_y_mm(pin_row),
                pi_zero_gpio_hole_diameter_mm
            );
        }

        for (pin_column = [18, 19])
        for (pin_row = [-1, -2]) {
            pi_zero_pcb_hole(
                pi_zero_gpio_pin_x_mm(pin_column),
                pi_zero_gpio_pin_y_mm(pin_row),
                pi_zero_gpio_hole_diameter_mm
            );
        }
    }

    pi_zero_component_reference(pi_zero_soc_component_mm);
    pi_zero_component_reference(pi_zero_micro_sd_holder_mm);
    pi_zero_component_reference(pi_zero_hdmi_connector_mm);
    pi_zero_component_reference(pi_zero_usb_data_connector_mm);
    pi_zero_component_reference(pi_zero_usb_power_connector_mm);
    pi_zero_component_reference(pi_zero_activity_led_mm);

    if (pi_zero_version != "1.2") {
        pi_zero_component_reference(pi_zero_camera_connector_body_mm);
        pi_zero_component_reference(pi_zero_camera_connector_latch_mm);
    }

    if (is_pi_zero_wireless_version()) {
        color(pi_zero_wifi_antenna_colour)
        translate([0, 0, 0.1])
            linear_extrude(height = pi_zero_board_thickness_mm)
                polygon(points = pi_zero_wifi_antenna_points_mm);
    }
}

module pi_zero_test_pad_reference() {
    for (pad_data_mm = pi_zero_test_pad_data_mm) {
        pi_zero_draw_test_pad(pad_data_mm);
    }
}

module pi_zero_gpio_reference(
    header_position = show_pi_zero_gpio_header,
    show_sound_vision_pads = show_pi_zero_gpio_sound_vision_pads,
    show_pin_colours = show_pi_zero_gpio_pin_colours
) {
    pad_z_mm = pi_zero_board_half_thickness_mm + header_position * pi_zero_gpio_pad_center_offset_mm;
    pin_z_mm = pi_zero_board_half_thickness_mm + header_position * pi_zero_gpio_pin_center_offset_mm;

    for (pin_column = [0:19])
    for (pin_row = [0, 1]) {
        pin_colour = show_pin_colours ? pi_zero_gpio_reference_colours[pin_column][pin_row] : pi_zero_gpio_pin_colour;
        pi_zero_pcb_pin(
            pi_zero_gpio_pin_x_mm(pin_column),
            pi_zero_gpio_pin_y_mm(pin_row),
            pad_z_mm,
            pin_z_mm,
            pin_colour
        );
    }

    if (show_sound_vision_pads) {
        for (pin_column = [18, 19])
        for (pin_row = [-1, -2]) {
            pi_zero_pcb_pin(
                pi_zero_gpio_pin_x_mm(pin_column),
                pi_zero_gpio_pin_y_mm(pin_row),
                pad_z_mm,
                pin_z_mm,
                pi_zero_gpio_pin_colour
            );
        }
    }
}

// ======================================================
// Helper Modules And Functions
// ======================================================

module pi_zero_draw_test_pad(pad_data_mm) {
    translate([pad_data_mm[2], pad_data_mm[3], pi_zero_board_thickness_mm / 4])
        color(pad_data_mm[5])
            cylinder(
                h = pi_zero_board_thickness_mm * 2 / 3,
                d = pad_data_mm[4],
                center = true
            );
}

module pi_zero_pcb_hole(x_position_mm, y_position_mm, diameter_mm) {
    translate([x_position_mm, y_position_mm, pi_zero_board_half_thickness_mm])
        cylinder(
            h = 2 * pi_zero_board_thickness_mm,
            d = diameter_mm,
            center = true
        );
}

module pi_zero_component_reference(component_data_mm) {
    translate([
        component_data_mm[0],
        component_data_mm[1],
        pi_zero_board_thickness_mm + component_data_mm[4] / 2
    ])
        color(component_data_mm[5])
            cube([component_data_mm[2], component_data_mm[3], component_data_mm[4]], center = true);
}

module pi_zero_pcb_pin(x_position_mm, y_position_mm, pad_z_mm, pin_z_mm, pin_colour) {
    translate([x_position_mm, y_position_mm, pad_z_mm])
        color(pi_zero_gpio_header_colour)
            cube([
                pi_zero_gpio_header_block_length_mm,
                pi_zero_gpio_header_block_width_mm,
                pi_zero_gpio_header_block_height_mm
            ], center = true);

    translate([x_position_mm, y_position_mm, pin_z_mm])
        color(pin_colour)
            cube([
                pi_zero_gpio_pin_length_mm,
                pi_zero_gpio_pin_width_mm,
                pi_zero_gpio_pin_height_mm
            ], center = true);
}

function pi_zero_gpio_pin_x_mm(pin_column) =
    -(19 * pi_zero_gpio_pin_half_pitch_mm) + pin_column * pi_zero_gpio_pin_pitch_mm;

function pi_zero_gpio_pin_y_mm(pin_row) =
    pi_zero_mounting_hole_y_mm - pi_zero_gpio_pin_half_pitch_mm + pin_row * pi_zero_gpio_pin_pitch_mm;

function is_pi_zero_wireless_version() =
    search("W", pi_zero_version) == [0];

// ======================================================
// Standalone Preview
// ======================================================

pi_zero_reference_model();
