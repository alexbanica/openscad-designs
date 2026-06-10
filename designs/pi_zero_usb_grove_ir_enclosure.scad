// Pi Zero USB Grove IR enclosure.
//
// Units: mm.
// Origin: board stack center in X/Y, bottom exterior of the printed tray at Z=0.
// Orientation: Pi Zero and Waveshare board X follows the 65 mm board length,
// Y follows the 30 mm board width. Waveshare RJ45/front USB-A ports face -Y.
// This is an adjustable printable case and fit reference; measure and test-fit
// the actual hardware stack before relying on final tolerances.

use <pi_zero.scad>
use <waveshare_eth_usb_hub_hat.scad>
use <seeed_grove_base_hat_zero.scad>
use <grove_infrared_emitter.scad>

// ======================================================
// Adjustable Parameters
// ======================================================

// Render controls
$fn = 48;
render_mode = "assembly"; // [assembly/bottom_tray/top_cover/printable_layout/electronics]
show_electronics = true;
show_cutout_guides = true;

// Stack dimensions and offsets
board_length_mm = 65.0;
board_width_mm = 30.0;
board_thickness_mm = 1.6;
measured_stack_height_mm = 35.0;
extra_upward_headroom_mm = 8.0;
board_clearance_x_mm = 5.0;
board_clearance_y_mm = 5.0;
pi_zero_standoff_height_mm = 4.0;
pi_zero_to_waveshare_hat_z_offset_mm = 11.2;
waveshare_to_grove_hat_z_offset_mm = 10.5;
electronics_preview_lift_mm = 0.0;
grove_hat_rotation_deg = 90.0;

// Enclosure wall/floor/cover dimensions
wall_thickness_mm = 2.4;
floor_thickness_mm = 2.4;
top_roof_thickness_mm = 2.4;
tray_wall_height_mm = 16.0;
corner_radius_mm = 3.0;
cover_lip_height_mm = 4.0;
cover_lip_thickness_mm = 1.2;
cover_fit_clearance_mm = 0.35;
top_cover_internal_clearance_mm = 0.8;

// Pi Zero stack mounting standoffs
pi_mounting_hole_edge_offset_mm = 3.5;
pi_standoff_outer_diameter_mm = 6.5;
pi_standoff_screw_hole_diameter_mm = 2.7;
pi_standoff_pilot_depth_mm = 5.5;

// Cover fasteners
cover_boss_outer_diameter_mm = 7.0;
cover_boss_hole_diameter_mm = 2.8;
cover_boss_edge_inset_x_mm = 5.6;
cover_boss_edge_inset_y_mm = 5.6;
cover_screw_head_diameter_mm = 5.2;
cover_screw_head_recess_depth_mm = 1.2;

// Pi Zero port cutout dimensions and offsets
pi_micro_sd_cutout_size_mm = [14.0, 8.0, 5.0];
pi_micro_sd_cutout_center_x_mm = -32.5;
pi_micro_sd_cutout_center_y_mm = 1.9;
pi_micro_sd_cutout_center_z_mm = 7.8;
pi_mini_hdmi_cutout_size_mm = [13.5, 7.5, 7.0];
pi_mini_hdmi_cutout_center_x_mm = -20.1;
pi_mini_hdmi_cutout_center_y_mm = -22.4;
pi_mini_hdmi_cutout_center_z_mm = 8.2;
pi_micro_usb_data_cutout_size_mm = [9.5, 7.5, 6.0];
pi_micro_usb_data_cutout_center_x_mm = 8.9;
pi_micro_usb_data_cutout_center_y_mm = -22.4;
pi_micro_usb_data_cutout_center_z_mm = 7.8;
pi_micro_usb_power_cutout_size_mm = [9.5, 7.5, 6.0];
pi_micro_usb_power_cutout_center_x_mm = 21.5;
pi_micro_usb_power_cutout_center_y_mm = -22.4;
pi_micro_usb_power_cutout_center_z_mm = 7.8;
pi_camera_cutout_size_mm = [8.0, 20.0, 5.0];
pi_camera_cutout_center_x_mm = 32.5;
pi_camera_cutout_center_y_mm = 0.0;
pi_camera_cutout_center_z_mm = 9.0;

// Waveshare port cutout dimensions and offsets
waveshare_rj45_cutout_size_mm = [19.0, 10.0, 16.0];
waveshare_rj45_cutout_center_x_mm = -16.0;
waveshare_rj45_cutout_center_y_mm = -22.4;
waveshare_rj45_cutout_center_z_mm = 22.5;
waveshare_front_usb_a_cutout_size_mm = [16.0, 10.0, 10.0];
waveshare_front_usb_a_cutout_center_x_mm = 11.0;
waveshare_front_usb_a_cutout_center_y_mm = -22.4;
waveshare_front_usb_a_cutout_center_z_mm = 20.5;
waveshare_left_usb_a_cutout_size_mm = [10.0, 16.0, 11.0];
waveshare_left_usb_a_cutout_center_x_mm = -39.9;
waveshare_left_usb_a_cutout_center_y_mm = -4.5;
waveshare_left_usb_a_cutout_center_z_mm = 20.5;
waveshare_right_usb_a_cutout_size_mm = [13.0, 18.0, 12.0];
waveshare_right_usb_a_cutout_center_x_mm = 40.8;
waveshare_right_usb_a_cutout_center_y_mm = -4.5;
waveshare_right_usb_a_cutout_center_z_mm = 20.5;
wireless_dongle_extra_clearance_x_mm = 3.0;
port_cutout_extra_clearance_mm = 0.6;

// IR emitter board mount
ir_pcb_width_mm = 20.0;
ir_pcb_length_mm = 24.0;
ir_pcb_thickness_mm = 1.6;
ir_mount_center_x_mm = 20.0;
ir_mount_center_y_mm = 2.5;
ir_mount_rotation_deg = 180.0;
ir_mount_standoff_height_mm = 5.0;
ir_mount_standoff_outer_diameter_mm = 4.8;
ir_mount_screw_hole_diameter_mm = 2.1;
ir_mounting_hole_edge_offset_x_mm = 2.5;
ir_mounting_hole_edge_offset_y_mm = 2.5;

// IR LED aperture
ir_led_diameter_mm = 5.0;
ir_led_aperture_diameter_mm = 6.2;
ir_led_aperture_center_x_mm = 20.0;
ir_led_aperture_center_z_mm = 13.0;
ir_led_aperture_wall_clearance_depth_mm = 6.0;
ir_led_aperture_guide_length_mm = 20.0;

// Internal Grove cable path
grove_cable_path_width_mm = 10.0;
grove_cable_path_height_mm = 6.0;
grove_cable_path_start_x_mm = -5.0;
grove_cable_path_start_y_mm = 10.0;
grove_cable_path_end_x_mm = 20.0;
grove_cable_path_end_y_mm = -9.5;
grove_cable_path_center_z_mm = 42.0;
grove_cable_path_clearance_lift_mm = 0.4;

// Anti-slide recesses/feet
use_rubber_foot_recesses = true;
rubber_foot_recess_diameter_mm = 9.0;
rubber_foot_recess_depth_mm = 0.9;
rubber_foot_recess_edge_inset_x_mm = 10.0;
rubber_foot_recess_edge_inset_y_mm = 7.5;
printed_foot_diameter_mm = 8.0;
printed_foot_height_mm = 1.0;

// Tolerances and print clearances
fit_tolerance_mm = 0.25;
preview_overlap_mm = 0.02;
guide_alpha = 0.28;

// Printable layout
printable_layout_spacing_mm = 28.0;

// Visual settings
tray_colour = "Gainsboro";
cover_colour = "LightSteelBlue";
standoff_colour = "Silver";
cutout_guide_colour = "Orange";
cable_guide_colour = "DeepSkyBlue";
ir_guide_colour = "Red";

// ======================================================
// Derived Values
// ======================================================

internal_length_mm = board_length_mm + 2 * board_clearance_x_mm;
internal_width_mm = board_width_mm + 2 * board_clearance_y_mm;
outer_length_mm = internal_length_mm + 2 * wall_thickness_mm;
outer_width_mm = internal_width_mm + 2 * wall_thickness_mm;
stack_clearance_height_mm = measured_stack_height_mm + extra_upward_headroom_mm;
case_total_height_mm =
    floor_thickness_mm + pi_zero_standoff_height_mm + stack_clearance_height_mm
    + top_roof_thickness_mm + top_cover_internal_clearance_mm;
top_cover_height_mm = case_total_height_mm - tray_wall_height_mm;
pi_zero_bottom_z_mm = floor_thickness_mm + pi_zero_standoff_height_mm + electronics_preview_lift_mm;
waveshare_hat_bottom_z_mm = pi_zero_bottom_z_mm + pi_zero_to_waveshare_hat_z_offset_mm;
grove_hat_bottom_z_mm = waveshare_hat_bottom_z_mm + waveshare_to_grove_hat_z_offset_mm;
pi_mounting_hole_x_mm = board_length_mm / 2 - pi_mounting_hole_edge_offset_mm;
pi_mounting_hole_y_mm = board_width_mm / 2 - pi_mounting_hole_edge_offset_mm;
pi_mounting_hole_centers_mm = [
    [-pi_mounting_hole_x_mm, -pi_mounting_hole_y_mm],
    [pi_mounting_hole_x_mm, -pi_mounting_hole_y_mm],
    [-pi_mounting_hole_x_mm, pi_mounting_hole_y_mm],
    [pi_mounting_hole_x_mm, pi_mounting_hole_y_mm]
];
cover_boss_x_mm = outer_length_mm / 2 - cover_boss_edge_inset_x_mm;
cover_boss_y_mm = outer_width_mm / 2 - cover_boss_edge_inset_y_mm;
cover_boss_centers_mm = [
    [-cover_boss_x_mm, -cover_boss_y_mm],
    [cover_boss_x_mm, -cover_boss_y_mm],
    [-cover_boss_x_mm, cover_boss_y_mm],
    [cover_boss_x_mm, cover_boss_y_mm]
];
ir_mounting_hole_x_mm = ir_pcb_width_mm / 2 - ir_mounting_hole_edge_offset_x_mm;
ir_mounting_hole_y_mm = ir_pcb_length_mm / 2 - ir_mounting_hole_edge_offset_y_mm;
ir_mounting_hole_centers_mm = [
    [-ir_mounting_hole_x_mm, -ir_mounting_hole_y_mm],
    [ir_mounting_hole_x_mm, -ir_mounting_hole_y_mm],
    [-ir_mounting_hole_x_mm, ir_mounting_hole_y_mm],
    [ir_mounting_hole_x_mm, ir_mounting_hole_y_mm]
];
ir_emitter_bottom_z_mm = floor_thickness_mm + ir_mount_standoff_height_mm;
ir_led_aperture_center_y_mm = -outer_width_mm / 2;
rubber_foot_recess_x_mm = outer_length_mm / 2 - rubber_foot_recess_edge_inset_x_mm;
rubber_foot_recess_y_mm = outer_width_mm / 2 - rubber_foot_recess_edge_inset_y_mm;
anti_slide_centers_mm = [
    [-rubber_foot_recess_x_mm, -rubber_foot_recess_y_mm],
    [rubber_foot_recess_x_mm, -rubber_foot_recess_y_mm],
    [-rubber_foot_recess_x_mm, rubber_foot_recess_y_mm],
    [rubber_foot_recess_x_mm, rubber_foot_recess_y_mm]
];
port_cutouts_mm = [
    ["pi_micro_sd", pi_micro_sd_cutout_center_x_mm, pi_micro_sd_cutout_center_y_mm, pi_micro_sd_cutout_center_z_mm, pi_micro_sd_cutout_size_mm[0], pi_micro_sd_cutout_size_mm[1], pi_micro_sd_cutout_size_mm[2]],
    ["pi_mini_hdmi", pi_mini_hdmi_cutout_center_x_mm, pi_mini_hdmi_cutout_center_y_mm, pi_mini_hdmi_cutout_center_z_mm, pi_mini_hdmi_cutout_size_mm[0], pi_mini_hdmi_cutout_size_mm[1], pi_mini_hdmi_cutout_size_mm[2]],
    ["pi_micro_usb_data", pi_micro_usb_data_cutout_center_x_mm, pi_micro_usb_data_cutout_center_y_mm, pi_micro_usb_data_cutout_center_z_mm, pi_micro_usb_data_cutout_size_mm[0], pi_micro_usb_data_cutout_size_mm[1], pi_micro_usb_data_cutout_size_mm[2]],
    ["pi_micro_usb_power", pi_micro_usb_power_cutout_center_x_mm, pi_micro_usb_power_cutout_center_y_mm, pi_micro_usb_power_cutout_center_z_mm, pi_micro_usb_power_cutout_size_mm[0], pi_micro_usb_power_cutout_size_mm[1], pi_micro_usb_power_cutout_size_mm[2]],
    ["pi_camera", pi_camera_cutout_center_x_mm, pi_camera_cutout_center_y_mm, pi_camera_cutout_center_z_mm, pi_camera_cutout_size_mm[0], pi_camera_cutout_size_mm[1], pi_camera_cutout_size_mm[2]],
    ["waveshare_rj45", waveshare_rj45_cutout_center_x_mm, waveshare_rj45_cutout_center_y_mm, waveshare_rj45_cutout_center_z_mm, waveshare_rj45_cutout_size_mm[0], waveshare_rj45_cutout_size_mm[1], waveshare_rj45_cutout_size_mm[2]],
    ["waveshare_front_usb_a", waveshare_front_usb_a_cutout_center_x_mm, waveshare_front_usb_a_cutout_center_y_mm, waveshare_front_usb_a_cutout_center_z_mm, waveshare_front_usb_a_cutout_size_mm[0], waveshare_front_usb_a_cutout_size_mm[1], waveshare_front_usb_a_cutout_size_mm[2]],
    ["waveshare_left_usb_a", waveshare_left_usb_a_cutout_center_x_mm, waveshare_left_usb_a_cutout_center_y_mm, waveshare_left_usb_a_cutout_center_z_mm, waveshare_left_usb_a_cutout_size_mm[0], waveshare_left_usb_a_cutout_size_mm[1], waveshare_left_usb_a_cutout_size_mm[2]],
    ["waveshare_right_usb_a_dongle", waveshare_right_usb_a_cutout_center_x_mm, waveshare_right_usb_a_cutout_center_y_mm, waveshare_right_usb_a_cutout_center_z_mm, waveshare_right_usb_a_cutout_size_mm[0] + wireless_dongle_extra_clearance_x_mm, waveshare_right_usb_a_cutout_size_mm[1], waveshare_right_usb_a_cutout_size_mm[2]]
];

// ======================================================
// Render Dispatch
// ======================================================

if (render_mode == "assembly") {
    pi_zero_usb_grove_ir_enclosure_assembly();
} else if (render_mode == "bottom_tray") {
    pi_zero_usb_grove_ir_bottom_tray();
} else if (render_mode == "top_cover") {
    pi_zero_usb_grove_ir_top_cover();
} else if (render_mode == "printable_layout") {
    pi_zero_usb_grove_ir_printable_layout();
} else if (render_mode == "electronics") {
    pi_zero_usb_grove_ir_electronics_reference();
} else {
    pi_zero_usb_grove_ir_enclosure_assembly();
}

// ======================================================
// Main Assemblies
// ======================================================

module pi_zero_usb_grove_ir_enclosure_assembly(
    show_case_electronics = show_electronics,
    show_guides = show_cutout_guides
) {
    pi_zero_usb_grove_ir_bottom_tray();
    pi_zero_usb_grove_ir_top_cover();

    if (show_case_electronics) {
        pi_zero_usb_grove_ir_electronics_reference();
    }

    if (show_guides) {
        pi_zero_usb_grove_ir_cutout_guides();
    }
}

module pi_zero_usb_grove_ir_printable_layout() {
    translate([-(outer_length_mm + printable_layout_spacing_mm) / 2, 0, 0])
        pi_zero_usb_grove_ir_bottom_tray();

    translate([(outer_length_mm + printable_layout_spacing_mm) / 2, 0, 0])
        pi_zero_usb_grove_ir_top_cover();
}

module pi_zero_usb_grove_ir_electronics_reference(
    show_pi = true,
    show_waveshare = true,
    show_grove = true,
    show_ir = true
) {
    if (show_pi) {
        translate([0, 0, pi_zero_bottom_z_mm])
            pi_zero_reference_model(
                show_reference = true,
                show_test_pads = true,
                show_gpio_header_position = 1,
                show_gpio_sound_vision_pads = false,
                show_gpio_pin_colours = false
            );
    }

    if (show_waveshare) {
        translate([0, 0, waveshare_hat_bottom_z_mm])
            waveshare_eth_usb_hub_hat_reference_model(
                show_hat_electronics = true,
                show_adapter = true,
                show_header = true
            );
    }

    if (show_grove) {
        translate([0, 0, grove_hat_bottom_z_mm])
            rotate([0, 0, grove_hat_rotation_deg])
                seeed_grove_base_hat_zero_reference_model(
                    show_electronics_preview = true,
                    show_gpio_header_preview = true,
                    show_gpio_socket_preview = true,
                    show_grove_label_preview = true,
                    show_pi_zero_preview = false
                );
    }

    if (show_ir) {
        translate([ir_mount_center_x_mm, ir_mount_center_y_mm, ir_emitter_bottom_z_mm])
            rotate([0, 0, ir_mount_rotation_deg])
                grove_infrared_emitter_reference_model(
                    show_electronics_preview = true,
                    show_grove_connector_preview = true,
                    show_ir_led_preview = true,
                    show_label_preview = false,
                    show_clearance_preview = true
                );
    }
}

// ======================================================
// Printable Parts
// ======================================================

module pi_zero_usb_grove_ir_bottom_tray() {
    color(tray_colour)
    difference() {
        union() {
            pi_zero_usb_grove_ir_tray_shell();
            pi_zero_usb_grove_ir_stack_standoffs();
            pi_zero_usb_grove_ir_cover_bosses();
            pi_zero_usb_grove_ir_emitter_mount();

            if (!use_rubber_foot_recesses) {
                pi_zero_usb_grove_ir_printed_feet();
            }
        }

        pi_zero_usb_grove_ir_port_cutout_volumes();
        pi_zero_usb_grove_ir_aperture_cutout_volume();
        pi_zero_usb_grove_ir_internal_grove_cable_path_volume();
        pi_zero_usb_grove_ir_stack_standoff_holes();
        pi_zero_usb_grove_ir_cover_boss_holes();
        pi_zero_usb_grove_ir_emitter_mount_holes();

        if (use_rubber_foot_recesses) {
            pi_zero_usb_grove_ir_anti_slide_features();
        }
    }
}

module pi_zero_usb_grove_ir_top_cover() {
    color(cover_colour)
    difference() {
        union() {
            pi_zero_usb_grove_ir_cover_shell();
            pi_zero_usb_grove_ir_cover_alignment_lip();
        }

        pi_zero_usb_grove_ir_cover_hollow_volume();
        pi_zero_usb_grove_ir_port_cutout_volumes();
        pi_zero_usb_grove_ir_aperture_cutout_volume();
        pi_zero_usb_grove_ir_internal_grove_cable_path_volume();
        pi_zero_usb_grove_ir_cover_screw_clearance_holes();
    }
}

module pi_zero_usb_grove_ir_tray_shell() {
    difference() {
        pi_zero_usb_grove_ir_rounded_box(
            [outer_length_mm, outer_width_mm, tray_wall_height_mm],
            corner_radius_mm,
            [0, 0, tray_wall_height_mm / 2]
        );

        translate([0, 0, floor_thickness_mm + (tray_wall_height_mm - floor_thickness_mm) / 2])
            pi_zero_usb_grove_ir_rounded_box(
                [internal_length_mm, internal_width_mm, tray_wall_height_mm - floor_thickness_mm + preview_overlap_mm],
                max(corner_radius_mm - wall_thickness_mm, 0.8),
                [0, 0, 0]
            );
    }
}

module pi_zero_usb_grove_ir_cover_shell() {
    difference() {
        translate([0, 0, tray_wall_height_mm])
            pi_zero_usb_grove_ir_rounded_box(
                [outer_length_mm, outer_width_mm, top_cover_height_mm],
                corner_radius_mm,
                [0, 0, top_cover_height_mm / 2]
            );

        pi_zero_usb_grove_ir_cover_hollow_volume();
    }
}

module pi_zero_usb_grove_ir_cover_hollow_volume() {
    translate([0, 0, tray_wall_height_mm - cover_lip_height_mm])
        pi_zero_usb_grove_ir_rounded_box(
            [
                internal_length_mm + 2 * cover_fit_clearance_mm,
                internal_width_mm + 2 * cover_fit_clearance_mm,
                top_cover_height_mm + cover_lip_height_mm - top_roof_thickness_mm + preview_overlap_mm
            ],
            max(corner_radius_mm - wall_thickness_mm, 0.8),
            [
                0,
                0,
                (top_cover_height_mm + cover_lip_height_mm - top_roof_thickness_mm + preview_overlap_mm) / 2
            ]
        );
}

module pi_zero_usb_grove_ir_cover_alignment_lip() {
    difference() {
        translate([0, 0, tray_wall_height_mm - cover_lip_height_mm])
            pi_zero_usb_grove_ir_rounded_box(
                [internal_length_mm - 2 * cover_fit_clearance_mm, internal_width_mm - 2 * cover_fit_clearance_mm, cover_lip_height_mm],
                max(corner_radius_mm - wall_thickness_mm - cover_fit_clearance_mm, 0.8),
                [0, 0, cover_lip_height_mm / 2]
            );

        translate([0, 0, tray_wall_height_mm - cover_lip_height_mm - preview_overlap_mm])
            pi_zero_usb_grove_ir_rounded_box(
                [
                    internal_length_mm - 2 * cover_lip_thickness_mm - 2 * cover_fit_clearance_mm,
                    internal_width_mm - 2 * cover_lip_thickness_mm - 2 * cover_fit_clearance_mm,
                    cover_lip_height_mm + 2 * preview_overlap_mm
                ],
                max(corner_radius_mm - wall_thickness_mm - cover_lip_thickness_mm, 0.6),
                [0, 0, (cover_lip_height_mm + 2 * preview_overlap_mm) / 2]
            );
    }
}

// ======================================================
// Standoffs, Bosses, IR Mount, And Anti-Slide Features
// ======================================================

module pi_zero_usb_grove_ir_stack_standoffs() {
    color(standoff_colour)
    for (hole_center_mm = pi_mounting_hole_centers_mm) {
        translate([hole_center_mm[0], hole_center_mm[1], floor_thickness_mm])
            cylinder(h = pi_zero_standoff_height_mm, d = pi_standoff_outer_diameter_mm);
    }
}

module pi_zero_usb_grove_ir_stack_standoff_holes() {
    for (hole_center_mm = pi_mounting_hole_centers_mm) {
        translate([hole_center_mm[0], hole_center_mm[1], floor_thickness_mm + pi_zero_standoff_height_mm - pi_standoff_pilot_depth_mm])
            cylinder(
                h = pi_standoff_pilot_depth_mm + preview_overlap_mm,
                d = pi_standoff_screw_hole_diameter_mm
            );
    }
}

module pi_zero_usb_grove_ir_cover_bosses() {
    color(standoff_colour)
    for (boss_center_mm = cover_boss_centers_mm) {
        translate([boss_center_mm[0], boss_center_mm[1], floor_thickness_mm])
            cylinder(h = tray_wall_height_mm - floor_thickness_mm, d = cover_boss_outer_diameter_mm);
    }
}

module pi_zero_usb_grove_ir_cover_boss_holes() {
    for (boss_center_mm = cover_boss_centers_mm) {
        translate([boss_center_mm[0], boss_center_mm[1], floor_thickness_mm])
            cylinder(
                h = tray_wall_height_mm + preview_overlap_mm,
                d = cover_boss_hole_diameter_mm
            );
    }
}

module pi_zero_usb_grove_ir_cover_screw_clearance_holes() {
    for (boss_center_mm = cover_boss_centers_mm) {
        translate([boss_center_mm[0], boss_center_mm[1], tray_wall_height_mm - cover_lip_height_mm - preview_overlap_mm])
            cylinder(
                h = top_cover_height_mm + cover_lip_height_mm + 2 * preview_overlap_mm,
                d = cover_boss_hole_diameter_mm
            );

        translate([boss_center_mm[0], boss_center_mm[1], case_total_height_mm - cover_screw_head_recess_depth_mm])
            cylinder(
                h = cover_screw_head_recess_depth_mm + preview_overlap_mm,
                d = cover_screw_head_diameter_mm
            );
    }
}

module pi_zero_usb_grove_ir_emitter_mount() {
    color(standoff_colour)
    translate([ir_mount_center_x_mm, ir_mount_center_y_mm, floor_thickness_mm])
        rotate([0, 0, ir_mount_rotation_deg])
            for (hole_center_mm = ir_mounting_hole_centers_mm) {
                translate([hole_center_mm[0], hole_center_mm[1], 0])
                    cylinder(h = ir_mount_standoff_height_mm, d = ir_mount_standoff_outer_diameter_mm);
            }
}

module pi_zero_usb_grove_ir_emitter_mount_holes() {
    translate([ir_mount_center_x_mm, ir_mount_center_y_mm, floor_thickness_mm])
        rotate([0, 0, ir_mount_rotation_deg])
            for (hole_center_mm = ir_mounting_hole_centers_mm) {
                translate([hole_center_mm[0], hole_center_mm[1], 0])
                    cylinder(
                        h = ir_mount_standoff_height_mm + preview_overlap_mm,
                        d = ir_mount_screw_hole_diameter_mm
                    );
            }
}

module pi_zero_usb_grove_ir_anti_slide_features() {
    for (foot_center_mm = anti_slide_centers_mm) {
        translate([foot_center_mm[0], foot_center_mm[1], -preview_overlap_mm])
            cylinder(
                h = rubber_foot_recess_depth_mm + preview_overlap_mm,
                d = rubber_foot_recess_diameter_mm
            );
    }
}

module pi_zero_usb_grove_ir_printed_feet() {
    for (foot_center_mm = anti_slide_centers_mm) {
        translate([foot_center_mm[0], foot_center_mm[1], -printed_foot_height_mm])
            cylinder(h = printed_foot_height_mm, d = printed_foot_diameter_mm);
    }
}

// ======================================================
// Cutouts, Aperture, Cable Path, And Guides
// ======================================================

module pi_zero_usb_grove_ir_port_cutout_volumes() {
    for (port_mm = port_cutouts_mm) {
        pi_zero_usb_grove_ir_port_cutout_volume(port_mm);
    }
}

module pi_zero_usb_grove_ir_port_cutout_volume(port_mm) {
    translate([port_mm[1], port_mm[2], port_mm[3]])
        cube([
            port_mm[4] + port_cutout_extra_clearance_mm,
            port_mm[5] + port_cutout_extra_clearance_mm,
            port_mm[6] + port_cutout_extra_clearance_mm
        ], center = true);
}

module pi_zero_usb_grove_ir_aperture_cutout_volume() {
    translate([
        ir_led_aperture_center_x_mm,
        ir_led_aperture_center_y_mm,
        ir_led_aperture_center_z_mm
    ])
        rotate([90, 0, 0])
            cylinder(
                h = ir_led_aperture_wall_clearance_depth_mm + wall_thickness_mm + preview_overlap_mm,
                d = ir_led_aperture_diameter_mm,
                center = true
            );
}

module pi_zero_usb_grove_ir_ir_led_aperture() {
    pi_zero_usb_grove_ir_aperture_cutout_volume();
}

module pi_zero_usb_grove_ir_internal_grove_cable_path_volume() {
    hull() {
        translate([grove_cable_path_start_x_mm, grove_cable_path_start_y_mm, grove_cable_path_center_z_mm])
            cube([grove_cable_path_width_mm, grove_cable_path_width_mm, grove_cable_path_height_mm], center = true);

        translate([grove_cable_path_end_x_mm, grove_cable_path_end_y_mm, grove_cable_path_center_z_mm + grove_cable_path_clearance_lift_mm])
            cube([grove_cable_path_width_mm, grove_cable_path_width_mm, grove_cable_path_height_mm], center = true);
    }
}

module pi_zero_usb_grove_ir_internal_grove_cable_path_guide() {
    color(cable_guide_colour, guide_alpha)
        pi_zero_usb_grove_ir_internal_grove_cable_path_volume();
}

module pi_zero_usb_grove_ir_cutout_guides() {
    color(cutout_guide_colour, guide_alpha)
    pi_zero_usb_grove_ir_port_cutout_volumes();

    color(ir_guide_colour, guide_alpha)
    union() {
        pi_zero_usb_grove_ir_ir_led_aperture();

        translate([
            ir_led_aperture_center_x_mm,
            ir_led_aperture_center_y_mm - ir_led_aperture_guide_length_mm / 2,
            ir_led_aperture_center_z_mm
        ])
            cube([
                ir_led_aperture_diameter_mm,
                ir_led_aperture_guide_length_mm,
                ir_led_aperture_diameter_mm
            ], center = true);
    }

    pi_zero_usb_grove_ir_internal_grove_cable_path_guide();
}

// ======================================================
// Helper Geometry
// ======================================================

module pi_zero_usb_grove_ir_rounded_box(size_mm, radius_mm, center_mm) {
    translate(center_mm)
        hull()
            for (x_position_mm = [-size_mm[0] / 2 + radius_mm, size_mm[0] / 2 - radius_mm])
            for (y_position_mm = [-size_mm[1] / 2 + radius_mm, size_mm[1] / 2 - radius_mm])
            for (z_position_mm = [-size_mm[2] / 2 + radius_mm, size_mm[2] / 2 - radius_mm]) {
                translate([x_position_mm, y_position_mm, z_position_mm])
                    sphere(r = radius_mm);
            }
}
