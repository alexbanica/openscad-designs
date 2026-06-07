# OpenSCAD Designs

This repository contains editable OpenSCAD designs.

## Design Files

- `designs/pi_zero.scad`
- `designs/rpi5.scad`
- `designs/seeed_grove_base_hat_zero.scad`
- `designs/waveshare_eth_usb_hub_hat.scad`
- `designs/rpi5_ai_hat_dual_heatsink_vision_case.scad`
- `designs/pi_zero_usb_grove_ir_enclosure.scad`

All files target OpenSCAD 2021.01 and have no external library dependencies.

## Reusable Raspberry Pi Reference Models

`designs/pi_zero.scad` and `designs/rpi5.scad` provide reusable board reference models for fit and clearance work. They are preview references, not printable parts or vendor-certified mechanical models.

Child designs should import the modules with `use` and call the reference module explicitly:

```scad
use <pi_zero.scad>
use <rpi5.scad>

pi_zero_reference_model(show_reference = true, show_gpio_header_position = 0);
rpi5_reference_model(show_reference = true, show_active_cooler = false);
```

The Pi Zero reference exposes toggles for the full reference, test pads, GPIO header direction, optional sound/vision GPIO pads, and GPIO pin colouring. The Raspberry Pi 5 reference exposes toggles for the full reference, GPIO pins, microSD card preview, and active cooler preview.

## Seeed Grove Base Hat For Raspberry Pi Zero Reference

`designs/seeed_grove_base_hat_zero.scad` provides an editable fit and clearance reference for the Seeed Studio Grove Base Hat for Raspberry Pi Zero. It uses `designs/pi_zero.scad` as the optional Raspberry Pi Zero stack reference and keeps the HAT model standalone for reuse in child designs.

### Component Assumptions

Default dimensions are configurable at the top of the `.scad` file. The initial defaults assume:

- Seeed Grove Base Hat for Raspberry Pi Zero board: 65.0 mm x 30.0 mm x 1.6 mm.
- Overall top-side height envelope: 20.0 mm.
- Board corner radius: 1.5 mm.
- Four mounting holes: 3.0 mm diameter, 3.5 mm from board edges, with 58.0 mm x 23.0 mm center span.
- Pi Zero-compatible 40-pin GPIO passthrough/header reference near the +Y edge.
- Visible metallic GPIO through-hole/pad row plus pin references near the +Y edge.
- Simplified Grove socket clearance groups for Digital, Analog, I2C, PWM, and UART.
- Default Grove visual layout follows the official Seeed wiki hardware overview image: top row left-to-right `D5`, `A0`, `A2`, `A4`; bottom row left-to-right `D16`, `PWM`, `I2C`, `UART`.
- Simplified right-edge `GPIO/SWD` landmark, controller, LEDs, and component clearance blocks.
- Grove operates at 3.3 V for electrical planning context, but this file models only mechanical fit and clearance.

The public source notes captured in the approved spec are inconsistent about analog Grove count: the product title says 4x Analog, while the fetched wiki specification table says 3 Analog and the official overview image visibly labels `A0`, `A2`, and `A4`. This reference defaults to the visible overview image for mechanical layout and is not an electrical guarantee.

Extra sockets implied only by conflicting text or earlier over-modeled defaults are intentionally not shown by default: no `D18`, no duplicate `I2C`, and no right-edge `A6`.

Connector bodies, cable exits, `GPIO/SWD` pad/pin markers, labels, controller blocks, and LEDs are simplified clearance volumes. The default right-edge `GPIO/SWD` block is an overview-image landmark, not a certified mechanical drawing. Grove socket positions, cable-exit envelopes, and the `GPIO/SWD` block position and size are adjustable defaults based on visible layout and Pi Zero board constraints, and should be tuned after measuring the actual HAT.

### Adjustable Parameters

The OpenSCAD source starts with an `Adjustable Parameters` section grouped by:

- render controls,
- board dimensions,
- mounting holes,
- stack and Pi Zero reference offsets,
- GPIO header/reference dimensions,
- Grove connector dimensions and positions,
- Grove cable-exit clearance dimensions and positions,
- right-edge GPIO/SWD reference dimensions,
- controller, component, LED, and label preview dimensions,
- printable layout,
- visual settings.

Common edits:

- Change `render_mode` to inspect the full assembly, HAT-only reference, connector clearance view, or separated fit-check layout.
- Set `show_electronics = false` to hide Grove sockets, cable exits, right-edge `GPIO/SWD`, controller blocks, LEDs, and the height envelope while keeping the PCB and mounting holes visible.
- Set `show_gpio_header = false` to hide only the GPIO passthrough/header reference.
- Set `show_grove_labels = false` to hide only the Grove, `GPIO/SWD`, and component labels.
- Set `show_pi_zero_reference = true` to show the reusable Pi Zero reference below the HAT.
- Tune `grove_digital_sockets_mm`, `grove_analog_sockets_mm`, `grove_i2c_sockets_mm`, `grove_pwm_sockets_mm`, and `grove_uart_sockets_mm` after physical measurement.
- Tune each Grove group's cable-exit variables, such as `grove_digital_cable_exit_size_mm`, `grove_digital_cable_exit_center_y_mm`, `grove_analog_cable_exit_size_mm`, `grove_i2c_cable_exit_size_mm`, `grove_pwm_cable_exit_center_y_mm`, and `grove_uart_cable_exit_center_y_mm`, for enclosure cable clearance. Defaults route top-row socket envelopes toward +Y and bottom-row socket envelopes toward -Y.
- Tune `gpio_swd_reference_center_x_mm`, `gpio_swd_reference_center_y_mm`, `gpio_swd_reference_block_size_mm`, and related `gpio_swd_*` pad and pin variables after measuring the right-edge feature on physical hardware.
- Tune `hat_mounting_hole_diameter_mm` for specific M2.5 fastener clearance.

### Render Modes

Set `render_mode` to one of:

- `assembly`: HAT reference with optional Pi Zero reference, electronics/components, GPIO header, Grove sockets, cable exits, and labels according to the visibility toggles.
- `hat`: HAT PCB and mounting holes with optional GPIO reference.
- `connectors`: HAT reference with Grove/socket/component clearance features emphasized.
- `printable_layout`: HAT reference and optional Pi Zero fit reference separated for visual inspection.

Optional inspection commands for users with OpenSCAD installed:

```sh
openscad -o /tmp/seeed_grove_base_hat_zero_assembly.off -D 'render_mode="assembly"' designs/seeed_grove_base_hat_zero.scad
openscad -o /tmp/seeed_grove_base_hat_zero_hat.off -D 'render_mode="hat"' designs/seeed_grove_base_hat_zero.scad
openscad -o /tmp/seeed_grove_base_hat_zero_connectors.off -D 'render_mode="connectors"' designs/seeed_grove_base_hat_zero.scad
openscad -o /tmp/seeed_grove_base_hat_zero_printable_layout.off -D 'render_mode="printable_layout"' designs/seeed_grove_base_hat_zero.scad
```

### Fit Notes

- Use the model as a child design reference with `use <seeed_grove_base_hat_zero.scad>` and call `seeed_grove_base_hat_zero_reference_model(...)` explicitly.
- Keep `show_pi_zero_reference = true` during early stack planning to verify board footprint, mounting-hole alignment, and GPIO relationship against the reusable Pi Zero model.
- Inspect the default Grove row order as `D5`, `A0`, `A2`, `A4` above `D16`, `PWM`, `I2C`, `UART` before using the model as an enclosure clearance reference.
- Confirm the top-row Grove socket bodies leave visible board space below the long 40-pin GPIO passthrough/header reference.
- Confirm the right-edge `GPIO/SWD` reference reads as a vertical landmark between the Grove rows and does not conflict with Grove cable-exit planning.
- Keep `show_gpio_header = true` when checking stack height so the metallic GPIO pad/header row remains visible above the board overlay.
- Leave additional printed-case clearance around Grove sockets and cable exits until the actual HAT and Grove cables are measured.
- The 20.0 mm overall height envelope is a planning volume; connector and component blocks remain independently adjustable.
- The design guidance remains compatible with Bambu Lab P2S and AMS 2 Pro fit-check workflows; no generated mesh exports are committed.

## Waveshare ETH/USB HUB HAT Reference

`designs/waveshare_eth_usb_hub_hat.scad` provides an editable fit and clearance reference for the Waveshare ETH/USB HUB HAT, including the included Micro USB bridge adapter used with Raspberry Pi Zero-class boards. It is a simplified mechanical reference for enclosure and stack planning, not a vendor-certified cosmetic model.

### Component Assumptions

Default dimensions are configurable at the top of the `.scad` file. The initial defaults assume:

- Waveshare ETH/USB HUB HAT board: 65.0 mm x 30.0 mm x 1.6 mm.
- Board corner radius: 1.5 mm.
- Four mounting holes: 3.0 mm diameter, 3.5 mm from board edges, with 58.0 mm x 23.0 mm center span.
- Connector preview set: RJ45 and one USB-A on the front edge opposite the GPIO header, one USB-A on each long side, and a bottom Micro USB HAT interface.
- LED preview set: PWR, ACT, and D1-D3 visual reference blocks.
- Micro USB bridge adapter solid envelope: 8.6 mm x 9.0 mm x 12.2 mm, measured from official Waveshare `0304-06.stp` solid vertices and left adjustable for physical measurement.
- Micro USB bridge adapter detail: 8.6 mm x 1.0 mm x 12.2 mm bridge body with two about 6.5 mm x 8.0 mm x 1.46 mm plug shells on 8.70 mm centers. The bridge body sits outside the board edge by default, while the plug shells extend inward into the board-side Micro USB socket positions.

Connector bodies, LEDs, GPIO pins, and component blocks are simplified clearance volumes. The default connector boxes are compact, edge-aligned fit references that avoid the default GPIO and component preview footprints. Positions and sizes should be adjusted after measuring the actual hardware stack.

### Adjustable Parameters

The OpenSCAD source starts with an `Adjustable Parameters` section grouped by:

- render controls,
- board dimensions,
- mounting holes,
- GPIO header/reference dimensions,
- connector dimensions and positions,
- LED and component preview dimensions,
- Micro USB bridge adapter dimensions,
- printable layout,
- visual settings.

Common edits:

- Change `render_mode` to inspect the full assembly, HAT-only reference, adapter-only reference, or separated layout.
- Set `show_electronics = false` to hide connector, LED, and component previews while keeping the PCB and mounting holes visible.
- Set `show_micro_usb_adapter = false` to hide only the bridge adapter.
- Set `show_gpio_header = false` to hide only the GPIO header/reference pins.
- Tune connector and Micro USB adapter offsets after physical measurement.
- Tune `hat_mounting_hole_edge_offset_mm` when measured hole positions differ; the default 3.5 mm edge offset derives the 58.0 mm x 23.0 mm hole-center span.
- Tune `hat_rj45_width_x_mm`, `hat_rj45_depth_y_mm`, `hat_front_usb_a_width_x_mm`, and `hat_front_usb_a_depth_y_mm` for measured front-port clearance.
- Tune `hat_side_usb_a_depth_x_mm`, `hat_side_usb_a_width_y_mm`, and `hat_side_usb_a_board_overlap_depth_mm` for side USB-A fit planning on the +/-X board edges.

### Render Modes

Set `render_mode` to one of:

- `assembly`: HAT reference with optional electronics, GPIO header, and Micro USB bridge adapter.
- `hat`: HAT reference without the Micro USB bridge adapter.
- `micro_usb_adapter`: Micro USB bridge adapter reference only.
- `printable_layout`: HAT reference and adapter separated for visual inspection.

Optional inspection commands for users with OpenSCAD installed:

```sh
openscad -o /tmp/waveshare_eth_usb_hub_hat_assembly.off -D 'render_mode="assembly"' designs/waveshare_eth_usb_hub_hat.scad
openscad -o /tmp/waveshare_eth_usb_hub_hat_only.off -D 'render_mode="hat"' designs/waveshare_eth_usb_hub_hat.scad
openscad -o /tmp/waveshare_eth_usb_hub_hat_adapter.off -D 'render_mode="micro_usb_adapter"' designs/waveshare_eth_usb_hub_hat.scad
openscad -o /tmp/waveshare_eth_usb_hub_hat_printable_layout.off -D 'render_mode="printable_layout"' designs/waveshare_eth_usb_hub_hat.scad
```

### Fit Notes

- Use the model as a child design reference with `use <waveshare_eth_usb_hub_hat.scad>` and call `waveshare_eth_usb_hub_hat_reference_model(...)` explicitly.
- Keep the Micro USB bridge adapter visible during early stack planning to confirm the upper plug shell aligns with the underside HAT USB HUB interface below the PCB.
- The Micro USB bridge adapter body defaults outside the -Y board edge like an external plug body; its plug shells extend inward from the edge into the HAT and Pi Zero Micro USB socket positions.
- The GPIO header reference is near the +Y long edge; the RJ45 and front USB-A connector clearances face -Y so they do not overlap the header.
- Side USB-A connector depth runs along X and intentionally crosses the +/-X board edges; side USB-A width runs along Y.
- Leave additional printed-case clearance around RJ45, USB-A, and Micro USB features until measured against the actual board and adapter.
- The design guidance remains compatible with Bambu Lab P2S and AMS 2 Pro fit-check workflows; no generated mesh exports are committed.

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
- Measured Micro USB bridge adapter clearance: 8.5 mm wide by 12 mm high.
- Measured Pi-to-USB-HAT stack gap: 11.20 mm.
- Measured USB-HAT-to-Grove-HAT stack gap: 10.5 mm.
- Measured Pi side-port edge-to-edge margins: 20 mm from Mini HDMI to the first Micro USB cutout, and 5 mm between the two Micro USB cutouts.
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
- Tune `pi_mini_hdmi_to_micro_usb_margin_mm` and `pi_micro_usb_between_margin_mm` if the measured Pi side-port spacing or cable clearance needs differ.
- Tune the USB HAT front, left-side, and right-side USB cutout positions independently for the measured `WS-16595` board.
- Tune `usb_hat_bottom_bridge_clearance_width_mm`, `usb_hat_bottom_bridge_clearance_height_mm`, `usb_hat_stack_clearance_mm`, and `grove_hat_stack_clearance_mm` after measuring or test-fitting the assembled hardware.
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

Optional OpenSCAD inspection commands for users with OpenSCAD installed:

```sh
openscad --version
openscad -o /tmp/pi_zero_reference.off designs/pi_zero.scad
openscad -o /tmp/rpi5_reference.off designs/rpi5.scad
openscad -o /tmp/seeed_grove_base_hat_zero_assembly.off -D 'render_mode="assembly"' designs/seeed_grove_base_hat_zero.scad
openscad -o /tmp/seeed_grove_base_hat_zero_hat.off -D 'render_mode="hat"' designs/seeed_grove_base_hat_zero.scad
openscad -o /tmp/seeed_grove_base_hat_zero_connectors.off -D 'render_mode="connectors"' designs/seeed_grove_base_hat_zero.scad
openscad -o /tmp/seeed_grove_base_hat_zero_printable_layout.off -D 'render_mode="printable_layout"' designs/seeed_grove_base_hat_zero.scad
openscad -o /tmp/waveshare_eth_usb_hub_hat_assembly.off -D 'render_mode="assembly"' designs/waveshare_eth_usb_hub_hat.scad
openscad -o /tmp/waveshare_eth_usb_hub_hat_only.off -D 'render_mode="hat"' designs/waveshare_eth_usb_hub_hat.scad
openscad -o /tmp/waveshare_eth_usb_hub_hat_adapter.off -D 'render_mode="micro_usb_adapter"' designs/waveshare_eth_usb_hub_hat.scad
openscad -o /tmp/waveshare_eth_usb_hub_hat_printable_layout.off -D 'render_mode="printable_layout"' designs/waveshare_eth_usb_hub_hat.scad
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
```

Repository validation:

```sh
git diff --check
```

Manual inspection for the reusable Raspberry Pi reference models:

- `designs/pi_zero.scad` and `designs/rpi5.scad` have clearly labeled `Adjustable Parameters` and `Derived Values` sections.
- Adjustable variables use descriptive `snake_case` names with `_mm` for linear dimensions and `_deg` for angles where applicable.
- User-adjustable geometry values are not redefined inside implementation modules.
- Major reference assemblies and repeated geometry are exposed through named modules.
- Pi Zero preview shows the board, configured optional features, GPIO header, test pads, and version-dependent components.
- Raspberry Pi 5 preview shows the board, configured optional features, GPIO pins, microSD preview, and active cooler when enabled.
- Child designs can show or hide each reference model and its major optional features without editing the base file.

Manual inspection for the Seeed Grove Base Hat for Raspberry Pi Zero reference:

- `designs/seeed_grove_base_hat_zero.scad` has clearly labeled `Adjustable Parameters` and `Derived Values` sections.
- Adjustable linear variables use `_mm`, and render modes dispatch deterministically.
- Board defaults are 65.0 mm x 30.0 mm x 1.6 mm with a 20.0 mm overall height envelope.
- Mounting holes default to 3.0 mm diameter, 3.5 mm edge offsets, and 58.0 mm x 23.0 mm center span.
- The file uses `use <pi_zero.scad>` and can show the optional Pi Zero stack reference without duplicating board geometry.
- `show_electronics`, `show_gpio_header`, `show_grove_labels`, and `show_pi_zero_reference` independently control their intended visual groups.
- Grove socket bodies and cable-exit envelopes are adjustable for Digital, Analog, I2C, PWM, and UART groups.
- Default visible Grove sockets are exactly `D5`, `A0`, `A2`, `A4`, `D16`, `PWM`, `I2C`, and `UART`.
- The Grove visual layout is two rows with top row left-to-right `D5`, `A0`, `A2`, `A4` and bottom row left-to-right `D16`, `PWM`, `I2C`, `UART`.
- No extra default Grove sockets such as `D18`, duplicate `I2C`, or right-edge `A6` are present.
- GPIO passthrough/header pads are visible along the +Y edge in `assembly`, `hat`, and `connectors` modes when `show_gpio_header = true`.
- Top-row Grove socket bodies leave visible board space below the long 40-pin GPIO passthrough/header reference.
- The right-edge `GPIO/SWD` reference is vertical, visually distinct from Grove sockets and the long GPIO header, and visible in `assembly` and `connectors` modes when `show_electronics = true`.
- The `GPIO/SWD` label follows `show_grove_labels`, and the previous horizontal interior SWD/debug placeholder is not present.
- Controller/component blocks, LEDs, and labels are present as simplified clearance references.
- The README documents the analog-count discrepancy and treats socket placement as a measurement-tunable reference.
- `assembly`, `hat`, `connectors`, and `printable_layout` modes show the intended reference views.
- No generated mesh or export artifacts are added.

Manual inspection for the Waveshare ETH/USB HUB HAT reference:

- `designs/waveshare_eth_usb_hub_hat.scad` has clearly labeled `Adjustable Parameters` and `Derived Values` sections.
- Adjustable linear variables use `_mm`, and render modes dispatch deterministically.
- Board defaults are 65.0 mm x 30.0 mm x 1.6 mm with 1.5 mm corner radius.
- Mounting holes default to 3.0 mm diameter, 3.5 mm edge offsets, and 58.0 mm x 23.0 mm center span.
- RJ45 and front USB-A clearances are compact edge-aligned boxes on the -Y edge opposite the +Y GPIO header, with one USB-A on each long side, bottom Micro USB interface, LEDs, and major clearance blocks visible when enabled.
- Major component preview blocks stay outside the default connector and GPIO header footprints.
- Side USB-A previews use X as outward connector depth and Y as connector width, with default placement crossing the +/-X board edges.
- `show_electronics`, `show_micro_usb_adapter`, and `show_gpio_header` independently control their intended visual groups.
- Micro USB bridge adapter defaults to an 8.6 mm x 9.0 mm x 12.2 mm solid envelope, uses separate body and two plug-shell blocks, places the bridge body outside the board edge with both plug shells extending inward, remains visually distinct, and aligns its upper plug to the HAT bottom Micro USB interface below the PCB in assembly mode.
- `assembly`, `hat`, `micro_usb_adapter`, and `printable_layout` modes show the intended reference views.
- No generated mesh or export artifacts are added.

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
- Micro USB bridge clearance defaults are 8.5 mm wide by 12 mm high.
- Pi-to-USB-HAT stack spacing is parameterized and defaults to 11.20 mm.
- USB-HAT-to-Grove-HAT stack spacing defaults to 10.5 mm.
- Pi side-port margins default to 20 mm from Mini HDMI to first Micro USB and 5 mm between Micro USB cutouts.
- Tray height and port preview/cutout positions respond to the stack clearance parameters.
- Sliding top hatch exposes only the GPIO header area.
- Grove sockets remain enclosed.
- IR emitter cable path is internal.
- Only the IR LED is exposed outside the case.
- Bottom clearance accounts for manually inserted GPIO header pin protrusion.
- Each printable part has a plausible flat print orientation.
- Wall thicknesses, clearances, bridges, and screw features are plausible for Bambu P2S printing.
