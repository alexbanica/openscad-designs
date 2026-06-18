// Raspberry Pi AI HAT+ 26T (Hailo-8, 26 TOPS) reference model.
//
// Units: mm.
// This is a planning geometry reference, not a vendor-accurate CAD.

use <rpi5.scad>
use <rpi5_active_cooler.scad>
rpi5_board_thickness_reference_mm = is_undef(rpi5_board_thickness_mm)
    ? 1.6
    : rpi5_board_thickness_mm;

// ======================================================
// Adjustable Parameters
// ======================================================

// Render controls
$fn = 48;
render_mode = "assembly"; // [assembly/hat/cooling/printable_layout]
show_rpi5_reference = true;
show_rpi5_active_cooler = true;
show_ai_hat_electronics = true;
show_ai_hat_cooler = true;
show_gpio_stack = true;
show_pcie_guidance = true;
show_labels = true;
show_clearance_guides = true;

// AI HAT+ board
ai_hat_board_length_mm = 65.0;
ai_hat_board_width_mm = 56.5;
ai_hat_board_thickness_mm = 1.6;
ai_hat_board_corner_radius_mm = 1.5;

// Mounting
ai_hat_mounting_hole_diameter_mm = 2.75;
ai_hat_mounting_hole_positions_mm = [
    [3.5, 3.5],
    [61.5, 3.5],
    [3.5, 52.5],
    [61.5, 52.5]
];

// Stacking
ai_hat_stack_distance_mm = 20.0;
ai_hat_header_pin_height_mm = 23.0;

// GPIO/header stack
ai_hat_gpio_header_origin_mm = [7, 49, ai_hat_board_thickness_mm];
ai_hat_gpio_header_size_mm = [51, 5, 2.5];
ai_hat_gpio_pin_origin_x_mm = 8;
ai_hat_gpio_pin_origin_y_mm = 50;
ai_hat_gpio_pin_pitch_mm = 2.54;
ai_hat_gpio_pin_size_mm = 0.64;
ai_hat_gpio_pin_count_x = 20;
ai_hat_gpio_pin_count_y = 2;

// AI accelerator package and board electronics
ai_hat_npu_package_origin_mm = [31.0, 18.0, ai_hat_board_thickness_mm];
ai_hat_npu_package_size_mm = [17.0, 17.0, 4.0];
ai_hat_npu_connection_origin_mm = [
    ai_hat_npu_package_origin_mm[0] + 5.0,
    ai_hat_npu_package_origin_mm[1] + ai_hat_npu_package_size_mm[1] - 0.01,
    ai_hat_board_thickness_mm + ai_hat_npu_package_size_mm[2]
];
ai_hat_npu_connection_size_mm = [7.0, 3.0, 2.5];
ai_hat_npu_package_colour = "LightSteelBlue";
ai_hat_npu_connection_colour = "DarkSlateGray";

// Adjustable top-side board details (simplified placeholders)
ai_hat_component_blocks_mm = [
    [9.0, 6.0, 7.0, 4.0, 3.0, "DimGray"],
    [18.0, 40.0, 7.5, 6.5, 1.4, "Black"],
    [4.0, 21.5, 7.0, 3.8, 2.2, "Black"],
    [45.0, 8.0, 5.5, 3.0, 2.0, "DarkSlateGray"]
];

// AI HAT cooler
ai_hat_cooler_origin_mm = [4.0, 8.5, ai_hat_board_thickness_mm + 1.2];
ai_hat_cooler_size_mm = [58.5, 35.0];
ai_hat_cooler_base_height_mm = 2.8;
ai_hat_cooler_fin_height_mm = 4.8;
ai_hat_cooler_fin_count = 8;
ai_hat_cooler_fin_spacing_mm = 4.3;
ai_hat_cooler_fin_origin_offset_mm = [2.4, 1.4];
ai_hat_cooler_fin_size_mm = [1.0, ai_hat_cooler_size_mm[1] - 3.5, ai_hat_cooler_fin_height_mm];
ai_hat_cooler_fan_size_mm = 20.0;
ai_hat_cooler_fan_height_mm = 3.8;
ai_hat_cooler_fan_origin_offset_mm = [21.0, 7.4, -1.5];
ai_hat_cooler_fan_opening_height_mm = 0.6;
ai_hat_cooler_fan_opening_diameter_mm = 14.5;
ai_hat_cooler_fan_hub_height_mm = 0.9;
ai_hat_cooler_fan_hub_diameter_mm = 4.5;
ai_hat_cooler_push_pin_positions_mm = [
    [10.0, 6.0],
    [48.0, 36.5]
];
ai_hat_cooler_push_pin_height_mm = 7.5;
ai_hat_cooler_push_pin_diameter_mm = 3.2;
ai_hat_cooler_soc_pad_origin_mm = [34.0, 22.0, ai_hat_board_thickness_mm + 0.2];
ai_hat_cooler_soc_pad_size_mm = [12.0, 12.0, 0.6];
ai_hat_cooler_fan_cable_offset_mm = [14.0, 2.8, 0.9];
ai_hat_cooler_fan_cable_spacing_mm = 1.4;
ai_hat_cooler_fan_cable_size_mm = [7.0, 0.7, 0.7];

// PCIe guidance
ai_hat_pcie_connector_origin_mm = [14.0, 1.0, ai_hat_board_thickness_mm];
ai_hat_pcie_connector_size_mm = [24.0, 4.0, 4.5];
ai_hat_pcie_cable_origin_mm = [12.0, -4.0, ai_hat_board_thickness_mm + 4.0];
ai_hat_pcie_cable_path_size_mm = [5.0, 4.0, 11.0];
ai_hat_pcie_flex_origin_mm = [12.0, -4.0, ai_hat_board_thickness_mm + 7.0];
ai_hat_pcie_flex_size_mm = [4.0, 7.0, 16.0];
ai_hat_pcie_connector_colour = "SlateGray";

// Layout
ai_hat_printable_layout_spacing_mm = 90.0;

// Visual settings
ai_hat_board_colour = "LimeGreen";
ai_hat_connector_colour = "Silver";
ai_hat_mounting_hole_colour = "White";
ai_hat_gpio_header_colour = "Black";
ai_hat_gpio_pin_colour = "Gold";
ai_hat_label_colour = "White";
ai_hat_clearance_colour = [0.03, 0.48, 0.90, 0.18];
ai_hat_stack_clearance_colour = [0.00, 0.66, 0.00, 0.12];

ai_hat_cooler_base_colour = "Silver";
ai_hat_cooler_fin_colour = "Gainsboro";
ai_hat_cooler_fan_colour = "Black";
ai_hat_cooler_fan_opening_colour = "DimGray";
ai_hat_cooler_thermal_pad_colour = [0.45, 0.95, 1, 0.36];

// ======================================================
// Derived Values
// ======================================================

ai_hat_board_stack_z_mm = rpi5_board_thickness_reference_mm + ai_hat_stack_distance_mm;
ai_hat_board_half_length_mm = ai_hat_board_length_mm / 2;
ai_hat_board_half_width_mm = ai_hat_board_width_mm / 2;

ai_hat_cooler_total_height_mm = ai_hat_cooler_base_height_mm + ai_hat_cooler_fin_height_mm;

ai_hat_cooler_fan_origin_mm = [
    ai_hat_cooler_origin_mm[0] + ai_hat_cooler_fan_origin_offset_mm[0],
    ai_hat_cooler_origin_mm[1] + ai_hat_cooler_fan_origin_offset_mm[1],
    ai_hat_cooler_origin_mm[2] + ai_hat_cooler_total_height_mm + ai_hat_cooler_fan_origin_offset_mm[2]
];
ai_hat_cooler_fan_cable_origin_mm = [
    ai_hat_cooler_fan_origin_mm[0] + ai_hat_cooler_fan_cable_offset_mm[0],
    ai_hat_cooler_fan_origin_mm[1] + ai_hat_cooler_fan_cable_offset_mm[1],
    ai_hat_cooler_fan_origin_mm[2] + ai_hat_cooler_fan_cable_offset_mm[2]
];
ai_hat_cooler_fan_cable_black_origin_mm = [
    ai_hat_cooler_fan_cable_origin_mm[0],
    ai_hat_cooler_fan_cable_origin_mm[1] + ai_hat_cooler_fan_cable_spacing_mm,
    ai_hat_cooler_fan_cable_origin_mm[2]
];

ai_hat_active_cooler_clearance_height_mm = max(
    0,
    ai_hat_board_stack_z_mm - rpi5_active_cooler_origin_mm()[2]
);

// ======================================================
// Render Dispatch
// ======================================================

if (render_mode == "assembly") {
    rpi5_ai_hat_plus_26t_reference_model();
} else if (render_mode == "hat") {
    rpi5_ai_hat_plus_26t_reference_model(
        show_rpi5_ref = false,
        show_ai_cooler = false,
        show_gpio = false,
        show_pcie = false,
        show_guides = false
    );
} else if (render_mode == "cooling") {
    rpi5_ai_hat_plus_26t_reference_model(
        show_rpi5_ref = true,
        show_active = true,
        show_ai_electronics = true,
        show_ai_cooler = true,
        show_gpio = true,
        show_pcie = true,
        show_label = true,
        show_guides = true
    );
} else if (render_mode == "printable_layout") {
    rpi5_ai_hat_plus_26t_printable_layout();
} else {
    rpi5_ai_hat_plus_26t_reference_model();
}

// ======================================================
// Main Reference Model
// ======================================================

module rpi5_ai_hat_plus_26t_reference_model(
    show_rpi5_ref = show_rpi5_reference,
    show_active = show_rpi5_active_cooler,
    show_ai_electronics = show_ai_hat_electronics,
    show_ai_cooler = show_ai_hat_cooler,
    show_gpio = show_gpio_stack,
    show_pcie = show_pcie_guidance,
    show_label = show_labels,
    show_guides = show_clearance_guides
) {
    if (show_rpi5_ref) {
        rpi5_reference_model(
            show_reference = true,
            show_gpio_pins = true,
            show_micro_sd_card = true,
            show_active_cooler = show_active
        );
    }

    translate([0, 0, ai_hat_board_stack_z_mm]) {
        rpi5_ai_hat_plus_26t_board_reference(
            show_components = show_ai_electronics,
            show_labels = show_label
        );

        if (show_gpio) {
            rpi5_ai_hat_plus_26t_gpio_stack_reference();
        }

        if (show_pcie) {
            rpi5_ai_hat_plus_26t_pcie_reference();
        }

        if (show_ai_cooler) {
            rpi5_ai_hat_plus_26t_cooler_reference();
        }
    }

    if (show_guides) {
        rpi5_ai_hat_plus_26t_clearance_guides();
    }
}

module rpi5_ai_hat_plus_26t_board_reference(
    show_components = true,
    show_labels = false
) {
    difference() {
        color(ai_hat_board_colour)
            rpi5_ai_hat_plus_26t_rounded_box(
                [ai_hat_board_length_mm, ai_hat_board_width_mm, ai_hat_board_thickness_mm],
                ai_hat_board_corner_radius_mm
            );

        for (hole_position_mm = ai_hat_mounting_hole_positions_mm) {
            translate([hole_position_mm[0], hole_position_mm[1], -0.1])
                cylinder(
                    h = ai_hat_board_thickness_mm + 0.2,
                    d = ai_hat_mounting_hole_diameter_mm
                );
        }
    }

    if (show_components) {
        rpi5_ai_hat_plus_26t_npu_reference(show_labels = show_labels);
        rpi5_ai_hat_plus_26t_component_reference_blocks();
    }

    if (show_labels) {
        rpi5_ai_hat_plus_26t_label(
            "AI HAT+ (26 TOPS)",
            [4.5, 53.0, ai_hat_board_thickness_mm + 0.2]
        );
    }
}

module rpi5_ai_hat_plus_26t_gpio_stack_reference() {
    color(ai_hat_gpio_header_colour)
    translate(ai_hat_gpio_header_origin_mm)
        cube(ai_hat_gpio_header_size_mm);

    for (pin_row = [0:ai_hat_gpio_pin_count_y - 1]) {
        for (pin_column = [0:ai_hat_gpio_pin_count_x - 1]) {
            color(ai_hat_gpio_pin_colour)
            translate([
                ai_hat_gpio_pin_origin_x_mm + pin_column * ai_hat_gpio_pin_pitch_mm,
                ai_hat_gpio_pin_origin_y_mm + pin_row * ai_hat_gpio_pin_pitch_mm,
                ai_hat_board_thickness_mm + ai_hat_gpio_header_size_mm[2]
            ])
                cube([
                    ai_hat_gpio_pin_size_mm,
                    ai_hat_gpio_pin_size_mm,
                    ai_hat_header_pin_height_mm
                ]);
        }
    }
}

module rpi5_ai_hat_plus_26t_npu_reference(show_labels = false) {
    color(ai_hat_npu_package_colour)
    translate(ai_hat_npu_package_origin_mm)
        cube(ai_hat_npu_package_size_mm);

    rpi5_ai_hat_plus_26t_connector_reference(
        ai_hat_npu_connection_origin_mm,
        ai_hat_npu_connection_size_mm,
        ai_hat_npu_connection_colour
    );

    if (show_labels) {
        rpi5_ai_hat_plus_26t_label(
            "Hailo-8",
            [
                ai_hat_npu_package_origin_mm[0],
                ai_hat_npu_package_origin_mm[1] + ai_hat_npu_package_size_mm[1] + 0.8,
                ai_hat_board_thickness_mm + ai_hat_npu_package_size_mm[2] + 0.2
            ]
        );
    }
}

module rpi5_ai_hat_plus_26t_cooler_reference() {
    color(ai_hat_cooler_base_colour)
    translate(ai_hat_cooler_origin_mm)
        cube([
            ai_hat_cooler_size_mm[0],
            ai_hat_cooler_size_mm[1],
            ai_hat_cooler_base_height_mm
        ]);

    for (fin_index = [0:ai_hat_cooler_fin_count - 1]) {
        color(ai_hat_cooler_fin_colour)
        translate([
            ai_hat_cooler_origin_mm[0] + ai_hat_cooler_fin_origin_offset_mm[0] + fin_index * ai_hat_cooler_fin_spacing_mm,
            ai_hat_cooler_origin_mm[1] + ai_hat_cooler_fin_origin_offset_mm[1],
            ai_hat_cooler_origin_mm[2] + ai_hat_cooler_base_height_mm
        ])
            cube(ai_hat_cooler_fin_size_mm);
    }

    color(ai_hat_cooler_fan_colour)
    translate(ai_hat_cooler_fan_origin_mm)
        cube([
            ai_hat_cooler_fan_size_mm,
            ai_hat_cooler_fan_size_mm,
            ai_hat_cooler_fan_height_mm
        ]);

    color(ai_hat_cooler_fan_opening_colour)
    translate([
        ai_hat_cooler_fan_origin_mm[0] + ai_hat_cooler_fan_size_mm / 2,
        ai_hat_cooler_fan_origin_mm[1] + ai_hat_cooler_fan_size_mm / 2,
        ai_hat_cooler_fan_origin_mm[2] + ai_hat_cooler_fan_height_mm
    ])
        cylinder(
            h = ai_hat_cooler_fan_opening_height_mm,
            d = ai_hat_cooler_fan_opening_diameter_mm
        );

    color(ai_hat_cooler_fan_colour)
    translate([
        ai_hat_cooler_fan_origin_mm[0] + ai_hat_cooler_fan_size_mm / 2,
        ai_hat_cooler_fan_origin_mm[1] + ai_hat_cooler_fan_size_mm / 2,
        rpi5_ai_hat_plus_26t_cooler_fan_hub_top_z_mm()
    ])
        cylinder(
            h = ai_hat_cooler_fan_hub_height_mm,
            d = ai_hat_cooler_fan_hub_diameter_mm
        );

    for (push_pin_position_mm = ai_hat_cooler_push_pin_positions_mm) {
        color(ai_hat_cooler_fan_colour)
        translate([
            push_pin_position_mm[0],
            push_pin_position_mm[1],
            ai_hat_board_thickness_mm
        ])
            cylinder(
                h = ai_hat_cooler_push_pin_height_mm,
                d = ai_hat_cooler_push_pin_diameter_mm
            );
    }

    color(ai_hat_cooler_thermal_pad_colour)
    translate(ai_hat_cooler_soc_pad_origin_mm)
        cube(ai_hat_cooler_soc_pad_size_mm);

    color("red")
    translate(ai_hat_cooler_fan_cable_origin_mm)
        cube(ai_hat_cooler_fan_cable_size_mm);

    color("black")
    translate(ai_hat_cooler_fan_cable_black_origin_mm)
        cube(ai_hat_cooler_fan_cable_size_mm);
}

module rpi5_ai_hat_plus_26t_pcie_reference() {
    color(ai_hat_pcie_connector_colour)
    translate(ai_hat_pcie_connector_origin_mm)
        cube(ai_hat_pcie_connector_size_mm);

    color("Silver")
    translate(ai_hat_pcie_cable_origin_mm)
        cube(ai_hat_pcie_cable_path_size_mm);

    color("Gray")
    translate(ai_hat_pcie_flex_origin_mm)
        cube(ai_hat_pcie_flex_size_mm);
}

module rpi5_ai_hat_plus_26t_component_reference_blocks() {
    for (component_mm = ai_hat_component_blocks_mm) {
        color(component_mm[5])
        translate([component_mm[0], component_mm[1], ai_hat_board_thickness_mm + component_mm[4] / 2])
            cube([component_mm[2], component_mm[3], component_mm[4]]);
    }
}

module rpi5_ai_hat_plus_26t_clearance_guides() {
    color(ai_hat_clearance_colour)
    translate([
        ai_hat_mounting_hole_positions_mm[0][0],
        ai_hat_mounting_hole_positions_mm[0][1],
        0
    ])
        cube([
            ai_hat_board_length_mm - 2 * ai_hat_mounting_hole_positions_mm[0][0],
            ai_hat_board_width_mm - 2 * ai_hat_mounting_hole_positions_mm[0][1],
            ai_hat_board_stack_z_mm
        ]);

    color([1, 0, 0, 0.15])
    translate([
        rpi5_active_cooler_origin_mm()[0],
        rpi5_active_cooler_origin_mm()[1],
        rpi5_active_cooler_origin_mm()[2]
    ])
        cube([
            rpi5_active_cooler_size_mm()[0],
            rpi5_active_cooler_size_mm()[1],
            ai_hat_active_cooler_clearance_height_mm
        ]);

    color([0.0, 0.7, 0.0, 0.12])
    translate([
        ai_hat_cooler_origin_mm[0],
        ai_hat_cooler_origin_mm[1],
        ai_hat_board_stack_z_mm + ai_hat_board_thickness_mm
    ])
        cube([
            ai_hat_cooler_size_mm[0],
            ai_hat_cooler_size_mm[1],
            ai_hat_cooler_base_height_mm
        ]);

    color(ai_hat_stack_clearance_colour)
    translate([
        ai_hat_mounting_hole_positions_mm[0][0],
        ai_hat_mounting_hole_positions_mm[0][1],
        rpi5_board_thickness_reference_mm
    ])
        cube([
            ai_hat_board_length_mm - 2 * ai_hat_mounting_hole_positions_mm[0][0],
            ai_hat_board_width_mm - 2 * ai_hat_mounting_hole_positions_mm[0][1],
            ai_hat_board_stack_z_mm + ai_hat_board_thickness_mm
        ]);
}

module rpi5_ai_hat_plus_26t_printable_layout() {
    translate([
        -ai_hat_printable_layout_spacing_mm / 2 - ai_hat_board_length_mm / 2,
        0,
        0
    ]) {
        rpi5_ai_hat_plus_26t_reference_model(
            show_rpi5_ref = true,
            show_active = true,
            show_ai_cooler = true,
            show_gpio = true,
            show_pcie = true,
            show_guides = false
        );
    }

    translate([
        ai_hat_printable_layout_spacing_mm / 2 + ai_hat_board_length_mm / 2,
        0,
        0
    ]) {
        rpi5_ai_hat_plus_26t_reference_model(
            show_rpi5_ref = false,
            show_active = false,
            show_ai_electronics = false,
            show_ai_cooler = true,
            show_gpio = false,
            show_pcie = false,
            show_label = false,
            show_guides = false
        );
    }
}

// ======================================================
// Helper Modules
// ======================================================

module rpi5_ai_hat_plus_26t_rounded_box(size_mm, radius_mm) {
    hull() {
        for (x_position_mm = [radius_mm, size_mm[0] - radius_mm])
        for (y_position_mm = [radius_mm, size_mm[1] - radius_mm]) {
            translate([x_position_mm, y_position_mm, 0])
                cylinder(h = size_mm[2], r = radius_mm);
        }
    }
}

module rpi5_ai_hat_plus_26t_connector_reference(origin_mm, size_mm, colour = ai_hat_connector_colour) {
    color(colour)
    translate(origin_mm)
        cube(size_mm);
}

module rpi5_ai_hat_plus_26t_label(label_text, position_mm, show_label = show_labels) {
    if (show_label) {
        color(ai_hat_label_colour)
            translate(position_mm)
                linear_extrude(height = 0.2)
                    text(label_text, size = 2, valign = "baseline", halign = "left");
    }
}

function rpi5_ai_hat_plus_26t_cooler_fan_hub_top_z_mm() =
    ai_hat_cooler_fan_origin_mm[2] + ai_hat_cooler_fan_height_mm + 0.2;
