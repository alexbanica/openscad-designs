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
- USB HAT: Waveshare ETH/USB HUB HAT sold by Kiwi Electronics as USB Ethernet HUB HAT for Raspberry Pi Zero, product code WS-16595, 65 mm x 30 mm, with RJ45 and 3 USB ports.
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
- USB HAT connector layout for product code WS-16595:
  - one RJ45 Ethernet connector exits the front edge,
  - one USB connector exits the front edge next to the RJ45 connector,
  - one USB connector exits the left long side,
  - one USB connector exits the right long side.
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
  - independent front, left-side, and right-side USB cutout dimensions and positions,
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
- The front IR LED aperture must be positioned so it does not overlap or obstruct the USB HAT front RJ45 and USB openings.
- The IR emitter cable routes internally from the Grove HAT to the IR emitter mount without requiring an external cable loop.
- The IR emitter mount includes optional internal screw holes for fastening the emitter board.
- The Pi Zero port openings expose microSD, mini-HDMI, both micro-USB connectors, and camera connector access where mechanically practical.
- The USB HAT port openings expose the RJ45 connector and all three USB connectors.
- The USB HAT front port openings include the RJ45 connector and one USB connector beside it.
- The USB HAT side port openings include one USB connector on the left long side and one USB connector on the right long side.
- The design must not place all three USB HAT USB openings on the same enclosure face.
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
- Default USB HAT connector openings will model the WS-16595 physical topology: RJ45 plus one USB on the front edge, one USB on the left long side, and one USB on the right long side.
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
- The existing implementation currently models the three USB HAT USB openings as a grouped set on one face; this iteration changes that behavior and requires independently parameterized front, left-side, and right-side USB openings.

## Validation Plan

- Run `git diff --check`.
- If OpenSCAD is installed, validate the changed `.scad` file for each documented render mode, using output paths under `/tmp`.
- Manually inspect the OpenSCAD preview for:
  - correct Pi Zero, USB HAT, and Grove HAT stacking order,
  - unobstructed Pi port openings,
  - unobstructed RJ45 opening and USB HAT openings matching the WS-16595 topology,
  - one USB HAT USB opening on the front edge beside RJ45,
  - one USB HAT USB opening on each long side,
  - no obsolete grouped three-USB opening on a single face,
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
- Waveshare Wiki, ETH/USB HUB HAT resources and interfaces: https://www.waveshare.com/wiki/ETH/USB_HUB_HAT
- Kiwi Electronics, Grove Base Hat for Raspberry Pi Zero: https://www.kiwi-electronics.com/nl/grove-base-hat-voor-raspberry-pi-zero-3931
- Seeed Studio Wiki, Grove Base Hat for Raspberry Pi Zero: https://wiki.seeedstudio.com/Grove_Base_Hat_for_Raspberry_Pi_Zero/
- Kiwi Electronics, Grove - Infrared Emitter: https://www.kiwi-electronics.com/nl/grove-infrared-emitter-2043
- Seeed Studio Wiki, Grove - Infrared Emitter: https://wiki.seeedstudio.com/Grove-Infrared_Emitter/

## Iteration: WS-16595 USB HAT Connector Layout Correction

Status: Approved

### Requested Change

Correct the USB HAT port model for Kiwi Electronics product code WS-16595. The prior spec allowed the implementation to place all three USB HAT USB openings together on one enclosure face. That is incorrect for the referenced hardware.

### Behavior Changed

- The USB HAT must be modeled as the Waveshare ETH/USB HUB HAT sold by Kiwi Electronics under product code WS-16595.
- The USB HAT must expose one front RJ45 connector.
- The USB HAT must expose one front USB connector next to the RJ45 connector.
- The USB HAT must expose one USB connector on each long side of the board/enclosure.
- The USB HAT USB cutouts and preview geometry must be independently parameterized by face instead of using a single grouped three-port front or side pattern.
- README documentation must describe this corrected WS-16595 connector layout.

### Behavior Preserved

- The Pi Zero, USB HAT, and Grove HAT stacking order remains unchanged.
- The enclosure remains a bottom tray plus screw-fastened top cover with sliding GPIO hatch.
- The Grove sockets remain enclosed.
- The IR emitter remains internal with only the IR LED exposed externally.
- The front IR aperture remains allowed, provided it does not overlap or block the RJ45 and front USB openings.
- The design remains one editable OpenSCAD 2021.01-compatible `.scad` file with no external library dependency.
- Generated mesh exports remain out of scope.

### Out Of Scope For This Iteration

- Vendor-accurate cosmetic connector models.
- Fixed measured connector coordinates beyond configurable defaults.
- Changes to the Grove HAT, Pi Zero, IR emitter, hatch, fastener, or print-orientation behavior except where needed to prevent front opening overlap.
- Generated STL, STEP, 3MF, or other mesh exports.

### Acceptance Criteria

- The spec and implementation plan no longer describe all three USB HAT USB connectors as a single grouped set on one face.
- The OpenSCAD adjustable parameter section includes independently tunable USB HAT front, left-side, and right-side USB cutout positions.
- The bottom tray cutouts expose RJ45 plus one USB on the front edge.
- The bottom tray cutouts expose one USB on the left long side and one USB on the right long side.
- The electronics preview, when enabled, shows the same corrected connector topology.
- The front IR LED aperture does not overlap the RJ45 or front USB openings.
- README component assumptions and manual inspection checklist mention the corrected WS-16595 USB HAT connector layout.

### Validation Delta

- A code review is sufficient repository validation unless the user explicitly requests QA or unit tests.
- If OpenSCAD is available during implementation, render checks may still be run for syntax and geometry sanity, but this iteration does not require unit tests.
- Manual/code-review inspection must specifically check the WS-16595 connector topology:
  - RJ45 plus one USB on the front edge,
  - one USB on the left long side,
  - one USB on the right long side,
  - no grouped three-USB cutout on a single face.

## Iteration: Measured USB Bridge And Stack Clearances

Status: Approved

### Requested Change

Update the default Pi Zero enclosure dimensions to reflect measured hardware clearances for the Micro USB bridge adapter between the Raspberry Pi Zero and Waveshare USB Ethernet HUB HAT, and the measured vertical board gaps in the assembled stack.

### Behavior Changed

- The Micro USB bridge adapter between the Pi Zero USB port and the USB HAT bottom interface must be represented with a measured vertical clearance height of 12 mm.
- The Micro USB bridge adapter clearance width must default to 8.5 mm.
- The vertical distance between the Raspberry Pi Zero board and the USB bridge adapter or USB HAT board must default to 11.20 mm.
- The vertical distance between the USB bridge adapter or USB HAT board and the Grove HAT must default to 10.5 mm.
- The Pi-to-USB-HAT vertical spacing must be an explicit adjustable parameter instead of a hard-coded derived value.
- README documentation must describe the measured Micro USB bridge adapter clearance and measured board-to-board gaps as defaults that should still be verified against the user's hardware.

### Behavior Preserved

- The enclosure remains openable through the screw-fastened top cover for electronics installation and service.
- The existing WS-16595 connector topology remains unchanged: RJ45 plus one USB on the front edge, one USB on each long side.
- The Grove sockets remain enclosed.
- The IR emitter remains internal with only the IR LED exposed externally.
- The design remains one editable OpenSCAD 2021.01-compatible `.scad` file with no external library dependency.
- Generated STL, STEP, 3MF, or other mesh exports remain out of scope.

### Out Of Scope For This Iteration

- Electrical validation of the Micro USB bridge adapter.
- Vendor-accurate cosmetic modeling of the Micro USB bridge adapter.
- Changes to Pi port, USB HAT port, Grove HAT socket, IR emitter, GPIO hatch, screw boss, or printable layout behavior except where stack height changes require preserving existing clearance.
- Generated STL, STEP, 3MF, or other mesh exports.

### Acceptance Criteria

- The OpenSCAD adjustable parameter section includes an explicit Pi-to-USB-HAT stack clearance parameter defaulting to 11.20 mm.
- The existing Grove HAT stack clearance defaults to 10.5 mm.
- The USB HAT bottom bridge clearance defaults to 8.5 mm wide and 12 mm high.
- Derived board z positions use the explicit stack clearance parameters rather than a hard-coded Pi-to-USB-HAT gap.
- The top cover, tray wall height, electronics preview, and port cutout z positions continue to derive from the updated stack dimensions.
- README component assumptions or tuning guidance document the measured Micro USB bridge adapter and stack gap defaults.

### Validation Delta

- A code review is sufficient repository validation unless the user explicitly requests QA or unit tests.
- If OpenSCAD is available during implementation, render checks may still be run for syntax and geometry sanity.
- Manual/code-review inspection must specifically check:
  - bridge clearance defaults are 8.5 mm wide and 12 mm high,
  - Pi-to-USB-HAT stack spacing is parameterized and defaults to 11.20 mm,
  - USB-HAT-to-Grove-HAT stack spacing defaults to 10.5 mm,
  - derived tray height and port preview/cutout z positions respond to the updated stack values.
