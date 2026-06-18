// Raspberry Pi 5 active cooler reference.
//
// Units: mm
// Origin: Raspberry Pi 5 board coordinate system.

// ======================================================
// Adjustable Parameters
// ======================================================

// Keep a local fallback so this helper can render as a standalone preview.
rpi5_active_cooler_board_thickness_reference_mm = is_undef(rpi5_board_thickness_mm)
    ? 1.6
    : rpi5_board_thickness_mm;

// Active cooler preview dimensions
rpi5_active_cooler_origin_mm = [17, 8, rpi5_active_cooler_board_thickness_reference_mm + 1.2];
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
rpi5_active_cooler_soc_pad_origin_mm = [35, 27, rpi5_active_cooler_board_thickness_reference_mm + 0.2];
rpi5_active_cooler_soc_pad_size_mm = [14, 14, 0.6];
rpi5_active_cooler_rp1_pad_origin_mm = [50, 30, rpi5_active_cooler_board_thickness_reference_mm + 0.2];
rpi5_active_cooler_rp1_pad_size_mm = [10, 10, 0.6];
rpi5_active_cooler_fan_cable_offset_mm = [18, 3, 1];
rpi5_active_cooler_fan_cable_spacing_mm = 1.5;
rpi5_active_cooler_fan_cable_size_mm = [8, 0.8, 0.8];

// Visual settings
rpi5_active_cooler_base_colour = "silver";
rpi5_active_cooler_fin_colour = "gainsboro";
rpi5_active_cooler_fan_colour = "black";
rpi5_active_cooler_fan_opening_colour = "dimgray";
rpi5_active_cooler_thermal_pad_colour = [0.5, 0.8, 1, 0.4];

// Accessor functions
function rpi5_active_cooler_origin_mm() = rpi5_active_cooler_origin_mm;
function rpi5_active_cooler_size_mm() = rpi5_active_cooler_size_mm;
function rpi5_active_cooler_base_height_mm() = rpi5_active_cooler_base_height_mm;
function rpi5_active_cooler_total_height_mm() = rpi5_active_cooler_total_height_mm;
function rpi5_active_cooler_fan_origin_mm() = rpi5_active_cooler_fan_origin_mm;

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
// Reusable Active Cooler Reference
// ======================================================

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
        translate([
            push_pin_position_mm[0],
            push_pin_position_mm[1],
            rpi5_active_cooler_board_thickness_reference_mm
        ])
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
