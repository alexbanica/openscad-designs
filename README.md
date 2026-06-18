# OpenSCAD Designs

This repository contains editable OpenSCAD designs.

## Design Files

- `designs/pi_zero.scad`
- `designs/rpi5.scad`
- `designs/grove_infrared_emitter.scad`
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

## Grove Infrared Emitter Reference

`designs/grove_infrared_emitter.scad` provides an editable fit and clearance reference for the Seeed Studio Grove - Infrared Emitter module. It models the PCB, mounting holes, Grove connector, cable/plug clearance, IR LED body and extension, component clearance blocks, labels, and optional IR sightline guidance.

### Component Assumptions

Default dimensions are configurable at the top of the `.scad` file. The initial defaults assume:

- Grove Infrared Emitter PCB: 20.25 mm x 23.75 mm x 1.6 mm.
- Grove connector total top envelope from PCB bottom: 9.65 mm.
- Bottom pin protrusion clearance: up to 2.0 mm below PCB bottom.
- IR LED extension beyond the +Y PCB edge: 7.5 mm.
- Board corner radius: 1.5 mm.
- Exactly two mounting holes: 2.0 mm diameter, 2.5 mm from each left/right board edge (centered on the PCB length centerline by default).
- Simplified Grove connector body: 8.0 mm x 7.5 mm with default top envelope set to 9.65 mm, centered near the -Y board edge.
- Simplified Grove cable/plug clearance guide centered over the connector and extending upward perpendicular to the PCB.
- Simplified 5.0 mm IR LED body, centered 4.0 mm above the PCB bottom face and pointing toward +Y.
- Optional IR sightline guide using the public 17 degree half-intensity angle as visual clearance context only.
- Simplified component clearance blocks and text labels.

The selected mechanical default is the 2026-06-17 measured value of a 20.25 mm x 23.75 mm PCB with a 9.65 mm connector top envelope and 2.0 mm bottom-pin clearance. Seeed's wiki also lists a conflicting 20.0 mm x 20.0 mm module size. Keep these dimensions adjustable and measure the actual module before precision enclosure work.

Mounting-hole positions are treated as planning assumptions until board hardware is measured. The two-hole defaults are centered on the PCB length centerline, with adjustable diameter and X-edge inset only. Tune `mounting_hole_diameter_mm` and `mounting_hole_edge_offset_x_mm` after measuring the board.

### Adjustable Parameters

The OpenSCAD source starts with an `Adjustable Parameters` section grouped by:

- render controls,
- board dimensions,
- mounting holes,
- Grove connector dimensions and placement,
- Grove cable/plug clearance dimensions,
- IR LED body and extension dimensions,
- component and label preview dimensions,
- clearance and sightline guide dimensions,
- printable layout,
- visual settings.

Common edits:

- Change `render_mode` to inspect the full assembly, PCB-only reference, clearance view, or separated fit-check layout.
- Set `show_electronics = false` to hide component clearance blocks while keeping the PCB and mounting holes visible.
- Set `show_grove_connector = false` to hide only the Grove connector body and its guide-dependent cable clearance.
- Set `show_ir_led = false` to hide only the IR LED body and guide-dependent LED extension/sightline previews.
- Set `show_labels = false` to hide text labels.
- Set `show_clearance_guides = false` to hide the Grove cable/plug clearance, IR LED extension envelope, bottom-pin clearance guide, and 17 degree sightline guides.
- Tune `pcb_width_mm`, `pcb_length_mm`, `pcb_thickness_mm`, and `ir_led_extension_beyond_pcb_mm` after physical measurement.
- Tune `grove_connector_*`, `grove_connector_total_top_envelope_mm`, `grove_cable_clearance_*`, `grove_bottom_pin_*`, and `ir_led_*` parameters for enclosure clearance and cable routing.

### Render Modes

Set `render_mode` to one of:

- `assembly`: full module reference with PCB, mounting holes, optional electronics, Grove connector, IR LED, labels, and clearance guides according to visibility toggles.
- `pcb`: PCB and mounting holes only.
- `clearance`: module reference with connector, perpendicular cable clearance, IR LED extension, component blocks, and sightline guides emphasized.
- `printable_layout`: reference body and clearance guides separated for visual inspection; this does not add generated printable exports to source control.

Optional inspection commands for users with OpenSCAD installed:

```sh
openscad -o /tmp/grove_infrared_emitter_assembly.off -D 'render_mode="assembly"' designs/grove_infrared_emitter.scad
openscad -o /tmp/grove_infrared_emitter_pcb.off -D 'render_mode="pcb"' designs/grove_infrared_emitter.scad
openscad -o /tmp/grove_infrared_emitter_clearance.off -D 'render_mode="clearance"' designs/grove_infrared_emitter.scad
openscad -o /tmp/grove_infrared_emitter_printable_layout.off -D 'render_mode="printable_layout"' designs/grove_infrared_emitter.scad
```

### Fit Notes

- Use the model as a child design reference with `use <grove_infrared_emitter.scad>` and call `grove_infrared_emitter_reference_model(...)` explicitly.
- The model coordinate origin is the PCB center on the bottom face. X runs across the 20.25 mm width, Y runs along the 23.75 mm length, and the IR LED points toward +Y.
- Keep `show_clearance_guides = true` during early enclosure planning to account for the upward Grove cable/plug area, LED extension envelope, bottom-pin clearance guide, and 17 degree sightline guide.
- Leave additional printed-case clearance above the Grove connector, around the cable/plug, and at the LED opening until the actual board, Grove cable, and lower-pin geometry are measured.
- Treat the 940 nm wavelength and 17 degree half-intensity angle as non-electrical visual context only; this file models mechanical fit and clearance.
- The design guidance remains compatible with Bambu Lab P2S and AMS 2 Pro fit-check workflows; no generated mesh exports are committed.

Manual inspection checklist:

- Confirm the PCB footprint defaults to 20.25 mm x 23.75 mm x 1.6 mm.
- Confirm the IR LED points toward +Y and extends 7.5 mm beyond the PCB edge by default.
- Confirm the measured 20.25 mm x 23.75 mm source default and conflicting 20.0 mm x 20.0 mm wiki size are documented.
- Confirm mounting-hole defaults are exactly two, centered on PCB length centerline, with diameter and X-offset adjustable, documented as assumptions until measured.
- Confirm the connector top envelope defaults to 9.65 mm above PCB bottom and can be tuned via `grove_connector_total_top_envelope_mm`.
- Confirm bottom-pin clearance defaults to 2.0 mm and is controlled by `show_clearance_guides`.
- Confirm `show_electronics`, `show_grove_connector`, `show_ir_led`, `show_labels`, and `show_clearance_guides` independently control their intended visual groups.
- Confirm the simplified Grove connector and perpendicular cable clearance are adjustable and visible in `assembly` and `clearance` modes when enabled.
- Confirm the IR LED body, extension envelope, and 17 degree sightline guide are adjustable and visible when enabled.
- Confirm no generated mesh exports are added. Repository validation remains manual review plus `git diff --check`; do not run OpenSCAD locally in this environment.

## Seeed Grove Base Hat For Raspberry Pi Zero Reference

`designs/seeed_grove_base_hat_zero.scad` provides an editable fit and clearance reference for the Seeed Studio Grove Base Hat for Raspberry Pi Zero. It uses `designs/pi_zero.scad` as the optional Raspberry Pi Zero stack reference and keeps the HAT model standalone for reuse in child designs.

### Component Assumptions

Default dimensions are configurable at the top of the `.scad` file. The initial defaults assume:

- Seeed Grove Base Hat for Raspberry Pi Zero board: 65.0 mm x 30.0 mm x 1.6 mm.
- Overall top-side height envelope: 20.0 mm.
- Board corner radius: 1.5 mm.
- Four mounting holes: 3.0 mm diameter, 3.5 mm from board edges, with 58.0 mm x 23.0 mm center span.
- Pi Zero-compatible 40-pin GPIO passthrough/header reference using the Pi Zero 20 x 2, 2.54 mm pitch pattern.
- Visible metallic GPIO through-hole/pad row plus optional above-board, below-board, or hidden pin previews.
- Underside GPIO socket/receptacle clearance block below the HAT PCB, aligned with the same GPIO grid.
- Simplified Grove socket clearance blocks using the image-derived coordinate table below.
- Simplified LEDs and component clearance blocks.
- Grove operates at 3.3 V for electrical planning context, but this file models only mechanical fit and clearance.

Connector bodies, labels, component blocks, and LEDs are simplified clearance volumes. Grove socket positions are image-derived estimates supplied in the approved spec and should be tuned after measuring the actual HAT before precision enclosure work.

### Coordinate Basis

The Grove connector table uses bottom-left PCB coordinates in millimeters. X runs across the 30 mm board width and Y runs along the 65 mm board length. The OpenSCAD model origin is the board center on the PCB bottom face, so the source transforms each Grove center as:

```text
model_x = -15.0 + user_x + grove_coordinate_offset_x_mm
model_y = -32.5 + user_y + grove_coordinate_offset_y_mm
```

Default Grove connector centers:

| Label | Bottom-left PCB X mm | Bottom-left PCB Y mm |
| --- | ---: | ---: |
| `UART` | 9.4 | 12.6 |
| `A3/A4` | 17.8 | 12.6 |
| `I2C` | 9.6 | 28.6 |
| `A2` | 17.8 | 28.3 |
| `D16` | 9.6 | 44.7 |
| `D26` | 17.8 | 44.1 |
| `D5` | 9.6 | 59.9 |
| `D6` | 17.8 | 59.1 |

The default UART printed-case cutout guidance is an adjustable 11.0 mm x 9.0 mm rectangle centered on the `UART` connector estimate.

### Adjustable Parameters

The OpenSCAD source starts with an `Adjustable Parameters` section grouped by:

- render controls,
- board dimensions,
- mounting holes,
- stack and Pi Zero reference offsets,
- GPIO header/passthrough dimensions,
- underside GPIO socket/receptacle clearance dimensions,
- Grove connector coordinate table and transform offsets,
- Grove connector body dimensions,
- UART printed-case cutout guidance,
- component, LED, and label preview dimensions,
- printable layout,
- visual settings.

Common edits:

- Change `render_mode` to inspect the full assembly, HAT-only reference, connector clearance view, or separated fit-check layout.
- Set `show_electronics = false` to hide Grove sockets, component blocks, LEDs, and UART cutout guidance while keeping the PCB and mounting holes visible.
- Set `show_gpio_header = false` to hide only the GPIO passthrough/header pin and pad reference.
- Set `show_gpio_socket_clearance = false` to hide only the underside GPIO socket/receptacle clearance block.
- Set `show_grove_labels = false` to hide only the Grove and `GPIO` labels.
- Set `show_pi_zero_reference = true` to show the reusable Pi Zero reference below the HAT.
- Set `show_height_envelope = true` to show the translucent 20.0 mm stack-height planning volume.
- Set `gpio_pin_preview_mode` to `above`, `below`, or `hidden` for stack planning.
- Tune `grove_socket_centers_mm`, `grove_coordinate_offset_x_mm`, and `grove_coordinate_offset_y_mm` after physical measurement.
- Tune `grove_connector_body_width_mm`, `grove_connector_body_length_mm`, and `grove_connector_body_height_mm` for enclosure connector clearance.
- Tune `uart_cutout_guidance_width_mm` and `uart_cutout_guidance_length_mm` for a printed-case opening around the UART connector.
- Tune `gpio_socket_clearance_size_x_mm`, `gpio_socket_clearance_size_y_mm`, `gpio_socket_clearance_height_mm`, and `gpio_socket_clearance_z_offset_mm` for the underside receptacle and stack clearance.
- Tune `hat_mounting_hole_diameter_mm` for specific M2.5 fastener clearance.

### Render Modes

Set `render_mode` to one of:

- `assembly`: HAT reference with optional Pi Zero reference, electronics/components, GPIO header, Grove sockets, and labels according to the visibility toggles.
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
- Inspect the default Grove row order as `UART`, `A3/A4`, `I2C`, `A2`, `D16`, `D26`, `D5`, and `D6` before using the model as an enclosure clearance reference.
- Confirm the Grove socket bodies leave clearance around the Pi Zero-style GPIO passthrough/header reference.
- Confirm the component blocks do not conflict with Grove connector planning.
- Keep `show_gpio_header = true` when checking stack height so the metallic GPIO pad/header row remains visible above or below the board according to `gpio_pin_preview_mode`.
- Keep `show_gpio_socket_clearance = true` during early stack planning to account for the underside receptacle where Pi Zero header pins enter the HAT.
- Leave additional printed-case clearance around Grove sockets until the actual HAT and Grove cables are measured.
- The 20.0 mm overall height envelope is a planning volume; connector and component blocks remain independently adjustable.
- The design guidance remains compatible with Bambu Lab P2S and AMS 2 Pro fit-check workflows; no generated mesh exports are committed.

Manual inspection checklist:

- Confirm the board footprint is 65.0 mm x 30.0 mm and mounting holes are 3.5 mm from the edges.
- Confirm the Grove coordinate transform preserves the bottom-left PCB coordinate table above.
- Confirm `show_pi_zero_reference` displays the reusable Pi Zero stack reference without duplicating Pi Zero source geometry.
- Confirm `gpio_pin_preview_mode = "above"`, `"below"`, and `"hidden"` control only the visible GPIO pin/pad preview.
- Confirm `show_gpio_socket_clearance` controls the underside GPIO socket clearance independently.
- Confirm no generated mesh exports are added. Repository validation remains manual review plus `git diff --check`; do not run OpenSCAD locally in this environment.

## Waveshare ETH/USB HUB HAT Reference

`designs/waveshare_eth_usb_hub_hat.scad` provides an editable fit and clearance reference for the Waveshare ETH/USB HUB HAT, including the included Micro USB bridge adapter used with Raspberry Pi Zero-class boards. It is a simplified mechanical reference for enclosure and stack planning, not a vendor-certified cosmetic model.

### Component Assumptions

Default dimensions are configurable at the top of the `.scad` file. The initial defaults assume:

- Waveshare ETH/USB HUB HAT board: 65.0 mm x 30.0 mm x 1.6 mm.
- Board corner radius: 1.5 mm.
- Four mounting holes: 3.0 mm diameter, 3.5 mm from board edges, with 58.0 mm x 23.0 mm center span.
- Pi Zero-compatible GPIO reference using the same 20 x 2, 2.54 mm pitch coordinate pattern as `designs/pi_zero.scad`.
- Connector preview set: RJ45 and one USB-A on the front edge opposite the GPIO header, one USB-A on each long side, and a bottom Micro USB HAT interface.
- RJ45 footprint: 16.68 mm x 11.7 mm, passing through the PCB from 1.3 mm below the bottom face to the configured 13.0 mm top-side height envelope.
- RJ45 left-margin position: 16.4 mm from the left PCB edge to the RJ45 left edge.
- USB-A footprint: 13.2 mm x 5.7 mm for the front connector preview; side USB-A uses 5.7 mm X inward depth and 13.2 mm Y board-side-margin length.
- Front RJ45-to-USB-A margin spacing: 3.65 mm between the RJ45 right margin and front USB-A left margin.
- Side USB-A blocks stay fully inside the PCB in X, with center Y aligned to the middle of the left and right side margins.
- LED preview set: PWR, ACT, and D1-D3 visual reference blocks.
- Micro USB bridge adapter solid envelope: 8.6 mm x 9.0 mm x 12.2 mm, measured from official Waveshare `0304-06.stp` solid vertices and left adjustable for physical measurement.
- Micro USB bridge adapter detail: 8.6 mm x 1.0 mm x 12.2 mm bridge body with two about 6.5 mm x 8.0 mm x 1.46 mm plug shells on 8.70 mm centers. The bridge body sits outside the board edge by default, while the plug shells extend inward into the board-side Micro USB socket positions.

Connector bodies, LEDs, GPIO pins, and component blocks are simplified clearance volumes. The default connector boxes use measured footprint defaults and deterministic board-relative placement. Positions and sizes should be adjusted after measuring the actual hardware stack.

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
- Tune `hat_rj45_left_margin_x_mm`, `hat_rj45_width_x_mm`, `hat_rj45_depth_y_mm`, `hat_rj45_below_board_extent_mm`, `hat_front_rj45_to_usb_a_margin_mm`, `hat_front_usb_a_width_x_mm`, and `hat_front_usb_a_depth_y_mm` for measured front-port clearance.
- Tune `hat_side_usb_a_depth_x_mm`, `hat_side_usb_a_width_y_mm`, and `hat_side_usb_a_center_y_mm` for side USB-A fit planning on the +/-X board edges.

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
- The GPIO header pin centers follow the Pi Zero 20 x 2 coordinate pattern, and the simplified GPIO header block is centered on that pin grid.
- The RJ45 clearance passes through the PCB and extends 1.3 mm below the bottom face by default while preserving the configured top-side height envelope.
- The RJ45 X position derives from the 16.4 mm default distance between the left PCB edge and RJ45 left edge.
- The front USB-A X position derives from the RJ45 center, measured connector widths, and the 3.65 mm margin-to-margin spacing.
- Side USB-A connector depth runs along X and width runs along Y; the blocks stay fully inside the PCB in X, and center Y aligns to the middle of the left and right side margins.
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

`designs/pi_zero_usb_grove_ir_enclosure.scad` is a printable enclosure set for a Raspberry Pi Zero v1.3, a Waveshare ETH/USB HUB HAT, a Seeed Grove Base Hat for Raspberry Pi Zero, and a Grove Infrared Emitter mounted in a separate external pod. The design keeps the Pi Zero, Waveshare HAT, and Grove HAT in the main enclosure, routes the Grove cable out through a dedicated main-enclosure exit in the removable top-cover assembly, and mounts the IR emitter board inside a separate pod. Top-cover-to-bottom-tray attachment stays at the existing four-pin socket interface, while the pod uses side-wall receiving socket sleeves/bosses and cap-side male insert pins. The pod prints as an open-top body by default and is closed by a full-cover removable pod cap with inserts.

### Component Assumptions

Default dimensions are configurable at the top of `designs/pi_zero_usb_grove_ir_enclosure.scad`. The initial defaults assume:

- Raspberry Pi Zero v1.3 board footprint: 65.0 mm x 30.0 mm.
- Stack order from bottom to top: Pi Zero, Waveshare ETH/USB HUB HAT, Seeed Grove Base Hat for Raspberry Pi Zero.
- User-provided measured stack height: 35.0 mm, plus 8.0 mm default extra upward headroom.
- Independent board spacing defaults: `pi_zero_to_waveshare_hat_z_offset_mm = 11.2` and `waveshare_to_grove_hat_z_offset_mm = 10.8`.
- Waveshare ETH/USB HUB HAT footprint: 65.0 mm x 30.0 mm, with RJ45 plus one USB-A port on the front edge and one USB-A port on each long side.
- Waveshare front RJ45/Ethernet and USB-A cutout X defaults come from the local `designs/waveshare_eth_usb_hub_hat.scad` reference: `waveshare_rj45_cutout_center_x_mm = -7.76` and `waveshare_front_usb_a_cutout_center_x_mm = 10.83`.
- Top-cover USB opening defaults: at least 15.4 mm effective width and 7.4 mm effective height for the external Pi Zero Micro USB power port, Waveshare front USB-A, Waveshare left USB-A, and Waveshare right USB-A openings.
- Seeed Grove Base Hat for Raspberry Pi Zero mounted above the USB HAT with the adjustable measured spacer default; tune the spacing after physical measurement if the preview or hardware stack needs more clearance.
- Source-of-truth Grove IR emitter defaults from `designs/grove_infrared_emitter.scad` remain connector center `(0.0, -8.1)`, total connector top envelope `9.65` mm from PCB bottom, LED diameter `5.0` mm, LED center height `4.0` mm, and LED extension beyond PCB `7.5` mm.
- This enclosure keeps that Grove source model intact for electrical/visual defaults but uses a local, source-of-truth-derived IR pod-fit override of `ir_pcb_width_mm = 23.65` mm (earlobe-inclusive width). Length remains `23.75` mm and thickness remains `1.6` mm.
- The IR emitter PCB reference uses exactly two mounting holes centered on the left/right PCB margins along the board length; hole diameter and X-edge inset remain adjustable fit-planning parameters.
- Common M2.5-class fasteners for the board standoffs.
- microSD card width: 11.0 mm, with a default 2.0 mm total clearance for the tray pass-through opening.
- Micro USB bridge/addon protrusion outside the Pi Zero PCB: 10.9 mm, plus 1.0 mm default printable fit clearance used to size the tray and top-cover Y envelope.
- The Grove IR emitter PCB stays inside the external pod, not in the main tray.
- IR emitter PCB support bosses are solid locating/support features, and IR PCB pilot holes are enabled by default (`enable_ir_mount_optional_pilot_holes = true`).
- In normal assembly, only the LED aperture and cable passage remain open after the full-cover cap is installed.
- The external pod defaults to a 31.8 mm body, shifted 24.5 mm toward the front USB-A side so the pod attachment avoids the Waveshare RJ45/Ethernet cutout area while staying inside the top-cover X margin. The wider default preserves side margin around the IR PCB support bosses after the pilot-hole spacing increased by 1.5 mm total.
- Printable render modes use print-only wrappers that place solids on the build plate at Z=0 without changing the assembled preview coordinate system.
- The Grove cable path starts near the selected Grove Base Hat connector area, exits the main enclosure through a dedicated opening, enters the pod through its matching entry, and terminates at the emitter connector area.
- One Waveshare side USB-A cutout includes extra clearance for an externally attached wireless dongle.

The board and connector previews are fit and clearance references, not vendor-accurate cosmetic models. Connector positions, port openings, stack spacing, IR alignment, and tolerances should be adjusted after measuring the actual hardware stack.

### Adjustable Parameters

The OpenSCAD source starts with an `Adjustable Parameters` section grouped by:

- render controls,
- stack dimensions and offsets,
- enclosure wall, floor, cover skirt/drop depth, and cover dimensions,
- Pi Zero stack mounting standoffs,
- plug-in top cover simple round male pins, wall-integrated tray female sockets, and socket clearance,
- Pi Zero and Waveshare port cutout dimensions and offsets,
- microSD card access dimensions,
- Micro USB bridge/addon outside-PCB clearance dimensions,
- external IR emitter pod dimensions, full-cover cap inserts, attachment posts/sockets, and attachment interface,
- removable linked lock elements for the pod-to-cover posts and pod-cap inserts,
- IR emitter pod board support, pilot-hole, and cap fit parameters,
- IR LED aperture, including pass-through overlap margin,
- main-to-pod Grove cable path,
- top ventilation/access hole pattern,
- anti-slide recesses or printed feet,
- tolerances and print clearances,
- printable layout,
- visual settings.

Common edits:

- Change `render_mode` to export a printable part.
- Set `show_electronics = false` to hide the Pi Zero, HAT, and IR emitter references without changing printable solids.
- Set `show_cutout_guides = false` to hide port, IR aperture, and cable path guide previews without changing printable solids.
- Adjust Pi Zero microSD, mini-HDMI, Micro USB, and camera cutout positions after a test fit.
- Tune `micro_sd_card_width_mm`, `micro_sd_card_total_clearance_mm`, `pi_micro_sd_cutout_*`, and `micro_sd_wall_through_overlap_mm` if the card slot needs more access clearance or a deeper wall-piercing subtraction after print inspection.
- Tune `micro_usb_bridge_outside_pcb_y_mm` and `micro_usb_bridge_fit_clearance_mm` if the measured bridge/addon protrusion differs; the derived internal Y envelope expands the bottom tray and top cover consistently while keeping the board stack centered.
- Tune the Waveshare RJ45, front USB-A, left USB-A, and right USB-A cutout positions independently after measuring the USB HAT. The shipped front RJ45/Ethernet and front USB-A X centers are refreshed from the local Waveshare reference defaults, `-7.76 mm` and `10.83 mm`.
- Tune `top_cover_usb_effective_width_mm` and `top_cover_usb_effective_height_mm` if the top-cover USB openings need more clearance after physical calibration. These top-cover USB dimensions are derived separately from the bottom-tray/shared cutouts so the tray port openings remain unchanged by this iteration.
- Tune `pi_zero_to_waveshare_hat_z_offset_mm` and `waveshare_to_grove_hat_z_offset_mm` for the real spacer stack; those values move the electronics previews, board-relative port cutout Z positions, and dependent Grove cable guide Z positions together.
- Increase `measured_stack_height_mm` or `extra_upward_headroom_mm` if the assembled stack, Grove connector, or cable needs more vertical clearance.
- Tune `grove_selected_socket_*` and the cable exit/entry offsets to match the actual Grove connector you use on the Grove Base Hat.
- Tune `cover_skirt_drop_depth_mm`, `cover_pin_diameter_mm`, `cover_pin_insertion_length_mm`, `cover_pin_offset_x_mm`, `cover_pin_offset_y_mm`, `cover_pin_count`, `tray_socket_clearance_mm`, and `tray_socket_depth_mm` after physical test fitting. The defaults use four simple round 3.0 mm male pins, 5.2 mm insertion length, 0.35 mm socket diameter clearance, and female socket holes placed directly in the thickened tray corner walls.
- The default `wall_thickness_mm` is 6.0 mm so the cover pins and socket holes live near the center of the wall/corner volume instead of relying on added internal socket bosses. The default `cover_pin_offset_x_mm` and `cover_pin_offset_y_mm` center the 3.35 mm socket holes in the wall/corner volume, leaving about 1.3 mm of material on both the inner and outer sides of the thickened walls. If pin fit is too tight, increase `tray_socket_clearance_mm`; if it is loose, reduce clearance in small increments while keeping enough clearance for the printer/material combination.
- Tune `pod_attachment_side`, `pod_center_offset_*`, `pod_outer_width_mm`, `pod_cap_*`, `pod_attachment_post_*`, `pod_attachment_socket_*`, `emitter_board_center_local_*`, `emitter_board_rotation_deg`, `ir_mounting_hole_edge_offset_x_mm`, `ir_led_*`, `pod_cable_entry_*`, and `pod_cap_insert_*` together. The emitter reference, pod board bosses, full-cover cap geometry, pod-to-cover post/socket interface, and cable endpoint are all derived from the same pod/emitter pose. The top-cover-owned IR pod female attachment holes are direct see-through holes through the reinforced socket sleeves along the pod male-post insertion axis, rather than blind pockets, and the default post spacing keeps those holes clear of the main cable exit/cable box. The default pod X offset keeps the pod clear of the Ethernet opening while preserving room for the local 23.65 mm pod-fit width override.
- Tune `pod_cap_insert_diameter_mm`, `pod_cap_insert_insertion_depth_mm`, `pod_cap_insert_socket_clearance_mm`, `pod_cap_insert_socket_depth_mm`, `pod_cap_insert_pin_root_diameter_mm`, `pod_cap_insert_pin_root_depth_mm`, `pod_cap_insert_receiver_wall_thickness_mm`, `pod_cap_insert_count`, `pod_cap_insert_spacing_mm`, `pod_cap_insert_external_wall_overlap_mm`, and `pod_cap_insert_tab_margin_mm` after printing a small fit sample or inspecting the first pod. These values control cap insertion depth, straight post-to-socket engagement, reinforced pin roots, and receiver attachment to the outside pod wall. The default cap insert receivers sit laterally outside the IR pod enclosure cavity so the pod-side female receiver/socket volumes do not consume internal wall/cavity space or block full male-insert insertion. The default 4.5 mm cap insert depth pairs with a 5.1 mm socket depth.
- Tune `pod_cap_insert_keeper_pin_diameter_mm`, `pod_cap_insert_keeper_pin_clearance_mm`, `pod_cap_insert_lock_wrap_clearance_mm`, `pod_cap_insert_lock_bridge_depth_mm`, and `pod_cap_insert_lock_bridge_height_mm` for the removable U-shaped external pod-cap lock. Tune `pod_attachment_post_lock_pin_diameter_mm`, `pod_attachment_post_lock_pin_clearance_mm`, `pod_attachment_post_lock_pin_engagement_depth_mm`, `pod_attachment_post_lock_bridge_depth_mm`, and `pod_attachment_post_lock_bridge_height_mm` for the removable U-shaped pod-to-cover lock. The default receiving-hole clearances for both U-lock interfaces are 0.45 mm around unchanged 1.2 mm lock legs. The top-cover U-lock installs from the top-cover exterior through accessible vertical top holes that continue into the aligned pod posts and top-cover socket sleeves after the pod posts are inserted. The pod-cap U-lock installs after the cap is seated: its legs pass through cross-holes in the cap-owned male insert pins and matching outer receiver bosses, while its bridge wraps around the outside face of the IR pod instead of crossing through the enclosure cavity. Both locks use the same two-leg linked topology at different spans and remain distinct from cover-to-tray socket pins, pod-cap sockets, IR PCB pilot holes, vents, cable openings, and Pi Zero stack mounting holes.
- Keep `enable_ir_mount_optional_pilot_holes = true` for the default removable pilot-hole and screw path. Set it false only if you intentionally want a tool-free retained path and will validate that the path remains stable.
- The main enclosure cable exit and the pod cable entry are separate features. The cable guide starts at the Grove HAT connector area, passes through the top-cover-owned main enclosure exit, enters the pod, and terminates at the emitter connector area.
- Use `cover_vent_*` values to resize or shift the default denser symmetric circular top-hole grid. The shipped defaults are `5 x 4` holes at `4.0 mm` diameter on `10.5 mm x 6.0 mm` spacing.
- Use rubber-foot recesses by default, or set `use_rubber_foot_recesses = false` to preview printed feet instead.

### Render Modes

Set `render_mode` to one of:

- `assembly`: full enclosure preview with optional electronics and the full-cover IR pod cap installed.
- `bottom_tray`: tray printable part with board standoffs, board-relative port cutouts, wall-integrated female sockets for the cover pins, and anti-slide features, placed on the build plate at Z=0.
- `top_cover`: plug-in removable cover with simple round male pins, top-cover-owned pod post/socket reinforcement and recesses, the dedicated main enclosure cable exit, and top ventilation/access holes, inverted print-side down on the build plate at Z=0.
- `ir_pod`: the external IR emitter pod assembled with its full-cover cap/top cover seated on the pod body, placed on the pod floor at Z=0. The pod body includes molded pod posts, solid board support bosses, cable entry, and pass-through LED aperture.
- `printable_layout`: bottom tray, top cover, open-top IR pod body, full-cover IR pod cap, the U-shaped pod-to-cover lock, and the U-shaped pod-cap insert lock arranged side-by-side on the build plate for inspection and export. All parts remain separate build-plate-supported objects.
- `electronics`: imported electronics/reference stack and IR emitter placement without printable case geometry.

Optional inspection commands for users with OpenSCAD installed:

```sh
openscad -o /tmp/pi_zero_usb_grove_ir_assembly.off -D 'render_mode="assembly"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_bottom_tray.off -D 'render_mode="bottom_tray"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_top_cover.off -D 'render_mode="top_cover"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_pod.off -D 'render_mode="ir_pod"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_printable_layout.off -D 'render_mode="printable_layout"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_electronics.off -D 'render_mode="electronics"' designs/pi_zero_usb_grove_ir_enclosure.scad
```

For inspection with electronics hidden:

```sh
openscad -o /tmp/pi_zero_usb_grove_ir_assembly.off -D 'render_mode="assembly"' -D 'show_electronics=false' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_assembly.off -D 'render_mode="assembly"' -D 'show_cutout_guides=false' designs/pi_zero_usb_grove_ir_enclosure.scad
```

### Assembly And Print Notes

- Print the bottom tray, top cover, open-top IR pod body, and full-cover IR pod cap as separate parts.
- Printable part render modes already orient the tray on its base, the top cover flat with the exterior roof on the bed, and the pod on its floor at Z=0. The assembled-world modules remain separate so `assembly` and `electronics` preserve fit-reference positions.
- Use `printable_layout` for all independent printed parts. Generated STL, STEP, 3MF, OFF, or other mesh/export artifacts are not committed to this repository.
- The pod body intentionally prints open-top so Bambu Studio tree supports are not trapped inside a closed pod roof. The full-cover cap closes the pod after the board, cable, and screw-access workflow are complete.
- The cap insert interface uses reinforced pin roots with straight male pins, straight socket bores, and accessible U-lock cross-holes through the outer male inserts and receiver bosses. The prior two-stage retention shoulder/interference section is removed so insertion is not blocked by a tight retention step. A single U-shaped external pod-cap lock wraps around the outside of the seated cap and IR pod enclosure instead of crossing through the pod cavity. The pod-to-cover posts use a separate removable U-shaped lock that inserts from the top-cover exterior through accessible top holes into the aligned pod posts and top-cover socket sleeves after insertion.
- Use PLA, PETG, or another material appropriate for the target thermal environment.
- Prefer at least three perimeters for the Pi Zero standoffs, cover skirt, simple cover pins, tray socket wall regions, top-cover pod socket reinforcement, and pod posts/board bosses.
- Install the Pi Zero stack on the Pi Zero-aligned standoffs before routing the Grove cable.
- Confirm the 10.8 mm default Waveshare-to-Grove spacing against the actual spacers; increase it if physical measurement or preview inspection shows collision between the Waveshare top-side parts and the Grove underside socket/header area.
- Route the Grove cable from the selected Grove socket area to the top-cover cable exit before fitting the pod, then continue through the pod entry to the IR emitter connector.
- With the Grove cable already connected, insert the IR emitter board through the cable-side pod entry, rest it on the pod bosses, align the LED to the pod aperture, route the cable through the pod entry without a sharp bend, then install the full-cover cap.
- After removing the full-cap, access the side of the board for optional M2.5 screws on enabled pilot-hole locations; the support geometry remains in the pod body and supports the removable-assembly screw workflow while preserving continued screw access.
- The alignment lip was removed for printability because it caused failed stringing/spaghetti in printable cover previews. Cover alignment and retention now come from the four vertical male pins and matching wall-integrated tray sockets instead of a perimeter lip.
- The top cover uses simple round plug-in pins and matching tray sockets cut into the thickened tray walls; it does not use cover screws and it does not depend on the Pi Zero stack mounting screws. The cover lowers vertically onto the tray, and removal should be tuned by socket clearance and pin insertion depth rather than by flexing latch features.
- The top-cover pod attachment includes local reinforcement around the socket regions so the interface is visibly rooted into the cover side wall while remaining separate from the cover-to-tray pin/socket interface.
- The four bottom-tray stack holes exist because the Pi Zero/HAT stack has four mounting points. Those holes are distinct from the top-cover pin/socket interface and from the pod post/socket interface.
- The Pi Zero opening for the internally occupied Micro USB adapter side is intentionally closed. The remaining external Pi Zero Micro USB opening is the power-side opening.
- Bottom-tray USB cutout behavior still uses the shared tray cutout defaults.
- The microSD opening is sized from the 11.0 mm card-width assumption plus default clearance, and its subtraction over-travels the tray wall so the access slot remains a true pass-through.
- The main enclosure Y envelope is sized from the 10.9 mm Micro USB bridge/addon outside-PCB protrusion plus fit clearance; this is internal footprint clearance and does not reopen the internally occupied adapter-side Micro USB port.
- Add rubber feet or pads to the default recesses after printing if anti-slide behavior is required.
- The design guidance remains compatible with the Bambu Lab P2S and AMS 2 Pro; no multi-material behavior is required.
- Physical measurement and test fitting are still required before final tolerances are trusted.

## Validation Checklist

Optional OpenSCAD inspection commands for users with OpenSCAD installed:

```sh
openscad --version
openscad -o /tmp/pi_zero_reference.off designs/pi_zero.scad
openscad -o /tmp/rpi5_reference.off designs/rpi5.scad
openscad -o /tmp/grove_infrared_emitter_assembly.off -D 'render_mode="assembly"' designs/grove_infrared_emitter.scad
openscad -o /tmp/grove_infrared_emitter_pcb.off -D 'render_mode="pcb"' designs/grove_infrared_emitter.scad
openscad -o /tmp/grove_infrared_emitter_clearance.off -D 'render_mode="clearance"' designs/grove_infrared_emitter.scad
openscad -o /tmp/grove_infrared_emitter_printable_layout.off -D 'render_mode="printable_layout"' designs/grove_infrared_emitter.scad
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
openscad -o /tmp/pi_zero_usb_grove_ir_pod.off -D 'render_mode="ir_pod"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_printable_layout.off -D 'render_mode="printable_layout"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_electronics.off -D 'render_mode="electronics"' designs/pi_zero_usb_grove_ir_enclosure.scad
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

Manual inspection for the Grove Infrared Emitter reference:

- `designs/grove_infrared_emitter.scad` has clearly labeled `Adjustable Parameters` and `Derived Values` sections.
- Adjustable linear variables use `_mm`, angle variables use `_deg`, and render modes dispatch deterministically.
- Board defaults are 20.25 mm x 23.75 mm x 1.6 mm with a 1.5 mm corner radius.
- IR LED extension beyond the +Y PCB edge defaults to 7.5 mm.
- The source documents the 2026-06-17 measured detail default and keeps the 20.0 mm x 20.0 mm wiki size as historical context only.
- Mounting holes default to exactly two holes centered on the left/right PCB margins along the board length; hole diameter and X-edge inset are adjustable planning defaults, then validated against measured hardware.
- Connector top envelope defaults to 9.65 mm above PCB bottom, and bottom pin protrusion clearance defaults to 2.0 mm below PCB bottom for fit checking.
- Grove connector body and cable/plug clearance guide are simplified, adjustable, and controlled by `show_grove_connector` and `show_clearance_guides`.
- IR LED body, extension envelope, and 17 degree sightline guide are simplified, adjustable, and controlled by `show_ir_led` and `show_clearance_guides`.
- `show_electronics`, `show_grove_connector`, `show_ir_led`, `show_labels`, and `show_clearance_guides` independently control their intended visual groups.
- `assembly`, `pcb`, `clearance`, and `printable_layout` modes show the intended reference views.
- No generated mesh or export artifacts are added.

Manual inspection for the Seeed Grove Base Hat for Raspberry Pi Zero reference:

- `designs/seeed_grove_base_hat_zero.scad` has clearly labeled `Adjustable Parameters` and `Derived Values` sections.
- Adjustable linear variables use `_mm`, and render modes dispatch deterministically.
- Board defaults are 65.0 mm x 30.0 mm x 1.6 mm with a 20.0 mm overall height envelope.
- Mounting holes default to 3.0 mm diameter, 3.5 mm edge offsets, and 58.0 mm x 23.0 mm center span.
- The file uses `use <pi_zero.scad>` and can show the optional Pi Zero stack reference without duplicating board geometry.
- `show_electronics`, `show_gpio_header`, `show_gpio_socket_clearance`, `show_grove_labels`, `show_pi_zero_reference`, and `show_height_envelope` independently control their intended visual groups.
- Grove socket bodies are adjustable from the shared Grove connector dimensions and coordinate table.
- Default visible Grove sockets are exactly `UART`, `A3/A4`, `I2C`, `A2`, `D16`, `D26`, `D5`, and `D6`.
- The Grove coordinate table preserves bottom-left PCB coordinates and transforms them into the board-centered OpenSCAD coordinate basis.
- GPIO passthrough/header pads use the Pi Zero-equivalent 20 x 2 grid in `assembly` and `hat` modes when `show_gpio_header = true`.
- `gpio_pin_preview_mode` supports `above`, `below`, and `hidden` pin preview modes.
- The underside GPIO socket/receptacle clearance block is below the HAT PCB, aligned with the GPIO grid, and controlled by `show_gpio_socket_clearance`.
- Grove socket bodies leave visible board space around the Pi Zero-style GPIO passthrough/header reference.
- The Grove and GPIO labels follow `show_grove_labels`.
- Component blocks, LEDs, and labels are present as simplified clearance references.
- The README documents the image-derived Grove coordinates, UART cutout guidance, and physical-measurement caveat.
- `assembly`, `hat`, `connectors`, and `printable_layout` modes show the intended reference views.
- No generated mesh or export artifacts are added.

Manual inspection for the Waveshare ETH/USB HUB HAT reference:

- `designs/waveshare_eth_usb_hub_hat.scad` has clearly labeled `Adjustable Parameters` and `Derived Values` sections.
- Adjustable linear variables use `_mm`, and render modes dispatch deterministically.
- Board defaults are 65.0 mm x 30.0 mm x 1.6 mm with 1.5 mm corner radius.
- Mounting holes default to 3.0 mm diameter, 3.5 mm edge offsets, and 58.0 mm x 23.0 mm center span.
- GPIO header pin centers follow the Pi Zero 20 x 2 coordinate pattern, and the simplified header block is derived from the corrected pin grid.
- RJ45 defaults to a 16.68 mm x 11.7 mm footprint, passes through the PCB, and extends 1.3 mm below the PCB bottom face.
- Front USB-A defaults to a 13.2 mm x 5.7 mm footprint, with its X center derived from the RJ45 center, connector X sizes, and 3.65 mm margin-to-margin spacing.
- Side USB-A previews default to 5.7 mm X inward depth and 13.2 mm Y board-side-margin length, stay fully inside the PCB in X, and align center Y to the middle of the left and right side margins.
- RJ45, front USB-A, one USB-A on each long side, bottom Micro USB interface, LEDs, and major clearance blocks are visible when enabled.
- Major component preview blocks stay outside the default connector and GPIO header footprints.
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

- `designs/pi_zero_usb_grove_ir_enclosure.scad` has clearly labeled `Adjustable Parameters` and `Derived Values` sections near the top.
- The file imports `pi_zero.scad`, `waveshare_eth_usb_hub_hat.scad`, `seeed_grove_base_hat_zero.scad`, and `grove_infrared_emitter.scad` with `use`.
- Render modes are exactly `assembly`, `bottom_tray`, `top_cover`, `ir_pod`, `printable_layout`, and `electronics`.
- `show_electronics` and `show_cutout_guides` independently control previews and guides without changing printable solids.
- Pi Zero, USB HAT, and Grove HAT render in the correct vertical order.
- Default board footprint planning dimensions are 65.0 mm x 30.0 mm.
- Default internal height derives from the 35.0 mm measured stack height plus 8.0 mm extra upward headroom.
- Pi Zero and Waveshare port cutout Z centers derive from their board-tier Z positions plus local offsets.
- `pi_zero_to_waveshare_hat_z_offset_mm` moves the Waveshare preview and Waveshare port cutout Z centers.
- `waveshare_to_grove_hat_z_offset_mm` defaults to 10.8 mm and moves the Grove HAT preview plus the main-to-pod cable guide start Z.
- Pi Zero microSD, mini-HDMI, the externally used power-side Micro USB port, and camera connector access are not blocked by the enclosure.
- The microSD access opening uses `micro_sd_card_width_mm = 11.0`, includes default total clearance, sits at the Pi Zero microSD edge, and fully pierces the tray wall.
- The derived tray/top-cover Y envelope accounts for `micro_usb_bridge_outside_pcb_y_mm = 10.9` plus `micro_usb_bridge_fit_clearance_mm = 1.0` without moving the board stack.
- The Micro USB bridge/addon clearance remains internal footprint clearance and does not reopen the internally consumed adapter-side Pi Zero Micro USB port.
- Bottom-tray USB cutout behavior remains on the shared tray cutout defaults; top-cover USB openings use separate derived dimensions.
- Top-cover USB openings default to at least 15.4 mm effective width and 7.4 mm effective height for the external Pi Zero Micro USB power port and the three Waveshare USB-A openings, and remain adjustable through `top_cover_usb_effective_width_mm` and `top_cover_usb_effective_height_mm`.
- USB HAT RJ45 plus one USB connector are exposed on the front edge.
- One USB HAT USB connector is exposed on each long side, and at least one USB-A cutout includes extra clearance for an external wireless dongle.
- Bottom tray includes floor, thickened side walls, Pi Zero-aligned M2.5-class standoffs, wall-integrated female cover-pin sockets, rubber-foot recesses by default, and the required cutout clearances.
- The tray still has four board-stack mounting holes because the Pi Zero/HAT stack has four mounting points; those holes are distinct from the cover pin/socket interface and pod post/socket hardware.
- Top cover is removable, plug-in, uses simple round male pins near supported corner regions, includes adjustable ventilation/access holes, and does not depend on the Pi Zero stack mounting screws.
- Top-cover pins are simple round vertical pins, and tray-side sockets are true receiving holes in the thickened tray corner walls rather than added internal bosses.
- The `ir_pod` render mode shows the IR pod body assembled with its full-cover cap/top cover on the pod floor at Z=0.
- The `assembly` render mode shows the full-cover IR pod cap installed so the pod is closed after PCB installation.
- The `printable_layout` render mode shows the bottom tray, top cover, open-top IR pod body, full-cover IR pod cap, the U-shaped pod-to-cover lock, and the U-shaped pod-cap insert lock as distinct non-intersecting objects with build-plate contact.
- The two removable U-shaped locks are rendered as distinct parts for installation simulation and keep clearances visible.
- The external pod contains the IR emitter PCB on adjustable support bosses using a local 23.65 mm x 23.75 mm pod-fit reference with exactly two left/right margin mounting bosses, plus optional pilot-hole retention. IR PCB pilot holes are enabled by default (`enable_ir_mount_optional_pilot_holes = true`), so board screws can be added after cap removal.
- The IR emitter PCB loads through the cable-side pod entry with the Grove cable already connected; board retention is validated through pilot holes and optional post-fit screws on the exposed pod side.
- The pod uses cap-owned straight male insert pins and lateral side-wall receiver sleeves/socket bosses for closure. The default side-wall sockets grow outward from the pod interior face so the pod center stays clear for PCB insertion. The interface uses reinforced pin roots without a retention shoulder or interference section, so insertion is not blocked by a tight lock step. After seating the cap, insert the U-shaped external pod-cap lock through the accessible outer insert-pin/receiver-boss cross-holes so it wraps around the pod exterior and resists pull-out; after installing the pod posts into the top-cover sockets, insert the U-shaped lock from the top-cover exterior through the accessible aligned post/socket holes.
- The full-cover cap can be installed after normal PCB and Grove cable installation, and pilot-hole/screw access is only available after removing the cap to complete optional screw retention.
- The pod attaches to the removable top cover through a top-cover-owned female socket interface with pod-owned male posts/pins, independent from the cover-to-tray pin/socket interface and Pi Zero stack fasteners.
- The pod post/socket interface includes local top-cover reinforcement around each socket to keep the joint visually rooted to thickened cover wall material.
- The pod cable entry, IR LED aperture, pod board bosses, cap inserts/sockets, and emitter reference preview all derive from the same adjustable pod/emitter pose.
- The main enclosure cable exit and pod cable entry align with the selected Grove HAT connector area and the emitter connector area.
- Grove cable exits the main enclosure only through the dedicated cable exit and enters the pod only through the pod entry.
- The IR LED aperture subtraction over-travels the pod wall with `ir_led_aperture_pass_through_overlap_mm`, so it is a definite pass-through opening in printable pod views.
- Only the IR LED path and required cable passage are exposed outside the pod by default after the full-cover cap is installed.
- Each printable part has a plausible flat print orientation.
- Wall thicknesses, clearances, bridges, and cap insert features are plausible for Bambu P2S printing.
- No generated mesh or export artifacts are added. Repository validation remains manual review plus `git diff --check`; do not run OpenSCAD locally in this environment.
- Assembly order note: with cover-to-tray pins/sockets left unchanged, install pod-to-cover posts, insert the U-shaped pod-to-cover lock from the top-cover exterior, seat the cap, then install the external U-shaped pod-cap lock around the outside of the pod/cap assembly. Both linked locks are distinct from: cover-to-tray pins/sockets, pod-to-cover post/socket features, cap inserts/sockets, IR PCB pilot holes, vents, cable openings, and stack mounting holes.
