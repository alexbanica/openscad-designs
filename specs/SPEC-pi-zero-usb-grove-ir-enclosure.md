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
  - clip catch or latch receiver features for the removable top cover.
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
- Local OpenSCAD command validation, because repository instructions state OpenSCAD is not installed locally and must not be run.

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
- The existing enclosure source already exposes board spacing parameters named `pi_zero_to_waveshare_hat_z_offset_mm` and `waveshare_to_grove_hat_z_offset_mm`, currently defaulting to 11.2 mm and 10.5 mm respectively. The implementation must preserve independent adjustment of these distances or replace them with equivalently clear parameters.
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
- Top-cover clip/catch features and pod attachment holes or bosses must remain visually and functionally separate from the Pi Zero stack mounting holes.
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
- The top cover must attach to the tray with a clip-on detachable interface by default, without cover screws.
- The top cover must include an adjustable ventilation/access hole pattern. The default pattern must be a simple symmetric grid of circular holes over the board-stack area, with adjustable count, diameter, spacing, and position, and must avoid clip/catch features and high-risk edge weakening.
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
- A clip-on detachable removable top cover is required as the default removable upper section; cover screws are out of scope for the main top cover.
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
  - `waveshare_to_grove_hat_z_offset_mm = 10.5`.
- The implementation must review and, if needed, increase the default Waveshare-to-Grove spacing so the Waveshare ETH/USB HUB HAT and Seeed Grove Base Hat reference models do not visibly collide in `assembly` or `electronics` render modes.
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
- The Waveshare RJ45 cutout center X must continue to align with `hat_rj45_center_x_mm = -16.0` from `designs/waveshare_eth_usb_hub_hat.scad`.
- The Waveshare front USB-A cutout center X must align with the Waveshare reference's derived front USB-A component center:
  - `hat_rj45_center_x_mm + hat_rj45_width_x_mm / 2 + hat_front_rj45_to_usb_a_margin_mm + hat_front_usb_a_width_x_mm / 2`,
  - using current defaults: `-16.0 + 14.7 / 2 + 3.75 + 13.2 / 2 = 1.7 mm`.
- The enclosure must not keep the stale `waveshare_front_usb_a_cutout_center_x_mm = 11.0` default.
- The Waveshare front USB-A cutout size must continue to cover the current Waveshare reference front USB-A component footprint of `13.2 mm x 5.7 mm`, plus the enclosure's existing cutout clearance behavior.
- The Waveshare side USB-A cutout defaults must continue to match the current Waveshare reference side USB-A orientation:
  - component footprint `5.7 mm` along X and `13.2 mm` along Y,
  - center Y aligned to `0.0`.
- Side USB-A cutout X centers may remain enclosure-wall cutout centers rather than component-body centers, because they are openings through the printed side walls; however, their default sizes and Y placement must continue to match the current Waveshare reference component spacing.
- README documentation must state that the enclosure Waveshare cutout defaults are based on the local Waveshare reference file and that the front USB-A default X center is `1.7 mm`.

Impact and regression considerations for this iteration:

- The change intentionally moves the front USB-A enclosure cutout leftward to match the current Waveshare reference model.
- The RJ45 opening, side USB-A openings, stack Z derivation, Pi Zero openings, Grove cable path, top cover, IR pod, and anti-slide behavior should remain unchanged unless directly required to keep Waveshare cutout documentation consistent.
- Because the side USB-A cutouts are printed side-wall openings, matching the Waveshare reference does not require moving their X centers onto the component body centers.

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
- The top cover is removable, clip-on attachable/detachable, and independently attached from the board stack mounting screws without cover screws.
- The top cover includes adjustable ventilation/access holes with a denser default pattern than the current sparse layout, while preserving printable roof strength and clearance from attachment features.
- The bottom tray's four Pi Zero stack mounting holes are documented and remain distinct from cover and pod attachment holes.
- The case includes access openings for all Pi Zero and Waveshare HAT ports listed in Scope.
- The Waveshare front USB-A cutout default X center matches the current local Waveshare reference derived center of `1.7 mm`, based on RJ45 center X, RJ45 width, the `3.75 mm` RJ45-to-USB-A component margin, and front USB-A width.
- The Waveshare enclosure cutout defaults do not retain stale front USB-A spacing that conflicts with `designs/waveshare_eth_usb_hub_hat.scad`.
- The case does not include an external opening for the Pi Zero Micro USB port that is occupied internally by the adapter connection to the ETH/USB HAT.
- At least one Waveshare USB-A opening supports an externally attached wireless USB dongle.
- Anti-slide recesses or feet are present on the bottom exterior.
- Render modes include `assembly`, `bottom_tray`, `top_cover`, `ir_pod`, `printable_layout`, and `electronics`.
- The top-cover clip features and tray receivers are visibly continuous with their parent solids by code review and do not read as detached floating geometry.
- The cover-to-tray interface provides positive retention on both short ends without using cover screws.
- The IR pod attachment is mounted to the removable top cover rather than to fixed tray/main-body geometry.
- The IR pod attachment geometry is visibly continuous with its parent printed part by code review and does not read as detached floating geometry.
- The IR pod mounts to the top cover through a tool-free clip or slide interface with positive retention and a plausible repeated-use insertion/removal path.
- `render_mode = "top_cover"` and `render_mode = "printable_layout"` do not show cover attachment features that look suspended in space or attached only by an implausibly small overlap.
- Any separate IR pod retainer part, if kept, is clearly intentional in both geometry and documentation rather than appearing as an unexplained extra object.
- Any separate IR pod retainer part is clearly separated from the pod body in `printable_layout` and its installation interface is visually understandable.
- The IR LED aperture is visibly and mechanically a pass-through opening in the pod wall by code review of the subtraction geometry.
- Top-cover removal may carry the IR pod with it, but must not require Pi Zero stack fastener removal or board-stack disassembly.
- README documents the new design behavior, assumptions, parameters, render modes, print notes, and manual inspection checklist.
- `git diff --check` passes.
- No generated mesh/export artifacts are added.

## Validation Plan

- Do not run OpenSCAD commands locally.
- Run `git diff --check`.
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
  - the Waveshare front USB-A cutout default X center matches the current local Waveshare reference's derived `1.7 mm` center,
  - the Waveshare side USB-A cutout defaults preserve the current local Waveshare reference side USB-A size and Y center while remaining side-wall openings,
  - the Pi Zero port cutout set excludes the internally consumed Pi Zero USB port and preserves the remaining externally used Pi Zero port access,
  - the wireless dongle remains outside the case through an accessible USB-A cutout,
  - the external IR emitter pod, printed PCB retention geometry, LED aperture, and main-to-pod cable path are present,
  - only the IR LED path is exposed outside the pod by default,
  - the IR emitter PCB loading path is tool-free and compatible with the Grove cable remaining connected,
  - the removable top cover uses clip/catch attachment, has no cover screws, and does not depend on board mounting screws,
  - the top cover ventilation/access hole pattern is present, denser than the current sparse layout, and does not overlap clip/catch features or weaken required roof margins by code review,
  - the top-cover clip roots and tray receivers are visibly attached to and supported by their parent solids,
  - anti-slide features are present,
  - the IR pod retention is mounted to the removable top cover rather than to fixed tray/main-body geometry,
  - the IR pod attachment features are visibly attached to and supported by their parent solids,
  - the pod-to-cover interface is tool-free and does not require screws for normal installation,
  - the cover-to-tray and cover-to-pod attachment geometry no longer reads as floating or air-gapped in printable views,
  - the extra IR pod printable part is clearly identifiable as the PCB retainer and intentionally placed when shown separately,
  - the IR LED aperture subtraction fully pierces the pod wall rather than stopping short of the external face,
  - top-cover removal can occur without requiring Pi Zero stack fastener removal or board-stack disassembly,
  - printable parts have plausible flat orientations and Bambu P2S-friendly dimensions,
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
- Document that the top cover is clip-on attachable/detachable and does not use cover screws.
- Document that the four bottom-tray board-stack holes exist because the Pi Zero/HAT stack has four mounting points, and that top-cover clip/catch features and pod attachment features are separate.
- Document the revised `top_cover`-mounted IR pod attachment method and note that pod retention is part of the removable upper assembly.
- Document that the IR emitter PCB installs tool-free, with the Grove cable allowed to remain connected during insertion.
- Document that the pod itself mounts tool-free to the top cover through the implemented clip or slide interface.
- Document that the additional loose IR pod printable part is the removable PCB retainer when that design is retained.
- Document that the IR LED aperture is intended to be a full pass-through opening in the pod wall.
- Document the implemented default top-hole density for this iteration and any recommended tuning if the user wants more or fewer holes after physical test fitting.
- Document which Pi Zero Micro USB port remains externally accessible and which one is intentionally closed because it is used internally by the adapter connection to the ETH/USB HAT.
- Document that Waveshare enclosure port cutout defaults are refreshed from `designs/waveshare_eth_usb_hub_hat.scad`, including the `1.7 mm` default front USB-A X center.
