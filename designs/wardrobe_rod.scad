// One-piece open-ended wardrobe rod. Dimensions are user supplied.

// Adjustable Parameters
// Holder spacing and engagement
clear_span_mm = 300;
left_insertion_depth_mm = 10;
right_insertion_depth_mm = 10;

// Circular cross-section
outside_diameter_mm = 22;
wall_thickness_mm = 4;

// View selection
render_mode = "printable_layout"; // [printable_layout, assembly]

// Derived Values
rod_length_mm = clear_span_mm + left_insertion_depth_mm + right_insertion_depth_mm;
bore_diameter_mm = outside_diameter_mm - 2 * wall_thickness_mm;
outer_radius_mm = outside_diameter_mm / 2;
bore_overrun_mm = 0.1;
$fn = 96;

assert(clear_span_mm > 0, "Clear span must be positive.");
assert(left_insertion_depth_mm >= 0 && right_insertion_depth_mm >= 0,
       "Insertion depths must be nonnegative.");
assert(outside_diameter_mm > 0, "Outside diameter must be positive.");
assert(wall_thickness_mm > 0, "Wall thickness must be positive.");
assert(bore_diameter_mm > 0, "Wall thickness must leave an open bore.");
assert(render_mode == "printable_layout" || render_mode == "assembly",
       "Unsupported render_mode.");

module wardrobe_rod() {
    difference() {
        cylinder(h = rod_length_mm, d = outside_diameter_mm, center = true);
        cylinder(h = rod_length_mm + 2 * bore_overrun_mm,
                 d = bore_diameter_mm, center = true);
    }
}

module horizontal_rod() {
    translate([0, 0, outer_radius_mm])
        rotate([0, 90, 0]) wardrobe_rod();
}

module printable_layout() {
    rotate([0, 0, 45]) horizontal_rod();
}

module assembly() {
    horizontal_rod();
}

if (render_mode == "printable_layout") printable_layout();
else assembly();
