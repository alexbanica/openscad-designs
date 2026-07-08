# OpenSCAD Designs

This repository contains editable OpenSCAD designs.

## Design Files

- `designs/pi_zero.scad`
- `designs/rpi5.scad`
- `designs/rpi5_active_cooler.scad`
- `designs/rpi5_ai_hat_plus_26t.scad`
- `designs/rpi5_ai_hat_plus_26t_enclosure.scad`
- `designs/pi5_five_stack_enclosure.scad`
- `designs/raspberry_pi_tower_stack.scad`
- `designs/grove_infrared_emitter.scad`
- `designs/seeed_grove_base_hat_zero.scad`
- `designs/waveshare_eth_usb_hub_hat.scad`
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

## Raspberry Pi 5 AI HAT+ 26T Reference

`designs/rpi5_ai_hat_plus_26t.scad` is a fit and clearance reference for the Raspberry Pi AI HAT+ 26 TOPS (Hailo-8, 26 TOPS).

`designs/rpi5_active_cooler.scad` now holds the reusable Raspberry Pi 5 active-cooler preview geometry used by `designs/rpi5.scad` and the AI HAT+ reference.

### Component Assumptions

The file is a planning-only model, not vendor CAD. Default dimensions come from public Raspberry Pi product data and readable source assumptions.

- Raspberry Pi AI HAT+ board defaults: 65.0 mm x 56.5 mm x 1.6 mm.
- Pi-to-AI-HAT+ stack distance: 20.0 mm (from stacked mounting-envelope assumptions).
- AI module pin/socket stack default: 23.0 mm from AI HAT PCB.
- Default Hailo-8 package footprint: 17.0 mm x 17.0 mm.
- Mounting-hole positions and Pi 5 active-cooler placement use the Raspberry Pi 5 reference coordinates from `designs/rpi5.scad` and the extracted active-cooler helper.
- PCIe guidance is a left-side on-board connector and routing reference on the AI HAT+ PCB, centered on the middle of the PCB side margin rather than a separate hanging or dangling device.
- Common M2.5 Raspberry Pi hardware assumptions.

The dimensions are approximate. Direct measurement is required before precision enclosure or CAM work.

### Adjustable Parameters

The source starts with an `Adjustable Parameters` section grouped by:

- render controls,
- AI HAT+ board geometry,
- mounting hardware,
- stack and GPIO/header stack,
- AI HAT+ cooling geometry,
- left-side on-board PCIe guidance,
- clearance visuals,
- printable layout.

Common edits:

- Set `render_mode = "assembly"`, `"hat"`, `"cooling"`, or `"printable_layout"`.
- Tune `ai_hat_board_length_mm`, `ai_hat_board_width_mm`, and `ai_hat_board_thickness_mm` for measured hardware.
- Tune `ai_hat_stack_distance_mm` and `ai_hat_header_pin_height_mm` after measuring actual stack mechanics.
- Tune `ai_hat_npu_package_size_mm` for a verified Hailo package envelope.
- Tune AI cooler parameters and placement if a measured local cooler sketch is available.
- Tune PCIe connector and on-board routing parameters (`ai_hat_pcie_connector_center_y_mm`, `ai_hat_pcie_connector_origin_mm`, `ai_hat_pcie_connector_size_mm`, `ai_hat_pcie_routing_origin_mm`, `ai_hat_pcie_routing_size_mm`) for wiring-route fit. The default connector and routing centers derive from the middle of the PCB side margin.
- Independently disable preview layers with `show_rpi5_active_cooler`, `show_ai_hat_electronics`, `show_ai_hat_cooler`, `show_gpio_stack`, `show_pcie_guidance`, `show_labels`, and `show_clearance_guides`.

### Render Modes

Set `render_mode` to one of:

- `assembly`: Raspberry Pi 5 with active cooler, AI HAT+ PCB/hardware, stack clearance, and cooling/cable guides.
- `hat`: AI HAT+ board and header/reference only.
- `cooling`: stack and cooling-focused view for active cooler clearance and AI HAT+ cooler relationship.
- `printable_layout`: separated fit-check groups for visual inspection only (no generated mesh files in source control).

Optional inspection commands:

```sh
openscad -o /tmp/rpi5_ai_hat_plus_26t_assembly.off -D 'render_mode="assembly"' designs/rpi5_ai_hat_plus_26t.scad
openscad -o /tmp/rpi5_ai_hat_plus_26t_hat.off -D 'render_mode="hat"' designs/rpi5_ai_hat_plus_26t.scad
openscad -o /tmp/rpi5_ai_hat_plus_26t_cooling.off -D 'render_mode="cooling"' designs/rpi5_ai_hat_plus_26t.scad
openscad -o /tmp/rpi5_ai_hat_plus_26t_printable_layout.off -D 'render_mode="printable_layout"' designs/rpi5_ai_hat_plus_26t.scad
openscad -o /tmp/rpi5_reference_after_cooler_extract.off designs/rpi5.scad
openscad -o /tmp/rpi5_active_cooler.off -D 'rpi5_active_cooler_reference();' designs/rpi5_active_cooler.scad
```

### Fit and Validation Notes

- Use the model as a child design with `use <rpi5_ai_hat_plus_26t.scad>` and call `rpi5_ai_hat_plus_26t_reference_model(...)` explicitly.
- Use `use <rpi5_active_cooler.scad>` and `rpi5_active_cooler_reference()` when you only need Pi 5 cooler-envelope geometry.
- AI HAT+ defaults are planning values for a 26 TOPS HAT+ and are not vendor-accurate mechanical details.
- `rpi5_ai_hat_plus_26t_pcie_reference()` renders the left-side on-board connector and routing reference centered on the PCB side margin and is gated by `show_pcie_guidance`.
- `show_labels` only controls text, and clearance guides are optional by construction.
- Use `show_clearance_guides = true` during initial stack and enclosure planning for Pi 5 cooler/AI HAT spacing checks.
- Keep `show_pcie_guidance = true` unless enclosure design intentionally removes the PCIe routing path.
- Verify and re-measure dimensions against real hardware before final dimensioning of an enclosure.

Manual inspection checklist:

- Confirm AI HAT+ defaults are 65.0 mm x 56.5 mm x 1.6 mm.
- Confirm stack distance is 20.0 mm and the GPIO/header stack envelope extends 23.0 mm above the AI HAT PCB.
- Confirm the Hailo-8 package default is 17.0 mm x 17.0 mm and visually aligned to the AI HAT cooler target.
- Confirm Pi 5 active cooler geometry is present and reusable through `rpi5_active_cooler.scad`.
- Confirm `show_rpi5_reference`, `show_rpi5_active_cooler`, `show_ai_hat_electronics`, `show_ai_hat_cooler`, `show_gpio_stack`, `show_pcie_guidance`, `show_labels`, and `show_clearance_guides` independently control those groups.
- Confirm `show_pcie_guidance` controls only `rpi5_ai_hat_plus_26t_pcie_reference()` and that PCIe guidance stays as a left-side on-board connector/routing feature centered on the PCB side margin.
- Confirm `assembly`, `hat`, `cooling`, and `printable_layout` behavior renders the intended views with the default parameters.

## Raspberry Pi 5 AI HAT+ 26T Enclosure

`designs/rpi5_ai_hat_plus_26t_enclosure.scad` is a printable bottom-tray and removable-top-cover enclosure for the Raspberry Pi 5 plus `designs/rpi5_ai_hat_plus_26t.scad` stack. It targets Bambu Lab P2S and AMS 2 Pro-friendly printable layouts, keeps generated mesh exports out of source control, and treats OpenSCAD renders as visual validation only.

### Component Assumptions

The enclosure uses `use <rpi5.scad>`, `use <rpi5_ai_hat_plus_26t.scad>`, and `use <rpi5_active_cooler.scad>` for electronics/reference previews. Because OpenSCAD `use` does not expose source variables, the enclosure locally mirrors the current Pi 5 and AI HAT+ reference values with names ending in `_mirror_mm`.

Mirrored Raspberry Pi 5 values include:

- board footprint: 85.0 mm x 56.0 mm x 1.6 mm, with 3.0 mm corner radius,
- mounting-hole centers: `[3.5, 3.5]`, `[61.5, 3.5]`, `[3.5, 52.5]`, and `[61.5, 52.5]`,
- USB-A, Ethernet, USB-C power, micro-HDMI, camera/display, PCIe, and microSD connector origins and sizes from `designs/rpi5.scad`.

Mirrored AI HAT+ values include:

- board footprint: 65.0 mm x 56.5 mm x 1.6 mm,
- Pi-to-HAT stack distance: 20.0 mm,
- GPIO/header pin envelope: 23.0 mm above a 2.5 mm header body on the AI HAT PCB,
- three header-connected cable paths are documented in mirror defaults but are no longer used to force top-cover height above the internal-height target.
- AI HAT+ cooler/fan envelope and PCIe guidance defaults from `designs/rpi5_ai_hat_plus_26t.scad`.

These mirrors are audit points. If the source references change, refresh the enclosure mirror values before precision fitting.

### Adjustable Parameters

The source starts with grouped adjustable parameters for:

- render controls and reference visibility toggles,
- enclosure wall, floor, roof, fit-clearance, and component-clearance values,
- Raspberry Pi 5 mirrored board, mounting, connector, and microSD values,
- AI HAT+ mirrored board, stack, cooler, fan, and PCIe values,
- board mounting/supports,
- top-cover male plug pins and bottom-tray female socket holes,
- bottom anti-slide rubber foot recesses,
- port/service cutout clearances,
- lateral side ventilation,
- top ventilation,
- printable layout spacing,
- visual colours.

Common edits:

- Set `render_mode = "assembly"`, `"bottom_tray"`, `"top_cover"`, `"electronics"`, or `"printable_layout"`.
- Tune `component_clearance_xy_mm`, `component_clearance_z_mm`, `wall_thickness_mm`, `cover_fit_clearance_mm`, and `edge_port_clearance_mm` after hardware measurement.
- Tune `ai_hat_stack_distance_mirror_mm` to adjust the distance between the Raspberry Pi 5 PCB and the AI HAT+ PCB.
- Tune `assembled_internal_height_target_mm` to set the assembled internal-height target (bottom inner surface to top inner surface), in mm. The default is 45.0 mm.
- The default `ai_hat_pcb_top_to_cover_top_height_mm` is derived from `floor_thickness_mm + assembled_internal_height_target_mm` and the mirrored AI HAT+ PCB top height. The default is 16.8 mm from the current stack defaults, and it is not clamped by mirrored header/cable heights.
- `ai_hat_header_cable_error_margin_mm` defines a mirrored/reference clearance assumption for the three header-connected cables. It is not used to increase the default assembled internal-height target or to clamp top-cover height; tune only if you intentionally want to change that mirrored reference.
- Tune `usb_c_cable_head_required_size_mm`, `micro_hdmi_adapter_head_required_size_mm`, and `front_cable_cutout_error_margin_mm` when the front-wall USB-C or micro-HDMI plug bodies need a larger pass-through than the mirrored connector bodies. The default micro-HDMI adapter requirement is 12.0 mm x 6.66 mm plus 0.6 mm total margin, and the default USB-C requirement is 12.0 mm x 7.0 mm plus 0.6 mm total margin.
- Tune `cover_pin_diameter_mm`, `cover_pin_insertion_length_mm`, `tray_socket_clearance_mm`, `tray_socket_depth_mm`, `cover_pin_count`, `cover_pin_offset_x_mm`, and `cover_pin_offset_y_mm` for the male/female connection fit.
- Tune `enable_anti_slide_foot_recesses`, `anti_slide_foot_recess_diameter_mm`, `anti_slide_foot_recess_depth_mm`, and `anti_slide_foot_recess_centers_mm` for adhesive or press-in rubber feet on the tray underside.
- Tune `side_vent_count`, `side_vent_width_mm`, `side_vent_height_mm`, `side_vent_spacing_mm`, `side_vent_center_x_mm`, and `side_vent_center_z_mm` for lateral airflow while keeping vents clear of the cover-pin socket bosses.
- Tune `top_vent_columns`, `top_vent_rows`, `top_vent_hole_diameter_mm`, `top_vent_spacing_x_mm`, `top_vent_spacing_y_mm`, and top vent offsets for the AI HAT+ cooler/fan area.

### Render Modes

Set `render_mode` to one of:

- `assembly`: bottom tray, top cover, male/female connector interface, optional electronics/reference stack, and optional cutout/clearance guides.
- `bottom_tray`: printable bottom tray only, with female cover-pin sockets and Raspberry Pi 5 mounting supports.
- `top_cover`: printable top cover only, inverted onto the print plane with male cover pins, service openings, and ventilation cutouts.
- `electronics`: Raspberry Pi 5 plus AI HAT+ reference stack only.
- `printable_layout`: bottom tray and top cover separated on the print plane with no floating printable geometry.

Optional inspection commands:

```sh
openscad -o /tmp/rpi5_ai_hat_plus_26t_enclosure_assembly.off -D 'render_mode="assembly"' designs/rpi5_ai_hat_plus_26t_enclosure.scad
openscad -o /tmp/rpi5_ai_hat_plus_26t_enclosure_bottom_tray.off -D 'render_mode="bottom_tray"' designs/rpi5_ai_hat_plus_26t_enclosure.scad
openscad -o /tmp/rpi5_ai_hat_plus_26t_enclosure_top_cover.off -D 'render_mode="top_cover"' designs/rpi5_ai_hat_plus_26t_enclosure.scad
openscad -o /tmp/rpi5_ai_hat_plus_26t_enclosure_electronics.off -D 'render_mode="electronics"' designs/rpi5_ai_hat_plus_26t_enclosure.scad
openscad -o /tmp/rpi5_ai_hat_plus_26t_enclosure_printable_layout.off -D 'render_mode="printable_layout"' designs/rpi5_ai_hat_plus_26t_enclosure.scad
```

### Fit and Validation Notes

- The top cover owns the male cylindrical plug pins by default; they protrude below the cover skirt in assembly and stand proud in the inverted printable top-cover render.
- The bottom tray owns matching top-open female socket holes in wall-integrated receiver bosses by default.
- The bottom tray includes shallow bottom-open recesses for anti-slide rubber feet by default.
- Raspberry Pi 5 edge ports are exposed through side or front wall cutouts for USB-A, Ethernet, USB-C power, micro-HDMI, and microSD access. The two right-side USB-A ports and Ethernet share one continuous side-wall cutout with no divider between those connector openings. The USB-C and micro-HDMI front-wall openings keep the mirrored connector centers but expand to the configured cable-head minimums when those are larger than the connector-derived opening.
- Camera/display and PCIe connectors use top service openings because cable routing depends on the installed ribbon/cable path.
- Lateral ventilation is enabled on both long side walls by default.
- Top ventilation is enabled above the AI HAT+ cooler/fan area by default.
- The top cover height is driven by `floor_thickness_mm + assembled_internal_height_target_mm` (default top inner roof = 47.4 mm) and preserves AI HAT+ cooler/fan clearance if required. If the cooler/fan clearance exceeds this target, OpenSCAD prints a conflict warning instead of silently increasing the internal-height target.
- The default assumes shorter installed AI HAT+ headers; the mirrored default header/cable clearance no longer auto-increases the height target.
- Default pin/socket positions are placed near enclosure corners to avoid Raspberry Pi 5 ports, mounting supports, side vents, and the AI HAT+ cooler/fan envelope.
- Physical fit remains unvalidated until measured against real hardware and test printed.

Manual inspection checklist:

- Confirm `assembly`, `bottom_tray`, `top_cover`, `electronics`, and `printable_layout` all render.
- Confirm the printable layout has the tray and cover separated and resting on the print plane.
- Confirm the top cover has male plug pins and the tray has matching female socket holes.
- Confirm the tray underside has anti-slide rubber-foot recesses and that they do not break through the floor.
- Confirm USB-A, Ethernet, USB-C power, micro-HDMI, camera/display, PCIe, and microSD openings are visible, with the right-side USB-A/Ethernet access rendered as one continuous cutout.
- Confirm the front USB-C opening clears at least 12.6 mm x 7.6 mm and each micro-HDMI opening clears at least 12.6 mm x 7.26 mm with the default cable-head margin.
- Confirm side and top ventilation are real subtractive openings.
- Confirm the default assembled internal height target is 45.0 mm, and the derived default top inner roof is 47.4 mm (`floor_thickness_mm + target`).
- Confirm the default AI HAT+ PCB-top-to-inner-roof target is 16.8 mm and header/cable clearance is not used as the controlling clamp for the default internal height.
- Confirm the **actual installed shorter-header** stack and connected cables visually fit under the reduced cover height in `assembly`, `top_cover`, and `electronics` without visible intersection at the top cover, side walls, standoffs, or pin/socket interface.
- Confirm the mirrored default AI HAT+ header/cable clearance assumptions are for reference only and may not match this lower-height 45.0 mm build; validate real hardware stack clearance against measured geometry instead.
- Confirm generated OFF/STL/STEP/3MF files remain under `/tmp` and are not tracked.

## Raspberry Pi 5 Five-Stack Enclosure

`designs/pi5_five_stack_enclosure.scad` is a printable bottom tray, middle cover, and upper cover for a five-board stack with explicit per-gap spacing controls, Raspberry Pi 5 access at the configured Pi 5 board level, a PCB 5 micro-USB front access opening, a lateral GPIO/header access opening for an outward-facing HAT header splitter branch, matching inter-PCB airflow grates, and two internal 30 mm fan mount positions in the upper cover.

### Component Assumptions

The enclosure models five same-footprint PCB positions with shared coordinate-frame defaults:

- `stack_board_count = 5` (default).
- Measured inter-board gaps are `measured_pi5_stack_gap_z_mm = [9.80, 17.05, 19.39, 41.20]` mm from PCB 1 to PCB 2, PCB 2 to PCB 3, PCB 3 to PCB 4, and PCB 4 to PCB 5.
- `stack_measurement_error_margin_mm = 0.5` is added to each measured gap, so the default generated `pi5_stack_gap_z_mm` is `[10.30, 17.55, 19.89, 41.70]` mm.
- PCB 4 from bottom to top is the Raspberry Pi 5 by default (`rpi5_stack_index = 4`).
- The measured PCB 5 top-to-top-cover clearance excluding vents is `35.82` mm via `measured_pcb5_to_top_cover_clearance_excluding_vents_mm`; the same `0.5` mm margin makes `top_of_fifth_board_to_top_cover_clearance_mm = 36.32` mm by default. The derived effective clearance also accounts for `minimum_pcb5_usable_headroom_without_internal_fans_mm = 30.32` mm plus the current internal fan thickness and boss height, so the default fan-aware PCB 5-to-roof clearance becomes `41.32` mm and leaves `5.0` mm more room below the fan/boss envelope.
- Left/right internal board clearance includes `left_right_pci_cable_clearance_margin_mm = 3.0`, giving `7.8` mm nominal clearance from each left/right inside wall to the PCB edge. Front/back clearance is unchanged at `4.8` mm because there are no cables there by default.
- PCB 5 micro-USB access is on the same front side as the Raspberry Pi 5 USB-C opening. `pcb5_micro_usb_left_margin_to_connector_left_mm = 8.85` places the connector left edge from the PCB left margin, with `front_cable_cutout_error_margin_mm = 0.6` applied to the cable-head opening. The default cable-head requirement is `pcb5_micro_usb_cable_head_required_size_mm = [10.30, 11.30]`, producing a minimum visible opening of `10.90 mm x 11.90 mm`.
- The middle/upper cover split is derived above the configured Pi 5 connector cutouts, with `middle_cover_split_clearance_above_pi5_connector_mm = 4.0` mm by default. With the default PCB 4 Pi 5 placement, the split is approximately `79.0` mm above the tray-floor exterior.
- Raspberry Pi 5 base mirror dimensions:
  - `85.0 mm x 56.0 mm x 1.6 mm` board,
  - `3.0 mm` corner radius,
  - four mounting-hole centers from `[3.5, 3.5]`, `[61.5, 3.5]`, `[3.5, 52.5]`, `[61.5, 52.5]`,
  - connector and microSD origins/sizes mirrored from `rpi5.scad`.
- Bottom tray base standoff defaults:
  - standoff height `4.6` mm,
  - standoff outer diameter `6.5` mm,
  - screw holes open from inside the enclosure through the standoff tops and do not pass through the tray floor,
  - screw-hole diameter follows the mirrored Raspberry Pi 5 PCB mounting-hole diameter, `2.75` mm by default,
  - screw-hole depth is `4.2` mm by default.
- Middle-cover male/female interface defaults:
  - pin count `4` at `cover_pin_offset_x_mm = 45.5`, `cover_pin_offset_y_mm = 31.0`,
  - pin diameter `5.0` mm, root diameter `7.6` mm, insertion length `5.2` mm,
  - socket clearance `0.35` mm, socket depth `5.6` mm,
  - tray socket receiver boss diameter `8.0` mm.
- Upper-cover to middle-cover interface defaults:
  - uses the same four default XY pin centers as the middle-cover/tray
    interface,
  - upper-cover male pin diameter `5.0` mm, root diameter `7.6` mm, root height
    `6.0` mm, and insertion length `5.2` mm,
  - middle-cover top-open socket clearance `0.35` mm and socket depth `5.6` mm.
- Anti-slip recess defaults:
  - `10.0` mm diameter,
  - up to `1.1` mm effective depth,
  - offsets `28.0` mm and `18.0` mm from perimeter edges.
- Inter-PCB airflow defaults:
  - active on both side walls, the back face, and non-Pi-adjacent front-face gaps by default,
  - every inter-PCB gap gets grate-style openings,
  - front/back face grate rows that touch the configured Pi 5 board are suppressed when they would collide with front connector cutouts or the GPIO/header lateral access opening,
  - `inter_pcb_airflow_slot_count = 4`,
  - `inter_pcb_airflow_slot_spacing_mm = 11.0`,
  - `inter_pcb_airflow_slot_width_mm = 6.0`,
  - `inter_pcb_airflow_slot_height_mm = 8.0`,
  - `inter_pcb_airflow_slot_length_mm = 18.0`.
- Upper top-cover wall airflow defaults:
  - enabled by default on the vertical walls only,
  - `upper_cover_airflow_row_count = 4`,
  - upper side-wall slots are half-size by default at `3.0` mm wide x `4.0` mm tall,
  - upper front/back slots are half-size by default at `9.0` mm long x `4.0` mm tall,
  - starts at least `10.0` mm above PCB 5,
  - keeps `8.0` mm below the inside top wall clear of vent rows.
- Internal fan and guarded roof grille defaults:
  - two internal fan positions are enabled by default,
  - `internal_fan_body_size_mm = [30.0, 30.0, 7.0]`,
  - `internal_fan_center_positions_mm = [[-22.5, 0.0], [22.5, 0.0]]`,
  - `internal_fan_screw_hole_spacing_mm = 24.0`,
  - four inside screw/pilot bosses per fan use `internal_fan_mount_boss_diameter_mm = 6.2`, `internal_fan_mount_boss_height_mm = 4.0`, `internal_fan_mount_screw_pilot_diameter_mm = 2.4`, and `internal_fan_mount_screw_pilot_depth_mm = 3.4`,
  - each roof grille is a guarded five-slot pattern using `guarded_fan_grille_slot_count = 5`, `guarded_fan_grille_slot_width_mm = 3.2`, `guarded_fan_grille_slot_length_mm = 18.0`, and `guarded_fan_grille_slot_spacing_mm = 5.0`,
  - the guarded grilles are the only default roof openings and are not full 30 mm fan holes.
- Raspberry Pi 5 GPIO/header lateral access defaults:
  - enabled by default with `enable_rpi5_gpio_header_lateral_access = true`,
  - placed on the Pi 5 GPIO/header edge of the enclosure with `rpi5_gpio_header_lateral_access_face_sign = 1`,
  - centered from the mirrored GPIO header origin and size,
  - width is the mirrored `51.0` mm GPIO header length plus `2.0` mm clearance on each X side,
  - height is the mirrored `2.5` mm header body plus `6.0` mm pin height plus `3.0` mm clearance above and below,
  - depth is `2 * wall_thickness_mm + 3.0` so the opening passes fully through the case wall.

### Source and Mirrors

This source uses `use <rpi5.scad>` for the Pi 5 fit/reference view.
Because `use` does not expose upstream variables in the parent scope, Pi 5 board size, mounting, connector, GPIO and microSD values are mirrored locally with the `_mirror_mm` naming convention.

### Adjustable Parameters

Parameters are grouped in `Adjustable Parameters` and `Derived Values`:

- render controls: `render_mode`, `show_rpi5_reference`, `show_rpi5_gpio_pins`, `show_rpi5_micro_sd_card`, `show_rpi5_active_cooler_reference`, `show_clearance_guides`
- stack geometry and derived Z mapping
- Raspberry Pi 5 mirror geometry and connector parameters
- wall/floor/roof clearances
- bottom-tray standoff, inside screw-hole, and insert toggles
- middle-cover/tray male/female interface parameters
- upper-cover/middle-cover male/female interface parameters
- anti-slip recess controls
- inter-PCB and upper top-cover wall airflow controls and slot geometry
- internal 30 mm fan body, center, boss, screw/pilot, and guarded roof grille controls
- microSD/port-access defaults and clearances, including GPIO/header lateral access controls
- printable layout spacing
- visual styling

Common edits:

- Set `render_mode = "assembly"`, `"bottom_tray"`, `"middle_cover"`, `"upper_cover"`, `"top_cover"`, `"electronics"`, or `"printable_layout"`.
- Tune `measured_pi5_stack_gap_z_mm` or `stack_measurement_error_margin_mm` for all four inter-PCB gaps and observe the derived `pi5_stack_gap_z_mm` stack Z map.
- Tune `rpi5_stack_index` if the Raspberry Pi 5 board moves from the default fourth PCB position.
- Tune `top_of_fifth_board_to_top_cover_clearance_mm` for roof headroom margin. Tune `pcb5_component_to_fan_extra_clearance_mm` when PCB 5 components need more room below the internal fans. The derived `effective_top_of_fifth_board_to_top_cover_clearance_mm` also accounts for `minimum_pcb5_usable_headroom_without_internal_fans_mm` and the internal fan clearance envelope, so the default effective PCB 5-to-roof clearance is `41.32 mm` while preserving an extra `5.0 mm` below the fan/boss envelope.
- Tune `left_right_pci_cable_clearance_margin_mm` if PCI/ribbon cable clearance is needed along the left/right inside walls. This does not enlarge the front/back margin.
- Tune `middle_cover_split_clearance_above_pi5_connector_mm` if the middle/upper split needs more material above the Pi 5 connector cutouts.
- Keep `stack_board_count` at its default `5` for the default five-board contract.
- Tune standoff and `enable_board_mount_inserts`, screw insert/hole dimensions. By default `board_mount_screw_hole_diameter_mm` is derived from `rpi5_board_mounting_hole_diameter_mirror_mm`, and the holes open from the inside standoff tops.
- Tune pin/socket dimensions for fit.
- Tune `middle_upper_connector_pin_*` and `middle_upper_connector_socket_*` if
  the upper-cover to middle-cover fit needs different clearance or engagement
  than the middle-cover to tray fit.
- Tune `inter_pcb_airflow_slot_*` and per-face enable flags to reposition vents. The front/back airflow helper automatically omits Pi 5-adjacent vent rows on faces where Pi 5 service openings or the GPIO/header splitter opening would collide.
- Tune `enable_upper_cover_wall_airflow`, `upper_cover_airflow_row_count`, `upper_cover_airflow_gap_above_highest_board_mm`, and `upper_cover_airflow_roof_keepout_mm` for the upper-cover vent band.
- Tune `enable_internal_fan_mounts`, `enable_guarded_fan_roof_grilles`, `internal_fan_body_size_mm`, `internal_fan_center_positions_mm`, `internal_fan_screw_hole_spacing_mm`, `internal_fan_mount_*`, and `guarded_fan_grille_*` after measuring the actual 30 mm fans.
- Tune service clearances for USB-A/Ethernet/USB-C/micro-HDMI, base-position microSD access, and GPIO/header lateral access. USB-C and micro-HDMI front openings use the same cable-head sizing defaults as the printed Raspberry Pi 5 AI HAT+ enclosure: `usb_c_cable_head_required_size_mm = [12.0, 7.0]`, `micro_hdmi_adapter_head_required_size_mm = [12.0, 6.66]`, and `front_cable_cutout_error_margin_mm = 0.6`, producing minimum visible front openings of `12.6 mm x 7.6 mm` and `12.6 mm x 7.26 mm`. Use `rpi5_gpio_header_lateral_access_*` when the installed HAT header splitter or display connector needs more lateral width, wall depth, or vertical clearance.
- Tune `pi5_service_port_cutout_lowering_mm` if the Pi 5 USB-A/Ethernet/USB-C/micro-HDMI access openings need vertical calibration after fitting. The default lowers those Pi 5 service openings by `5.0` mm from the mirrored connector-derived center.
- Tune `pcb5_micro_usb_*` values if the PCB 5 micro-USB connector body, cable head, or left-margin measurement needs calibration after fitting. The default `pcb5_micro_usb_cutout_lowering_mm = 7.0` lowers the PCB 5 micro-USB opening by `7.0` mm from the measured connector-derived center.
- Tune `enable_anti_slip_recesses`, recess diameter/depth, and offsets.

### Render Modes

Set `render_mode` to one of:

- `assembly`: full assembled enclosure with optional bottom tray, middle cover, upper cover, and optional five-board reference stack.
- `bottom_tray`: printed bottom tray only, including PCB supports, female cover-socket features, and tray anti-slip recesses.
- `middle_cover`: printed middle cover only, inverted to the print plane with male pins, Pi 5 connector cutouts, and lower wall cutouts.
- `upper_cover`: printed upper cover only, inverted to the print plane with non-fan roof areas closed, guarded fan grilles, inside fan mounting bosses, and upper wall ventilation.
- `top_cover`: printed middle and upper cover sections together, separated on the print plane for inspection.
- `electronics`: five PCB positions only (no printed geometry), with the configured Raspberry Pi 5 board shown at `rpi5_stack_index` and generic PCB placeholders for the other levels. `show_rpi5_reference` controls visibility in this mode.
- `printable_layout`: bottom tray, middle cover, and upper cover placed on separate build areas for direct inspection.

Optional inspection commands:

```sh
openscad -o /tmp/pi5_five_stack_enclosure_assembly.off -D 'render_mode="assembly"' -D 'show_rpi5_reference=false' designs/pi5_five_stack_enclosure.scad
openscad -o /tmp/pi5_five_stack_enclosure_bottom_tray.off -D 'render_mode="bottom_tray"' designs/pi5_five_stack_enclosure.scad
openscad -o /tmp/pi5_five_stack_enclosure_middle_cover.off -D 'render_mode="middle_cover"' designs/pi5_five_stack_enclosure.scad
openscad -o /tmp/pi5_five_stack_enclosure_upper_cover.off -D 'render_mode="upper_cover"' designs/pi5_five_stack_enclosure.scad
openscad -o /tmp/pi5_five_stack_enclosure_top_cover.off -D 'render_mode="top_cover"' designs/pi5_five_stack_enclosure.scad
openscad -o /tmp/pi5_five_stack_enclosure_electronics.off -D 'render_mode="electronics"' designs/pi5_five_stack_enclosure.scad
openscad -o /tmp/pi5_five_stack_enclosure_printable_layout.off -D 'render_mode="printable_layout"' designs/pi5_five_stack_enclosure.scad
```

### Fit and Validation Notes

- The design keeps the bottom tray as the smaller shallow half (`tray_wall_height_mm` default `16.0`) and places the middle and upper cover sections above it.
- The middle cover owns `cover_pin_*` and bottom tray owns `tray_socket_*` dimensions.
- The upper cover is a separate printable headroom section above the Pi 5 connector-access zone. It owns short downward `middle_upper_connector_pin_*` male pins that plug into matching top-open `middle_upper_connector_socket_*` holes in the middle cover at the split.
- Five board Z offsets, highest-board Z, inter-gap centers, effective fan-aware top clearance, and derived enclosure height are computed from `pi5_stack_gap_z_mm`, board thickness, and the internal fan clearance envelope.
- All four inter-board gaps receive grate-style airflow openings by default on both opposing side walls and the back face.
- Front-face grates are automatically skipped for gaps directly adjacent to the configured Pi 5 board so USB-C and micro-HDMI front connector openings stay clear. Back-face grates are also skipped for Pi 5-adjacent gaps when the GPIO/header lateral access opening is on the back/GPIO-header face, so the HAT splitter/display opening does not collide with vent slots.
- The tall upper-cover wall area above PCB 5 has additional side/front/back wall grates by default; non-fan roof areas remain closed.
- Two guarded roof fan grilles sit above the internal fan positions by default. They use multiple slots with printed ribs left between openings, so the roof is not one full 30 mm hole per fan.
- Two internal fan mounting point sets are modeled on the inside face of the upper cover. The default `24.0` mm screw span is a planning assumption for typical 30 mm fans and should be measured before final printing.
- Raspberry Pi 5 USB-A/Ethernet, USB-C, and micro-HDMI service cutouts are placed at `rpi5_stack_index` on the side/front walls. The two USB-A ports and Ethernet use one continuous right-side cutout with no separator between connector openings and keep the same Raspberry Pi 5 connector extents used by the printed Raspberry Pi 5 AI HAT+ enclosure. The front USB-C and micro-HDMI openings keep the mirrored connector X/Y placement but enlarge the visible width/height to the Raspberry Pi 5 AI HAT+ enclosure cable-head defaults when those are larger than the connector-derived openings. By default `pi5_service_port_cutout_lowering_mm = 5.0` lowers the Pi 5 USB-A/Ethernet/USB-C/micro-HDMI openings by `5.0` mm for physical access. The top cover roof has no service openings; only guarded fan airflow grilles pierce the roof.
- PCB 5 has a dedicated front-side micro-USB cable opening on the same side as the Pi 5 USB-C connector. It is placed from the measured connector-left margin, uses the same front cable cutout error margin as the Pi 5 front connector openings, and is lowered by `pcb5_micro_usb_cutout_lowering_mm = 7.0` by default.
- The Raspberry Pi 5 GPIO/header lateral access cutout is placed on the GPIO/header edge at `rpi5_stack_index`. It is intended for a HAT header splitter with one branch facing outward through the enclosure and another branch facing upward to continue the stack; the splitter and display connector are not modeled.
- Base-board Pi 5 USB-A/Ethernet, USB-C, micro-HDMI, and microSD tray-wall openings are only generated when `rpi5_stack_index = 1`.
- Base-board Pi 5 GPIO/header lateral access is generated in the tray wall when `rpi5_stack_index = 1`.
- Base-board screw holes open from inside the tray at the mirrored Raspberry Pi 5 mounting-hole centers and do not break through the bottom face.
- Bottom-tray female socket bosses are built from `tray_socket_receiver_diameter_mm` and provide material support behind each socket hole.
- Non-Pi PCB positions render as simple generic PCB placeholders in the electronics preview.
- The bottom tray includes underside anti-slip recesses; keep recess depth below floor thickness to avoid breakthrough.
- The source uses only local mirrored Pi 5 values where `use <rpi5.scad>` prevents direct variable access.

Manual inspection checklist:

- Confirm default `stack_board_count = 5`, `rpi5_stack_index = 4`, the measured gap list is `[9.80, 17.05, 19.39, 41.20]` mm, and the default margin-adjusted gap list is `[10.30, 17.55, 19.89, 41.70]` mm.
- Confirm all board positions share the same X/Y footprint and that the Raspberry Pi 5 reference appears at PCB 4 in `assembly`.
- Confirm `render_mode` variants all generate.
- Confirm top cover height updates when `pi5_stack_gap_z_mm` or `top_of_fifth_board_to_top_cover_clearance_mm` changes.
- Confirm the left/right inside-wall-to-PCB clearance includes the PCI cable margin and that front/back clearance is not enlarged by that setting.
- Confirm the default top-cover clearance preserves PCB 5 headroom while adding the two internal 30 mm fan bodies, mounting bosses, and the extra `5.0 mm` PCB 5 component-to-fan clearance.
- Confirm non-fan roof areas are closed and the roof has no service openings.
- Confirm middle-cover/bottom-tray pin-socket pairing exists and remains printable.
- Confirm the middle/upper cover split sits above the Pi 5 connector cutouts and the upper cover is independently printable.
- Confirm upper-cover/middle-cover pin-socket pairing exists and remains printable.
- Confirm both opposing side walls keep inter-PCB grate openings for all four gap centers by default, and that front/back-face grates are omitted only for Pi-adjacent connector or GPIO/header splitter access zones.
- Confirm the upper-cover wall vent band exists on vertical walls and does not replace inter-PCB airflow.
- Confirm two guarded roof grille patterns exist, align to the two fan centers, and retain printed ribs/material instead of forming full 30 mm holes.
- Confirm the GPIO/header lateral access opening is centered on the Pi 5 GPIO/header edge, passes through the case wall, and gives enough clearance for the measured outward-facing HAT header splitter/display connector.
- Confirm the front USB-C opening clears at least `12.6 mm x 7.6 mm` and each micro-HDMI opening clears at least `12.6 mm x 7.26 mm`, matching the printed Raspberry Pi 5 AI HAT+ enclosure defaults.
- Confirm the PCB 5 front micro-USB opening is on the Pi 5 USB-C side, starts from the measured `8.85` mm left-margin placement, and clears at least `10.90 mm x 11.90 mm` by default.
- Confirm two internal fan mounting point sets exist inside the upper cover and avoid the split-interface pins/sockets and PCB 5 clearance.
- Confirm base board standoffs and anti-slip recesses do not break through the floor.
- Confirm `printable_layout` has only three printed parts.
- Confirm generated OFF files stay under `/tmp` and are not tracked.

## Raspberry Pi Tower Stack Enclosure

`designs/raspberry_pi_tower_stack.scad` is a printable bottom-tray and
removable-top-cover enclosure for a five-board Raspberry Pi-size stack with a
Raspberry Pi 5 as the fourth board and a Cluster HAT-style PCB as the top board.

It includes a centered stack reference with adjustable per-PCB gap spacing, Pi 5
service/access openings around the fourth-board zone, NVMe board references at
PCB 1 and PCB 3, under-Pi5 airflow for NVMe heatsinks and a PCI splitter, extra
NVMe airflow for the bottom and third PCBs, two small square fan mount positions
configured as intake/exhaust by default, and a perpendicular display cover
assembly preview with a clear window. The bottom tray is the shallow/small
cover half by default; the top cover carries the larger enclosure height.
The top cover includes explicit Pi 5 USB-A/Ethernet access and GPIO/HAT-pin
access for the perpendicular header/display branch.

### Component Assumptions

The design defaults are planning values and remain fully adjustable:

- Five-board stack using Raspberry Pi-size footprints.
- PCB 1 and PCB 3 are NVMe boards by default (`nvme_stack_indices = [1, 3]`).
- PCB 4 is Raspberry Pi 5 by default (`rpi5_stack_index = 4`).
- PCB 5/top is a Cluster HAT-style board by default
  (`cluster_hat_stack_index = 5`).
- Per-gap stack spacing vector defaults to `[14.0, 12.0, 14.0, 13.0]` mm.
- Top-cover clearance (from the top of the highest PCB to the inner top-cover target)
  defaults to `7.0` mm via
  `top_of_highest_board_to_top_cover_clearance_mm`.
- Bottom tray side-wall height defaults to `2.5` mm via
  `bottom_tray_side_wall_height_mm`, keeping the bottom cover shallow while the
  top cover encloses the stack.
- Generic placeholder PCB defaults: `85.0 mm x 56.0 mm x 1.6 mm` with Pi 5-style
  mounting pattern and simplified header geometry.
- NVMe PCB defaults use the same `85.0 mm x 56.0 mm x 1.6 mm` Raspberry Pi-size
  board outline with adjustable module and heatsink preview geometry.
- Cluster HAT-style top-board defaults use the same Raspberry Pi-size board
  outline with adjustable GPIO/socket and downstream socket preview geometry.
- Top cover interface defaults are 4-pin male/female socket geometry:
  - pin count: `4` with `4` active pins by default at `(-42.0, -28.0)`,
    `(42.0, -28.0)`, `(-42.0, 28.0)`, `(42.0, 28.0)`
  - `cover_pin_diameter_mm = 3.2`
  - `cover_pin_insertion_length_mm = 5.0`
  - `cover_pin_root_diameter_mm = 5.6`
  - `tray_socket_clearance_mm = 0.35`
  - `tray_socket_depth_mm = 5.8`
  - `tray_socket_receiver_diameter_mm = 7.0`.
- Pi 5 HAT-pin access defaults use `hat_pin_access_clearance_mm = 2.5`,
  `hat_pin_lateral_exit_width_mm = 58.0`,
  `hat_pin_lateral_exit_height_mm = 14.0`, and
  `hat_pin_lateral_exit_z_offset_mm = 5.5` for the top GPIO access and the side
  pass-through used by the perpendicular display branch.
- Pi 5 mounting access defaults use `pi5_mounting_access_diameter_mm = 8.0`
  through the top cover above the fourth-board mounting holes.
- PCB mounting insert defaults are `pcb_mount_insert_outer_diameter_mm = 4.2`,
  `pcb_mount_insert_depth_mm = 3.8`, `pcb_mount_screw_pilot_diameter_mm = 2.2`,
  and `pcb_mount_screw_pilot_depth_mm = 5.0` in the bottom-tray standoffs.
- Anti-slip recess defaults use four bottom-open recesses controlled by
  `enable_anti_slip_recesses`, `anti_slip_recess_diameter_mm = 10.0`,
  `anti_slip_recess_depth_mm = 1.1`, `anti_slip_recess_offset_x_mm = 32.0`,
  and `anti_slip_recess_offset_y_mm = 20.0`.
- Under-Pi5 airflow defaults provide bottom tray slots and lower side-wall vents
  under the fourth-board Raspberry Pi 5 zone for an NVMe heatsink and PCI
  splitter placeholder envelope. Tune `enable_under_pi5_airflow`,
  `enable_under_pi5_bottom_airflow`, `under_pi5_airflow_count`,
  `under_pi5_airflow_slot_width_mm`, `under_pi5_airflow_slot_length_mm`,
  `under_pi5_airflow_lower_side_count`, and related spacing/offset parameters
  after measuring the real modules.
- NVMe airflow defaults provide bottom-tray slots below PCB 1 and side-wall vent
  openings near PCB 1 and PCB 3. Tune `enable_nvme_board_airflow`,
  `enable_bottom_nvme_airflow`, `nvme_airflow_*`, and `nvme_side_vent_*`
  parameters after measuring the real NVMe modules and heatsinks.
- Fan defaults are configurable square fan mounts with default mount centers at
  `[[-18.0, -20.0], [18.0, -20.0]]`, defaults `fan_mount_enabled_flags = [true, true]`,
  `fan_airflow_direction_labels = ["intake", "exhaust"]`,
  body size `30.0` mm, thickness `7.0` mm, clearance `0.6` mm,
  hole spacing `24.0` mm, screw-hole diameter `3.0` mm, boss diameter `6.0` mm,
  boss height `6.0` mm, wall-hole diameter `4.2` mm, wall-cutout padding `1.6` mm.
- Display defaults are placeholder display geometry with a covered body and an
  exposed front window, using
  `display_body_length_mm = 50.0`, `display_body_width_mm = 32.0`,
  `display_body_height_mm = 20.0`, `display_body_thickness_mm = 2.2`,
  `display_window_length_mm = 28.0`, `display_window_height_mm = 12.0`,
  `display_window_clearance_mm = 0.6`,
  `display_cover_wall_thickness_mm = 2.0`,
  `display_cover_front_clearance_mm = 1.2`,
  `display_cover_z_lift_mm = 6.0`.
- Display/header splitter defaults are:
  `display_body_offset_x_from_splitter_mm = 1.0`,
  `display_body_offset_z_from_header_mm = 0.8`,
  `display_splitter_vertical_length_mm = 22.0`,
  `display_splitter_lateral_length_mm = 20.0`,
  `display_splitter_cross_section_mm = 4.0`,
  `header_splitter_pin_count_x = 4`, `header_splitter_pin_count_y = 2`,
  `header_splitter_pin_offset_x_mm = 1.2`, and
  `header_splitter_pin_offset_y_mm = 1.2`.

### Source and Mirrors

`designs/rpi5.scad` is used directly for the fourth-board preview and port
service context. Because OpenSCAD `use` limits raw variable visibility, the enclosure
adds local `rpi5_*_mirror_mm` values for:

- board footprint/edge geometry and mounting points,
- GPIO/header placement,
- service connector origins and extents (USB-A, Ethernet, USB-C, micro-HDMI, camera/display, PCIe),
- microSD position/extent.

### Adjustable Parameters

Top-level parameters are grouped in the source under:

- render controls, visibility toggles, and inspection helpers,
- stack and spacing controls,
- NVMe board and airflow controls,
- Cluster HAT-style top-board controls,
- Raspberry Pi 5 mirror values,
- wall/floor/roof and clearances,
- shallow tray/tall cover split controls,
- supports, standoffs, PCB mounting inserts, pin/socket parameters,
- bottom anti-slip recess parameters,
- Raspberry Pi 5 port access sizing and clearance,
- Raspberry Pi 5 GPIO/HAT-pin top and side pass-through access,
- side and top ventilation settings around the Pi 5 zone,
- under-Pi5 bottom and lower-side airflow settings for NVMe/heatsink and PCI splitter clearance,
- square fan mount parameters, mount enable flags, and intake/exhaust labels,
- display cover/window placement,
- vertical/lateral header splitter preview parameters,
- display cover/window clearances,
- printable layout spacing and visual styling.

Common edits:

- Set `render_mode = "assembly"`, `"bottom_tray"`, `"top_cover"`, `"display_cover"`, `"electronics"`, or `"printable_layout"`.
- Tune `pcb_stack_gap_z_mm` to adjust each inter-board gap independently.
- Tune `top_of_highest_board_to_top_cover_clearance_mm`, `show_tower_reference`,
  `show_rpi5_reference`, `show_rpi5_active_cooler_reference`,
  and `show_placeholder_board_headers` for stack preview density.
- `assembly` hides the PCB stack by default (`show_tower_reference = false`) so
  the cover/tray split and openings can be inspected without electronics
  occluding the enclosure. Use `electronics` or set `show_tower_reference = true`
  when checking board fit.
- Tune `bottom_tray_side_wall_height_mm` to keep the bottom cover as small as
  practical while preserving sockets, standoffs, inserts, and the cover overlap.
- Tune `pcb_mount_insert_*` and `pcb_mount_screw_pilot_*` values for the
  selected PCB mounting inserts.
- Tune `enable_anti_slip_recesses`, `anti_slip_recess_diameter_mm`,
  `anti_slip_recess_depth_mm`, and recess offsets for rubber feet.
- Tune `cover_pin_diameter_mm`, `cover_pin_insertion_length_mm`,
  `tray_socket_clearance_mm`, `tray_socket_depth_mm`, and socket count/offsets for top cover fit.
- Tune `rpi5_usb_*`, `rpi5_ethernet_*`, `rpi5_micro_hdmi_*`, and camera/display/PCIe
  clearance values to match measured connector and cable-head geometry.
- Tune `hat_pin_access_clearance_mm`, `hat_pin_lateral_exit_width_mm`,
  `hat_pin_lateral_exit_height_mm`, and `hat_pin_lateral_exit_z_offset_mm` for
  the perpendicular HAT-pin/header branch and display connection.
- Tune `enable_pi5_side_ventilation`, `enable_pi5_top_ventilation`, and all related
  vent counts/sizes/spacing.
- Tune `enable_under_pi5_airflow`, `enable_under_pi5_bottom_airflow`,
  `under_pi5_airflow_*`, and `under_pi5_airflow_lower_side_*` values to move or
  resize bottom-tray and lower-side passages around real NVMe, heatsink, and
  PCI splitter hardware.
- Tune `nvme_stack_indices`, `nvme_module_size_mm`, `nvme_heatsink_size_mm`,
  `enable_nvme_board_airflow`, `enable_bottom_nvme_airflow`, `nvme_airflow_*`,
  and `nvme_side_vent_*` values for the PCB 1 and PCB 3 NVMe boards.
- Tune `cluster_hat_*` values for the top Cluster HAT-style board sockets and
  header geometry.
- Tune fan mounting (`fan_mount_centers_mm`, `fan_body_size_mm`,
  `fan_body_clearance_mm`, `fan_mount_*`) and `fan_mount_enabled_flags` for one or two fan builds.
  Both mounts are populated by default; `fan_airflow_direction_labels` documents
  the default intake/exhaust intent and does not simulate airflow.
- Tune display cover (`display_body_*`, `display_window_*`, `display_cover_*`,
  `display_splitter_*`) and `display_cover_z_lift_mm` for branch geometry.

### Render Modes

Set `render_mode` to one of:

- `assembly`: tray + cover + optional stack references + fan/display/header previews.
  The stack references are hidden by default.
- `bottom_tray`: shallow printable tray only, with wall-integrated female socket
  bosses, PCB mounting inserts, anti-slip recesses, and mounting supports.
- `top_cover`: taller printable top cover only, with male plug pins and
  top-coverage openings.
- `display_cover`: display cover/extension geometry only.
- `electronics`: only the five-board references (PCB 1/3 NVMe boards, PCB 2
  placeholder, PCB 4 Pi 5, PCB 5 Cluster HAT-style board).
- `printable_layout`: tray, top cover, and display cover arranged for separate printing inspection.

Optional inspection commands:

```sh
openscad -o /tmp/raspberry_pi_tower_stack_assembly.off -D 'render_mode="assembly"' designs/raspberry_pi_tower_stack.scad
openscad -o /tmp/raspberry_pi_tower_stack_bottom_tray.off -D 'render_mode="bottom_tray"' designs/raspberry_pi_tower_stack.scad
openscad -o /tmp/raspberry_pi_tower_stack_top_cover.off -D 'render_mode="top_cover"' designs/raspberry_pi_tower_stack.scad
openscad -o /tmp/raspberry_pi_tower_stack_display_cover.off -D 'render_mode="display_cover"' designs/raspberry_pi_tower_stack.scad
openscad -o /tmp/raspberry_pi_tower_stack_electronics.off -D 'render_mode="electronics"' designs/raspberry_pi_tower_stack.scad
openscad -o /tmp/raspberry_pi_tower_stack_printable_layout.off -D 'render_mode="printable_layout"' designs/raspberry_pi_tower_stack.scad
```

### Fit and Validation Notes

- Use this source as a child design with `use <raspberry_pi_tower_stack.scad>` and call
  `raspberry_pi_tower_stack_assembly()`,
  `raspberry_pi_tower_stack_printable_bottom_tray()`,
  `raspberry_pi_tower_stack_printable_top_cover()`,
  `raspberry_pi_tower_stack_display_cover()`,
  or `raspberry_pi_tower_stack_electronics_reference()` as needed.
- The fourth-board Pi 5 access is provided for mounting holes, USB-A, Ethernet,
  USB-C power, both micro-HDMI ports, camera/display, PCIe, and microSD.
- The top cover also has explicit GPIO/HAT-pin access and a side pass-through
  for the perpendicular HAT-pin branch that carries the display.
- Airflow features include Pi 5 side-wall ventilation through the top cover,
  Pi 5 top-zone vent holes, bottom tray airflow slots, lower side-wall passages
  through the top cover below the Pi 5 board for the NVMe/heatsink and PCI
  splitter area, and dedicated PCB 1/PCB 3 NVMe airflow openings.
- Two fan mounts are always modeled and both are populated by default, with
  direction labels documenting one intake slot and one exhaust slot.
- The display cover hides the display body and only exposes the configured window on the active
  display face.
- The bottom tray includes anti-slip recesses and PCB mounting insert holes by
  default. Keep `anti_slip_recess_depth_mm` below `floor_thickness_mm` so the
  recesses do not break through the floor.
- Generated OFF/STL/STEP/3MF/3mf outputs must remain under `/tmp` only.

Manual inspection checklist:

- Confirm `assembly`, `bottom_tray`, `top_cover`, `display_cover`, `electronics`, and `printable_layout` all render.
- Confirm `pcb_stack_gap_z_mm` affects each inter-board interval independently.
- Confirm PCB 1 and PCB 3 are NVMe boards, PCB 4 is Raspberry Pi 5, and PCB 5 is
  the Cluster HAT-style top board.
- Confirm top-cover clearance is controlled by `top_of_highest_board_to_top_cover_clearance_mm`.
- Confirm the bottom tray is the shallow/small cover half and the top cover is
  the larger/taller cover half.
- Confirm top cover has male pins and tray has matching female socket bosses/holes.
- Confirm bottom-tray standoffs include PCB mounting insert holes.
- Confirm bottom-tray underside has anti-slip recess holes and they do not break
  through the floor.
- Confirm USB-A, Ethernet, USB-C, micro-HDMI, camera/display, PCIe, and microSD openings are included.
- Confirm Pi 5 GPIO/HAT-pin access and the side pass-through for the
  perpendicular display branch are included.
- Confirm Pi 5 mounting access holes are present through the top cover.
- Confirm Pi 5-zone ventilation exists on side walls and top openings.
- Confirm under-Pi5 bottom and lower-side airflow openings exist below the
  fourth-board Raspberry Pi 5 zone.
- Confirm PCB 1 has bottom-tray NVMe airflow and PCB 1/PCB 3 have side-wall
  NVMe airflow openings.
- Confirm two fan mounts are present, populated, non-overlapping by default, and
  documented as intake/exhaust.
- Confirm header splitter preview includes a vertical and lateral branch.
- Confirm display window dimensions and cover offsets are documented defaults and adjustable.
- Confirm generated mesh files remain untracked.

## Raspberry Pi Zero USB Ethernet Grove Enclosure

`designs/pi_zero_usb_grove_ir_enclosure.scad` is a printable enclosure set for a Raspberry Pi Zero v1.3, a Waveshare ETH/USB HUB HAT, a Seeed Grove Base Hat for Raspberry Pi Zero, and a Grove Infrared Emitter PCB screwed to the inside of the removable top cover. The design keeps the Pi Zero, Waveshare HAT, and Grove HAT in the main enclosure with board stack standoffs, usable external port cutouts, top ventilation/access holes, a front-wall top-cover IR LED aperture, and anti-slide features.

### Component Assumptions

Default dimensions are configurable at the top of `designs/pi_zero_usb_grove_ir_enclosure.scad`. The initial defaults assume:

- Raspberry Pi Zero v1.3 board footprint: 65.0 mm x 30.0 mm.
- Stack order from bottom to top: Pi Zero, Waveshare ETH/USB HUB HAT, Seeed Grove Base Hat for Raspberry Pi Zero.
- User-provided measured stack height: 35.0 mm, plus 13.0 mm default extra upward headroom.
- Independent board spacing defaults: `pi_zero_to_waveshare_hat_z_offset_mm = 11.2` and `waveshare_to_grove_hat_z_offset_mm = 10.8`.
- Waveshare ETH/USB HUB HAT footprint: 65.0 mm x 30.0 mm, with RJ45 plus one USB-A port on the front edge and one USB-A port on each long side.
- Waveshare front RJ45/Ethernet and USB-A cutout X defaults come from the local `designs/waveshare_eth_usb_hub_hat.scad` reference: `waveshare_rj45_cutout_center_x_mm = -7.76` and `waveshare_front_usb_a_cutout_center_x_mm = 10.83`.
- Top-cover USB opening defaults: at least 15.4 mm effective width and 7.4 mm effective height for the external Pi Zero Micro USB power port, Waveshare front USB-A, Waveshare left USB-A, and Waveshare right USB-A openings.
- Seeed Grove Base Hat for Raspberry Pi Zero mounted above the USB HAT with the adjustable measured spacer default; tune the spacing after physical measurement if the preview or hardware stack needs more clearance.
- Common M2.5-class fasteners for the board standoffs.
- microSD card width: 11.0 mm, with a default 2.0 mm total clearance for the tray pass-through opening.
- External Pi Zero HDMI plug head: 20.80 mm length and 11.30 mm height for the bottom-tray HDMI entry, plus the shared 0.6 mm port cutout error margin.
- External Pi Zero Micro USB plug head: 10.30 mm length and 11.30 mm height for the bottom-tray power-side entry, matching the default mini-HDMI plug-head height, plus the shared 0.6 mm port cutout error margin.
- Micro USB bridge/addon protrusion outside the Pi Zero PCB: 10.9 mm, plus 1.0 mm default printable fit clearance used to size the tray and top-cover Y envelope.
- Grove IR emitter PCB mounted upside down inside the removable top cover with two screw bosses, leaving the Grove male port/component side facing down into the enclosure. The PCB center defaults to the right side of the front-facing wall at `ir_top_cover_pcb_center_x_mm = 24.0` and `ir_top_cover_pcb_center_y_mm = -16.7`, placing the IR PCB screw holes 7.0 mm closer to the front-wall IR LED aperture than the prior `-9.7` default. The default screw-hole center spacing is `20.15` mm, copied from the previous IR pod implementation available in `origin/main` in this clone. The IR PCB screw default assumes a maximum 5.0 mm screw length including the screw head.
- Top-cover IR LED aperture: 6.2 mm diameter, horizontal through the `-Y` front-facing top-cover wall, with its wall center derived from the live enclosure width and front-wall position. The default Z height is derived from the underside boss height, PCB thickness, and LED center height on the upside-down component face. The final cut depth includes the shared port clearance so the aperture over-travels both wall faces.
- Printable render modes use print-only wrappers that place solids on the build plate at Z=0 without changing the assembled preview coordinate system.
- One Waveshare side USB-A cutout includes extra clearance for an externally attached wireless dongle.

The board and connector previews are fit and clearance references, not vendor-accurate cosmetic models. Connector positions, port openings, stack spacing, and tolerances should be adjusted after measuring the actual hardware stack.

### Adjustable Parameters

The OpenSCAD source starts with an `Adjustable Parameters` section grouped by:

- render controls,
- stack dimensions and offsets,
- enclosure wall, floor, cover skirt/drop depth, and cover dimensions,
- Pi Zero stack mounting standoffs,
- plug-in top cover simple round male pins, wall-integrated tray female sockets, and socket clearance,
- top-cover IR PCB screw bosses, pilot holes, LED aperture, and vent keepout behavior,
- Pi Zero and Waveshare port cutout dimensions and offsets,
- microSD card access dimensions,
- Micro USB bridge/addon outside-PCB clearance dimensions,
- top ventilation/access hole pattern,
- anti-slide recesses or printed feet,
- tolerances and print clearances,
- printable layout,
- visual settings.

Common edits:

- Change `render_mode` to export a printable part.
- Set `show_electronics = false` to hide the Pi Zero and HAT references without changing printable solids.
- Set `show_cutout_guides = false` to hide port guide previews without changing printable solids.
- Adjust Pi Zero microSD, mini-HDMI, Micro USB, and camera cutout positions after a test fit.
- Tune `micro_sd_card_width_mm`, `micro_sd_card_total_clearance_mm`, `pi_micro_sd_cutout_*`, and `micro_sd_wall_through_overlap_mm` if the card slot needs more access clearance or a deeper wall-piercing subtraction after print inspection.
- Tune `pi_mini_hdmi_head_length_mm`, `pi_mini_hdmi_head_height_mm`, and `pi_mini_hdmi_cutout_depth_mm` if your external HDMI plug head differs from the 20.80 mm x 11.30 mm default. The shared `port_cutout_extra_clearance_mm` remains the default printable error margin applied to the bottom-tray opening.
- Tune `pi_micro_usb_power_head_length_mm`, `pi_micro_usb_power_head_height_mm`, and `pi_micro_usb_power_cutout_depth_mm` if your external Micro USB plug head differs from the 10.30 mm x 11.30 mm default. The Micro USB power opening height intentionally matches the default mini-HDMI opening height. The shared `port_cutout_extra_clearance_mm` remains the default printable error margin applied to the bottom-tray opening.
- Tune `micro_usb_bridge_outside_pcb_y_mm` and `micro_usb_bridge_fit_clearance_mm` if the measured bridge/addon protrusion differs; the derived internal Y envelope expands the bottom tray and top cover consistently while keeping the board stack centered.
- Tune the Waveshare RJ45, front USB-A, left USB-A, and right USB-A cutout positions independently after measuring the USB HAT. The shipped front RJ45/Ethernet and front USB-A X centers are refreshed from the local Waveshare reference defaults, `-7.76 mm` and `10.83 mm`.
- Tune `top_cover_usb_effective_width_mm` and `top_cover_usb_effective_height_mm` if the top-cover USB openings need more clearance after physical calibration. These top-cover USB dimensions are derived separately from the bottom-tray/shared cutouts so the tray port openings remain unchanged by this iteration.
- Tune `pi_zero_to_waveshare_hat_z_offset_mm` and `waveshare_to_grove_hat_z_offset_mm` for the real spacer stack; those values move the electronics previews and board-relative port cutout Z positions together.
- Increase `measured_stack_height_mm` or `extra_upward_headroom_mm` if the assembled stack or Grove connector area needs more vertical clearance.
- Tune `cover_skirt_drop_depth_mm`, `cover_pin_diameter_mm`, `cover_pin_insertion_length_mm`, `cover_pin_offset_x_mm`, `cover_pin_offset_y_mm`, `cover_pin_count`, `tray_socket_clearance_mm`, and `tray_socket_depth_mm` after physical test fitting. The defaults use four simple round 3.0 mm male pins, 5.2 mm insertion length, 0.35 mm socket diameter clearance, and female socket holes placed directly in the thickened tray corner walls.
- The default `wall_thickness_mm` is 6.0 mm so the cover pins and socket holes live near the center of the wall/corner volume instead of relying on added internal socket bosses. The default `cover_pin_offset_x_mm` and `cover_pin_offset_y_mm` center the 3.35 mm socket holes in the wall/corner volume, leaving about 1.3 mm of material on both the inner and outer sides of the thickened walls. If pin fit is too tight, increase `tray_socket_clearance_mm`; if it is loose, reduce clearance in small increments while keeping enough clearance for the printer/material combination.
- Tune `ir_top_cover_pcb_center_x_mm`, `ir_top_cover_pcb_center_y_mm`, `ir_top_cover_pcb_thickness_mm`, `ir_top_cover_mount_hole_spacing_x_mm`, `ir_top_cover_mount_boss_outer_diameter_mm`, `ir_top_cover_mount_screw_hole_diameter_mm`, `ir_top_cover_mount_max_screw_length_including_head_mm`, `ir_top_cover_mount_screw_head_height_allowance_mm`, `ir_top_cover_led_local_*`, `ir_top_cover_led_center_above_component_face_mm`, `ir_top_cover_led_aperture_diameter_mm`, and `ir_top_cover_led_aperture_wall_overtravel_mm` after fitting the upside-down Grove IR emitter PCB to the underside of the top cover. The PCB defaults to the right side of the front-facing wall with center X `24.0`; adjust this value if the physical board or cable needs more side clearance. The default screw-hole spacing is `20.15` mm from the prior pod geometry. The default boss height and pilot depth derive to 2.2 mm from a 5.0 mm maximum screw length including head, minus 1.2 mm screw-head allowance and 1.6 mm PCB thickness. The LED aperture pierces the front-facing `-Y` top-cover wall using the aperture wall depth plus the shared port clearance as its effective subtraction depth, and vents that overlap the screw bosses are skipped automatically by the IR feature keepout.
- Use `cover_vent_*` values to resize or shift the default denser symmetric circular top-hole grid. The shipped defaults are `5 x 4` holes at `4.0 mm` diameter on `10.5 mm x 6.0 mm` spacing.
- Use rubber-foot recesses by default, or set `use_rubber_foot_recesses = false` to preview printed feet instead.

### Render Modes

Set `render_mode` to one of:

- `assembly`: full enclosure preview with optional electronics and the top-cover IR PCB screw mount.
- `bottom_tray`: tray printable part with board standoffs, board-relative port cutouts, wall-integrated female sockets for the cover pins, and anti-slide features, placed on the build plate at Z=0.
- `top_cover`: plug-in removable cover with simple round male pins, underside IR PCB screw bosses, front-wall IR LED aperture, and top ventilation/access holes, inverted print-side down on the build plate at Z=0.
- `printable_layout`: bottom tray and top cover arranged side-by-side on the build plate for inspection and export. Both parts remain separate build-plate-supported objects.
- `electronics`: imported electronics/reference stack without printable case geometry.

Optional inspection commands for users with OpenSCAD installed:

```sh
openscad -o /tmp/pi_zero_usb_grove_ir_assembly.off -D 'render_mode="assembly"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_bottom_tray.off -D 'render_mode="bottom_tray"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_top_cover.off -D 'render_mode="top_cover"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_printable_layout.off -D 'render_mode="printable_layout"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_electronics.off -D 'render_mode="electronics"' designs/pi_zero_usb_grove_ir_enclosure.scad
```

For inspection with electronics hidden:

```sh
openscad -o /tmp/pi_zero_usb_grove_ir_assembly.off -D 'render_mode="assembly"' -D 'show_electronics=false' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_assembly.off -D 'render_mode="assembly"' -D 'show_cutout_guides=false' designs/pi_zero_usb_grove_ir_enclosure.scad
```

### Assembly And Print Notes

- Print the bottom tray and top cover as separate parts.
- Printable part render modes already orient the tray on its base and the top cover flat with the exterior roof on the bed. The assembled-world modules remain separate so `assembly` and `electronics` preserve fit-reference positions.
- Use `printable_layout` for all independent printed parts. Generated STL, STEP, 3MF, OFF, or other mesh/export artifacts are not committed to this repository.
- Use PLA, PETG, or another material appropriate for the target thermal environment.
- Prefer at least three perimeters for the Pi Zero standoffs, cover skirt, simple cover pins, and tray socket wall regions.
- Install the Pi Zero stack on the Pi Zero-aligned standoffs before installing the top cover.
- Screw the Grove IR emitter PCB upside down inside the top cover using the two underside bosses before installing the cover on the tray. The default screw-hole span is `20.15` mm, the PCB sits on the right side of the front-facing wall, the Grove male port/component side faces down into the enclosure, and the LED is intended to face the front-facing `-Y` top-cover wall aperture. The IR PCB screw must be no longer than 5.0 mm including the screw head unless the screw-depth parameters are changed after measuring the hardware.
- Confirm the 10.8 mm default Waveshare-to-Grove spacing against the actual spacers; increase it if physical measurement or preview inspection shows collision between the Waveshare top-side parts and the Grove underside socket/header area.
- The alignment lip was removed for printability because it caused failed stringing/spaghetti in printable cover previews. Cover alignment and retention now come from the four vertical male pins and matching wall-integrated tray sockets instead of a perimeter lip.
- The top cover uses simple round plug-in pins and matching tray sockets cut into the thickened tray walls; it does not use cover screws and it does not depend on the Pi Zero stack mounting screws. The cover lowers vertically onto the tray, and removal should be tuned by socket clearance and pin insertion depth rather than by flexing latch features.
- The four bottom-tray stack holes exist because the Pi Zero/HAT stack has four mounting points. Those holes are distinct from the top-cover pin/socket interface.
- The top-cover IR PCB screw bosses are distinct from the bottom-tray stack holes and from the cover pin/socket interface. They consume some underside cover clearance, so inspect the real Grove HAT, cable, and IR PCB clearance before final print use.
- Bottom-tray HDMI entry defaults to a measured 20.80 mm plug-head length and 11.30 mm plug-head height, with the shared port cutout error margin added by the cutout subtraction.
- The Pi Zero opening for the internally occupied Micro USB adapter side is intentionally closed. The remaining external Pi Zero Micro USB opening is the power-side opening.
- Bottom-tray Micro USB power-side entry defaults to a 10.30 mm plug-head length and an 11.30 mm plug-head height matching the mini-HDMI entry height, with the shared port cutout error margin added by the cutout subtraction.
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
openscad -o /tmp/rpi5_ai_hat_plus_26t_assembly.off -D 'render_mode="assembly"' designs/rpi5_ai_hat_plus_26t.scad
openscad -o /tmp/rpi5_ai_hat_plus_26t_hat.off -D 'render_mode="hat"' designs/rpi5_ai_hat_plus_26t.scad
openscad -o /tmp/rpi5_ai_hat_plus_26t_cooling.off -D 'render_mode="cooling"' designs/rpi5_ai_hat_plus_26t.scad
openscad -o /tmp/rpi5_ai_hat_plus_26t_printable_layout.off -D 'render_mode="printable_layout"' designs/rpi5_ai_hat_plus_26t.scad
openscad -o /tmp/pi_zero_usb_grove_ir_assembly.off -D 'render_mode="assembly"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_bottom_tray.off -D 'render_mode="bottom_tray"' designs/pi_zero_usb_grove_ir_enclosure.scad
openscad -o /tmp/pi_zero_usb_grove_ir_top_cover.off -D 'render_mode="top_cover"' designs/pi_zero_usb_grove_ir_enclosure.scad
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

Manual inspection for the Pi Zero USB Grove enclosure:

- `designs/pi_zero_usb_grove_ir_enclosure.scad` has clearly labeled `Adjustable Parameters` and `Derived Values` sections near the top.
- The file imports `pi_zero.scad`, `waveshare_eth_usb_hub_hat.scad`, and `seeed_grove_base_hat_zero.scad` with `use`.
- Render modes are exactly `assembly`, `bottom_tray`, `top_cover`, `printable_layout`, and `electronics`.
- `show_electronics` and `show_cutout_guides` independently control previews and guides without changing printable solids.
- Pi Zero, USB HAT, and Grove HAT render in the correct vertical order.
- Default board footprint planning dimensions are 65.0 mm x 30.0 mm.
- Default internal height derives from the 35.0 mm measured stack height plus 13.0 mm extra upward headroom.
- Pi Zero and Waveshare port cutout Z centers derive from their board-tier Z positions plus local offsets.
- `pi_zero_to_waveshare_hat_z_offset_mm` moves the Waveshare preview and Waveshare port cutout Z centers.
- `waveshare_to_grove_hat_z_offset_mm` defaults to 10.8 mm and moves the Grove HAT preview.
- Pi Zero microSD, mini-HDMI, the externally used power-side Micro USB port, and camera connector access are not blocked by the enclosure.
- The microSD access opening uses `micro_sd_card_width_mm = 11.0`, includes default total clearance, sits at the Pi Zero microSD edge, and fully pierces the tray wall.
- The derived tray/top-cover Y envelope accounts for `micro_usb_bridge_outside_pcb_y_mm = 10.9` plus `micro_usb_bridge_fit_clearance_mm = 1.0` without moving the board stack.
- The Micro USB bridge/addon clearance remains internal footprint clearance and does not reopen the internally consumed adapter-side Pi Zero Micro USB port.
- Bottom-tray USB cutout behavior remains on the shared tray cutout defaults; top-cover USB openings use separate derived dimensions.
- Top-cover USB openings default to at least 15.4 mm effective width and 7.4 mm effective height for the external Pi Zero Micro USB power port and the three Waveshare USB-A openings, and remain adjustable through `top_cover_usb_effective_width_mm` and `top_cover_usb_effective_height_mm`.
- USB HAT RJ45 plus one USB connector are exposed on the front edge.
- One USB HAT USB connector is exposed on each long side, and at least one USB-A cutout includes extra clearance for an external wireless dongle.
- Bottom tray includes floor, thickened side walls, Pi Zero-aligned M2.5-class standoffs, wall-integrated female cover-pin sockets, rubber-foot recesses by default, and the required cutout clearances.
- The tray still has four board-stack mounting holes because the Pi Zero/HAT stack has four mounting points; those holes are distinct from the cover pin/socket interface.
- Top cover is removable, plug-in, uses simple round male pins near supported corner regions, includes adjustable ventilation/access holes, and does not depend on the Pi Zero stack mounting screws.
- Top-cover pins are simple round vertical pins, and tray-side sockets are true receiving holes in the thickened tray corner walls rather than added internal bosses.
- The `assembly` render mode shows only the main enclosure plus optional Pi Zero, Waveshare HAT, and Grove HAT references.
- The `printable_layout` render mode shows only the bottom tray and top cover as distinct non-intersecting objects with build-plate contact.
- Each printable part has a plausible flat print orientation.
- Wall thicknesses, clearances, and cover pin/socket features are plausible for Bambu P2S printing.
- No generated mesh or export artifacts are added. Repository validation remains manual review plus `git diff --check`; OpenSCAD may be used locally when a short focused render is useful.
