# SPEC: Pi Zero USB Grove IR Enclosure

Status: Approved

## Purpose

Create an editable OpenSCAD design for a printable enclosed case that houses a Raspberry Pi Zero v1.3 stacked with a Waveshare ETH/USB HUB HAT and a Seeed Grove Base Hat for Raspberry Pi Zero, plus a separate attachable Grove Infrared Emitter enclosure.

The case will keep the board stack fixed, expose required external connectors, route the Grove cable from the main enclosure into the attachable IR emitter enclosure, allow the top to be removed for future Grove modules or additional HAT work, include top ventilation/access holes, and remain practical to print on a Bambu Lab P2S.

## Problem Statement

The repository has reusable reference models for the Pi Zero, Waveshare ETH/USB HUB HAT, Seeed Grove Base Hat, and Grove Infrared Emitter, but no current source file for a complete case around the user's stack. The README references `designs/pi_zero_usb_grove_ir_enclosure.scad`, but that file is not present in the current repository state and there is no matching approved spec artifact.

The requested assembly needs a deterministic printable main enclosure that provides port access, a Grove cable exit path, anti-slide features, removable upper access, top ventilation/access holes, and enough internal height for the approximately 35 mm board stack plus Grove connector/cable clearance. It also needs a deterministic attachable IR emitter enclosure that secures the Grove IR emitter PCB outside the main enclosure while allowing the Grove cable to pass between both enclosures.

## Scope

- Add or update one editable OpenSCAD source file for the Pi Zero USB Grove IR enclosure.
- Use existing local reference models instead of duplicating board and module models:
  - `designs/pi_zero.scad`,
  - `designs/waveshare_eth_usb_hub_hat.scad`,
  - `designs/seeed_grove_base_hat_zero.scad`,
  - `designs/grove_infrared_emitter.scad`.
- Model a printable bottom tray with:
  - side walls,
  - bottom floor,
  - Pi Zero mounting standoffs aligned to the Pi Zero mounting holes,
  - Grove cable exit opening toward the external IR emitter enclosure,
  - anti-slide feet or pad recesses,
  - detachable cover receiver features for the removable top cover.
- Model a removable upper case section or top cover that can be removed to add Grove elements or inspect/add an additional HAT.
- Model top-cover holes as an adjustable ventilation/access pattern.
- Provide access openings for:
  - Raspberry Pi Zero microSD,
  - Raspberry Pi Zero mini-HDMI,
  - the externally used Raspberry Pi Zero Micro USB port,
  - Raspberry Pi Zero camera connector access,
  - Waveshare HAT RJ45,
  - Waveshare HAT front USB-A,
  - Waveshare HAT left and right USB-A.
- Keep the wireless USB dongle outside the case by allowing it to remain connected through a Waveshare HAT USB-A opening.
- Provide an attachable external IR emitter enclosure with:
  - a Grove IR emitter PCB mounting location,
  - a serviceable printed retention method for the Grove IR emitter PCB,
  - an IR LED aperture that exposes the LED path outward while keeping the PCB protected,
  - a cable entry opening aligned with the main enclosure cable exit,
  - a mechanical attachment interface to the main enclosure.
- Keep the Grove cable path internal to the main enclosure until it exits through the dedicated cable opening, then routes directly into the external IR emitter enclosure through its cable entry.
- Include adjustable clearance parameters for stack height, port openings, wall thickness, tolerances, fasteners, IR emitter placement, Grove cable channel, and anti-slide features.
- Include independent adjustable board-to-board spacing parameters for:
  - Pi Zero PCB bottom to Waveshare ETH/USB HUB HAT PCB bottom,
  - Waveshare ETH/USB HUB HAT PCB bottom to Seeed Grove Base Hat PCB bottom.
- Derive board preview Z positions, Waveshare port opening Z positions, Grove Hat connector/cable clearance Z positions, and case height from the board-to-board spacing parameters so the electronics preview and case openings remain aligned when the stack spacing is tuned.
- Mount the Grove IR emitter board at an adjustable position inside the external IR emitter enclosure, and derive its pod cutouts and mounting holes from the same IR emitter placement values.
- Include render modes for:
  - full assembly preview,
  - bottom tray printable part,
  - removable top cover printable part,
  - IR emitter pod printable part,
  - printable layout,
  - electronics-only fit reference if useful.
- Update `README.md` to document the new design, parameters, render modes, print notes, and manual inspection checklist.

## Out Of Scope

- Generated STL, STEP, 3MF, OFF, or other mesh/export files.
- Vendor-certified cosmetic board, connector, cable, or dongle geometry.
- Electrical validation, IR protocol validation, Raspberry Pi software configuration, or Grove signal testing.
- A sealed waterproof or dustproof enclosure.
- Active cooling, fan mounts, or thermal performance guarantees.
- A wireless USB dongle model, beyond clearance and port access for the dongle to plug in externally.
- A precise enclosure fit before the user physically measures and test-fits the hardware stack.
- External OpenSCAD libraries.
- Required generated mesh/export deliverables; optional OpenSCAD inspection artifacts may be generated under `/tmp` and must not be committed.

## Definitions

- Board stack: Raspberry Pi Zero v1.3 on the bottom, Waveshare ETH/USB HUB HAT above it, and Seeed Grove Base Hat for Raspberry Pi Zero above the Waveshare HAT.
- Removable upper case section: the top cover or upper shell that can be removed without removing the Pi Zero from the bottom tray.
- Port access opening: an enclosure cutout sized with adjustable clearance around a connector so the connector remains externally usable.
- IR emitter pod: the separate printable enclosure that mounts the Grove Infrared Emitter PCB outside the main enclosure and attaches to the main enclosure.
- Pod attachment interface: printed tabs, bosses, slots, or screw features that mechanically attach the IR emitter pod to the main enclosure.
- IR aperture: the pod opening through which the Grove IR emitter LED protrudes or transmits outward.
- Main-to-pod Grove cable path: printed clearance volume from the Grove Base Hat connector area to a main enclosure cable exit, plus aligned cable-entry clearance in the IR emitter pod.
- Top ventilation/access holes: a configurable hole pattern in the top cover for passive airflow and access/inspection, not a mounting pattern for the board stack.
- Anti-slide feature: printed recesses or feet features intended to accept rubber pads or increase contact stability on a flat surface.
- Reference model: an editable OpenSCAD approximation for fit, clearance, and planning, not a certified vendor mechanical model.

## Inputs And Constraints

- The OpenSCAD source must target OpenSCAD 2021.01-compatible syntax.
- The OpenSCAD source must not require external libraries.
- Generated mesh exports must not be added to source control.
- The default board stack must be Raspberry Pi Zero v1.3 + Waveshare ETH/USB HUB HAT + Seeed Grove Base Hat for Raspberry Pi Zero.
- The board stack vertical order must be:
  1. Raspberry Pi Zero v1.3,
  2. Waveshare ETH/USB HUB HAT,
  3. Seeed Grove Base Hat for Raspberry Pi Zero.
- The default board footprint planning size must use the existing 65.0 mm x 30.0 mm Pi Zero/HAT reference dimensions.
- The user-provided total height from the Pi Zero to the upper part of the Grove HAT plus Grove male connector is approximately 35.0 mm, including existing spacers between HATs.
- The enclosure must add adjustable upward headroom above the 35.0 mm stack for the Grove cable, Grove connector handling clearance, and IR emitter placement. The default extra upward headroom must be a conservative adjustable value, initially 8.0 mm.
- The existing enclosure source already exposes board spacing parameters named `pi_zero_to_waveshare_hat_z_offset_mm` and `waveshare_to_grove_hat_z_offset_mm`, currently defaulting to 11.2 mm and 10.8 mm respectively. The implementation must preserve independent adjustment of these distances or replace them with equivalently clear parameters.
- Changing either board spacing parameter must move the corresponding board reference model and all dependent case openings or cable guides for that board tier.
- Waveshare ETH/USB HUB HAT port cutouts must be positioned relative to the Waveshare HAT Z position, not as unrelated fixed absolute Z coordinates.
- Grove Base Hat connector/cable clearance guides must be positioned relative to the Grove Base Hat Z position, not as unrelated fixed absolute Z coordinates.
- The enclosure must expose all Pi Zero and Waveshare HAT ports listed in Scope while preserving enough surrounding material for printable wall strength.
- The wireless USB dongle must be treated as external; the case must not try to enclose it.
- The IR emitter PCB must be outside the main enclosure and inside a separate attachable IR emitter pod.
- Only the IR LED path and required Grove cable passage should be exposed outside the printed enclosures by default.
- The IR emitter pod mount must include an adjustable printed PCB retention method based on the existing Grove IR emitter mounting-hole reference and board outline assumptions.
- The IR LED aperture must be adjustable for LED diameter, wall clearance, and LED protrusion or flush alignment.
- The Grove cable must exit the main enclosure only through the dedicated cable exit and enter the IR emitter pod through the dedicated cable entry.
- The default cable route must not require a loose external loop beyond the direct bridge between main enclosure and IR emitter pod.
- The Grove IR emitter board must be mounted inside the external pod, with enough adjustable clearance for the Grove plug and cable bend between the HAT socket, main cable exit, pod cable entry, and IR emitter connector.
- The top cover must be removable independently from the Pi Zero mounting screws.
- The bottom tray must provide a way to screw the Pi Zero and its attached HAT stack into place through the Pi Zero mounting-hole pattern.
- The default bottom tray must use four Pi Zero stack mounting holes because the Pi Zero/HAT mounting-hole pattern has four mounting points. These are not optional anti-slide holes.
- Top-cover attachment features and pod attachment holes or bosses must remain visually and functionally separate from the Pi Zero stack mounting holes.
- The case must provide anti-slide capability using either printed rubber-foot recesses or printed feet with adjustable dimensions. The default must use rubber-foot recesses because they are more reliable for non-slip behavior on common surfaces.
- Printable wall thicknesses, screw bosses, standoffs, and clearances must be adjustable and plausible for Bambu Lab P2S printing.
- All linear dimension variables must use `_mm`; all angle variables must use `_deg`.
- User-adjustable values must not be redefined inside modules.
- Major printable parts and repeated helper geometry must use named modules.

## Deterministic Behavior

- `render_mode = "assembly"` displays the complete case with optional electronics/reference stack.
- `render_mode = "bottom_tray"` displays only the printable bottom tray.
- `render_mode = "top_cover"` displays only the removable printable upper case section.
- `render_mode = "ir_pod"` displays only the printable external IR emitter enclosure.
- `render_mode = "printable_layout"` displays printable parts arranged side-by-side for inspection and export.
- `render_mode = "electronics"` displays the imported electronics/reference stack and IR emitter placement without printable case geometry.
- `show_electronics` controls the Pi Zero, HAT, and IR emitter reference models without hiding printable case geometry.
- `show_cutout_guides` controls visible port, IR aperture, cable, and clearance guides without changing the printable solids.
- The bottom tray must contain four Pi Zero stack standoffs aligned to the Pi Zero mounting-hole pattern.
- The Pi Zero stack standoffs must include adjustable screw clearance holes or pilot holes compatible with M2.5-class mounting hardware by default.
- The top cover must attach to the tray with a detachable screwless interface by default, without cover screws. Later approved iterations may use clips, pins, sockets, or equivalent positive-retention geometry.
- The top cover must include an adjustable ventilation/access hole pattern. The default pattern must be a simple symmetric grid of circular holes over the board-stack area, with adjustable count, diameter, spacing, and position, and must avoid cover attachment features and high-risk edge weakening.
- The upper cover removal path must not require disconnecting the wireless USB dongle, IR emitter LED, or Grove cable, aside from normal clearance around the removable part.
- The case must include port cutouts for the Pi Zero microSD, mini-HDMI, the externally used Pi Zero Micro USB port, camera connector access, Waveshare RJ45, Waveshare front USB-A, and both Waveshare side USB-A connectors.
- Port cutout dimensions and positions must be adjustable independently where connector placement may need physical calibration.
- Board-tier port cutout Z positions must be derived from board-tier Z positions plus adjustable per-port local offsets. In particular:
  - Pi Zero port cutout centers must derive from the Pi Zero PCB bottom Z position,
  - Waveshare port cutout centers must derive from the Waveshare HAT PCB bottom Z position,
  - any future Grove Hat connector access or cable guides must derive from the Grove HAT PCB bottom Z position.
- Waveshare USB-A cutouts must allow an external wireless USB dongle to remain plugged into at least one accessible USB-A port.
- The IR emitter PCB must mount on bosses or posts at a fixed adjustable location inside the external IR emitter pod, with its LED aligned to the pod IR aperture.
- The IR emitter PCB retention geometry must default to the imported Grove IR emitter reference mounting-hole and board-outline assumptions and remain adjustable.
- The IR emitter retention features, IR emitter reference model, IR LED aperture, pod cable entry, and any IR-specific pod cutouts must all derive from the same adjustable IR emitter placement values.
- The IR aperture must expose the LED path while keeping the PCB body and Grove connector inside the IR emitter pod.
- The IR aperture must remain a true pass-through cut in the printable pod geometry even when electronics/reference previews are hidden or removed from the scene.
- The main-to-pod Grove cable path must provide adjustable clearance from the selected Grove Base Hat connector area to the main enclosure exit and from the pod entry to the IR emitter board, including Grove connector/plug clearance at both ends.
- The IR emitter pod must attach to the outside of the main enclosure by default using a top-cover-mounted positive-retention interface with adjustable tab, rail, or latch dimensions and side placement.
- The default pod attachment side must be the same front side used for the IR LED direction unless overridden by adjustable placement parameters.
- The default enclosure internal height must be derived from the 35.0 mm measured stack height plus the extra upward headroom parameter.
- The derived enclosure height must remain at least high enough for:
  - Pi Zero standoff height,
  - the Grove HAT PCB bottom Z position,
  - Grove HAT top-side connector/cable clearance,
  - internal Grove connector/cable exit clearance,
  - extra upward headroom.
- Anti-slide recesses or feet must be present on the bottom exterior, with adjustable count, diameter/size, depth, and placement.
- Printable parts must be separable without requiring generated mesh files in source control.

## Assumptions

- The user's "pizero 1.3" means Raspberry Pi Zero v1.3 with manually inserted GPIO headers or equivalent stack headers.
- The user's "waveshare usb hat" means the existing repository `designs/waveshare_eth_usb_hub_hat.scad` reference for the Waveshare ETH/USB HUB HAT.
- The user's "groove base hat" and "groove infrared emitter" mean Seeed Grove Base Hat for Raspberry Pi Zero and Seeed Grove Infrared Emitter.
- The requested deliverable is an editable `.scad` source and README documentation, not committed generated print exports.
- The Grove Base Hat's exact connector used for the IR emitter is not specified. The enclosure will provide a cable clearance route from the Grove connector area to the main enclosure exit rather than requiring a single hard-coded connector to be the only usable option.
- The default Grove IR emitter pod placement will use the existing Grove connector coordinate assumptions as a planning reference and remain adjustable after physical measurement.
- Rubber-foot recesses are the default anti-slide method; actual rubber feet or pads are external purchased parts and are not modeled as required printed artifacts.
- A screwless detachable removable top cover is required as the default removable upper section; cover screws are out of scope for the main top cover.
- A top-cover-mounted positive-retention pod attachment is acceptable as the default external IR emitter pod attachment because it keeps the pod associated with the removable upper section as requested by the user.
- The first implementation may use simplified rectangular connector and cable cutout volumes while preserving adjustable positions and clearances.

## Impact And Regression Considerations

- The enclosure source must not change behavior of existing reference models.
- Existing reference model files should be imported with `use` and called from the enclosure source rather than copied or redefined.
- README currently documents a missing `designs/pi_zero_usb_grove_ir_enclosure.scad`; implementation must either align the new design with that documented filename or update README consistently.
- README validation examples must remain optional for users with OpenSCAD installed and must not instruct agents to run OpenSCAD locally as required validation.
- The design must remain compatible with Bambu Lab P2S and AMS 2 Pro print guidance by avoiding unsupported geometry assumptions and keeping generated meshes out of source control.
- Existing render modes and user-facing behavior must be preserved while correcting board spacing, cutout alignment, and Grove IR emitter placement behavior.

## Iteration: Adjustable Stack Spacing And Grove IR Placement

Requested changes:

- Confirm whether board spacing is already adjustable, and document the values users should tune.
- Fix the height between the Waveshare ETH/USB HUB HAT and the Grove Base Hat so their reference models no longer collide in the enclosure drawing.
- Ensure stack height adjustments also move dependent case holes and cutouts.
- Reposition the Grove IR emitter board so its cable route is associated with the Grove Base Hat connector/cable area instead of an unrelated tray location.
- Account for Grove cable and plug clearance between the Grove Base Hat and the Grove IR emitter.
- Keep or add main enclosure and pod holes/cutouts that follow the corrected Grove IR emitter placement.
- Provide mounting holes for the Grove IR emitter board.

Updated deterministic behavior:

- The design must expose independent, user-adjustable board spacing values for Pi Zero-to-Waveshare and Waveshare-to-Grove distances.
- Current implementation defaults, if retained, are:
  - `pi_zero_to_waveshare_hat_z_offset_mm = 11.2`,
  - `waveshare_to_grove_hat_z_offset_mm = 10.8`.
- The implementation must use the 10.8 mm default Waveshare-to-Grove spacing requested during implementation, keep it adjustable, and document that users should increase it if physical measurement or preview inspection shows collision in `assembly` or `electronics` render modes.
- The implementation must derive board-tier Z positions from those spacing values and then derive related case openings from the board-tier Z positions. Fixed absolute Z values for Waveshare port openings or Grove cable guides are not acceptable when they should follow board spacing.
- The Grove IR emitter pod placement must be adjustable by X/Y/Z and rotation relative to the main enclosure, with a default attachment on the same front side as the IR LED direction.
- The Grove IR emitter board placement inside the pod must be adjustable by X/Y/Z and rotation, but its default must fit the PCB, Grove connector, cable bend, and IR LED aperture within the pod.
- The Grove IR emitter PCB reference model, pod mounting bosses, emitter mounting holes, LED aperture, pod cable entry, and cable path/cutout guides must all use the same derived IR emitter pod placement so changing the pod or emitter position updates the printed features consistently.
- The IR emitter board must have screw/pilot holes in the pod mount using adjustable Grove 20 mm-class mounting-hole planning assumptions.
- README documentation must state the board spacing parameters and explain that adjusting them moves the electronics preview and dependent case openings.

## Iteration: External Attachable IR Emitter Pod And Top Holes

Requested changes:

- Move the Grove Infrared Emitter outside of the main internal enclosure.
- Add a separate IR emitter enclosure that attaches to the main enclosure.
- Provide a Grove cable path out of the main enclosure and into the IR emitter pod.
- Add holes to the top of the main enclosure.
- Clarify why the printable bottom tray shows four screw holes.

Updated deterministic behavior:

- The main enclosure must no longer mount the Grove Infrared Emitter PCB internally.
- The Grove Infrared Emitter PCB must mount inside a separate printable pod that is attachable to the main enclosure.
- The IR emitter pod must be included in `assembly`, `ir_pod`, `printable_layout`, and `electronics`/reference behavior as applicable.
- `render_mode = "ir_pod"` must show only the printable IR emitter pod.
- `render_mode = "printable_layout"` must arrange the bottom tray, top cover, and IR emitter pod as separate printable parts.
- The pod must attach to the main enclosure using an adjustable screw-fastened tab-and-boss interface by default.
- The pod attachment interface must be independent from Pi Zero stack mounting holes and top-cover clip/catch features.
- The main enclosure must include a dedicated Grove cable exit opening, and the IR emitter pod must include a matching cable entry opening.
- The Grove cable route must derive from the selected Grove Base Hat connector area, pass through the main enclosure cable exit, and enter the IR emitter pod through the pod cable entry.
- Cable exit/entry dimensions, positions, and clearances must be adjustable.
- The IR emitter pod must contain adjustable mounting bosses or posts for the Grove IR emitter PCB using the existing Grove 20 mm-class mounting-hole planning assumptions.
- The IR emitter reference model, pod mount bosses, pod mounting holes, pod cable entry, IR LED aperture, and LED guide must derive from the same adjustable IR emitter pod pose.
- The IR LED aperture must be on the external face of the pod by default and must expose the LED path while keeping the PCB body and Grove connector inside the pod.
- The top cover must include an adjustable circular ventilation/access hole pattern. The default must be a symmetric grid over the board-stack area and must avoid clip/catch features.
- The existing four Pi Zero stack mounting holes in the bottom tray are intentional and must be documented as the four board-stack fastener holes matching the Pi Zero/HAT mounting pattern.
- Top-cover clip/catch features and IR pod attachment holes must be named, positioned, and documented so they are distinguishable from the four Pi Zero stack mounting holes.

## Iteration: Printability And Attachment Hardening

Requested changes:

- Increase the amount of top ventilation/access holes on the removable upper section.
- Fix the removable upper section attachment so the upper tray and bottom tray connect more securely.
- Eliminate any upper-tray connector features that appear visually or mechanically detached from the upper tray body.
- Revise the IR pod attachment method because the current upper-tray-mounted attachment approach is not trusted for functional printing or repeated use.
- Prioritize printability and functional assembly confidence before the user prints on a Bambu printer.
- Remove the external case opening for the Pi Zero USB port that is internally occupied by the adapter connection to the ETH/USB HAT.

Updated deterministic behavior:

- The top cover ventilation/access pattern must remain a symmetric circular grid, but the default density must increase from the current sparse pattern to a denser default layout sized to preserve printable roof strength and edge margins.
- The recommended default top-hole pattern for this iteration is `5 x 4` circular holes unless implementation review finds that edge clearance requires `4 x 4` to preserve wall strength. The implemented default must be documented in `README.md`.
- The top cover must use a mechanically positive tray attachment that combines:
  - a continuous alignment lip around the tray opening,
  - clip features that are fully merged into the cover shell rather than appearing as detached or floating geometry,
  - tray-side receiver or latch geometry that is fully merged into tray walls or tray structure rather than appearing as isolated features.

## Iteration: Pod Serviceability And Top-Cover Ownership

Requested changes:

- The Grove IR emitter PCB mounting holes inside the pod should not require tool access that is impractical in the available pod space.
- The IR pod attachment mechanism should belong to `top_cover`, not `bottom_tray`.

Updated deterministic behavior:

- The Grove IR emitter PCB must no longer require internal screw-driving access inside the pod as the default mounting method.
- The pod must retain the Grove IR emitter PCB using a printed top-load retention method by default.
- The default printed PCB retention method must use adjustable locating/support features plus an adjustable snap bar, clip, or equivalent printed retainer that can be installed and removed without needing a screwdriver inside the pod.
- The PCB retention geometry must keep the board protected, keep the Grove connector and cable area usable, and keep the LED aligned with the IR aperture.
- The IR emitter PCB reference model, printed PCB retention geometry, pod cable entry, IR LED aperture, and related pod cutouts must continue to derive from the same adjustable emitter pose so they stay aligned when the emitter position changes.
- The IR pod must attach to geometry owned by `top_cover` by default.
- The `top_cover` must remain removable without cover screws, while still carrying the pod attachment interface as part of the upper removable assembly.
- The pod attachment interface on `top_cover` must remain visually and functionally distinct from the top-cover clip/catch features that connect the cover to `bottom_tray`.
- The pod attachment interface must remain visually and functionally distinct from the four Pi Zero stack mounting holes in `bottom_tray`.
- The main enclosure cable exit and pod cable entry must remain aligned with the selected Grove Base Hat connector area and the pod-mounted emitter board after the pod attachment ownership moves back to `top_cover`.
- The IR LED aperture in the printable pod must remain visibly open through the pod wall in `ir_pod`, `assembly`, and `printable_layout` render modes, regardless of `show_electronics`.
- `render_mode = "top_cover"` and `render_mode = "printable_layout"` must continue to show the top cover as a printable part that includes the pod attachment interface.
- README documentation must state that the pod attaches to `top_cover` and that the IR emitter PCB is retained by a printed serviceable retention feature rather than internal mounting screws.
- Cover retention must not rely on only a small local contact patch between the cover and tray. The cover-to-tray interface must provide support on both long sides and must remain removable without using screws.
- The removable top cover must remain independently removable from the Pi Zero stack fasteners. Pod removal may occur with the top-cover assembly because the approved pod attachment is cover-owned.
- The default IR pod attachment for this iteration must use a mechanically supported printed interface with positive retention suitable for repeated assembly and removal, with the supporting geometry visibly continuous with the `top_cover` body rather than reading as a floating appendage.
- If a slide-and-lock pod attachment is retained, the locking rails, stops, and retention features must be cover-mounted, not tray-mounted, and must remain printable without unsupported floating geometry in the printable orientation.
- The main enclosure cable exit and pod cable entry must remain aligned after the pod attachment method is revised, and top-cover removal must preserve normal pod/cable clearance without requiring board-stack disassembly.
- The implementation must remove or refactor any geometry that visually suggests the pod connectors or top-cover connectors are not actually attached to their parent printable part.
- The Pi Zero external port opening set must exclude the Micro USB port that is consumed internally by the Pi Zero-to-Waveshare adapter connection. Only externally usable Pi Zero ports should remain open by default.
- The remaining Pi Zero Micro USB opening must stay externally accessible for the port that is still intended for external use.

Impact and regression considerations for this iteration:

- The revised attachment geometry must preserve existing required port cutouts, stack standoffs, and render modes.
- Keeping pod retention on the cover must not introduce a requirement to remove the Pi Zero stack in order to mount or unmount the pod.
- Increasing top-hole density must not cut into clip roots, tray receivers, pod attachment structure, or edge wall thickness needed for printability.
- Printable layout orientation must remain plausible for Bambu Lab P2S printing without support-heavy assumptions for the default parts.
- Removing the unused external Pi Zero USB opening must not block the still-required external Pi Zero power/data access that remains in use outside the enclosure.

## Iteration: Functional Printable Layout And IR Aperture Correction

Requested changes:

- Fix the removable top-cover connection geometry so the cover-to-tray attachment reads as and behaves like a functional printable interface rather than small features hanging in the air.
- Fix the IR pod attachment geometry so the top-cover-owned pod interface is visibly rooted into the top cover with enough printable support to look and behave like one object.
- Clarify the extra loose IR pod printable part that currently appears in the printable layout.
- Make the IR LED hole in the pod a clear pass-through opening in the final printable pod wall.
- Make the IR pod easy to mount onto the top cover without screws.
- Remove the need to screw the Grove IR emitter PCB into the pod; the PCB should load by sliding in with its Grove cable attached.

Updated deterministic behavior:

- `render_mode = "top_cover"` and `render_mode = "printable_layout"` must show cover attachment features that are visibly continuous with the top-cover shell by code review and supported by more than a token overlap into the shell.
- The top-cover clip tabs, hooks, rails, latches, or equivalent interface features must have an explicit structural root into the cover body using merged length, sidewall extension, gusseting, or another visibly load-bearing transition rather than appearing as isolated appendages.
- The tray-side mating geometry for the removable top cover must likewise be visibly continuous with tray walls or tray structure and must present a plausible engagement path for repeated assembly and removal.
- The approved cover-to-tray connection must remain screwless, removable, and independent from the four Pi Zero stack mounting holes.
- The top-cover-owned IR pod attachment must remain distinct from the cover-to-tray clip features, but its rails, tabs, hooks, or other retention geometry must be visibly rooted into the top cover with enough merged support to avoid reading as floating geometry in printable views.
- The top-cover-owned IR pod attachment must be tool-free by default. The pod must mount to the top cover using a slide-in or clip-in interface with positive retention and a clear insertion/removal direction suitable for repeated use.
- The pod-to-cover interface must not require screws, captive nuts, or screwdriver access for normal assembly.
- The IR pod printable geometry must remain a functional enclosure body even when the detachable PCB retainer is rendered separately.
- The Grove IR emitter PCB must not require screw fastening inside the pod. The default board retention method must be a tool-free slide-in loading path that allows the PCB to be inserted with the Grove cable already connected.
- The pod interior, cable entry, and PCB retention geometry must preserve enough clearance for the connected Grove cable and a plausible insertion path without forcing a sharp bend immediately at the connector.
- The approved board-retention pattern may use printed rails, slots, stops, spring tabs, or a snap retainer, but it must not depend on internal screw access.
- Any additional IR pod printable element must serve that tool-free retention approach explicitly. If a separate retainer part remains, `render_mode = "printable_layout"` must place it intentionally relative to the pod and the documentation must describe its purpose and installation.
- The IR LED aperture must be a definite through-hole in the pod's external face, not a blind cavity or guide-only subtraction, and it must remain visibly open in `ir_pod`, `assembly`, and `printable_layout` render modes regardless of whether electronics previews are shown.
- The IR LED aperture subtraction must extend fully through the pod wall thickness with enough overlap margin that minor parameter tuning does not accidentally leave a skin on the outer face.

Impact and regression considerations for this iteration:

- Strengthening the removable top-cover and pod-attachment geometry must not block the existing port cutouts, cable exit path, vent-hole pattern, or top-cover removability.
- The tool-free PCB insertion path must not create a cable pinch point at the pod entry or require disconnecting the Grove cable for normal installation.
- Making the IR LED hole a guaranteed pass-through must not expose the Grove connector or other pod internals beyond the approved LED path.

## Iteration: Short-End Cover Retention

Requested changes:

- Move the bottom-tray to top-cover connector/clip interface from the two long sides of the main enclosure to the two short ends.
- Properly adjust the top cover so the short-end retention is integrated into the removable cover geometry rather than appearing as relocated loose tabs.
- Make the separate IR pod PCB retainer read as a clearly separate printable part in `printable_layout`, not as a piece protruding from or fused to the IR pod.
- Make the IR pod PCB retainer installation path visually understandable from the modeled geometry and README documentation.

Updated deterministic behavior:

- The cover-to-tray attachment interface must use the two short ends of the enclosure by default, not the two long sides.
- The top cover must include short-end clip tabs, hooks, latch rails, or equivalent screwless positive-retention features rooted into the top-cover shell.
- The bottom tray must include matching short-end receiver or catch geometry rooted into the tray end walls or tray structure.
- The short-end cover retention features must remain visibly continuous with their parent solids by code review and must not appear suspended, air-gapped, or attached only by a token overlap in `top_cover`, `bottom_tray`, `assembly`, or `printable_layout` modes.
- The short-end cover retention interface must remain independently removable without cover screws and must remain independent from the Pi Zero stack mounting fasteners.
- The short-end cover retention interface must remain visually and functionally distinct from the top-cover-owned IR pod attachment interface.
- Moving the cover retention to the short ends must preserve the existing port cutouts, Grove cable exit, IR pod attachment, top ventilation/access holes, cover alignment lip, and case removability.
- The top ventilation/access hole pattern must keep adequate clearance from the short-end clip roots and tray receivers.
- The IR pod PCB retainer must be rendered in `printable_layout` with enough explicit separation from the IR pod body that it reads as a distinct printable part.
- The IR pod PCB retainer must not appear to protrude from, intersect with, or be fused into the IR pod body in `printable_layout`.
- The IR pod PCB retainer geometry must include or align with a visible service opening, slot, ledge, snap feature, or equivalent retention interface on the IR pod so its installation path is understandable by code review and visual inspection.
- The modeled retention interface must make clear that the retainer belongs to the IR pod PCB retention path, not the top-cover attachment path.
- The top-cover attachment path and the IR pod PCB retainer path must remain separate mechanisms:
  - the IR pod mounts to the top cover through the pod attachment interface,
  - the IR emitter PCB is retained inside the IR pod by the removable retainer.
- README documentation and manual inspection guidance must describe the short-end cover retention placement.
- README documentation and manual inspection guidance must describe how the IR pod PCB retainer installs and how it differs from the pod-to-top-cover attachment.

Impact and regression considerations for this iteration:

- Short-end retention must not block the Pi Zero microSD/camera end cutouts or weaken the tray end walls around those openings.
- Short-end clip placement must preserve enough wall material near corners and port cutouts for Bambu P2S-friendly printability.
- Because the IR pod attachment remains top-cover-owned and front-side by default, short-end cover retention must stay separate from the pod slide/clip interface and must not interfere with pod insertion/removal.
- Retainer placement changes in `printable_layout` must not alter the installed retainer pose used in `assembly`.
- Retainer interface changes must not require screwdriver access inside the pod or require disconnecting the Grove cable for normal PCB installation.

## Iteration: Waveshare Connector Spacing Refresh

Requested changes:

- Update the enclosure for the revised Waveshare ETH/USB HUB HAT component placement.
- Use `designs/waveshare_eth_usb_hub_hat.scad` in this repository as the source of truth for the correct dimensions and spacing between Waveshare components.

Updated deterministic behavior:

- The enclosure's Waveshare port cutout defaults must be refreshed from the current local Waveshare reference model defaults, not from stale enclosure-only measurements.
- The Waveshare RJ45 cutout center X must align with the current `hat_rj45_center_x_mm` derived value from `designs/waveshare_eth_usb_hub_hat.scad`.
- The Waveshare front USB-A cutout center X must align with the Waveshare reference's derived front USB-A component center:
  - `hat_rj45_center_x_mm + hat_rj45_width_x_mm / 2 + hat_front_rj45_to_usb_a_margin_mm + hat_front_usb_a_width_x_mm / 2`,
  - using the current reference defaults at the time of this iteration.
- The enclosure must not keep stale RJ45 or front USB-A X defaults that conflict with `designs/waveshare_eth_usb_hub_hat.scad`.
- The Waveshare front USB-A cutout size must continue to cover the current Waveshare reference front USB-A component footprint plus the enclosure's existing cutout clearance behavior.
- The Waveshare side USB-A cutout defaults must continue to match the current Waveshare reference side USB-A orientation:
  - component footprint `5.7 mm` along X and `13.2 mm` along Y,
  - center Y aligned to `0.0`.
- Side USB-A cutout X centers may remain enclosure-wall cutout centers rather than component-body centers, because they are openings through the printed side walls; however, their default sizes and Y placement must continue to match the current Waveshare reference component spacing.
- README documentation must state that the enclosure Waveshare cutout defaults are based on the local Waveshare reference file, including the current derived RJ45 and front USB-A X centers.

Impact and regression considerations for this iteration:

- The change intentionally moves the front connector enclosure cutouts as needed to match the current Waveshare reference model.
- The RJ45 opening, side USB-A openings, stack Z derivation, Pi Zero openings, Grove cable path, top cover, IR pod, and anti-slide behavior should remain unchanged unless directly required to keep Waveshare cutout documentation consistent.
- Because the side USB-A cutouts are printed side-wall openings, matching the Waveshare reference does not require moving their X centers onto the component body centers.

## Iteration: Updated Waveshare Front Connector Source Alignment

Requested changes:

- The Waveshare ETH/USB HUB HAT reference model has updated front RJ45/Ethernet and front USB-A placement.
- Align the Pi Zero USB Grove IR enclosure front RJ45/Ethernet and front USB-A holes to the updated `designs/waveshare_eth_usb_hub_hat.scad`.
- Keep the enclosure's existing clearance/error-margin behavior around those openings.

Updated deterministic behavior:

- `designs/waveshare_eth_usb_hub_hat.scad` is the source of truth for the enclosure defaults for front RJ45/Ethernet and front USB-A placement.
- The enclosure must update its Waveshare RJ45 cutout center X from the current reference value:
  - `hat_rj45_center_x_mm = -hat_board_half_length_mm + hat_rj45_left_margin_x_mm + hat_rj45_width_x_mm / 2`.
- With the current reference defaults, the expected RJ45 cutout center X is `-7.76 mm`:
  - `-32.5 + 16.4 + 16.68 / 2 = -7.76`.
- The enclosure must update its Waveshare front USB-A cutout center X from the current reference value:
  - `hat_front_usb_a_center_x_mm = hat_rj45_center_x_mm + hat_rj45_width_x_mm / 2 + hat_front_rj45_to_usb_a_margin_mm + hat_front_usb_a_width_x_mm / 2`.
- With the current reference defaults, the expected front USB-A cutout center X is `10.83 mm`:
  - `-7.76 + 16.68 / 2 + 3.65 + 13.2 / 2 = 10.83`.
- The enclosure must no longer default to the stale RJ45 X center `-16.0 mm`.
- The enclosure must no longer default to the stale front USB-A X center `1.7 mm`.
- The enclosure front RJ45 and front USB-A cutout dimensions must continue to preserve the existing enclosure clearance/error-margin behavior. The implementation may refresh nominal connector dimensions from the Waveshare reference, but must not reduce the effective clearance below the current design's margin around the referenced connector bodies.
- Top-cover-specific USB enlargement behavior must remain in effect for the top-cover portion of the front USB-A opening.
- Waveshare side USB-A cutouts are not part of this iteration unless implementation discovers a direct dependency while keeping the front connector opening data consistent.
- README documentation must state that the front RJ45 and front USB-A enclosure defaults are derived from the local Waveshare reference and document the current expected RJ45 and front USB-A X centers.

Impact and regression considerations for this iteration:

- This iteration intentionally shifts the front RJ45/Ethernet opening and front USB-A opening to match the updated Waveshare reference.
- Moving front connector openings must preserve existing wall material, clip/receiver changes, top-cover removability, IR pod attachment, Grove cable path, and printable render orientations.
- The updated reference model has an uncommitted line-ending warning in the current worktree; implementation must not introduce unrelated line-ending churn beyond files it intentionally edits.

## Iteration: Bambu-Friendly Printable Layout

Requested changes:

- Make the enclosure printable-friendly according to the current repository `AGENTS.md` printable guidance.
- Ensure printable render modes do not contain floating objects.
- Ensure every printable object is separable and printable independently.
- Ensure every printable object is oriented with its broadest, most material-heavy, or most stable face downward on the printer plate unless this spec explicitly documents a different orientation.

Updated deterministic behavior:

- The printable layout must be Bambu Lab-friendly for the Bambu Lab P2S and AMS 2 Pro compatibility target documented by repository instructions.
- `render_mode = "bottom_tray"` must show the bottom tray as a single printable object with its exterior bottom face on the build plate at `Z=0` by default.
- `render_mode = "top_cover"` must show the top cover as a single printable object with a broad, stable printable face on the build plate at `Z=0` by default. If the implementation keeps the cover in its assembled orientation for `assembly`, the printable-only top-cover render path must reorient or reposition the part so the standalone printable mode is plate-friendly.
- `render_mode = "ir_pod"` must show the IR emitter pod body as a printable object with a broad, stable printable face on the build plate at `Z=0` by default. If a separate pod PCB retainer is shown in this mode, it must be a distinct printable object with its own build-plate contact.
- `render_mode = "printable_layout"` must arrange the bottom tray, top cover, IR emitter pod, and any separate IR pod PCB retainer as distinct non-intersecting objects, each independently resting on the build plate with no floating geometry.
- Printable-layout separation must be large enough that the separate parts do not intersect, visually fuse, or depend on each other for support or plate contact.
- Assembly and electronics render modes may keep assembled-world positions and reference previews; the Bambu-friendly no-floating and build-plate-orientation requirements apply to printable part render modes and printable layout outputs.
- Printable part orientation must not rely on electronics/reference preview geometry, cutout guide geometry, or other non-printing guides for build-plate contact.
- Any adjustable printable-layout spacing or orientation parameters must keep `_mm` or `_deg` suffixes as appropriate and remain in the grouped `Adjustable Parameters` section.
- README documentation must describe the printable render orientation and state that the printable layout places separable parts on the build plate without generated mesh exports.

Impact and regression considerations for this iteration:

- Reorienting standalone printable render modes must not change the assembled coordinate relationships used by `assembly` and `electronics`.
- Refactoring printable render paths must preserve all approved case features, port cutouts, cover clips, pod attachment, IR aperture, cable path, anti-slide features, and retainer behavior.
- The top cover may need a printable wrapper module or transform so the assembled cover geometry is preserved while the standalone printable output is build-plate-friendly.
- The IR pod may need a printable wrapper module or transform so its installed assembly pose remains unchanged while standalone printable output rests on the build plate.
- The separate IR pod PCB retainer must remain distinguishable from the pod-to-top-cover attachment mechanism.
- OpenSCAD-assisted inspection may be used under current repository instructions, but generated mesh exports must remain temporary and must not be added to source control.

## Iteration: IR Pod Ethernet-Cutout Clearance

Requested changes:

- The external IR pod should not sit over the Waveshare RJ45/Ethernet opening.
- Make the IR pod a little smaller while preserving the 20.0 mm Grove IR emitter PCB fit.

Updated deterministic behavior:

- The default external IR pod width must be reduced from the prior 32.0 mm default to a narrower default that still fits the 20.0 mm IR emitter PCB, side locator geometry, printed retainer/service opening, and printable walls.
- The default pod placement must shift toward the front USB-A side of the main enclosure so the pod body and top-cover attachment avoid covering the RJ45/Ethernet cutout.
- The default pod slide rail spacing must remain compatible with the narrower pod body and leave printable material around the rail slots.
- The default top-cover-owned pod slide backing plate must remain inside the top-cover X footprint.
- The pod width, pod X offset, and rail spacing must remain adjustable for physical calibration.

Impact and regression considerations for this iteration:

- Shrinking the pod alone cannot fully clear the RJ45 opening while preserving a serviceable 20.0 mm IR PCB enclosure, so the default must combine a smaller pod with an X offset away from Ethernet.
- The pod cable entry, LED aperture, board retention geometry, printable wrappers, and assembly/electronics positions must continue to derive from the same pod/emitter pose.

## Iteration: MicroSD Opening And Micro USB Bridge Clearance

Requested changes:

- The bottom tray microSD card opening is too small after physical printing.
- The microSD card width is 11.0 mm.
- OpenSCAD preview does not clearly show the microSD pass-through opening in the expected tray location even though the printed tray contains an opening.
- The main enclosure Y clearance is too small for the Micro USB bridge/addon between the Pi Zero and Waveshare HAT.
- The Micro USB bridge/addon protrudes 10.9 mm outside the Pi Zero PCB.
- Increase the bottom tray and matching top cover Y envelope so the Micro USB bridge/addon fits.

Updated deterministic behavior:

- The bottom tray must include a true, visible, pass-through microSD access opening at the Pi Zero microSD edge in `bottom_tray`, `assembly`, and `printable_layout` render modes.
- The microSD access opening must be sized from an adjustable `micro_sd_card_width_mm` or equivalently clear parameter, defaulting to `11.0 mm`.
- The default microSD opening must provide clearance around the 11.0 mm card width. The default clear pass-through width must be at least `micro_sd_card_width_mm + 2.0 mm`, unless implementation review shows that a larger current default is already used on the correct axis and only the opposing axis or placement is wrong.
- The microSD opening dimensions, local position, and Z placement must remain independently adjustable for physical calibration.
- The microSD cutout subtraction must extend fully through the relevant tray wall with enough overlap margin that OpenSCAD preview cannot leave an accidental skin or hidden non-opening at the exterior face.
- The microSD access opening must not weaken or collide with the short-end cover retention receiver geometry, Pi Zero stack mounting standoffs, or camera access opening.
- The enclosure must account for the Micro USB bridge/addon protruding `10.9 mm` outside the Pi Zero PCB along the adapter side of the board.
- The Micro USB bridge/addon protrusion must be represented by an adjustable parameter such as `micro_usb_bridge_outside_pcb_y_mm`, defaulting to `10.9 mm`.
- The main enclosure internal Y clearance must be derived so the adapter side has at least `10.9 mm` outside-PCB clearance plus printable fit clearance. The default additional fit clearance must be at least `1.0 mm`.
- The bottom tray and top cover must expand consistently in Y so the Micro USB bridge/addon clearance exists through the tray, cover, and assembled enclosure rather than only one printable part.
- Expanding the enclosure Y envelope must preserve existing board-stack placement, Waveshare and Pi Zero port cutout alignment, Grove cable exit alignment, top-cover removability, short-end cover retention, pod attachment, printable-layout separation, and build-plate-friendly printable orientations.
- The Micro USB bridge/addon clearance must not reintroduce an external Pi Zero Micro USB opening for the internally consumed adapter-side port. The adapter-side port remains internally occupied and externally closed by default.
- README documentation must state the 11.0 mm microSD card width assumption, the default microSD opening clearance behavior, and the 10.9 mm Micro USB bridge/addon outside-PCB protrusion used to size the enclosure Y clearance.

Impact and regression considerations for this iteration:

- The current microSD opening may be dimensioned on the wrong axis, placed too shallow, or subtracted without enough wall-through overlap; implementation must correct the pass-through behavior rather than only increasing a number.
- Increasing Y clearance changes the main enclosure footprint and can move front/rear wall features. The implementation must preserve port access and avoid causing cover clips, pod slide rails, cable exits, or vent holes to intersect new or existing cutouts.
- The Micro USB bridge/addon clearance is based on the user's measured physical protrusion, not vendor-certified mechanical data. The clearance must remain adjustable for later test-fit tuning.
- Physical fit still requires slicer inspection and a test print before relying on final tolerances.

## Iteration: Top-Cover Clip Floating Feature Removal And USB Clearance

Requested changes:

- Remove the floating or detached-looking top-cover element at the cover-to-bottom-tray clip area.
- Leave the bottom tray unchanged.
- Increase every USB opening on the top cover so each has at least 15.0 mm width plus a small clearance margin and 7.0 mm height plus a small clearance margin.

Updated deterministic behavior:

- The bottom tray geometry must remain unchanged by this iteration. In particular, tray shell geometry, Pi Zero stack standoffs, tray-side cover receiver/catch geometry, anti-slide features, and bottom-tray port cutout behavior must not be modified.
- The top cover must remove or refactor only the cover-owned floating or detached-looking clip-area geometry that currently appears near the cover-to-bottom-tray attachment clips.
- The top cover must preserve a screwless removable cover-to-tray interface where possible using remaining cover geometry that engages the existing bottom-tray receivers. If removing the floating cover-side element eliminates positive retention, the implementation must stop and request a spec or plan amendment instead of changing the bottom tray.
- The top-cover clip-area geometry that remains must be visibly continuous with the top-cover shell or lip by code review and must not appear suspended, air-gapped, or attached only by token overlap in `top_cover`, `assembly`, or `printable_layout` render modes.
- Every USB cutout that subtracts from the top cover must have an effective opening width of at least `15.4 mm` and an effective opening height of at least `7.4 mm` by default, representing the requested 15.0 mm x 7.0 mm minimum plus a 0.4 mm small clearance margin.
- The affected USB cutouts include the top-cover portions of:
  - the externally used Pi Zero Micro USB opening,
  - the Waveshare front USB-A opening,
  - the Waveshare left USB-A opening,
  - the Waveshare right USB-A opening.
- The internally consumed Pi Zero Micro USB adapter-side port must remain externally closed by default and must not be reintroduced as a USB opening.
- USB cutout dimensions must remain adjustable after this iteration, and the implementation must not hard-code non-adjustable cutout sizes inside modules.
- Enlarging top-cover USB openings must not intentionally change bottom-tray cutout dimensions in this iteration.
- Enlarging top-cover USB openings must preserve surrounding printable material as much as possible and must not collide with top-cover clip/lip roots, pod attachment geometry, cable exit geometry, or top ventilation holes by code review.
- README documentation and manual inspection guidance must state the default top-cover USB opening minimums and the fact that this iteration intentionally leaves the bottom tray unchanged.

Impact and regression considerations for this iteration:

- Removing the floating clip-area element may reduce cover retention if the current geometry depends on that element. The implementation must preserve reasonable screwless cover engagement with the existing bottom-tray receivers or stop for plan/spec amendment.
- Top-cover-only USB cutout enlargement can create a mismatch between cover and tray cutout sizes. This is intentional only for the top cover in this iteration because the user explicitly requested the bottom tray remain untouched.
- Larger USB openings may reduce local wall strength around the top cover. The implementation must keep the minimum requested clearance while preserving material near clip roots and pod rails where feasible.
- Physical fit still requires slicer inspection and a test print before relying on final tolerances.

## Iteration: Lip Removal And Robust Cover Clip Bases

Requested changes:

- Preserve the user's removal of the top-cover alignment lip because the lip caused spaghetti during printing.
- Clean up unused top-cover lip code and parameters that are no longer part of the intended design.
- Make the top-cover clip tabs less fragile and less likely to break at their roots.
- Strengthen only the clip connection between the removable top cover and the bottom tray.
- Keep the top cover and bottom tray able to connect when clipped together.
- Allow local wall thickening at the clip/receiver areas when needed to give the clips a stronger base.

Updated deterministic behavior:

- The removable top cover must not use a continuous perimeter alignment lip by default.
- The prior continuous top-cover alignment-lip requirement is superseded by this iteration. A non-continuous local guide, boss, or pad is allowed only when it is directly part of the strengthened short-end clip/receiver interface and does not recreate a thin perimeter lip.
- Unused top-cover alignment-lip modules, derived values, and adjustable parameters must be removed when they no longer serve any remaining geometry or documentation behavior.
- The cover-to-tray connection must remain screwless, detachable, and independently removable from the Pi Zero stack fasteners.
- The default cover-to-tray retention must remain on the two short ends of the enclosure and must stay separate from the IR pod-to-cover attachment.
- The top-cover clip tabs must have visibly stronger roots than the current fragile tabs by code review, using thicker tabs, larger root blocks, gussets, filleted/hulled transitions, local cover-wall thickening, or equivalent solid geometry.
- The default clip-tab thickness must increase from the current fragile `1.2 mm` default to at least `1.8 mm`, or the implementation must provide an equivalent or stronger printed cross-section through a named adjustable parameter.
- The clip root must merge into the top-cover shell through a broad supported base rather than a narrow contact patch. The default root engagement along the clip end must be at least `10.0 mm` unless constrained by port/camera/microSD cutout clearance.
- The bottom tray may be changed only where needed for this iteration's clip connection:
  - short-end tray receiver/catch geometry,
  - local tray wall thickening or backing pads around the clip receivers,
  - clearances needed for the thicker top-cover clips to engage and release.
- Other bottom-tray behavior remains preserved, including stack standoffs, anti-slide features, port cutout behavior, microSD access behavior, Y-envelope clearance behavior, and printable orientation behavior.
- Matching bottom-tray receiver geometry must be adjusted so the strengthened top-cover clips can still snap into place, hold the cover positively, and release by hand without requiring cover screws.
- Clip and receiver clearances must remain adjustable for physical calibration.
- Strengthened clip geometry must not block or weaken the Pi Zero microSD opening, camera access opening, USB openings, top ventilation/access holes, main cable exit, or IR pod attachment.
- The printable `top_cover`, `bottom_tray`, `assembly`, and `printable_layout` render modes must show the strengthened clip tabs and matching receivers as visibly continuous with their parent printable solids.
- README documentation must state that the continuous alignment lip was removed for printability, that cover retention now relies on strengthened short-end clip tabs and matching tray receivers, and that only local clip/receiver wall thickening is intentional.

Impact and regression considerations for this iteration:

- Removing the continuous lip reduces passive cover alignment, so the strengthened clips and receiver geometry must provide both positive retention and practical alignment at the short ends.
- Thickening local clip walls can reduce nearby port/cutout margins; implementation must preserve the required openings and avoid creating new unsupported or floating geometry.
- This iteration intentionally narrows behavior changes to the top-cover-to-bottom-tray connection. IR pod attachment, electronics placement, USB sizing, microSD access, and general enclosure footprint should remain unchanged unless directly affected by clip/receiver clearance.

## Iteration: Plug-In Pin And Socket Cover Connection

Requested changes:

- Replace the failed real-world clip connection between the bottom tray and top cover.
- Make the side walls slightly thicker to support a stronger cover connection.
- Put female receiving holes or sockets in the bottom tray.
- Put matching male pins on the top cover.
- Let the user plug the top cover into the bottom tray instead of sliding or snapping failed clip hooks over the tray.
- Make the male pins robust enough that they are not thin, fragile, or likely to break during normal hand assembly.

Updated deterministic behavior:

- This iteration supersedes the previous default cover-to-tray clip/hook retention behavior. Existing clip-tab and tray-receiver requirements remain historical context only where they do not conflict with the new plug-in pin/socket interface.
- The default cover-to-tray interface must be screwless, detachable by hand, and based on top-cover-owned male pins inserting downward into bottom-tray-owned female sockets or holes.
- The top cover must no longer require clip hooks to flex around the bottom tray wall for normal insertion.
- The plug-in insertion direction must be primarily vertical in assembled orientation, so the top cover can be lowered onto the tray and the pins enter the sockets without needing to force the cover side walls over tray-mounted catches.
- The default interface must use at least four male pins and four matching female sockets, distributed near the enclosure corners or along structurally supported side-wall regions so the cover is constrained against rocking.
- Male pins must be rooted into the top-cover shell or skirt through visibly broad bosses, pads, or thickened local wall geometry. A pin must not appear as a thin isolated rod joined only by a small contact patch.
- Female sockets must be integrated into the bottom tray side walls, corner regions, or local reinforced bosses. Socket geometry must remain visually and mechanically distinct from the four Pi Zero stack mounting holes and from the IR pod attachment features.
- The default male pin diameter or narrowest cross-section must be at least `3.0 mm`, and the default pin root diameter or equivalent root/boss cross-section must be at least `4.5 mm`, unless implementation review proves a larger shape is needed for printability or a smaller local value is required to avoid a required port cutout.
- The default socket clearance around each male pin must be adjustable and must start in a plausible FDM range for hand assembly, with the recommended default clearance between `0.25 mm` and `0.45 mm` per diameter.
- The wall thickness default for the main enclosure must increase from the current `2.4 mm` to at least `2.8 mm`, or the implementation must add equivalent named local side-wall thickening around the sockets while preserving the existing outer fit behavior as much as practical.
- The implementation must expose user-adjustable parameters for pin diameter, pin length/insertion depth, pin root/boss dimensions, socket diameter or clearance, socket depth, and any new side-wall or local reinforcement thicknesses. Linear values must use `_mm`.
- The pin/socket engagement must provide cover alignment and practical retention through friction/fit and insertion depth, but must not require cover screws or Pi Zero stack fasteners.
- The cover must remain removable without removing the Pi Zero stack fasteners, disconnecting the Grove cable, or removing the IR pod from the top cover unless the user intentionally separates the top-cover assembly.
- The top ventilation/access holes, port cutouts, main cable exit, IR pod attachment, microSD access, camera access, USB openings, stack standoffs, anti-slide features, printable layout, and render modes must remain preserved except for direct local changes needed to add the thicker walls and plug-in connection.
- Any removed clip-specific modules, parameters, README text, and validation requirements must be replaced with pin/socket equivalents rather than left stale.
- `render_mode = "bottom_tray"` must show the female socket/hole features in the tray.
- `render_mode = "top_cover"` must show the male pins rooted into the top cover.
- `render_mode = "assembly"` and `render_mode = "printable_layout"` must keep the tray and cover separable printable parts while showing the matching pin/socket relationship.
- README documentation must describe the plug-in pin/socket cover connection, the thicker wall or local reinforcement behavior, the adjustable fit parameters, and the need for physical test fitting before relying on final tolerances.

Impact and regression considerations for this iteration:

- The failed clip interface is intentionally replaced rather than further strengthened, so implementation should remove or disable obsolete clip hooks and tray catches unless a non-flexing guide feature remains directly useful for the pin/socket fit.
- Thicker side walls and socket bosses can reduce internal clearance or move wall-adjacent cutouts; implementation must preserve required board, connector, cable, and pod clearances by adjusting cutout positions or reinforcement placement only where necessary.
- Pin/socket geometry must avoid the Pi Zero mounting-hole pattern so users do not confuse cover retention sockets with board-stack fastener holes.
- Physical fit still depends on printer/material calibration, so socket clearance and pin dimensions must remain easy to tune near the top of the OpenSCAD file.

## Acceptance Criteria

- A new `designs/pi_zero_usb_grove_ir_enclosure.scad` file exists.
- The file has `Adjustable Parameters` and `Derived Values` sections near the top.
- The file uses OpenSCAD 2021.01-compatible syntax and no external library dependencies.
- The file uses existing local reference models for the Pi Zero, Waveshare HAT, Seeed Grove Base Hat, and Grove IR emitter.
- The file provides named modules for the assembly, bottom tray, top cover, external IR emitter pod, electronics preview, stack standoffs, IR emitter pod mount, IR aperture, main-to-pod Grove cable path, port cutouts, anti-slide features, and helper geometry.
- Default stack height planning uses an adjustable 35.0 mm measured stack height plus adjustable extra upward headroom.
- Independent board spacing values are adjustable and documented.
- The Waveshare HAT and Grove HAT reference models do not collide in the default `assembly` or `electronics` previews by visual code review of their derived Z placements and clearance envelopes.
- Waveshare port cutout Z centers derive from the Waveshare HAT Z position plus adjustable local offsets.
- Grove cable path placement derives from the Grove HAT connector area, main cable exit, pod cable entry, and IR emitter pod placement values plus adjustable local offsets.
- Changing the Waveshare-to-Grove spacing changes the Grove HAT preview position and all dependent Grove cable/case guide positions.
- Changing the IR emitter pod or emitter position changes the IR emitter reference, pod mount bosses, mount holes, LED aperture, cable entry, and related pod/main cable cutouts together.
- The board stack renders in the correct vertical order when `show_electronics = true`.
- The bottom tray includes Pi Zero-aligned mounting standoffs and adjustable M2.5-class screw clearance.
- The Grove IR emitter PCB has a mounting location inside the external IR emitter pod with a printed serviceable top-load retention feature and adjustable locating/support geometry.
- The Grove IR emitter PCB can be installed into the pod without screws and without requiring the Grove cable to be disconnected first.
- The IR LED is aligned with an adjustable exterior pod aperture, and only the LED path is exposed outside the pod by default.
- The Grove cable path exits the main enclosure only through the dedicated cable exit and enters the pod only through the dedicated cable entry.
- The top cover is removable, plug-in attachable/detachable, and independently attached from the board stack mounting screws without cover screws.
- The top cover does not use a continuous perimeter alignment lip by default.
- Unused alignment-lip source code and documentation are removed when no longer referenced by the design.
- The default cover-to-tray connection uses top-cover-owned male pins and bottom-tray-owned female sockets/holes rather than flexing clip hooks.
- Male pins default to at least `3.0 mm` diameter or equivalent narrowest cross-section, with at least `4.5 mm` root/boss support or equivalent broad rooted geometry.
- Female sockets are integrated into reinforced tray walls, corner regions, or local bosses and have adjustable clearance/depth for FDM test fitting.
- The main enclosure side walls are thickened from the current default or locally reinforced around sockets so the plug-in connection has plausible print strength.
- The top cover includes adjustable ventilation/access holes with a denser default pattern than the current sparse layout, while preserving printable roof strength and clearance from attachment features.
- The bottom tray's four Pi Zero stack mounting holes are documented and remain distinct from cover and pod attachment holes.
- The case includes access openings for all Pi Zero and Waveshare HAT ports listed in Scope.
- The Waveshare RJ45 and front USB-A cutout default X centers match the current local Waveshare reference derived centers, currently `-7.76 mm` and `10.83 mm`.
- The Waveshare enclosure cutout defaults do not retain stale RJ45 or front USB-A spacing that conflicts with `designs/waveshare_eth_usb_hub_hat.scad`.
- The bottom tray includes a true visible pass-through microSD access opening in the expected Pi Zero microSD location.
- The microSD opening default accounts for an 11.0 mm microSD card width with clearance and remains adjustable.
- The microSD opening subtraction fully pierces the tray wall in `bottom_tray`, `assembly`, and `printable_layout` modes.
- The main enclosure Y envelope accounts for the Micro USB bridge/addon protruding 10.9 mm outside the Pi Zero PCB plus printable fit clearance.
- The bottom tray and top cover are expanded consistently for the Micro USB bridge/addon clearance.
- The case does not include an external opening for the Pi Zero Micro USB port that is occupied internally by the adapter connection to the ETH/USB HAT.
- The internally consumed Pi Zero Micro USB adapter-side port remains externally closed by default after the Y clearance expansion.
- Bottom-tray source geometry changes for the pin/socket iteration are limited to female sockets, wall/local reinforcement needed for those sockets, and direct clearance changes needed to preserve fit.
- The top cover no longer includes floating or detached-looking cover-owned connection geometry near the bottom-tray interface.
- Every top-cover USB opening defaults to at least 15.4 mm effective width and 7.4 mm effective height while keeping those dimensions adjustable.
- At least one Waveshare USB-A opening supports an externally attached wireless USB dongle.
- Anti-slide recesses or feet are present on the bottom exterior.
- Render modes include `assembly`, `bottom_tray`, `top_cover`, `ir_pod`, `printable_layout`, and `electronics`.
- The top-cover male pins and tray female sockets are visibly continuous with their parent solids by code review and do not read as detached floating geometry.
- The cover-to-tray interface provides plug-in alignment and practical retention without using cover screws.
- The IR pod attachment is mounted to the removable top cover rather than to fixed tray/main-body geometry.
- The IR pod attachment geometry is visibly continuous with its parent printed part by code review and does not read as detached floating geometry.
- The IR pod mounts to the top cover through a tool-free clip or slide interface with positive retention and a plausible repeated-use insertion/removal path.
- `render_mode = "top_cover"` and `render_mode = "printable_layout"` do not show cover attachment pins, sockets, or reinforcement features that look suspended in space or attached only by an implausibly small overlap.
- Any separate IR pod retainer part, if kept, is clearly intentional in both geometry and documentation rather than appearing as an unexplained extra object.
- Any separate IR pod retainer part is clearly separated from the pod body in `printable_layout` and its installation interface is visually understandable.
- The IR LED aperture is visibly and mechanically a pass-through opening in the pod wall by code review of the subtraction geometry.
- `bottom_tray`, `top_cover`, `ir_pod`, and `printable_layout` printable outputs contain no floating printable objects in their intended printable orientation.
- `printable_layout` places each printable object as a separate, non-intersecting, independently printable object.
- Every printable object in printable render modes rests on the build plate at `Z=0` with its broadest, most material-heavy, or most stable face downward unless this spec explicitly documents a different orientation.
- Printable render-mode transforms do not alter the assembled-world positions used by `assembly` or `electronics`.
- Top-cover removal may carry the IR pod with it, but must not require Pi Zero stack fastener removal or board-stack disassembly.
- README documents the new design behavior, assumptions, parameters, render modes, print notes, and manual inspection checklist.
- `git diff --check` passes.
- No generated mesh/export artifacts are added.

## Validation Plan

- Run `git diff --check`.
- Optionally run local OpenSCAD inspection commands when useful for printability confidence; any generated inspection artifacts must be written under `/tmp` and must not be committed.
- Perform code review/manual inspection to confirm:
  - the source follows repository OpenSCAD naming and section rules,
  - adjustable dimensions are grouped and not redefined inside modules,
  - render modes select the intended assemblies and printable parts,
  - reference models are imported instead of duplicated,
  - the stack order and vertical clearances match the approved defaults,
  - board spacing parameters are independently adjustable and documented,
  - Waveshare and Grove HAT previews do not collide at default spacing,
  - dependent Waveshare port holes and Grove cable/case guide positions derive from board spacing,
  - all required Pi Zero and Waveshare port cutouts exist and are independently adjustable where needed,
  - the Waveshare RJ45 and front USB-A cutout default X centers match the current local Waveshare reference's derived centers, currently `-7.76 mm` and `10.83 mm`,
  - the Waveshare side USB-A cutout defaults preserve the current local Waveshare reference side USB-A size and Y center while remaining side-wall openings,
  - the Pi Zero port cutout set excludes the internally consumed Pi Zero USB port and preserves the remaining externally used Pi Zero port access,
  - the microSD access opening is visible, correctly placed at the Pi Zero microSD edge, sized for an 11.0 mm card width plus clearance, and subtracted fully through the tray wall,
  - the bottom tray and top cover Y envelope account for the 10.9 mm Micro USB bridge/addon outside-PCB protrusion plus fit clearance,
  - the Micro USB bridge/addon clearance does not re-open the internally consumed Pi Zero Micro USB port to the exterior,
  - bottom tray source geometry changes after the plug-in pin/socket iteration are limited to female sockets, socket reinforcement, wall/local thickening, and clearances required for the plug-in cover connection,
  - top-cover connection geometry no longer includes a floating or detached-looking cover-owned element,
  - the continuous alignment lip is absent from the default top-cover geometry,
  - unused alignment-lip modules, values, and README text are removed or updated,
  - male pins, pin roots, female sockets, and socket reinforcement remain visibly rooted into their parent printable solids,
  - every top-cover USB opening defaults to at least 15.4 mm effective width and 7.4 mm effective height and remains adjustable,
  - the wireless dongle remains outside the case through an accessible USB-A cutout,
  - the external IR emitter pod, printed PCB retention geometry, LED aperture, and main-to-pod cable path are present,
  - only the IR LED path is exposed outside the pod by default,
  - the IR emitter PCB loading path is tool-free and compatible with the Grove cable remaining connected,
  - the removable top cover uses plug-in pin/socket attachment, has no cover screws, and does not depend on board mounting screws,
  - the top cover ventilation/access hole pattern is present, denser than the current sparse layout, and does not overlap cover attachment features or weaken required roof margins by code review,
  - the top-cover pin roots and tray sockets are visibly attached to and supported by their parent solids,
  - anti-slide features are present,
  - the IR pod retention is mounted to the removable top cover rather than to fixed tray/main-body geometry,
  - the IR pod attachment features are visibly attached to and supported by their parent solids,
  - the pod-to-cover interface is tool-free and does not require screws for normal installation,
  - the cover-to-tray and cover-to-pod attachment geometry no longer reads as floating or air-gapped in printable views,
  - the cover-to-tray pins default to a robust non-fragile cross-section and the sockets provide adjustable FDM clearance,
  - the extra IR pod printable part is clearly identifiable as the PCB retainer and intentionally placed when shown separately,
  - the IR LED aperture subtraction fully pierces the pod wall rather than stopping short of the external face,
  - top-cover removal can occur without requiring Pi Zero stack fastener removal or board-stack disassembly,
  - printable parts have plausible flat orientations and Bambu P2S-friendly dimensions,
  - printable render modes and `printable_layout` contain no floating printable objects,
  - each printable object in `printable_layout` is separated from the others and has independent build-plate contact at `Z=0`,
  - printable-only orientation transforms do not affect assembled-world geometry,
  - README entries match the implemented behavior,
  - no generated mesh/export artifacts are present.

## Documentation Requirements

- Update `README.md` to document `designs/pi_zero_usb_grove_ir_enclosure.scad` consistently with the actual source.
- Document component assumptions, including the user-provided 35.0 mm stack height and default extra upward headroom.
- Document the independent board spacing parameters users should tune, including the current/default Pi Zero-to-Waveshare and Waveshare-to-Grove values.
- Document that board spacing changes move the electronics preview and dependent case openings/cable guides together.
- Document adjustable parameter groups, render modes, optional OpenSCAD commands for users with OpenSCAD installed, assembly notes, and Bambu Lab print notes.
- Document that physical measurement and test fitting are still required before relying on final tolerances.
- Document the external IR emitter pod render mode, attachment interface, cable exit/entry path, and top cover ventilation/access hole pattern.
- Document that the top cover is plug-in attachable/detachable with male pins and female sockets and does not use cover screws.
- Document that the four bottom-tray board-stack holes exist because the Pi Zero/HAT stack has four mounting points, and that top-cover pin/socket features and pod attachment features are separate.
- Document the revised `top_cover`-mounted IR pod attachment method and note that pod retention is part of the removable upper assembly.
- Document that the IR emitter PCB installs tool-free, with the Grove cable allowed to remain connected during insertion.
- Document that the pod itself mounts tool-free to the top cover through the implemented clip or slide interface.
- Document that the additional loose IR pod printable part is the removable PCB retainer when that design is retained.
- Document that the IR LED aperture is intended to be a full pass-through opening in the pod wall.
- Document the implemented default top-hole density for this iteration and any recommended tuning if the user wants more or fewer holes after physical test fitting.
- Document which Pi Zero Micro USB port remains externally accessible and which one is intentionally closed because it is used internally by the adapter connection to the ETH/USB HAT.
- Document the 11.0 mm microSD card width assumption and the default clearance used for the microSD pass-through opening.
- Document the 10.9 mm Micro USB bridge/addon outside-PCB protrusion and that the tray and cover Y envelope are sized from that value plus fit clearance.
- Document that Waveshare enclosure port cutout defaults are refreshed from `designs/waveshare_eth_usb_hub_hat.scad`, including the current derived RJ45 and front USB-A X centers, currently `-7.76 mm` and `10.83 mm`.
- Document that printable render modes and `printable_layout` are Bambu Lab-friendly, with separate parts placed on the build plate and no generated mesh exports committed.
- Document that the plug-in pin/socket iteration intentionally changes the bottom tray only for sockets, socket reinforcement, and directly required clearance preservation.
- Document that every top-cover USB opening defaults to at least 15.4 mm effective width and 7.4 mm effective height, with adjustable dimensions for physical calibration.
