# Fisans Äventyr — Game Design Document

*A point-and-click Christmas adventure for a 5-year-old.*

This document is a living draft. It exists to keep decisions, ideas, and open
questions in one place so development doesn't start on assumptions nobody
agreed to. Update it as things get decided — don't let it go stale.

### Status legend

| Tag | Meaning |
|---|---|
| ✅ **Decided** | Agreed direction. Safe to build against. |
| 🔍 **Needs research/decision** | Must be resolved before it's built. Not agreed yet. |
| 💭 **Idea** | A thought worth keeping, not a commitment. |

---

## 1. Overview

- **Working title:** Fisans Äventyr ✅
- **Genre:** Point-and-click adventure ✅
- **Engine:** Godot 4.7 ✅ (already in use in this repo)
- **Target platform:** Tablet / touch ✅
- **Target player:** The designer's 5-year-old daughter ✅
- **First deliverable scope:** One vertical-slice scene ✅ — a single small,
  polished scene to prove out the interaction model and art/content
  pipeline, not a full story yet (see [§9 Scope & Milestones](#9-scope--milestones)).
- **Setting/theme:** A Christmas adventure involving Santa ✅ (specifics TBD, see [§3](#3-story--setting))

---

## 2. Target Audience & Design Constraints

Audience: one specific 5-year-old, not a general market. That's a feature —
we can design for her directly rather than for an abstract demographic —
but it also means the usual "make it accessible to kids broadly" guidelines
need to be checked against how *she* actually plays.

- ✅ **Reading level.** Minimal text, always paired with spoken narration —
  reading is never required to understand what's happening.
- ✅ **Voice-over / narration.** Yes — recorded by a family member (not
  text-to-speech or a hired actor).
- ✅ **Failure states.** None. Every action either makes progress or gently
  does nothing — no way to "lose" or get stuck in a bad state.
- ✅ **Language.** Swedish only.
- ✅ **Supervision assumption.** Parent-assisted, at least for the first
  playthroughs — UI can lean on that rather than needing to be fully
  self-explanatory.
- 🔍 **Session length.** Not fixed yet — calibrate against how she actually
  engages with the first playable slice rather than targeting a number
  up front.
- 🔍 **Input precision.** How small can a tappable hotspot be before it's
  too hard for a 5-year-old's motor control/finger size on a tablet?

---

## 3. Story & Setting

- ✅ **Player character:** a stand-in for her — she is the hero of the
  Santa adventure (possibly using her name/likeness; exact treatment TBD).
- ✅ **Story goal:** help Santa find or fix something before Christmas
  (e.g. a lost reindeer, a missing gift, a misplaced list — the specific
  "something" is still open, see below).

Everything below is still open:

- 🔍 What specifically has Santa lost/broken, concretely, for the
  vertical-slice scene? (Needs to be simple enough for one scene.)
- 🔍 Cast of characters (Santa + who else — elves, reindeer, family?).
- 🔍 Number of scenes/locations for the eventual full first story (separate
  from the vertical-slice scope above).
- 🔍 Tone: cozy/gentle vs. any tension at all (even mild "uh oh" moments)?

---

## 4. Core Gameplay Loop

- ✅ **Interaction model:** Point-and-click/tap. The player taps where they
  want to go and taps objects/characters to interact — no keyboard
  movement.
  - ⚠️ Note: the current prototype in this repo (`player/`, `main.tscn`) uses
    WASD-driven movement from an earlier test. That approach is superseded
    by this decision — treat the existing prototype scene as throwaway
    reference, not a foundation to build on, unless someone decides to
    salvage specific art/assets from it.
- ✅ **Verb set:** walk-to-tap, plus a simple inventory — the player can
  pick up an item and use it on something else, in addition to tapping
  objects/characters directly.
- ✅ **Puzzle complexity:** one simple multi-step puzzle for the vertical
  slice (e.g. find one item, use it in one place) — not single-step-only,
  but not a chain of several steps either.
- ✅ **Interactivity cue:** interactive objects have a gentle persistent
  idle animation (slight bounce/glow/wiggle) inviting a tap — no hover
  state needed since touch has none.

---

## 5. Controls & UX

- ✅ Primary input: touch (tap).
- ✅ Orientation: landscape.
- ✅ Desktop dev input: mouse click mirrors touch tap, for fast iteration
  without needing a tablet for every test.
- ✅ UI chrome: a minimal home screen with one big "play" button before the
  scene — not a straight launch-into-scene, but not a full menu either.
- ✅ Parent-exit mechanism: none in-game — rely on the device's own
  home/back button/gesture, kept out of the child's way entirely.

---

## 6. Art Direction

- ✅ **Art pipeline:** AI-generated art, refined as needed. May be paired
  with purchased asset packs (see research note below).
- 🔍 **Visual style** — open research item. Plan: look for existing asset
  packs in a style that fits the cozy-Christmas tone, and evaluate
  whether/how well AI-generated art can be paired with or match that
  style. Style isn't chosen until that research pass happens. The
  existing "dresser background" prototype art hasn't been evaluated
  against this either.
- 🔍 Color palette / mood boards — depends on visual style above.
- 🔍 Character design for Santa and any other cast members — depends on
  visual style above.

---

## 7. Audio

- ✅ **Music/SFX source:** royalty-free library (music and sound effects) —
  fast, low-cost, no licensing risk for a vertical slice.
- 🔍 Music style within that (cozy, orchestral-Christmas, playful) — not
  chosen yet.
- 🔍 Sound effects for interactions (confirmatory "success" sounds are
  especially useful for this audience so every tap feels rewarding).
- 🔍 Voice/narration — see [§2](#2-target-audience--design-constraints).

---

## 8. Technical

- ✅ Engine: Godot 4.7, `Mobile` feature set already configured
  (`project.godot`).
- 🔍 The project's internal name is still the placeholder `"Wild Runner"` in
  `project.godot` — should be renamed to match the actual title once one is
  finalized.
- ✅ **Export targets:** Android only, for now — matches the tablet/touch
  decision and the existing "Setup Google Play account" TODO. Revisit
  iOS/other platforms later if wanted.
- ✅ **Save/progress system:** none needed for the vertical slice — it's a
  single short, fail-state-free scene that can just be replayed from the
  start. Revisit once there's a multi-scene story.
- ✅ **Target device:** no specific model chosen yet — build against a
  generic mid-range Android tablet assumption and adjust once tested on
  her actual device.
- 🔍 CI workflow (also already on `TODO.md`) — out of scope for this
  document, but worth linking once it exists.

---

## 9. Scope & Milestones

- ✅ **First deliverable:** one vertical-slice scene — small, complete
  enough to validate point-and-click interaction, art pipeline, and
  "does a 5-year-old actually enjoy tapping through this," before
  committing to a full story.
- ✅ **Definition of done for the vertical slice** — implemented against
  this checklist (no playtest gate; trying it with her happens as a later
  stage, not a requirement to call this "done"):
  - [ ] One scene, landscape orientation, touch input (mouse mirrors touch
    for desktop dev/testing)
  - [ ] Minimal home screen with a "play" button leading into the scene
  - [ ] 3–5 interactive hotspots in the scene, each with a gentle
    persistent idle animation inviting a tap
  - [ ] Simple inventory: player can pick up one item and use it on
    something else (the one multi-step puzzle)
  - [ ] No fail states — every tap either progresses the puzzle or gently
    does nothing
  - [ ] No intro/outro framing — just the puzzle content itself
  - [ ] Placeholder audio is acceptable (silence or temp sounds) — real
    family-recorded narration and final music/SFX are a follow-up pass,
    not required for this checklist
  - [ ] No save/progress system
- 🔍 What happens after the slice — greenlight criteria for moving on to
  the full first Christmas story.
- ✅ **Timeline:** aim to have something playable before Christmas 2026.

---

## 10. Open Questions / Research Backlog

Consolidated from above — resolve these before/while building the slice:

1. Session length target (§2)
2. Minimum comfortable tap-target size for this age (§2)
3. What specifically has Santa lost/broken, for the slice (§3)
4. Cast of characters (§3)
5. Number of scenes for the eventual full story (§3)
6. Tone: fully cozy vs. mild "uh oh" tension (§3)
7. Visual style — pending asset-pack/AI research pass (§6)
8. Color palette, mood boards, character designs — depend on #7 (§6)
9. Music style within the royalty-free library (§7)
10. Sound effect design for interactions (§7)
11. Greenlight criteria for moving from slice to full story (§9)

---

## 11. Decision Log

| Date | Decision | Notes |
|---|---|---|
| 2026-09-12 | Genre: point-and-click adventure (not the WASD movement in the current prototype) | Prototype's WASD player is superseded, not a foundation |
| 2026-09-12 | Platform: tablet/touch | Matches existing "Setup Google Play account" TODO |
| 2026-09-12 | First deliverable: one vertical-slice scene | Not a full story yet |
| 2026-09-12 | Working title: "Fisans Äventyr" | |
| 2026-09-12 | Minimal text, always paired with spoken narration | No reading required |
| 2026-09-12 | Narration recorded by a family member | Not TTS or a hired actor |
| 2026-09-12 | No fail/lose states | Every action progresses or gently does nothing |
| 2026-09-12 | Language: Swedish only | |
| 2026-09-12 | Supervision assumption: parent-assisted | At least for early playthroughs |
| 2026-09-12 | Player character is a stand-in for her | Exact treatment (name/likeness) TBD |
| 2026-09-12 | Story goal: help Santa find/fix something before Christmas | The specific "something" is still open |
| 2026-09-12 | Verb set: walk-to-tap + simple inventory | Can pick up and use items, not just tap objects directly |
| 2026-09-12 | Puzzle complexity: one simple multi-step puzzle for the slice | Not single-step-only, not a long chain |
| 2026-09-12 | Interactivity cue: gentle persistent idle animation | No hover state needed |
| 2026-09-12 | Orientation: landscape | Matches existing 1024x768 viewport |
| 2026-09-12 | Desktop mouse click mirrors touch tap | For dev iteration without a tablet |
| 2026-09-12 | Minimal home screen with a "play" button | Not a straight launch, not a full menu |
| 2026-09-12 | No in-game parent-exit UI | Relies on device home/back |
| 2026-09-12 | Target: playable before Christmas 2026 | |
| 2026-09-12 | Export target: Android only, for now | Revisit iOS/other platforms later |
| 2026-09-12 | No save system for the vertical slice | Revisit once there's a multi-scene story |
| 2026-09-12 | Target device: generic mid-range Android tablet | Placeholder until tested on her actual device |
| 2026-09-12 | Art pipeline: AI-generated, refined as needed | May pair with purchased asset packs |
| 2026-09-12 | Music/SFX source: royalty-free library | Style within that still open |
| 2026-09-12 | No intro/outro framing for the slice | Just the puzzle content itself |
| 2026-09-12 | Placeholder audio acceptable for v1 | Real narration/music is a follow-up pass |
| 2026-09-12 | "Done" = checklist only, no playtest gate | Playtesting with her is a later stage |
| 2026-09-12 | Scene size: 3-5 interactive hotspots | |
