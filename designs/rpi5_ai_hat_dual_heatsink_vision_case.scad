/*
  Raspberry Pi 5 AI HAT+ dual-heatsink vision case
  Target: OpenSCAD 2021.01
  Units: millimetres
*/

// ================================================================
// Adjustable Parameters
// ================================================================

// Render controls
render_mode = "assembly"; // assembly, tower, camera_arm, camera_holder, printable_layout
show_electronics = true;
show_debug_clearances = false;

// Board dimensions
pi_board_length_mm = 85;
pi_board_width_mm = 56;
pi_board_thickness_mm = 1.6;
pi_mount_hole_offset_x_mm = 3.5;
pi_mount_hole_offset_y_mm = 3.5;
pi_mount_hole_diameter_mm = 2.75;

ai_hat_length_mm = 66;
ai_hat_width_mm = 56.5;
ai_hat_thickness_mm = 1.6;
ai_hat_mount_hole_offset_x_mm = 3.5;
ai_hat_mount_hole_offset_y_mm = 3.5;
ai_hat_mount_hole_diameter_mm = 2.75;

// Stack and cooler clearances
pi_to_hat_spacing_mm = 12;
pi_active_cooler_clearance_height_mm = 13;
ai_hat_cooler_clearance_height_mm = 18;
cooler_air_gap_mm = 8;
top_exhaust_clearance_mm = 14;

// Case structure
case_wall_thickness_mm = 2.4;
case_post_diameter_mm = 8;
case_rail_width_mm = 5;
case_base_thickness_mm = 3;
case_corner_radius_mm = 3;
case_board_clearance_mm = 2;
case_side_rib_thickness_mm = 3;
case_side_rib_depth_mm = 4;
case_side_rib_count = 3;
case_top_ring_height_mm = 5;

// Ventilation
vent_side_opening_count = 3;
vent_side_rib_width_mm = 3;
vent_bottom_slot_length_mm = 46;
vent_bottom_slot_width_mm = 4;
vent_bottom_slot_count = 5;
vent_top_opening_margin_mm = 8;
vent_min_printable_rib_mm = 2.4;
vent_min_printable_slot_mm = 3;

// Camera system
camera_board_length_mm = 25;
camera_board_width_mm = 24;
camera_board_thickness_mm = 1.2;
camera_body_depth_mm = 4;
camera_lens_clearance_diameter_mm = 12;
camera_arm_forward_offset_mm = 58;
camera_arm_height_offset_mm = 22;
camera_arm_width_mm = 14;
camera_arm_thickness_mm = 5;
camera_tilt_angle_deg = -12;
camera_hinge_screw_clearance_mm = 3.2;
camera_holder_clearance_mm = 0.8;
camera_holder_wall_thickness_mm = 2.2;
camera_holder_lip_height_mm = 1.6;
camera_mount_hole_diameter_mm = 2.2;
camera_mount_hole_spacing_x_mm = 21;
camera_mount_hole_spacing_y_mm = 12.5;

// CSI ribbon routing
ribbon_width_clearance_mm = 18;
ribbon_bend_relief_radius_mm = 9;
ribbon_channel_width_mm = 20;
ribbon_channel_height_mm = 3;
ribbon_channel_wall_mm = 1.5;

// Fasteners and print tolerances
fastener_screw_clearance_diameter_mm = 2.9;
fastener_heat_set_insert_diameter_mm = 4.1;
fastener_standoff_height_mm = 5;
fit_tolerance_mm = 0.35;
layer_friendly_clearance_mm = 0.25;

// ================================================================
// Derived Values
// ================================================================

$fn = 48;

tower_inner_length_mm = pi_board_length_mm + 2 * case_board_clearance_mm;
tower_inner_width_mm = max(pi_board_width_mm, ai_hat_width_mm) + 2 * case_board_clearance_mm;
tower_outer_length_mm = tower_inner_length_mm + 2 * case_wall_thickness_mm;
tower_outer_width_mm = tower_inner_width_mm + 2 * case_wall_thickness_mm;

pi_board_z_mm = case_base_thickness_mm + fastener_standoff_height_mm;
hat_board_z_mm = pi_board_z_mm + pi_board_thickness_mm + pi_to_hat_spacing_mm;
pi_cooler_top_z_mm = pi_board_z_mm + pi_board_thickness_mm + pi_active_cooler_clearance_height_mm;
ai_cooler_base_z_mm = max(hat_board_z_mm + ai_hat_thickness_mm, pi_cooler_top_z_mm + cooler_air_gap_mm);
ai_cooler_top_z_mm = ai_cooler_base_z_mm + ai_hat_cooler_clearance_height_mm;
tower_top_z_mm = ai_cooler_top_z_mm + max(top_exhaust_clearance_mm, camera_arm_height_offset_mm);
camera_arm_attach_z_mm = tower_top_z_mm - case_top_ring_height_mm / 2;
camera_arm_z_mm = camera_arm_attach_z_mm;

post_center_x_mm = tower_inner_length_mm / 2 - pi_mount_hole_offset_x_mm;
post_center_y_mm = tower_inner_width_mm / 2 - pi_mount_hole_offset_y_mm;
camera_holder_outer_length_mm = camera_board_length_mm + 2 * camera_holder_wall_thickness_mm + 2 * camera_holder_clearance_mm;
camera_holder_outer_width_mm = camera_board_width_mm + 2 * camera_holder_wall_thickness_mm + 2 * camera_holder_clearance_mm;
camera_holder_depth_mm = camera_body_depth_mm + camera_holder_wall_thickness_mm + camera_holder_lip_height_mm + camera_holder_clearance_mm;
camera_holder_hinge_offset_y_mm = camera_holder_outer_width_mm / 2 + camera_holder_wall_thickness_mm / 2;

// ================================================================
// Top Level
// ================================================================

if (render_mode == "assembly") {
    full_assembly();
} else if (render_mode == "tower") {
    tower_printable_part();
} else if (render_mode == "camera_arm") {
    camera_arm_printable_part();
} else if (render_mode == "camera_holder") {
    camera_holder_printable_part();
} else if (render_mode == "printable_layout") {
    printable_layout();
} else {
    full_assembly();
}

// ================================================================
// Assembly
// ================================================================

module full_assembly() {
    tower_printable_part();

    translate([0, -tower_outer_width_mm / 2 - camera_arm_forward_offset_mm / 2, camera_arm_z_mm])
        camera_arm_printable_part();

    translate([0, -tower_outer_width_mm / 2 - camera_arm_forward_offset_mm, camera_arm_z_mm])
        rotate([camera_tilt_angle_deg, 0, 0])
            translate([0, -camera_holder_hinge_offset_y_mm, 0])
            camera_holder_printable_part();

    if (show_electronics) {
        electronics_preview();
    }

    if (show_debug_clearances) {
        clearance_preview();
    }
}

module printable_layout() {
    tower_printable_part();
    translate([tower_outer_length_mm + 18, 0, (camera_arm_thickness_mm + 3) / 2])
        camera_arm_printable_part();
    translate([tower_outer_length_mm + 52, 0, camera_holder_depth_mm / 2])
        camera_holder_printable_part();
}

// ================================================================
// Tower Frame
// ================================================================

module tower_printable_part() {
    difference() {
        union() {
            base_plate();
            corner_posts();
            side_ribs();
            top_exhaust_ring();
            ribbon_tower_relief();
        }

        bottom_intake_slots();
        board_mount_holes();
        top_exhaust_opening();
    }
}

module base_plate() {
    translate([0, 0, case_base_thickness_mm / 2])
        rounded_box(tower_outer_length_mm, tower_outer_width_mm, case_base_thickness_mm, case_corner_radius_mm);
}

module corner_posts() {
    for (x_sign = [-1, 1]) {
        for (y_sign = [-1, 1]) {
            translate([
                x_sign * (tower_outer_length_mm / 2 - case_post_diameter_mm / 2),
                y_sign * (tower_outer_width_mm / 2 - case_post_diameter_mm / 2),
                tower_top_z_mm / 2
            ])
                cylinder(h = tower_top_z_mm, d = case_post_diameter_mm, center = true);
        }
    }

    for (x_sign = [-1, 1]) {
        for (y_sign = [-1, 1]) {
            translate([x_sign * post_center_x_mm, y_sign * post_center_y_mm, case_base_thickness_mm])
                standoff();
        }
    }
}

module standoff() {
    difference() {
        cylinder(h = fastener_standoff_height_mm, d = case_post_diameter_mm * 0.78);
        translate([0, 0, -0.1])
            cylinder(h = fastener_standoff_height_mm + 0.2, d = fastener_screw_clearance_diameter_mm);
    }
}

module side_ribs() {
    for (y_sign = [-1, 1]) {
        side_rail_y = y_sign * (tower_outer_width_mm / 2 - case_wall_thickness_mm / 2);
        translate([0, side_rail_y, pi_board_z_mm + pi_board_thickness_mm / 2])
            cube([tower_outer_length_mm - case_post_diameter_mm, case_rail_width_mm, case_side_rib_thickness_mm], center = true);

        translate([0, side_rail_y, hat_board_z_mm + ai_hat_thickness_mm / 2])
            cube([tower_outer_length_mm - case_post_diameter_mm, case_rail_width_mm, case_side_rib_thickness_mm], center = true);

        for (rib_index = [0 : case_side_rib_count - 1]) {
            rib_z = pi_board_z_mm + 10 + rib_index * ((tower_top_z_mm - pi_board_z_mm - 20) / max(1, case_side_rib_count - 1));
            translate([0, side_rail_y, rib_z])
                cube([tower_outer_length_mm - 2 * case_post_diameter_mm, case_side_rib_depth_mm, vent_side_rib_width_mm], center = true);
        }
    }

    for (x_sign = [-1, 1]) {
        translate([x_sign * (tower_outer_length_mm / 2 - case_wall_thickness_mm / 2), 0, pi_board_z_mm + 8])
            cube([case_rail_width_mm, tower_outer_width_mm - 2 * case_post_diameter_mm, case_side_rib_thickness_mm], center = true);
        translate([x_sign * (tower_outer_length_mm / 2 - case_wall_thickness_mm / 2), 0, ai_cooler_top_z_mm + 4])
            cube([case_rail_width_mm, tower_outer_width_mm - 2 * case_post_diameter_mm, case_side_rib_thickness_mm], center = true);
    }
}

module top_exhaust_ring() {
    translate([0, 0, tower_top_z_mm - case_top_ring_height_mm / 2])
        difference() {
            rounded_box(tower_outer_length_mm, tower_outer_width_mm, case_top_ring_height_mm, case_corner_radius_mm);
            rounded_box(
                tower_outer_length_mm - 2 * vent_top_opening_margin_mm,
                tower_outer_width_mm - 2 * vent_top_opening_margin_mm,
                case_top_ring_height_mm + 0.2,
                max(0.1, case_corner_radius_mm - case_wall_thickness_mm)
            );
        }
}

module bottom_intake_slots() {
    slot_spacing = vent_bottom_slot_width_mm + max(vent_min_printable_rib_mm, 3);
    for (slot_index = [0 : vent_bottom_slot_count - 1]) {
        slot_y = (slot_index - (vent_bottom_slot_count - 1) / 2) * slot_spacing;
        translate([0, slot_y, -0.1])
            rounded_box(vent_bottom_slot_length_mm, vent_bottom_slot_width_mm, case_base_thickness_mm + 0.2, vent_bottom_slot_width_mm / 2);
    }
}

module board_mount_holes() {
    for (x_sign = [-1, 1]) {
        for (y_sign = [-1, 1]) {
            translate([x_sign * post_center_x_mm, y_sign * post_center_y_mm, -0.1])
                cylinder(h = case_base_thickness_mm + fastener_standoff_height_mm + 0.3, d = fastener_screw_clearance_diameter_mm);
        }
    }
}

module top_exhaust_opening() {
    translate([0, 0, tower_top_z_mm - case_top_ring_height_mm - 0.1])
        rounded_box(
            tower_outer_length_mm - 2 * vent_top_opening_margin_mm,
            tower_outer_width_mm - 2 * vent_top_opening_margin_mm,
            case_top_ring_height_mm + 0.3,
            max(0.1, case_corner_radius_mm - case_wall_thickness_mm)
        );
}

module ribbon_tower_relief() {
    translate([0, -tower_outer_width_mm / 2 - ribbon_channel_wall_mm / 2, pi_board_z_mm + 8])
        difference() {
            rounded_box(ribbon_channel_width_mm + 2 * ribbon_channel_wall_mm, ribbon_channel_wall_mm * 2, ribbon_channel_height_mm + 2 * ribbon_channel_wall_mm, 1);
            translate([0, -0.1, 0])
                cube([ribbon_channel_width_mm, ribbon_channel_wall_mm * 3, ribbon_channel_height_mm], center = true);
        }
}

// ================================================================
// Camera Arm
// ================================================================

module camera_arm_printable_part() {
    difference() {
        union() {
            rounded_box(camera_arm_width_mm, camera_arm_forward_offset_mm, camera_arm_thickness_mm, 2);

            translate([0, camera_arm_forward_offset_mm / 2, 0])
                rounded_box(camera_arm_width_mm + 10, 10, camera_arm_thickness_mm, 2);

            translate([0, -camera_arm_forward_offset_mm / 2, 0])
                hinge_bar(camera_arm_width_mm + 8);

            ribbon_arm_channel_body();
        }

        translate([0, -camera_arm_forward_offset_mm / 2, 0])
            rotate([0, 90, 0])
                cylinder(h = camera_arm_width_mm + 12, d = camera_hinge_screw_clearance_mm, center = true);

        ribbon_arm_channel_cut();
    }
}

module hinge_bar(length_mm) {
    rotate([0, 90, 0])
        cylinder(h = length_mm, d = camera_arm_thickness_mm + 3, center = true);
}

module ribbon_arm_channel_body() {
    translate([0, 0, camera_arm_thickness_mm / 2 + ribbon_channel_wall_mm / 2])
        rounded_box(ribbon_channel_width_mm + 2 * ribbon_channel_wall_mm, camera_arm_forward_offset_mm - 10, ribbon_channel_height_mm + 2 * ribbon_channel_wall_mm, 1.5);
}

module ribbon_arm_channel_cut() {
    translate([0, 0, camera_arm_thickness_mm / 2 + ribbon_channel_wall_mm / 2])
        cube([ribbon_channel_width_mm, camera_arm_forward_offset_mm - 5, ribbon_channel_height_mm + 0.2], center = true);
}

// ================================================================
// Camera Holder
// ================================================================

module camera_holder_printable_part() {
    difference() {
        union() {
            camera_holder_frame();
            translate([0, camera_holder_outer_width_mm / 2 + camera_holder_wall_thickness_mm / 2, 0])
                hinge_bar(camera_holder_outer_length_mm + 8);
            camera_board_lips();
        }

        camera_holder_cavity();
        camera_lens_opening();
        camera_mount_holes();
        translate([0, camera_holder_outer_width_mm / 2 + camera_holder_wall_thickness_mm / 2, 0])
            rotate([0, 90, 0])
                cylinder(h = camera_holder_outer_length_mm + 12, d = camera_hinge_screw_clearance_mm, center = true);
    }
}

module camera_holder_frame() {
    rounded_box(camera_holder_outer_length_mm, camera_holder_outer_width_mm, camera_holder_depth_mm, 2);
}

module camera_holder_cavity() {
    translate([0, 0, camera_holder_wall_thickness_mm])
        rounded_box(
            camera_board_length_mm + 2 * camera_holder_clearance_mm,
            camera_board_width_mm + 2 * camera_holder_clearance_mm,
            camera_holder_depth_mm,
            1
        );
}

module camera_board_lips() {
    lip_z = camera_holder_depth_mm / 2 - camera_holder_lip_height_mm / 2;
    translate([0, -camera_holder_outer_width_mm / 2 + camera_holder_wall_thickness_mm / 2, lip_z])
        cube([camera_holder_outer_length_mm, camera_holder_wall_thickness_mm, camera_holder_lip_height_mm], center = true);
    translate([0, camera_holder_outer_width_mm / 2 - camera_holder_wall_thickness_mm / 2, lip_z])
        cube([camera_holder_outer_length_mm, camera_holder_wall_thickness_mm, camera_holder_lip_height_mm], center = true);
    translate([-camera_holder_outer_length_mm / 2 + camera_holder_wall_thickness_mm / 2, 0, lip_z])
        cube([camera_holder_wall_thickness_mm, camera_holder_outer_width_mm, camera_holder_lip_height_mm], center = true);
    translate([camera_holder_outer_length_mm / 2 - camera_holder_wall_thickness_mm / 2, 0, lip_z])
        cube([camera_holder_wall_thickness_mm, camera_holder_outer_width_mm, camera_holder_lip_height_mm], center = true);
}

module camera_lens_opening() {
    translate([0, 0, -camera_holder_depth_mm / 2 - 0.1])
        cylinder(h = camera_holder_depth_mm + 0.2, d = camera_lens_clearance_diameter_mm);
}

module camera_mount_holes() {
    for (x_sign = [-1, 1]) {
        for (y_sign = [-1, 1]) {
            translate([
                x_sign * camera_mount_hole_spacing_x_mm / 2,
                y_sign * camera_mount_hole_spacing_y_mm / 2,
                -camera_holder_depth_mm / 2 - 0.1
            ])
                cylinder(h = camera_holder_depth_mm + 0.2, d = camera_mount_hole_diameter_mm);
        }
    }
}

// ================================================================
// Electronics Preview
// ================================================================

module electronics_preview() {
    color([0.05, 0.45, 0.18, 0.55])
        translate([0, 0, pi_board_z_mm + pi_board_thickness_mm / 2])
            cube([pi_board_length_mm, pi_board_width_mm, pi_board_thickness_mm], center = true);

    color([0.05, 0.35, 0.55, 0.5])
        translate([0, 0, hat_board_z_mm + ai_hat_thickness_mm / 2])
            cube([ai_hat_length_mm, ai_hat_width_mm, ai_hat_thickness_mm], center = true);

    color([0.6, 0.6, 0.6, 0.35])
        translate([0, 0, pi_board_z_mm + pi_board_thickness_mm + pi_active_cooler_clearance_height_mm / 2])
            cube([52, 42, pi_active_cooler_clearance_height_mm], center = true);

    color([0.6, 0.6, 0.6, 0.35])
        translate([0, 0, ai_cooler_base_z_mm + ai_hat_cooler_clearance_height_mm / 2])
            cube([56, 45, ai_hat_cooler_clearance_height_mm], center = true);

    color([0.02, 0.02, 0.02, 0.5])
        translate([0, -tower_outer_width_mm / 2 - camera_arm_forward_offset_mm, camera_arm_z_mm])
            rotate([camera_tilt_angle_deg, 0, 0])
                translate([0, -camera_holder_hinge_offset_y_mm, 0])
                    cube([camera_board_length_mm, camera_board_width_mm, camera_board_thickness_mm], center = true);
}

module clearance_preview() {
    color([1, 0.4, 0.1, 0.18])
        translate([0, 0, ai_cooler_top_z_mm + top_exhaust_clearance_mm / 2])
            cube([
                tower_outer_length_mm - 2 * vent_top_opening_margin_mm,
                tower_outer_width_mm - 2 * vent_top_opening_margin_mm,
                top_exhaust_clearance_mm
            ], center = true);

    color([0.1, 0.4, 1, 0.22])
        translate([0, -tower_outer_width_mm / 2 - camera_arm_forward_offset_mm / 2, camera_arm_z_mm + camera_arm_thickness_mm])
            cube([ribbon_width_clearance_mm, camera_arm_forward_offset_mm, ribbon_bend_relief_radius_mm], center = true);
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
