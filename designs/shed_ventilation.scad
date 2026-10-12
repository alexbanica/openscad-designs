// Shed vent: provisional photo estimates. Units mm; installed up is +Y,
// outside is +Z, rear mounting plane and print bed are Z=0.
// Adjustable Parameters
render_mode = "printable_layout";
door_angle_deg = 0;
// Photo-estimated mounting dimensions: measure before installation.
plate_width_mm = 125;
plate_height_mm = 85;
screw_spacing_x_mm = 110;
screw_spacing_y_mm = 70;
// Selected design defaults, not measured hardware.
screw_clearance_diameter_mm = 4.5;
screw_head_diameter_mm = 9;
screw_head_height_mm = 4;
frame_border_mm = 10;
frame_thickness_mm = 3;
door_thickness_mm = 2.4;
door_overlap_mm = 3;
moving_clearance_mm = 0.4;
journal_diameter_mm = 3;
louver_projection_mm = 5;
louver_rows = 4;
louver_columns = 2;
$fn = 32;

// Derived Values
opening_width_mm = plate_width_mm - 2*frame_border_mm;
opening_height_mm = plate_height_mm - 2*frame_border_mm;
core_width_mm = opening_width_mm - 2*moving_clearance_mm;
core_height_mm = opening_height_mm - 2*moving_clearance_mm;
lip_z_mm = frame_thickness_mm + moving_clearance_mm;
door_width_mm = opening_width_mm + 2*door_overlap_mm;
door_height_mm = opening_height_mm + 2*door_overlap_mm;
hinge_y_mm = -plate_height_mm/2 - 5;
hinge_z_mm = 5;
journal_radius_mm = journal_diameter_mm/2;
bearing_inner_x_mm = core_width_mm/2 - 18;
bearing_width_mm = 8;
arm_x_mm = bearing_inner_x_mm - 4;
head_start_x_mm = bearing_inner_x_mm + 3 + moving_clearance_mm;
head_length_mm = 1.6;
head_radius_mm = journal_radius_mm + 1;
head_down_mm = hinge_z_mm;
chamber_radius_mm = max(sqrt(pow(head_down_mm,2)+pow(0.3,2)),head_radius_mm) + moving_clearance_mm;
slot_width_mm = (core_width_mm - 18)/louver_columns;
row_pitch_mm = (core_height_mm - 10)/louver_rows;
slot_height_mm = row_pitch_mm - 7;
slot_x_pitch_mm = slot_width_mm + 5;
top_catch_width_mm = 12;
catch_y_mm = door_height_mm/2 + moving_clearance_mm;
// Conservative XY keepouts use the real aperture corner, bearing and catch.
screw_corner_distance_mm = sqrt(pow(max((screw_spacing_x_mm-opening_width_mm)/2,0),2)+pow(max((screw_spacing_y_mm-opening_height_mm)/2,0),2));
journal_bridge_overlap_mm = min(hinge_z_mm+journal_radius_mm,lip_z_mm+door_thickness_mm)-max(hinge_z_mm-journal_radius_mm,lip_z_mm);
function rectangle_distance_mm(x_mm,y_mm,x0_mm,x1_mm,y0_mm,y1_mm) = sqrt(pow(max(x0_mm-x_mm,0,x_mm-x1_mm),2)+pow(max(y0_mm-y_mm,0,y_mm-y1_mm),2));
// Exact top-core radial envelope over the entire 0..90-degree sweep.
core_top_sweep_mm = hinge_y_mm + sqrt(pow(core_height_mm/2-hinge_y_mm,2)+pow(hinge_z_mm,2));

assert(render_mode=="printable_layout" || render_mode=="assembly", "Only permitted inspection modes");
assert(plate_width_mm>0 && plate_height_mm>0 && frame_border_mm>0 && frame_thickness_mm>0 && door_thickness_mm>0, "Positive dimensions required");
assert(moving_clearance_mm>0 && journal_diameter_mm>0 && door_overlap_mm>0, "Positive moving clearances required");
assert(door_angle_deg>=0 && door_angle_deg<=90, "Operational range 0..90 degrees");
assert(louver_rows==4 && louver_columns==2 && slot_height_mm>0 && slot_width_mm>0 && louver_projection_mm>0, "Eight noncollapsed passages required");
assert(door_overlap_mm<frame_border_mm && core_width_mm>40 && core_height_mm>30, "Invalid overlap or aperture");
assert(screw_spacing_x_mm/2+screw_head_diameter_mm/2<=plate_width_mm/2 && screw_spacing_y_mm/2+screw_head_diameter_mm/2<=plate_height_mm/2, "Screw head outside mounting plate");
assert(screw_spacing_x_mm>opening_width_mm && screw_spacing_y_mm>opening_height_mm, "Screw centres must remain in corner borders");
assert(screw_clearance_diameter_mm>0 && screw_clearance_diameter_mm<screw_head_diameter_mm, "Invalid screw diameters");
assert(screw_head_height_mm>0, "Positive screw head height required");
// Smaller heads are subsets of the validated Z=3..7 mm default envelope.
// Taller heads need renewed local-relief motion inspection before support.
assert(screw_head_height_mm<=4, "Screw head exceeds supported 4 mm motion envelope");
assert(screw_corner_distance_mm>screw_clearance_diameter_mm/2, "Screw shank intersects aperture corner");
assert(journal_bridge_overlap_mm>0, "Journal and moving bridge require positive material overlap");
for (sx=[-1,1],sy=[-1,1]) {
    assert(rectangle_distance_mm(sx*screw_spacing_x_mm/2,sy*screw_spacing_y_mm/2,-top_catch_width_mm/2,top_catch_width_mm/2,door_height_mm/2-1.2,catch_y_mm+2.8)>screw_head_diameter_mm/2+moving_clearance_mm, "Screw head/tool intersects catch");
    for (side=[-1,1])
        assert(rectangle_distance_mm(side*sx*screw_spacing_x_mm/2,sy*screw_spacing_y_mm/2,arm_x_mm,bearing_inner_x_mm+bearing_width_mm,hinge_y_mm-7,hinge_y_mm+7)>screw_head_diameter_mm/2+moving_clearance_mm, "Screw head/tool intersects hinge or stop");
}
assert(core_top_sweep_mm<opening_height_mm/2, "Recessed core collides with frame top during sweep");
assert(journal_radius_mm<hinge_z_mm && head_radius_mm>journal_radius_mm+moving_clearance_mm, "Invalid captive journal/head allocation");
assert(bearing_inner_x_mm>top_catch_width_mm && bearing_inner_x_mm+bearing_width_mm<opening_width_mm/2, "Hinge conflict");
assert(catch_y_mm+3<plate_height_mm/2, "Catch outside plate");

echo(screw_corner_distance_mm=screw_corner_distance_mm,journal_bridge_overlap_mm=journal_bridge_overlap_mm,screw_head_z_mm=[frame_thickness_mm,frame_thickness_mm+screw_head_height_mm]);
echo(opening_mm=[opening_width_mm,opening_height_mm],core_top_sweep_mm=core_top_sweep_mm,hinge_axis_mm=[hinge_y_mm,hinge_z_mm],journal_radial_gap_mm=moving_clearance_mm,head_retention_overlap_mm=head_radius_mm-journal_radius_mm-moving_clearance_mm);

// Inspection helper: actual selected head envelope, never part of the print.
// QA can intersect this with door_at_angle() to inspect the complete sweep.
module screw_head_envelopes() {
    for (sx=[-1,1],sy=[-1,1])
        translate([sx*screw_spacing_x_mm/2,sy*screw_spacing_y_mm/2,frame_thickness_mm])
            cylinder(h=screw_head_height_mm,d=screw_head_diameter_mm);
}
module rounded_rectangle(width_mm,height_mm,radius_mm=0.8) {
    offset(r=radius_mm) square([width_mm-2*radius_mm,height_mm-2*radius_mm],center=true);
}
module axis_prism(start_x_mm,length_mm) {
    translate([start_x_mm,hinge_y_mm,hinge_z_mm]) rotate([90,0,90]) linear_extrude(height=length_mm) children();
}
module diamond(radius_mm) {
    polygon([[sqrt(2)*radius_mm,0],[0,sqrt(2)*radius_mm],[-sqrt(2)*radius_mm,0],[0,-sqrt(2)*radius_mm]]);
}
module head_profile() {
    // Bed-reaching toe integral to the moving head; no separate pin/retainer.
    polygon([[-0.3,-head_down_mm],[0.3,-head_down_mm],[head_radius_mm,0],[0,head_radius_mm],[-head_radius_mm,0]]);
}
module bearing_chamber() {
    union() {
        // Lower half follows the long toe; upper diamond provides a 45-degree roof.
        intersection() { circle(r=chamber_radius_mm); translate([-chamber_radius_mm,-chamber_radius_mm]) square([2*chamber_radius_mm,chamber_radius_mm]); }
        intersection() { diamond(chamber_radius_mm); translate([-10,0]) square([20,10]); }
    }
}
module one_bearing() {
    difference() {
        translate([bearing_inner_x_mm,hinge_y_mm-7,0]) cube([bearing_width_mm,14,hinge_z_mm+sqrt(2)*chamber_radius_mm+1.6]);
        axis_prism(bearing_inner_x_mm-0.1,3.1) diamond(journal_radius_mm+moving_clearance_mm);
        axis_prism(bearing_inner_x_mm+3,head_length_mm+2*moving_clearance_mm) bearing_chamber();
    }
}
module fixed_frame() {
    difference() {
        linear_extrude(height=frame_thickness_mm) difference() {
            rounded_rectangle(plate_width_mm,plate_height_mm);
            rounded_rectangle(opening_width_mm,opening_height_mm);
        }
        for (sx=[-1,1],sy=[-1,1]) translate([sx*screw_spacing_x_mm/2,sy*screw_spacing_y_mm/2,-0.1]) cylinder(h=frame_thickness_mm+0.2,d=screw_clearance_diameter_mm);
    }
    one_bearing(); mirror([1,0,0]) one_bearing();
    // Stops contact the moving lug underside only at 90 degrees.
    for (side=[-1,1]) scale([side,1,1])
        translate([arm_x_mm+2.5,hinge_y_mm-1.2,0])
            cube([bearing_inner_x_mm-arm_x_mm-1.5,1.4,1]);
    // Flexible top catch: bed-supported anchor and cantilever beam outside door.
    translate([-top_catch_width_mm/2,catch_y_mm+1.6,0]) cube([top_catch_width_mm,1.2,lip_z_mm+door_thickness_mm+1.8]);
    translate([-top_catch_width_mm/2,catch_y_mm,lip_z_mm+door_thickness_mm+moving_clearance_mm]) cube([top_catch_width_mm,2.8,1.2]);
    // Lip hooks over a door tab, initially with positive XYZ clearance.
    translate([-top_catch_width_mm/2,door_height_mm/2-1.2,lip_z_mm+door_thickness_mm+moving_clearance_mm]) cube([top_catch_width_mm,1.6+moving_clearance_mm,1.2]);
}
module vent_slots() {
    for (row=[0:louver_rows-1],column=[0:louver_columns-1]) {
        x_mm=(column-(louver_columns-1)/2)*slot_x_pitch_mm;
        y_mm=(row-(louver_rows-1)/2)*row_pitch_mm;
        translate([x_mm,y_mm,-0.1]) linear_extrude(height=lip_z_mm+door_thickness_mm+0.2) rounded_rectangle(slot_width_mm,slot_height_mm,0.5);
    }
}
module door_louvers() {
    for (row=[0:louver_rows-1],column=[0:louver_columns-1]) {
        x_mm=(column-(louver_columns-1)/2)*slot_x_pitch_mm;
        y_mm=(row-(louver_rows-1)/2)*row_pitch_mm;
        // Top-connected inclined roof; bottom mouth remains open to downward Y.
        translate([x_mm-slot_width_mm/2-1,y_mm,door_thickness_mm]) rotate([90,0,90]) linear_extrude(height=slot_width_mm+2)
            polygon([[slot_height_mm/2+1,-0.2],[slot_height_mm/2+1,1.2],[-slot_height_mm/2,louver_projection_mm],[-slot_height_mm/2,louver_projection_mm-1.2]]);
    }
}
module one_moving_hinge() {
    // Bridge crosses the frame above its 3 mm top with a 0.4 mm gap.
    translate([arm_x_mm,hinge_y_mm-1,lip_z_mm]) cube([2,-core_height_mm/2-hinge_y_mm+3,door_thickness_mm]);
    translate([arm_x_mm,hinge_y_mm-journal_radius_mm,0]) cube([2,2*journal_radius_mm,hinge_z_mm]);
    axis_prism(arm_x_mm,head_start_x_mm+head_length_mm-arm_x_mm) circle(r=journal_radius_mm);
    axis_prism(head_start_x_mm,head_length_mm) head_profile();
    // Integral radial stop lug; its y=-4 face becomes z=1 at 90 degrees.
    translate([arm_x_mm+2.5,hinge_y_mm-4,hinge_z_mm]) cube([1,3,1]);
}
module door_solid() {
    difference() {
        union() {
            linear_extrude(height=door_thickness_mm) rounded_rectangle(core_width_mm,core_height_mm);
            // Perimeter overlap grows from core side edges, bridges relief gap.
            translate([0,0,lip_z_mm]) linear_extrude(height=door_thickness_mm) difference() {
                rounded_rectangle(door_width_mm,door_height_mm);
                rounded_rectangle(core_width_mm-2,core_height_mm-2);
            }
            linear_extrude(height=lip_z_mm+0.2) difference() {
                rounded_rectangle(core_width_mm,core_height_mm);
                rounded_rectangle(core_width_mm-2,core_height_mm-2);
            }
        }
        vent_slots();
    }
    door_louvers();
    one_moving_hinge(); mirror([1,0,0]) one_moving_hinge();
    translate([-5,door_height_mm/2-4,lip_z_mm+door_thickness_mm]) cube([10,2,2]);
}
module moving_door() {
    difference() {
        door_solid();
        // A2 full-depth corner relief includes the recessed core for initial swing.
        // Four local corner gaps preserve all straight-edge overlap and hole inputs.
        for (sx=[-1,1],sy=[-1,1])
            translate([sx*screw_spacing_x_mm/2,sy*screw_spacing_y_mm/2,-0.1])
                cylinder(h=max(lip_z_mm+door_thickness_mm,louver_projection_mm+door_thickness_mm,hinge_z_mm+head_radius_mm)+0.2,d=screw_head_diameter_mm+2*moving_clearance_mm);
    }
}
module door_at_angle(angle_deg) {
    translate([0,hinge_y_mm,hinge_z_mm]) rotate([angle_deg,0,0]) translate([0,-hinge_y_mm,-hinge_z_mm]) moving_door();
}
module vent_assembly(angle_deg) {
    color("silver") fixed_frame();
    color("steelblue") door_at_angle(angle_deg);
}
vent_assembly(render_mode=="printable_layout" ? 0 : door_angle_deg);
