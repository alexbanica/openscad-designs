// Seeed Grove - Infrared Emitter reference model.
//
// Units: mm
// Origin: board center on the PCB bottom face.
// X runs across the board width, Y runs along the board length, and Z rises
// from the PCB bottom face. The IR LED points toward +Y by default.
//
// This is an adjustable fit and clearance reference, not a vendor-certified
// mechanical model. Defaults use the detailed 20.0 mm x 24.0 mm PCB with
// 7.5 mm IR LED extension; Seeed's wiki also lists a conflicting 20.0 mm x
// 20.0 mm module size. Mounting-hole defaults are Grove 20 mm-class planning
// assumptions until measured.

// ======================================================
// Adjustable Parameters
// ======================================================

// Render controls
$fn = 48;
render_mode = "assembly"; // [assembly/pcb/clearance/printable_layout]
show_electronics = true;
show_grove_connector = true;
show_ir_led = true;
show_labels = true;
show_clearance_guides = true;

// Board dimensions
pcb_width_mm = 20.0;
pcb_length_mm = 24.0;
pcb_thickness_mm = 1.6;
pcb_corner_radius_mm = 1.5;

// Mounting holes
mounting_hole_diameter_mm = 2.0;
mounting_hole_edge_offset_x_mm = 2.5;
mounting_hole_edge_offset_y_mm = 2.5;
mounting_hole_marker_diameter_mm = 3.8;

// Grove connector dimensions and placement
grove_connector_width_mm = 8.0;
grove_connector_length_mm = 7.5;
grove_connector_height_mm = 5.8;
grove_connector_center_x_mm = 0.0;
grove_connector_center_y_mm = -8.1;
grove_connector_z_clearance_mm = 0.0;

// Grove cable/plug clearance dimensions
grove_cable_clearance_width_mm = 12.0;
grove_cable_clearance_length_mm = 12.0;
grove_cable_clearance_height_mm = 7.0;
grove_cable_clearance_bottom_gap_mm = 0.2;

// IR LED body and extension dimensions
ir_led_diameter_mm = 5.0;
ir_led_body_length_mm = 7.0;
ir_led_center_x_mm = 0.0;
ir_led_center_height_mm = 4.0;
ir_led_extension_beyond_pcb_mm = 7.5;

// Component and label preview dimensions
component_clearance_blocks_mm = [
    [-4.8, 1.0, 5.2, 3.2, 1.6, "DimGray"],
    [4.7, 1.2, 4.0, 3.0, 1.4, "Black"],
    [0.0, -2.8, 6.0, 2.6, 1.2, "DarkSlateGray"],
    [6.0, 6.2, 3.0, 2.4, 1.1, "Silver"]
];
label_size_mm = 1.9;
label_height_mm = 0.25;
label_z_offset_mm = 0.2;

// Clearance and sightline guide dimensions
ir_half_intensity_angle_deg = 17.0;
ir_sightline_length_mm = 28.0;
ir_sightline_width_mm = 0.35;
ir_extension_envelope_diameter_extra_mm = 1.5;
clearance_guide_lift_mm = 0.2;

// Printable layout
printable_layout_spacing_mm = 18.0;

// Visual settings
pcb_colour = "ForestGreen";
mounting_hole_marker_colour = "Silver";
grove_connector_colour = "White";
grove_clearance_colour = "LightSkyBlue";
ir_led_body_colour = "DarkRed";
ir_led_lens_colour = "FireBrick";
ir_clearance_colour = "Orange";
component_colour = "DimGray";
label_colour = "White";

// ======================================================
// Derived Values
// ======================================================

pcb_half_width_mm = pcb_width_mm / 2;
pcb_half_length_mm = pcb_length_mm / 2;
pcb_half_thickness_mm = pcb_thickness_mm / 2;
mounting_hole_radius_mm = mounting_hole_diameter_mm / 2;
mounting_hole_x_mm = pcb_half_width_mm - mounting_hole_edge_offset_x_mm;
mounting_hole_y_mm = pcb_half_length_mm - mounting_hole_edge_offset_y_mm;
mounting_hole_centers_mm = [
    [-mounting_hole_x_mm, -mounting_hole_y_mm],
    [mounting_hole_x_mm, -mounting_hole_y_mm],
    [-mounting_hole_x_mm, mounting_hole_y_mm],
    [mounting_hole_x_mm, mounting_hole_y_mm]
];
grove_connector_center_z_mm =
    pcb_thickness_mm + grove_connector_height_mm / 2 + grove_connector_z_clearance_mm;
grove_connector_top_z_mm =
    pcb_thickness_mm + grove_connector_z_clearance_mm + grove_connector_height_mm;
grove_cable_clearance_center_x_mm = grove_connector_center_x_mm;
grove_cable_clearance_center_y_mm =
    grove_connector_center_y_mm;
grove_cable_clearance_center_z_mm =
    grove_connector_top_z_mm
    + grove_cable_clearance_bottom_gap_mm
    + grove_cable_clearance_height_mm / 2;
ir_led_center_y_mm =
    pcb_half_length_mm + ir_led_extension_beyond_pcb_mm - ir_led_body_length_mm / 2;
ir_led_front_y_mm = pcb_half_length_mm + ir_led_extension_beyond_pcb_mm;
ir_led_back_y_mm = ir_led_front_y_mm - ir_led_body_length_mm;
ir_led_extension_envelope_diameter_mm =
    ir_led_diameter_mm + ir_extension_envelope_diameter_extra_mm;
ir_sightline_origin_y_mm = ir_led_front_y_mm;
ir_sightline_center_y_mm = ir_sightline_origin_y_mm + ir_sightline_length_mm / 2;
full_envelope_length_mm = pcb_length_mm + ir_led_extension_beyond_pcb_mm;

// ======================================================
// Render Dispatch
// ======================================================

if (render_mode == "assembly") {
    grove_infrared_emitter_reference_model();
} else if (render_mode == "pcb") {
    grove_infrared_emitter_reference_model(
        show_electronics_preview = false,
        show_grove_connector_preview = false,
        show_ir_led_preview = false,
        show_label_preview = false,
        show_clearance_preview = false
    );
} else if (render_mode == "clearance") {
    grove_infrared_emitter_reference_model(
        show_electronics_preview = true,
        show_grove_connector_preview = show_grove_connector,
        show_ir_led_preview = show_ir_led,
        show_label_preview = show_labels,
        show_clearance_preview = show_clearance_guides
    );
} else if (render_mode == "printable_layout") {
    grove_infrared_emitter_printable_layout();
} else {
    grove_infrared_emitter_reference_model();
}

// ======================================================
// Main Reference Model
// ======================================================

module grove_infrared_emitter_reference_model(
    show_electronics_preview = show_electronics,
    show_grove_connector_preview = show_grove_connector,
    show_ir_led_preview = show_ir_led,
    show_label_preview = show_labels,
    show_clearance_preview = show_clearance_guides
) {
    grove_infrared_emitter_pcb_reference();

    if (show_electronics_preview) {
        grove_infrared_emitter_component_previews();
    }

    if (show_grove_connector_preview) {
        grove_infrared_emitter_grove_connector_preview();
    }

    if (show_ir_led_preview) {
        grove_infrared_emitter_ir_led_preview();
    }

    if (show_clearance_preview) {
        grove_infrared_emitter_clearance_guides(
            show_connector_clearance = show_grove_connector_preview,
            show_led_clearance = show_ir_led_preview
        );
    }

    if (show_label_preview) {
        grove_infrared_emitter_label_previews(
            show_connector_label = show_grove_connector_preview,
            show_led_label = show_ir_led_preview,
            show_clearance_label = show_clearance_preview
        );
    }
}

// ======================================================
// PCB Board And Mounting Holes
// ======================================================

module grove_infrared_emitter_pcb_reference() {
    color(pcb_colour)
    difference() {
        grove_infrared_emitter_rounded_box(
            [pcb_width_mm, pcb_length_mm, pcb_thickness_mm],
            pcb_corner_radius_mm,
            [0, 0, pcb_half_thickness_mm]
        );

        for (hole_center_mm = mounting_hole_centers_mm) {
            grove_infrared_emitter_pcb_hole(hole_center_mm);
        }
    }

    for (hole_center_mm = mounting_hole_centers_mm) {
        color(mounting_hole_marker_colour)
        translate([hole_center_mm[0], hole_center_mm[1], pcb_thickness_mm + 0.03])
            difference() {
                cylinder(h = 0.06, d = mounting_hole_marker_diameter_mm, center = true);
                cylinder(h = 0.08, d = mounting_hole_diameter_mm + 0.2, center = true);
            }
    }
}

module grove_infrared_emitter_pcb_hole(center_xy_mm) {
    translate([center_xy_mm[0], center_xy_mm[1], pcb_half_thickness_mm])
        cylinder(
            h = pcb_thickness_mm + 0.2,
            d = mounting_hole_diameter_mm,
            center = true
        );
}

// ======================================================
// Grove Connector And Cable Clearance
// ======================================================

module grove_infrared_emitter_grove_connector_preview() {
    color(grove_connector_colour)
    translate([
        grove_connector_center_x_mm,
        grove_connector_center_y_mm,
        grove_connector_center_z_mm
    ])
        cube([
            grove_connector_width_mm,
            grove_connector_length_mm,
            grove_connector_height_mm
        ], center = true);
}

module grove_infrared_emitter_grove_cable_clearance_preview() {
    color(grove_clearance_colour, 0.32)
    translate([
        grove_cable_clearance_center_x_mm,
        grove_cable_clearance_center_y_mm,
        grove_cable_clearance_center_z_mm
    ])
        cube([
            grove_cable_clearance_width_mm,
            grove_cable_clearance_length_mm,
            grove_cable_clearance_height_mm
        ], center = true);
}

// ======================================================
// IR LED Body And Extension
// ======================================================

module grove_infrared_emitter_ir_led_preview() {
    color(ir_led_body_colour)
    translate([ir_led_center_x_mm, ir_led_center_y_mm, ir_led_center_height_mm])
    rotate([90, 0, 0])
        cylinder(h = ir_led_body_length_mm, d = ir_led_diameter_mm, center = true);

    color(ir_led_lens_colour)
    translate([ir_led_center_x_mm, ir_led_front_y_mm, ir_led_center_height_mm])
    rotate([90, 0, 0])
        cylinder(h = 0.8, d1 = ir_led_diameter_mm, d2 = ir_led_diameter_mm * 0.72, center = true);
}

module grove_infrared_emitter_ir_extension_envelope_preview() {
    color(ir_clearance_colour, 0.26)
    translate([
        ir_led_center_x_mm,
        pcb_half_length_mm + ir_led_extension_beyond_pcb_mm / 2,
        ir_led_center_height_mm
    ])
    rotate([90, 0, 0])
        cylinder(
            h = ir_led_extension_beyond_pcb_mm,
            d = ir_led_extension_envelope_diameter_mm,
            center = true
        );
}

// ======================================================
// Component Blocks And Labels
// ======================================================

module grove_infrared_emitter_component_previews() {
    for (component_mm = component_clearance_blocks_mm) {
        grove_infrared_emitter_top_component(
            [component_mm[0], component_mm[1]],
            [component_mm[2], component_mm[3], component_mm[4]],
            component_mm[5]
        );
    }
}

module grove_infrared_emitter_label_previews(
    show_connector_label = true,
    show_led_label = true,
    show_clearance_label = true
) {
    grove_infrared_emitter_top_label("Grove IR Emitter", [-8.7, 8.0, pcb_thickness_mm + label_z_offset_mm]);
    grove_infrared_emitter_top_label("20 x 24 PCB", [-8.5, -1.4, pcb_thickness_mm + label_z_offset_mm]);

    if (show_connector_label) {
        grove_infrared_emitter_top_label("Grove", [-4.4, -10.5, pcb_thickness_mm + label_z_offset_mm]);
    }

    if (show_led_label) {
        grove_infrared_emitter_top_label("IR LED", [-4.0, 11.0, pcb_thickness_mm + label_z_offset_mm]);
    }

    if (show_clearance_label) {
        color(label_colour)
        translate([ir_led_center_x_mm + 1.5, ir_sightline_origin_y_mm + 5.5, ir_led_center_height_mm])
        rotate([90, 0, 0])
            linear_extrude(height = label_height_mm)
                text("17 deg", size = label_size_mm, halign = "left", valign = "center");
    }
}

// ======================================================
// Clearance And Sightline Guides
// ======================================================

module grove_infrared_emitter_clearance_guides(
    show_connector_clearance = show_grove_connector,
    show_led_clearance = show_ir_led
) {
    if (show_connector_clearance) {
        grove_infrared_emitter_grove_cable_clearance_preview();
    }

    if (show_led_clearance) {
        grove_infrared_emitter_ir_extension_envelope_preview();
        grove_infrared_emitter_sightline_guides();
    }
}

module grove_infrared_emitter_sightline_guides() {
    color(ir_clearance_colour, 0.5)
    translate([ir_led_center_x_mm, ir_sightline_center_y_mm, ir_led_center_height_mm])
        cube([ir_sightline_width_mm, ir_sightline_length_mm, ir_sightline_width_mm], center = true);

    for (angle_deg = [-ir_half_intensity_angle_deg, ir_half_intensity_angle_deg]) {
        color(ir_clearance_colour, 0.38)
        translate([ir_led_center_x_mm, ir_sightline_origin_y_mm, ir_led_center_height_mm])
        rotate([0, 0, -angle_deg])
        translate([0, ir_sightline_length_mm / 2, 0])
            cube([ir_sightline_width_mm, ir_sightline_length_mm, ir_sightline_width_mm], center = true);
    }
}

// ======================================================
// Printable Fit-Check Layout
// ======================================================

module grove_infrared_emitter_printable_layout() {
    translate([
        -pcb_half_width_mm - printable_layout_spacing_mm / 2,
        0,
        0
    ])
        grove_infrared_emitter_reference_model(
            show_clearance_preview = false
        );

    translate([
        pcb_half_width_mm + printable_layout_spacing_mm / 2,
        0,
        0
    ])
        union() {
            grove_infrared_emitter_reference_model(
                show_electronics_preview = false,
                show_grove_connector_preview = false,
                show_ir_led_preview = false,
                show_label_preview = show_labels,
                show_clearance_preview = false
            );

            if (show_clearance_guides) {
                grove_infrared_emitter_clearance_guides(
                    show_connector_clearance = show_grove_connector,
                    show_led_clearance = show_ir_led
                );
            }
        }
}

// ======================================================
// Helper Modules
// ======================================================

module grove_infrared_emitter_top_component(center_xy_mm, size_mm, colour = component_colour) {
    color(colour)
    translate([
        center_xy_mm[0],
        center_xy_mm[1],
        pcb_thickness_mm + size_mm[2] / 2
    ])
        cube(size_mm, center = true);
}

module grove_infrared_emitter_top_label(label_text, origin_mm) {
    color(label_colour)
    translate(origin_mm)
        linear_extrude(height = label_height_mm)
            text(label_text, size = label_size_mm, halign = "left", valign = "center");
}

module grove_infrared_emitter_rounded_box(size_mm, radius_mm, center_mm) {
    translate(center_mm)
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
