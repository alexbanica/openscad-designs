# OpenSCAD Designs

This repository contains editable OpenSCAD designs.

## Design Files

- `designs/rpi5_ai_hat_dual_heatsink_vision_case.scad`
- `designs/pi_zero_usb_grove_ir_enclosure.scad`

Both files target OpenSCAD 2021.01 and have no external library dependencies.

## Raspberry Pi 5 AI HAT+ Vision Case

The Raspberry Pi 5 design is a printable open tower frame with a forward camera arm, adjustable tilt holder, bottom intake, top exhaust opening, and CSI ribbon relief.

### Component Assumptions

Default dimensions are configurable at the top of the `.scad` file. The initial defaults assume:

- Raspberry Pi 5 board: 85 mm x 56 mm.
- Raspberry Pi AI HAT+ or compatible HAT footprint: about 66 mm x 56.5 mm.
- Raspberry Pi Camera Module 3 Standard: 25 mm x 24 mm x 11.5 mm envelope.
- Common M2.5 Raspberry Pi mounting hardware.
- A Pi active cooler below the HAT and a second active cooler above the AI HAT.

The cooler models are clearance volumes for fit and airflow inspection, not vendor-accurate cosmetic models.

### Adjustable Parameters

The OpenSCAD source starts with an `Adjustable Parameters` section grouped by:

- render controls,
- board dimensions,
- stack and cooler clearances,
- case structure,
- ventilation,
- camera system,
- CSI ribbon routing,
- fasteners and print tolerances.

Common edits:

- Change `render_mode` to export a specific printable part.
- Set `show_electronics = false` for printable-only previews.
- Adjust `camera_arm_forward_offset_mm` and `camera_tilt_angle_deg` for camera placement.
- Increase `case_board_clearance_mm`, `fit_tolerance_mm`, or `layer_friendly_clearance_mm` for looser prints.
- Adjust cooler clearance heights if a specific heatsink or fan stack is taller than the defaults.

### Render Modes

Set `render_mode` to one of:

- `assembly`: full preview with tower, camera arm, holder, and optional electronics.
- `tower`: tower/base printable part.
- `camera_arm`: forward camera arm printable part.
- `camera_holder`: camera holder and tilt hinge printable part.
- `printable_layout`: printable parts arranged side-by-side for inspection.

Example export command:

```sh
openscad -o tower.stl -D 'render_mode="tower"' designs/rpi5_ai_hat_dual_heatsink_vision_case.scad
```

For inspection with electronics hidden:

```sh
openscad -o assembly.off -D 'render_mode="assembly"' -D 'show_electronics=false' designs/rpi5_ai_hat_dual_heatsink_vision_case.scad
```

### Bambu Lab Print Notes

- Print tower, camera arm, and holder as separate parts.
- Use PLA, PETG, or another material appropriate for the target thermal environment.
- Prefer at least three perimeters for the tower posts and camera hinge.
- Orient the tower on the base plate, the arm flat on its broad face, and the camera holder with the back face on the bed.
- Use normal supports only if your slicer flags the camera hinge or holder lips for your chosen orientation.
- Do not block the bottom intake slots or top exhaust opening with adhesive pads, labels, or accessory mounts.

## Raspberry Pi Zero USB Ethernet Grove IR Enclosure

The Pi Zero design is a printable enclosed case for a Raspberry Pi Zero v1.3 with manually inserted GPIO headers, a Waveshare USB Ethernet HUB HAT, a Seeed Grove Base Hat for Raspberry Pi Zero, and an internally mounted Grove Infrared Emitter. The enclosure uses a bottom tray, screw-fastened top cover, sliding GPIO hatch, internal IR cable path, and a front IR LED aperture that leaves only the LED exposed.

### Component Assumptions

Default dimensions are configurable at the top of `designs/pi_zero_usb_grove_ir_enclosure.scad`. The initial defaults assume:

- Raspberry Pi Zero v1.3 board: 65 mm x 30 mm.
- Waveshare ETH/USB HUB HAT, Kiwi product code `WS-16595`, footprint: 65 mm x 30 mm, with RJ45 plus one USB port on the front edge and one USB port on each long side.
- Seeed Grove Base Hat for Raspberry Pi Zero mounted above the USB HAT.
- Seeed Grove Infrared Emitter board: 20 mm x 20 mm with a 5 mm IR LED.
- Common M2.5 fasteners for board standoffs and enclosure screws.
- Conservative bottom clearance for manually inserted GPIO header pins protruding below the Pi Zero.

The board and connector previews are fit and clearance references, not vendor-accurate cosmetic models. Connector positions, port openings, stack spacing, and tolerances should be adjusted after measuring the actual hardware stack.

### Adjustable Parameters

The OpenSCAD source starts with an `Adjustable Parameters` section grouped by:

- render controls,
- Pi Zero dimensions,
- USB HAT dimensions,
- Grove HAT dimensions,
- IR emitter dimensions,
- enclosure structure,
- fasteners and tolerances.

Common edits:

- Change `render_mode` to export a printable part.
- Set `show_electronics = false` for printable-only previews.
- Adjust Pi, USB HAT, and Grove HAT connector cutout positions after a test fit.
- Tune the USB HAT front, left-side, and right-side USB cutout positions independently for the measured `WS-16595` board.
- Increase `fit_tolerance_mm`, `sliding_hatch_clearance_mm`, or `case_port_cutout_extra_width_mm` for looser fit.
- Increase `pi_bottom_header_pin_protrusion_clearance_mm` if the manually inserted GPIO header pins protrude farther below the Pi.

### Render Modes

Set `render_mode` to one of:

- `assembly`: full enclosure preview with optional electronics.
- `bottom_tray`: tray printable part with standoffs, port cutouts, IR mount, cable path, and cover bosses.
- `top_cover`: screw-fastened cover with hatch opening and rails.
- `gpio_hatch`: sliding GPIO access hatch.
- `printable_layout`: printable parts arranged side-by-side for inspection.

Example export commands:

```sh
openscad -o pi_zero_usb_grove_ir_assembly.off -D 'render_mode="assembly"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o pi_zero_usb_grove_ir_bottom_tray.stl -D 'render_mode="bottom_tray"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o pi_zero_usb_grove_ir_top_cover.stl -D 'render_mode="top_cover"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o pi_zero_usb_grove_ir_gpio_hatch.stl -D 'render_mode="gpio_hatch"' designs/pi_zero_usb_grove_ir_enclosure.scad
```

For inspection with electronics hidden:

```sh
openscad -o pi_zero_usb_grove_ir_assembly.off -D 'render_mode="assembly"' -D 'show_electronics=false' designs/pi_zero_usb_grove_ir_enclosure.scad
```

### Assembly And Print Notes

- Print the bottom tray, top cover, and GPIO hatch as separate parts.
- Orient the tray on its base, the top cover flat with the exterior face on the bed, and the hatch flat on its broad face.
- Use PLA, PETG, or another material appropriate for the target thermal environment.
- Prefer at least three perimeters for screw bosses, standoffs, and hatch rails.
- Check that the GPIO hatch slides freely before installing electronics.
- Install the IR emitter internally with the LED aligned to the front aperture and route its Grove cable inside the case before closing the cover.
- The design guidance remains compatible with the Bambu Lab P2S and AMS 2 Pro; no multi-material behavior is required.

## Validation Checklist

When `openscad` is installed:

```sh
openscad --version
openscad -o /tmp/rpi5_ai_hat_dual_heatsink_vision_case.off -D 'render_mode="assembly"' designs/rpi5_ai_hat_dual_heatsink_vision_case.scad
openscad -o /tmp/rpi5_ai_hat_tower.off -D 'render_mode="tower"' designs/rpi5_ai_hat_dual_heatsink_vision_case.scad
openscad -o /tmp/rpi5_ai_hat_camera_arm.off -D 'render_mode="camera_arm"' designs/rpi5_ai_hat_dual_heatsink_vision_case.scad
openscad -o /tmp/rpi5_ai_hat_camera_holder.off -D 'render_mode="camera_holder"' designs/rpi5_ai_hat_dual_heatsink_vision_case.scad
openscad -o /tmp/rpi5_ai_hat_printable_layout.off -D 'render_mode="printable_layout"' designs/rpi5_ai_hat_dual_heatsink_vision_case.scad
openscad -o /tmp/pi_zero_usb_grove_ir_assembly.off -D 'render_mode="assembly"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_bottom_tray.off -D 'render_mode="bottom_tray"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_top_cover.off -D 'render_mode="top_cover"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_gpio_hatch.off -D 'render_mode="gpio_hatch"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_printable_layout.off -D 'render_mode="printable_layout"' designs/pi_zero_usb_grove_ir_enclosure.scad
git diff --check
```

Manual inspection for the Pi 5 design:

- Side walls remain substantially open for cooler intake and exhaust airflow.
- Bottom intake slots are present and unobstructed.
- Top exhaust is substantially open above the AI cooler clearance volume.
- Camera holder sits forward of the top exhaust path.
- CSI ribbon channel and relief geometry avoid intentionally sharp bends or pinch points.
- Each printable part has a plausible flat print orientation.
- Adjustable variables are grouped and understandable without reading implementation modules.

Manual inspection for the Pi Zero USB Grove IR enclosure:

- Pi Zero, USB HAT, and Grove HAT render in the correct vertical order.
- Pi Zero microSD, mini-HDMI, both micro-USB ports, and camera connector access are not blocked by the enclosure.
- USB HAT RJ45 plus one USB connector are exposed on the front edge.
- One USB HAT USB connector is exposed on each long side, with no obsolete grouped three-USB opening on a single face.
- The front IR LED aperture does not overlap or block the RJ45 or front USB openings.
- Sliding top hatch exposes only the GPIO header area.
- Grove sockets remain enclosed.
- IR emitter cable path is internal.
- Only the IR LED is exposed outside the case.
- Bottom clearance accounts for manually inserted GPIO header pin protrusion.
- Each printable part has a plausible flat print orientation.
- Wall thicknesses, clearances, bridges, and screw features are plausible for Bambu P2S printing.
