# SPEC: Linksys LGS105 Cable-Management Enclosure

Status: Approved

## Iteration: Flat Device Cables And Lay-In Connector Access (2026-07-21)

This iteration preserves the approved two-part enclosure, switch arrangement,
three-aperture contract, cable lengths, ventilation, render modes, and printing
constraints while refining the Ethernet cable geometry:

- the single uplink remains a conventional round CAT6 cable;
- the four device cables are flat CAT6 cables associated with EAN
  `7432022397395` and share one device-bundle aperture;
- the four flat device cables are treated as one stacked or compact bundle, not
  as four separately routed enclosure exits;
- RJ45 connector bodies do not have to pass through a closed cable-size hole;
  the removable cover is the opening mechanism, allowing each connector to be
  placed inside and connected before its cable jacket is laid into the
  open-topped slot;
- cable previews, aperture sizing, routing evidence, parameter names, and
  documentation must distinguish the round uplink from the flat device cables.

## Purpose

Create a printable enclosure for a Linksys LGS105 five-port unmanaged Ethernet
switch that hides excess Ethernet cable, keeps the switch fixed in position,
provides exactly three cable-service apertures, and maintains passive airflow.

## Problem

The switch uses one Ethernet cable as its uplink and four Ethernet cables for
connected devices. The cables are longer than the immediately visible runs need
to be, leaving an unwanted bundle next to the exposed switch. A normal close-fit
switch case would not provide enough internal space or suitable bend control for
the excess cable.

The enclosure must therefore combine a protected switch compartment with an
internal cable-storage compartment. It must allow only the required cable length
to leave the enclosure while keeping the remaining cable organized, must not
allow the switch to slide or lift during normal cable handling, and must not
block the switch's passive ventilation.

## Scope

- Add one editable OpenSCAD 2021.01-compatible source for the complete enclosure.
- Model a two-part enclosure consisting of a bottom tray and removable top cover.
- Provide a dedicated switch compartment and an adjacent cable-storage
  compartment on the Ethernet-port side.
- Fix the switch horizontally and vertically without modifying the metal switch
  body.
- Provide exactly three cable-service apertures:
  - one power-cable aperture on the power-input side,
  - one uplink Ethernet cable aperture on the Ethernet side,
  - one shared device-cable aperture for four Ethernet cables beside the uplink
    aperture on the same side.
- Provide adjustable cable-routing guides and usable storage for the stated
  Ethernet cable set.
- Provide real ventilation openings through the enclosure while keeping the
  switch's own ventilation paths clear.
- Provide assembly, individual-part, and printable-layout render modes.
- Document parameters, assumptions, printing guidance, assembly, and validation
  in `README.md`.

## Out Of Scope

- Modifying the Linksys switch, its power adapter, or any Ethernet cable.
- Providing electrical shielding, water resistance, dust sealing, strain-relief
  certification, or fire-resistance certification.
- Supporting PoE switches or Linksys models other than the LGS105.
- Storing the external AC power adapter inside the enclosure.
- Wall-mounting hardware in the initial design.
- Generated STL, STEP, 3MF, OFF, or other mesh exports in source control.
- Guaranteeing physical fit without checking the actual switch and cables.

## Definitions

- **Ethernet side:** the side of the switch containing all five RJ45 ports and
  their status indicators.
- **Power side:** the side opposite the Ethernet ports containing the DC power
  input.
- **Uplink:** the single Ethernet cable connecting the switch to the upstream
  router or network.
- **Device bundle:** the four Ethernet cables connecting the other four switch
  ports to local devices. In the default design these are flat cables gathered
  into one shared enclosure exit.
- **Cable-service aperture:** one of the three intentional enclosure-wall
  openings through which a power or Ethernet cable exits. Ventilation openings
  do not count as cable-service apertures.
- **Lay-in aperture:** an open-topped tray-wall slot that accepts a cable without
  passing its connector through the wall; the installed top cover closes the
  open side and turns it into a bounded pass-through opening.
- **Connector access mechanism:** removal of the complete top cover, which opens
  every lay-in slot and exposes the switch ports so RJ45 heads can be placed
  inside the enclosure without fitting through a cable-size wall opening.
- **Cable-storage compartment:** the enclosed volume adjacent to the Ethernet
  ports where excess cable is routed around bend guides.
- **Necessary exposed length:** the cable length the user leaves outside the
  enclosure to reach the connected device. The remainder stays inside.

## Research Sources And Hardware Identification

- Linksys documents two LGS105 versions:
  - v1: `121 mm x 75.5 mm x 26 mm`, `5 V DC / 1.0 A`;
  - v2: `120 mm x 88 mm x 26 mm`, `12 V / 0.5 A`.
- The user-provided EAN `4260184663453` is associated by multiple product
  listings with product code `LGS105-EU` and the original approximately
  `121 mm x 75 mm x 26 mm` enclosure.
- Some retailer data for the same EAN contains later-revision power or dimension
  values. The design therefore uses the v1-size body as its default planning
  assumption while keeping switch dimensions adjustable and requiring a physical
  pre-print check.
- The user-provided cable EAN `7432022397395` is associated with a REXLIS flat
  CAT6 cable listing that reports a `6 mm x 1.4 mm` cable cross-section. The
  listing is not manufacturer mechanical documentation and does not provide a
  reliable RJ45 head or molded-boot envelope, so the cable cross-section remains
  an adjustable planning input requiring measurement.
- Sources:
  - <https://support.linksys.com/kb/article/5017-en/>
  - <https://www.toppreise.ch/preisvergleich/Switches-1000-MBit/LINKSYS-LGS105-p404462>
  - <https://www.photopoint.ee/en/networking/6393107-linksys-lgs105-5-port-switch>
  - <https://www.bol.com/nl/nl/p/0-5m-cat6-ultra-dunne-flat-ethernet-netwerk-lan-kabel-zwart/9200000088464010/>

## User-Provided And Manually Entered Dimensions

The following values were supplied manually by the user and must be documented
as design inputs:

- Ethernet cable count: exactly five connected cables.
- Uplink count: one cable.
- Device cable count: four cables.
- Device cable profile: four flat CAT6 cables associated with EAN
  `7432022397395`.
- Uplink cable profile: one conventional round CAT6 cable.
- Cable lengths: four flat device cables at `250 mm` each and one round uplink
  cable at `500 mm`.
- Total connected Ethernet cable length: `1500 mm`.
- Uplink and device cables leave from the same enclosure side.
- Power leaves from the opposite enclosure side.

The user identified the device cables as flat and the uplink as round but did
not provide measured RJ45 head or molded-boot dimensions. Initial adjustable
planning assumptions are:

- Round uplink cable diameter: `uplink_cable_diameter_mm = 4.0`.
- Flat device cable width: `device_cable_width_mm = 6.0`.
- Flat device cable thickness: `device_cable_thickness_mm = 1.4`.
- Uplink aperture usable width and height: `6.0 mm x 6.0 mm`.
- Shared four-device-cable aperture usable width and height:
  `8.0 mm x 7.0 mm`, supporting a default four-cable stack of
  `6.0 mm x 5.6 mm` with clearance.
- Minimum routing-guide bend radius: `15.0 mm`.
- Switch fit clearance on each horizontal side: `0.6 mm`.
- Switch fit clearance above the body: `0.8 mm`.

These assumptions are not vendor-certified measurements. The actual switch
width, depth, height, both cable profiles, cable behavior, and RJ45 head and boot
clearances must be checked before relying on the default fit. All manually
entered or assumed dimensions must remain user-adjustable near the top of the
source.

## Inputs And Constraints

- Target OpenSCAD 2021.01 syntax with no external library dependency.
- Keep the coherent enclosure in one editable `.scad` source file.
- Use descriptive `snake_case` names and `_mm` suffixes for linear dimensions.
- Keep user-adjustable parameters grouped by purpose and derived values in a
  separate section.
- Default switch body dimensions are `121.0 mm x 75.5 mm x 26.0 mm`.
- The source coordinate convention must clearly state which axis represents
  switch width, switch depth from Ethernet side to power side, and height.
- The enclosure must fit a Bambu Lab P2S build plate in every individual-part
  and printable-layout mode.
- Every printable part must be separate, non-floating, and oriented with its
  broadest stable face on the print plane.
- The top cover must be removable for switch installation, cable connection,
  cable winding, and later service.
- Ethernet connectors and the power connector must be installed with the top
  removed; the design must not require a connector body to pass through a
  cable-size aperture.
- With the cover removed, all three cable slots must be open from above so an
  RJ45 head can be placed inside the enclosure and the attached jacket can then
  be lowered into its slot.
- No default cable route may require a bend tighter than the adjustable minimum
  bend radius.
- Ventilation must preserve continuous material around the enclosure perimeter,
  cover-retention features, switch-retention features, and cable apertures.

## Deterministic Behavior

### Overall Arrangement

- The switch sits in a close-fit compartment with its Ethernet ports facing the
  internal cable-storage compartment.
- The external wall beyond the cable-storage compartment is the Ethernet-side
  enclosure wall.
- The uplink and shared device-bundle apertures are adjacent openings in that
  Ethernet-side enclosure wall.
- The power aperture is centered from an adjustable position on the opposite
  enclosure wall and routes only the low-voltage DC lead.
- The default exterior is functional and simplified rather than a cosmetic copy
  of the Linksys metal housing.

### Exactly Three Cable-Service Apertures

- The enclosure has exactly three cable-service apertures in its default
  assembled configuration.
- Each aperture is a real pass-through opening through its wall, not a recess or
  a subtraction that terminates inside wall material.
- All three apertures use lay-in tray-wall slots closed by the installed top
  cover.
- The uplink aperture retains the one round uplink cable without sharing its
  opening with device cables.
- The device aperture accommodates all four flat device cables as one stacked or
  controlled compact bundle without crushing them; it does not create four
  separate enclosure exits.
- The installed cover and its locating skirt provide relief above all three
  slots so they close the open side without reducing the approved usable cable
  envelopes.
- The power aperture accommodates the DC cable without requiring the barrel
  connector or adapter body to pass through it.
- Vent holes are permitted in addition to these three service apertures and are
  visually and functionally distinct from them.

### Switch Retention

- The tray provides a flat switch support floor and adjustable perimeter stops
  or rails that prevent movement along both horizontal axes.
- Retention features must not depend on adhesives, screws driven into the
  switch, or modification of the metal housing.
- The top cover provides adjustable downward retention pads or rails with
  positive clearance so the switch cannot lift out during ordinary cable
  handling but is not clamped hard enough to deform or scratch it.
- Retention features must not cover the RJ45 ports, DC input, LEDs, or the
  switch's own ventilation openings.
- The switch remains removable after the top cover is removed.

### Cable Storage And Routing

- The cable-storage compartment includes multiple smooth, rounded routing guides
  positioned to support loops rather than sharp folds.
- Routing guides use the adjustable minimum bend radius and have no cable-contact
  edge sharper than the modeled rounding allowance.
- Representative routing distinguishes one round uplink from four flat device
  cables and does not render all five cables as round cylinders.
- The storage area supports routing the stated five connected cables with a
  combined maximum length of `1500 mm`, while allowing any required portion of
  each cable to remain outside.
- Storage does not require every cable to be wound to the same exposed length.
- The user can pull out the necessary length for each run and route the remaining
  slack around the internal guides before closing the cover.
- A divider or guide boundary separates the single uplink path from the
  four-device bundle near their external apertures so the two exits remain
  identifiable.
- The cover prevents loosely routed cable loops from rising out of the storage
  compartment during normal use.
- The design does not pinch, kink, or apply a hard edge to an Ethernet cable at
  an exit.

### Cover And Serviceability

- The enclosure has a removable, tool-free top cover retained by printable
  friction pins, clips, or another adjustable non-permanent interface.
- The cover retention is independent of the switch body and cables.
- With the cover removed, the switch, all RJ45 plugs, the power connector, the
  complete cable-storage area, and all three lay-in apertures are accessible.
- The open cover state is the connector access mechanism: RJ45 heads are placed
  inside and connected before the cable jackets are lowered into the uplink and
  shared-device slots.
- With the cover installed, the switch and stored cable bundle are visually
  covered while the three service apertures remain usable.
- The design includes a visible status-light window or sightline aligned with
  the Ethernet-side LED region so link/activity state can be checked without
  removing the cover.

### Ventilation

- The bottom tray and top cover include adjustable, real pass-through
  ventilation openings that create a passive low-to-high airflow path around the
  fanless metal switch.
- Default vents must not be blocked by the switch-retention rails or cable guide
  posts.
- The switch compartment and cable compartment must not form an airtight
  partition; air can move between them without adding a fourth cable-service
  aperture.
- Vent openings must keep clear of cable-contact paths so cable loops cannot be
  forced through them during normal assembly.
- Default vent placement preserves cover strength and continuous material around
  retention features and corners.

### Render Modes

- `assembly`: assembled enclosure with simplified switch and cable-route
  references available through visibility toggles.
- `bottom_tray`: printable bottom tray only, stable face on the print plane.
- `top_cover`: printable top cover only, oriented with its broadest stable face
  on the print plane.
- `cable_routing_preview`: enclosure reference showing the three aperture paths,
  switch keepout, minimum bend guides, and representative cable loops.
- `printable_layout`: bottom tray and top cover separated with no overlap,
  floating objects, or electronic reference geometry.

## Adjustable Parameter Groups

The source must expose at least these groups near the top:

- Render controls and reference-visibility toggles.
- Switch body dimensions and fit clearances.
- Tray, wall, floor, cover, and corner dimensions.
- Switch retention rails, stops, and vertical pads.
- Cable count, round-uplink diameter, flat-device width and thickness, total
  storage allowance, and minimum bend radius.
- Cable-storage compartment depth and routing-guide geometry.
- Uplink, device-bundle, and power aperture dimensions and positions.
- LED sightline dimensions and position.
- Bottom, side, and top ventilation dimensions, counts, spacing, and offsets.
- Cover-retention geometry and fit clearance.
- Printable-layout spacing and preview colors.

## Assumptions

- EAN `4260184663453` identifies an original-size LGS105 closely enough to use
  `121.0 mm x 75.5 mm x 26.0 mm` as the initial body envelope.
- The actual unit may differ from merged retailer data, so measured dimensions
  override the defaults.
- The DC input is on the side opposite the five Ethernet ports.
- All five Ethernet ports can be used simultaneously: one uplink and four device
  connections.
- The `500 mm` round cable is the uplink; the four `250 mm` flat cables form the
  device bundle.
- The cables are flexible enough to follow a `15.0 mm` default minimum bend
  radius, subject to measurement and physical validation.
- A tabletop enclosure is acceptable; wall mounting is not required initially.
- The AC adapter remains outside the enclosure.
- The user will arrange cables with the cover removed rather than pulling RJ45
  connector bodies through finished apertures.

## Regression And Risk Considerations

- An incorrect hardware-version assumption can prevent the switch from fitting;
  adjustable dimensions and a physical measurement checkpoint mitigate but do
  not eliminate this risk.
- Cable jackets and molded boots vary substantially. The default apertures may
  need tuning even though the removable-cover lay-in mechanism avoids passing
  RJ45 heads through them.
- The researched flat-cable cross-section is retailer data, not a measured
  sample or manufacturer drawing; the actual four-cable bundle can require a
  different stacking orientation or aperture clearance.
- Packing the full stated cable length depends on actual cable thickness,
  stiffness, and necessary exposed run lengths.
- Tight cable routing can damage performance or cable life; minimum bend radius
  and rounded guide surfaces are hard acceptance criteria.
- Excessively open ventilation can weaken the cover, while insufficient airflow
  can retain heat. Default patterns must balance open area and continuous
  structure.
- A close vertical retention fit can press on the metal enclosure or obstruct
  its vents; default top pads require positive clearance and a physical fit
  check.
- Openings that exist in source logic may still fail to pierce rendered walls;
  rendered inspection of every service aperture and vent is required.
- A single large printable tray may approach practical print-time and warping
  limits even if it fits the Bambu Lab P2S plate.

## Acceptance Criteria

- A proposed OpenSCAD source can represent the v1-size LGS105 default envelope
  and exposes its dimensions for tuning.
- The assembled enclosure visibly contains separate switch and cable-storage
  regions.
- The switch is constrained in X, Y, and Z while remaining removable after the
  cover is removed.
- The default assembly has exactly three cable-service apertures: power, uplink,
  and four-cable device bundle.
- Uplink and device-bundle apertures are adjacent on the Ethernet side; power is
  on the opposite side.
- All three service apertures visibly pass completely through their enclosure
  walls and remain bounded when the cover is installed.
- The five Ethernet cables can be connected and laid into their apertures without
  passing RJ45 plug bodies through the openings.
- The four flat device cables share one lay-in aperture and are not represented
  as four separate cable-service holes.
- With the cover removed, RJ45 heads fit into the exposed assembly area and the
  attached cable jackets can be lowered into the open-topped slots.
- Representative routing models four flat `250 mm` device cables and one round
  `500 mm` uplink cable, uses smooth guides, and has no bend tighter than the
  configured minimum radius.
- Stored cable is covered in the assembled mode, while individually adjustable
  external cable lengths can remain outside.
- Status LEDs remain observable without opening the enclosure.
- Bottom and top or side ventilation openings visibly pass through their walls,
  do not collide with retention features, and provide an airflow path around the
  switch.
- `bottom_tray`, `top_cover`, and `printable_layout` contain only independently
  printable, non-floating geometry with stable print-plane contact.
- No generated mesh artifact is added to source control.

## Validation Plan

- Run `git diff --check`.
- Run OpenSCAD syntax/render checks with a maximum of 15 seconds per render for:
  - `assembly` with electronic references hidden,
  - `printable_layout` with electronic references hidden.
- Inspect the `bottom_tray`, `top_cover`, and `cable_routing_preview` mode
  selection and module wiring in source without rendering those modes, in
  accordance with the repository's render restrictions.
- Export temporary inspection artifacts only under `/tmp`.
- Visually inspect that:
  - the switch envelope does not intersect tray, cover, or retention geometry;
  - retention exists in all three axes and does not block service areas;
  - all three cable-service apertures fully pierce their walls;
  - the cover closes the open side of every lay-in aperture without pinching its
    cable envelope;
  - the shared device aperture fits a four-flat-cable bundle and remains open
    from above with the cover removed;
  - the cover and skirt do not pinch the round uplink or flat device bundle;
  - representative flat and round cables follow the configured minimum bend
    radius;
  - ventilation openings are real, unobstructed, and structurally separated;
  - printable parts are separated, stable, and contain no reference electronics.
- Measure the actual switch, round cable diameter, flat cable width/thickness,
  and RJ45 head/boot envelope before final printing.
- Inspect the sliced parts in Bambu Studio for build-plate fit, unsupported
  bridges, wall continuity, and practical print orientation.
- Perform a physical test fit and low-temperature operational observation before
  treating airflow and retention as validated.

## Documentation Needs

Update `README.md` to document:

- the new design file and supported LGS105 default body assumption;
- the EAN/version ambiguity and required physical measurement check;
- the three cable-service apertures and their side assignment;
- switch retention and service procedure;
- cable-storage capacity, cable-length inputs, bend-radius controls, and routing
  procedure;
- round-uplink and flat-device cable parameters, the single shared device exit,
  and removable-cover connector insertion procedure;
- ventilation strategy and keepouts;
- render modes and relevant OpenSCAD commands;
- Bambu Lab P2S/AMS 2 Pro printing and slicer guidance;
- the limitation that rendered inspection cannot replace physical measurement,
  thermal observation, slicer inspection, or a test print.
