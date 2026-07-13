// Rotating kitchen tray for jars.
//
// Units: mm
// Origin: center of the tray/base rotation axis on the build plate.
// Z rises upward from the base bottom face in assembly mode.
//
// This is a fully 3D-printed lazy-susan style tray. The giro/rotating
// mechanism is a printed thrust-bearing stack: base race, loose printed
// rollers, tray underside race, and a printed center retaining cap.

// ======================================================
// Adjustable Parameters
// ======================================================

// Render controls
$fn = 48;
render_mode = "printable_layout"; // [assembly/top_tray/base_ring/roller/retaining_cap/printable_layout]
show_rollers = true;
show_retaining_cap = true;
show_cutaway_preview = false;

// Tray dimensions
tray_outer_diameter_mm = 240.0;
tray_wall_height_mm = 30.0;
tray_wall_thickness_mm = 3.0;
tray_floor_thickness_mm = 3.2;

// Jar floor grip and drainage grooves
floor_grip_groove_count = 36;
floor_grip_groove_width_mm = 1.2;
floor_grip_groove_depth_mm = 0.8;
floor_grip_inner_radius_mm = 24.0;
floor_grip_outer_radius_mm = 105.0;

// Giro / printed roller mechanism
base_outer_diameter_mm = 178.0;
base_inner_recess_diameter_mm = 112.0;
base_height_mm = 8.0;
base_floor_thickness_mm = 3.0;
race_center_radius_mm = 67.0;
race_channel_width_mm = 12.0;
race_channel_depth_mm = 2.0;
roller_count = 12;
roller_diameter_mm = 8.0;
roller_length_mm = 14.0;
roller_running_clearance_mm = 0.6;
base_roller_pocket_clearance_mm = 0.6;
roller_end_chamfer_mm = 0.8;
upper_race_height_mm = 4.4;
upper_race_floor_overlap_mm = 0.4;
upper_race_outer_diameter_mm = 160.0;
upper_race_inner_diameter_mm = 124.0;

// Center pivot and retaining cap
center_post_diameter_mm = 18.0;
center_post_extra_height_mm = 4.0;
center_running_clearance_mm = 0.8;
retaining_cap_outer_diameter_mm = 30.0;
retaining_cap_height_mm = 6.0;
retaining_cap_socket_diameter_mm = 17.8;
retaining_cap_socket_depth_mm = 4.4;
retaining_cap_socket_end_clearance_mm = 0.2;
retaining_cap_lift_clearance_mm = 0.9;

// Printable layout
printable_layout_spacing_mm = 18.0;
roller_print_spacing_mm = 4.0;
printable_roller_rows = 2;

// Visual settings
tray_colour = "Gainsboro";
base_colour = "SlateGray";
roller_colour = "DarkOrange";
cap_colour = "DimGray";
cutaway_colour = "LightSkyBlue";

// ======================================================
// Derived Values
// ======================================================

eps_mm = 0.02;
tray_outer_radius_mm = tray_outer_diameter_mm / 2;
tray_inner_radius_mm = tray_outer_radius_mm - tray_wall_thickness_mm;
base_outer_radius_mm = base_outer_diameter_mm / 2;
base_inner_recess_radius_mm = base_inner_recess_diameter_mm / 2;
center_bore_diameter_mm = center_post_diameter_mm + 2 * center_running_clearance_mm;
race_channel_half_width_mm = race_channel_width_mm / 2;
race_inner_radius_mm = race_center_radius_mm - race_channel_half_width_mm;
race_outer_radius_mm = race_center_radius_mm + race_channel_half_width_mm;
roller_center_z_mm =
    base_floor_thickness_mm + race_channel_depth_mm + roller_diameter_mm / 2;
base_roller_pocket_diameter_mm =
    roller_diameter_mm + base_roller_pocket_clearance_mm;
base_roller_pocket_length_mm =
    roller_length_mm + base_roller_pocket_clearance_mm;
base_roller_pocket_center_z_mm =
    roller_center_z_mm + base_roller_pocket_clearance_mm / 2;
tray_bottom_z_mm =
    roller_center_z_mm + roller_diameter_mm / 2 + roller_running_clearance_mm;
tray_top_z_mm = tray_bottom_z_mm + tray_wall_height_mm;
upper_race_bottom_z_mm = tray_bottom_z_mm - upper_race_height_mm;
tray_center_boss_top_z_mm = tray_bottom_z_mm + tray_floor_thickness_mm;
retaining_cap_bottom_z_mm =
    tray_center_boss_top_z_mm + retaining_cap_lift_clearance_mm;
center_post_height_mm =
    retaining_cap_bottom_z_mm
        + retaining_cap_socket_depth_mm
        - retaining_cap_socket_end_clearance_mm
        + center_post_extra_height_mm;
roller_print_columns =
    ceil(roller_count / printable_roller_rows);
roller_print_pitch_x_mm =
    roller_length_mm + roller_print_spacing_mm;
roller_print_pitch_y_mm =
    roller_diameter_mm + roller_print_spacing_mm;

// ======================================================
// Render Dispatch
// ======================================================

if (render_mode == "assembly") {
    rotating_kitchen_jar_tray_assembly();
} else if (render_mode == "top_tray") {
    translate([0, 0, upper_race_height_mm])
        rotating_kitchen_jar_top_tray_printable();
} else if (render_mode == "base_ring") {
    rotating_kitchen_jar_base_ring();
} else if (render_mode == "roller") {
    rotating_kitchen_jar_roller();
} else if (render_mode == "retaining_cap") {
    rotating_kitchen_jar_retaining_cap();
} else if (render_mode == "printable_layout") {
    rotating_kitchen_jar_printable_layout();
} else {
    assert(false, str("Unsupported render_mode=\"", render_mode, "\""));
}

// ======================================================
// Main Assemblies
// ======================================================

module rotating_kitchen_jar_tray_assembly() {
    color(base_colour)
        rotating_kitchen_jar_base_ring();

    if (show_rollers) {
        rotating_kitchen_jar_rollers_assembly();
    }

    translate([0, 0, tray_bottom_z_mm])
        color(tray_colour)
            rotating_kitchen_jar_top_tray_printable();

    if (show_retaining_cap) {
        translate([0, 0, retaining_cap_bottom_z_mm])
            color(cap_colour)
                rotating_kitchen_jar_retaining_cap();
    }

    if (show_cutaway_preview) {
        color(cutaway_colour, 0.25)
            rotating_kitchen_jar_cutaway_preview();
    }
}

module rotating_kitchen_jar_printable_layout() {
    translate([0, 0, upper_race_height_mm])
        color(tray_colour)
            rotating_kitchen_jar_top_tray_printable();

    translate([
        tray_outer_diameter_mm / 2 + printable_layout_spacing_mm
            + base_outer_diameter_mm / 2,
        0,
        0
    ])
        color(base_colour)
            rotating_kitchen_jar_base_ring();

    translate([
        0,
        -(tray_outer_diameter_mm / 2 + printable_layout_spacing_mm
            + retaining_cap_outer_diameter_mm / 2),
        0
    ])
        color(cap_colour)
            rotating_kitchen_jar_retaining_cap();

    translate([
        tray_outer_diameter_mm / 2 + printable_layout_spacing_mm,
        -(base_outer_diameter_mm / 2 + printable_layout_spacing_mm
            + printable_roller_rows * roller_print_pitch_y_mm),
        roller_diameter_mm / 2
    ])
        color(roller_colour)
            rotating_kitchen_jar_rollers_printable_grid();
}

// ======================================================
// Printable Parts
// ======================================================

module rotating_kitchen_jar_top_tray_printable() {
    difference() {
        union() {
            rotating_kitchen_jar_tray_bowl();
            rotating_kitchen_jar_upper_race();
            rotating_kitchen_jar_center_boss();
        }

        rotating_kitchen_jar_center_bore();
        rotating_kitchen_jar_floor_grip_grooves();
    }
}

module rotating_kitchen_jar_base_ring() {
    union() {
        difference() {
            cylinder(h = base_height_mm, d = base_outer_diameter_mm);

            rotating_kitchen_jar_base_inner_recess();
            rotating_kitchen_jar_base_roller_pockets();
        }

        rotating_kitchen_jar_center_post();
    }
}

module rotating_kitchen_jar_roller() {
    rotate([0, 90, 0])
        difference() {
            cylinder(h = roller_length_mm, d = roller_diameter_mm, center = true);

            translate([0, 0, -roller_length_mm / 2 - eps_mm])
                cylinder(
                    h = roller_end_chamfer_mm + eps_mm,
                    d1 = roller_diameter_mm + eps_mm,
                    d2 = roller_diameter_mm - 2 * roller_end_chamfer_mm
                );

            translate([0, 0, roller_length_mm / 2 - roller_end_chamfer_mm])
                cylinder(
                    h = roller_end_chamfer_mm + eps_mm,
                    d1 = roller_diameter_mm - 2 * roller_end_chamfer_mm,
                    d2 = roller_diameter_mm + eps_mm
                );
        }
}

module rotating_kitchen_jar_retaining_cap() {
    difference() {
        union() {
            cylinder(h = retaining_cap_height_mm, d = retaining_cap_outer_diameter_mm);
            translate([0, 0, retaining_cap_height_mm - 1.2])
                cylinder(h = 1.2, d1 = retaining_cap_outer_diameter_mm, d2 = retaining_cap_outer_diameter_mm - 3.0);
        }

        translate([0, 0, -eps_mm])
            cylinder(
                h = retaining_cap_socket_depth_mm + eps_mm,
                d = retaining_cap_socket_diameter_mm
            );
    }
}

// ======================================================
// Tray Geometry
// ======================================================

module rotating_kitchen_jar_tray_bowl() {
    difference() {
        cylinder(h = tray_wall_height_mm, d = tray_outer_diameter_mm);

        translate([0, 0, tray_floor_thickness_mm])
            cylinder(
                h = tray_wall_height_mm - tray_floor_thickness_mm + eps_mm,
                d = tray_outer_diameter_mm - 2 * tray_wall_thickness_mm
            );
    }
}

module rotating_kitchen_jar_floor_grip_grooves() {
    for (groove_index = [0 : floor_grip_groove_count - 1]) {
        rotate([0, 0, 360 * groove_index / floor_grip_groove_count])
            translate([
                (floor_grip_inner_radius_mm + floor_grip_outer_radius_mm) / 2,
                0,
                tray_floor_thickness_mm - floor_grip_groove_depth_mm / 2
            ])
                cube([
                    floor_grip_outer_radius_mm - floor_grip_inner_radius_mm,
                    floor_grip_groove_width_mm,
                    floor_grip_groove_depth_mm + eps_mm
                ], center = true);
    }
}

module rotating_kitchen_jar_upper_race() {
    translate([0, 0, -upper_race_height_mm])
        difference() {
            cylinder(
                h = upper_race_height_mm + upper_race_floor_overlap_mm,
                d = upper_race_outer_diameter_mm
            );
            translate([0, 0, -eps_mm])
                cylinder(
                    h = upper_race_height_mm
                        + upper_race_floor_overlap_mm
                        + 2 * eps_mm,
                    d = upper_race_inner_diameter_mm
                );
            translate([0, 0, upper_race_height_mm - race_channel_depth_mm])
                rotating_kitchen_jar_annular_cut(
                    race_inner_radius_mm,
                    race_outer_radius_mm,
                    race_channel_depth_mm + eps_mm
                );
        }
}

module rotating_kitchen_jar_center_boss() {
    translate([0, 0, -upper_race_height_mm])
        cylinder(
            h = tray_floor_thickness_mm + upper_race_height_mm,
            d = center_bore_diameter_mm + 9.0
        );
}

module rotating_kitchen_jar_center_bore() {
    translate([0, 0, -upper_race_height_mm - eps_mm])
        cylinder(
            h = tray_wall_height_mm + upper_race_height_mm + 2 * eps_mm,
            d = center_bore_diameter_mm
        );
}

// ======================================================
// Base And Giro Geometry
// ======================================================

module rotating_kitchen_jar_center_post() {
    cylinder(h = center_post_height_mm, d = center_post_diameter_mm);
}

module rotating_kitchen_jar_base_inner_recess() {
    translate([0, 0, base_floor_thickness_mm])
        cylinder(
            h = base_height_mm - base_floor_thickness_mm + eps_mm,
            d = base_inner_recess_diameter_mm
        );
}

module rotating_kitchen_jar_base_roller_pockets() {
    for (roller_index = [0 : roller_count - 1]) {
        rotate([0, 0, 360 * roller_index / roller_count])
            translate([
                race_center_radius_mm,
                0,
                base_roller_pocket_center_z_mm
            ])
                rotate([0, 90, 0])
                    cylinder(
                        h = base_roller_pocket_length_mm,
                        d = base_roller_pocket_diameter_mm,
                        center = true
                    );
    }
}

module rotating_kitchen_jar_rollers_assembly() {
    for (roller_index = [0 : roller_count - 1]) {
        rotate([0, 0, 360 * roller_index / roller_count])
            translate([race_center_radius_mm, 0, roller_center_z_mm])
                color(roller_colour)
                    rotating_kitchen_jar_roller();
    }
}

module rotating_kitchen_jar_rollers_printable_grid() {
    for (roller_index = [0 : roller_count - 1]) {
        translate([
            (roller_index % roller_print_columns) * roller_print_pitch_x_mm,
            floor(roller_index / roller_print_columns) * roller_print_pitch_y_mm,
            0
        ])
            rotating_kitchen_jar_roller();
    }
}

// ======================================================
// Helper Geometry
// ======================================================

module rotating_kitchen_jar_annular_cut(inner_radius_mm, outer_radius_mm, height_mm) {
    difference() {
        cylinder(h = height_mm, r = outer_radius_mm);
        translate([0, 0, -eps_mm])
            cylinder(h = height_mm + 2 * eps_mm, r = inner_radius_mm);
    }
}

module rotating_kitchen_jar_cutaway_preview() {
    translate([0, -tray_outer_radius_mm / 2, tray_top_z_mm / 2])
        cube([tray_outer_diameter_mm + 2, tray_outer_radius_mm, tray_top_z_mm + 2], center = true);
}
