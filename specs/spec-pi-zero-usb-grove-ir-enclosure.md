# Raspberry Pi Zero USB Ethernet Grove IR Enclosure Spec

Status: Approved

## Purpose

Define a parametric OpenSCAD 2021.01 design for a printable enclosed case that holds a Raspberry Pi Zero v1.3 with manually inserted GPIO headers, a Waveshare USB Ethernet HUB HAT, a Seeed Grove Base Hat for Raspberry Pi Zero, and an internally mounted Grove Infrared Emitter with only the IR LED exposed externally.

## Problem Statement

The assembled Pi Zero stack has exposed boards, side-facing Pi and USB/Ethernet HAT ports, a top Grove Base Hat with GPIO access requirements, and a separate wired IR emitter module. The design needs a printable enclosure that protects the stacked electronics while preserving all required port access, exposing only the top GPIO header area, routing the IR emitter cable internally, and aiming the IR LED outside the case without exposing the rest of the emitter board.

## Scope

- One primary OpenSCAD source file for this enclosure.
- Parametric dimensions for:
  - Raspberry Pi Zero v1.3 footprint, thickness, mounting holes, port openings, and bottom header protrusion allowance.
  - Waveshare ETH/USB HUB HAT footprint, mounting holes, RJ45 opening, 3 USB openings, and bottom USB bridge clearance.
  - Seeed Grove Base Hat for Raspberry Pi Zero footprint, top GPIO header access area, Grove connector clearance, and stack height.
  - Grove Infrared Emitter board, LED aperture, optional internal screw holes, and internal cable routing.
  - enclosure wall thickness, lid clearance, screw bosses, tolerances, and Bambu Lab-friendly print settings.
- Printable component modules for:
  - bottom tray with Pi/HAT standoffs and side port cutouts,
  - screw-fastened top cover,
  - sliding top GPIO hatch,
  - internal IR emitter mount,
  - full assembly preview,
  - printable part render modes.
- README updates covering component assumptions, render modes, parameters, print guidance, and validation.
- Compatibility with OpenSCAD 2021.01.
- Bambu Lab P2S and AMS 2 Pro-compatible print guidance.

## Out Of Scope

- Electrical design, wiring changes, GPIO pin mapping, Grove software setup, or IR protocol configuration.
- Waterproofing, dust sealing, outdoor sealing, or RF/EMI shielding.
- Vendor-certified fit guarantees for HAT revisions not matching the documented products.
- Exposing Grove sockets for external plug/unplug access; the IR emitter cable is routed internally.
- Generated STL, STEP, 3MF, or other mesh exports unless a future approved plan explicitly adds them.
- Automated physical fit validation.

## Definitions

- Pi Zero: Raspberry Pi Zero v1.3 board from Kiwi Electronics, using the standard Zero footprint, with manually inserted GPIO headers protruding slightly below the board.
- USB HAT: Waveshare ETH/USB HUB HAT sold by Kiwi Electronics as USB Ethernet HUB HAT for Raspberry Pi Zero, 65 mm x 30 mm, with RJ45 and 3 USB ports.
- Grove HAT: Seeed Grove Base Hat for Raspberry Pi Zero, mounted above the USB HAT.
- IR emitter: Seeed Grove - Infrared Emitter module, 20 mm x 20 mm board with a 5 mm IR LED.
- Enclosure: A closed protective case made from a bottom tray and screw-fastened top cover.
- GPIO hatch: A sliding top access feature that exposes only the top 2x20 GPIO header area.
- Port cutout: A side or end-wall opening aligned to a Pi or USB HAT connector so cables can be plugged in while the enclosure is assembled.

## Inputs And Constraints

- OpenSCAD compatibility target: 2021.01.
- Units: millimetres.
- Default Pi Zero footprint: 65 mm x 30 mm, with standard Zero mounting hole positions parameterized.
- USB HAT documented dimensions: 65 mm x 30 mm, 3 mm mounting holes, 1x RJ45, and 3x USB 2.0 ports.
- Grove IR emitter documented dimensions: 20 mm x 20 mm x 18 mm, 5 mm LED, 940 nm emitter.
- Grove Base Hat provides a top GPIO pinout matching the Raspberry Pi header and multiple Grove sockets.
- The Pi Zero manually inserted GPIO header pins protrude downward from the bottom of the Pi and require bottom clearance.
- The case must keep all fit-critical dimensions configurable near the top of the OpenSCAD file.
- The design must not depend on external OpenSCAD libraries.
- Geometry must be organized into named modules with descriptive `snake_case` names.
- Linear dimensions must use `_mm` suffixes and angles must use `_deg` suffixes.
- User-adjustable values must not be redefined inside modules.
- Generated mesh exports must remain out of source control.
- The design and documented print guidance must remain compatible with Bambu Lab P2S and AMS 2 Pro unless a future spec changes printer support.

## Adjustable Variables Section

The OpenSCAD source must include a clearly labeled `Adjustable Parameters` section near the top. Required groups:

- Render controls:
  - `render_mode`,
  - `show_electronics`,
  - optional debug or cutaway preview toggles.
- Pi Zero dimensions:
  - board length, width, thickness,
  - mounting hole offsets and diameters,
  - microSD, mini-HDMI, micro-USB power, micro-USB data, camera connector, and GPIO header preview/cutout parameters,
  - bottom header pin protrusion clearance.
- USB HAT dimensions:
  - board length, width, thickness,
  - mounting hole diameter and offsets,
  - RJ45 cutout dimensions and position,
  - three USB cutout dimensions and positions,
  - bottom micro-USB bridge clearance.
- Grove HAT dimensions:
  - board length, width, thickness,
  - stack clearance,
  - top GPIO access opening,
  - Grove connector preview and internal cable clearance.
- IR emitter dimensions:
  - board length, width, thickness,
  - LED diameter, LED protrusion, LED aperture clearance,
  - optional screw hole diameter and spacing,
  - internal cable channel width and height.
- Enclosure structure:
  - wall thickness,
  - base thickness,
  - lid thickness,
  - corner radius or chamfer size if used,
  - board edge clearance,
  - internal stack height clearance.
- Fasteners and tolerances:
  - enclosure screw clearance,
  - standoff diameter,
  - screw boss diameter,
  - fit tolerance,
  - sliding hatch clearance,
  - minimum printable feature size.

Derived values must be placed in a separate `Derived Values` section below the adjustable variables.

## Deterministic Behavior

- The default assembly renders the Pi Zero at the bottom, the USB HAT above it, and the Grove HAT on top.
- The enclosure consists of a bottom tray and a top cover joined by screws.
- The top cover includes a sliding hatch aligned over the Grove HAT's 2x20 GPIO header area.
- With the hatch open, only the top GPIO header area is accessible from outside the enclosure.
- With the hatch closed, the top of the enclosure protects the Grove HAT while allowing no external Grove socket access.
- The IR emitter module is mounted inside the enclosure.
- Only the IR LED is exposed outside the enclosure through a front aperture sized for the configured LED and tolerance.
- The IR emitter cable routes internally from the Grove HAT to the IR emitter mount without requiring an external cable loop.
- The IR emitter mount includes optional internal screw holes for fastening the emitter board.
- The Pi Zero port openings expose microSD, mini-HDMI, both micro-USB connectors, and camera connector access where mechanically practical.
- The USB HAT port openings expose the RJ45 connector and all three USB connectors.
- Board mounting holes remain usable via internal standoffs or through-screw features.
- Port cutouts include configurable clearance so cables can be inserted without removing the case.
- Bottom internal clearance accommodates manually inserted GPIO header pins protruding below the Pi Zero.
- Simplified non-printing preview modules show the Pi Zero, USB HAT, Grove HAT, and IR emitter when `show_electronics` is enabled.
- Printable render modes include at least:
  - `assembly`,
  - `bottom_tray`,
  - `top_cover`,
  - `gpio_hatch`,
  - `printable_layout`.
- The design avoids supports where reasonable by using flat printable parts, chamfers, bridges within practical FDM limits, and accessible screw assembly.

## Assumptions Proposed For Approval

- The Pi Zero target is Raspberry Pi Zero v1.3 with the standard 65 mm x 30 mm board footprint.
- Header pin protrusion below the Pi Zero will default to a conservative configurable clearance rather than a fixed measured value.
- Exact connector cutout positions and sizes will be parameterized so they can be adjusted after test fitting.
- The camera connector access requirement can be satisfied by a case opening or removable-cover access path rather than by making the camera connector usable with the cover fully closed.
- The Grove Base Hat sockets remain enclosed after assembly; only the already-connected IR emitter cable is routed internally.
- The IR emitter points forward from the case by default.
- The IR emitter board is serviceable by removing the top cover, not through an external removable IR door.
- Common M2.5 fasteners are the default for Pi/HAT mounting and enclosure assembly unless the implementation discovers a stronger local convention.
- The first implementation will create editable OpenSCAD geometry and documentation only, with no generated mesh files.

## Impact And Regression Considerations

- This adds a second coherent design to the repository and should preserve the existing Raspberry Pi 5 AI HAT design.
- The new design should follow the same repository conventions for specs, render modes, OpenSCAD 2021.01 syntax, parameter grouping, and README documentation.
- The existing `AGENTS.md` guidance should remain compatible with this design, including Bambu Lab P2S and AMS 2 Pro print compatibility.
- Physical fit cannot be proven without measuring the actual stack and printing or test-fitting parts; the design must therefore make stack height, connector positions, and tolerances adjustable.

## Validation Plan

- Run `git diff --check`.
- If OpenSCAD is installed, validate the changed `.scad` file for each documented render mode, using output paths under `/tmp`.
- Manually inspect the OpenSCAD preview for:
  - correct Pi Zero, USB HAT, and Grove HAT stacking order,
  - unobstructed Pi port openings,
  - unobstructed RJ45 and 3x USB openings,
  - sliding hatch exposing only the GPIO header area,
  - enclosed Grove sockets and internal IR cable path,
  - only the IR LED exposed outside,
  - bottom clearance for protruding manually inserted header pins,
  - plausible flat print orientation for each printable part,
  - Bambu P2S-friendly wall thicknesses, clearances, bridges, and screw features.
- If OpenSCAD is unavailable, report that geometry validation was not run and provide manual inspection steps in the completion report.

## Documentation Requirements

- Update `README.md` with:
  - the new design file name,
  - supported hardware stack,
  - component assumptions and source dimensions,
  - adjustable parameter groups,
  - render modes and export examples,
  - assembly and print guidance,
  - Bambu Lab P2S and AMS 2 Pro notes,
  - manual validation checklist.
- Update `AGENTS.md` validation commands to include the new design render modes when implementation is approved and performed.

## Research Sources

- Kiwi Electronics, Raspberry Pi Zero v1.3 product page: https://www.kiwi-electronics.com/nl/raspberry-pi-zero-versie-1-3-2840
- Kiwi Electronics, USB Ethernet HUB HAT for Raspberry Pi Zero: https://www.kiwi-electronics.com/nl/usb-ethernet-hub-hat-voor-raspberry-pi-zero-10305
- Waveshare, ETH/USB HUB HAT: https://www.waveshare.com/eth-usb-hub-hat.htm
- Kiwi Electronics, Grove Base Hat for Raspberry Pi Zero: https://www.kiwi-electronics.com/nl/grove-base-hat-voor-raspberry-pi-zero-3931
- Seeed Studio Wiki, Grove Base Hat for Raspberry Pi Zero: https://wiki.seeedstudio.com/Grove_Base_Hat_for_Raspberry_Pi_Zero/
- Kiwi Electronics, Grove - Infrared Emitter: https://www.kiwi-electronics.com/nl/grove-infrared-emitter-2043
- Seeed Studio Wiki, Grove - Infrared Emitter: https://wiki.seeedstudio.com/Grove-Infrared_Emitter/
