# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

A Godot 4.7 game project. The repo/internal name ("fisans-adventure" / `project.godot`'s
`config/name="Wild Runner"`) is a leftover placeholder — the actual working title is
**Fisans Äventyr**, a point-and-click Christmas adventure being built for the designer's
5-year-old daughter. See [docs/GDD.md](docs/GDD.md) for the full design (living doc — decisions,
open questions, and a decision log all live there; check it before assuming a design decision).

**Important:** the current scene (`main.tscn`, `player/`) is a WASD/platformer prototype from
an earlier test — genre and controls have since been decided as point-and-click/tap
(see GDD §4). Treat this prototype as throwaway reference, not a foundation to build on,
unless salvaging specific art/assets from it.

## Commands

There is no CLI build/test/lint pipeline — this is developed through the Godot editor.

- **Open editor / run project:** use the VS Code tasks in [.vscode/tasks.json](.vscode/tasks.json)
  ("Godot: Open Editor", "Godot: Run Project"), or the Godot MCP server (`godot` in
  [.mcp.json](.mcp.json), backed by `@coding-solo/godot-mcp`) — prefer the MCP tools
  (`run_project`, `get_debug_output`, `stop_project`, etc.) for launching/inspecting the game
  and reading errors without leaving the session.
- **Godot executable path:** `C:\Users\Jakop\AppData\Local\Godot\app\Godot_v4.7.2-stable_win64.exe`
  (Godot 4.7.2, `.vscode/settings.json` / `.mcp.json`).
- **Debugging in VS Code:** launch configs in [.vscode/launch.json](.vscode/launch.json) require
  the Godot Tools VS Code extension.
- No automated tests exist yet.

## Architecture

- `project.godot` — engine config. `Mobile` rendering feature set and Jolt physics are already
  set, matching the tablet/touch target (GDD §8). Viewport is 1024x768, landscape.
- `main.tscn` — the current (prototype) scene: a background sprite, a static floor body, and a
  `player/player.tscn` instance.
- `player/player.gd` — `CharacterBody2D` script with WASD movement, jump, and an
  `AnimatedSprite2D` driven by an idle/run/jump animation state — this is the superseded
  platformer control scheme, not the point-and-click interaction model the GDD calls for.
- `assets/` — art assets, including a licensed sprite pack under `assets/kian/` (see its
  `LICENSE.txt`) and a placeholder background photo. Binary asset types (`.png`, `.jpg`, `.ogg`,
  `.wav`, etc.) are tracked via Git LFS — see [.gitattributes](.gitattributes).
- `docs/GDD.md` — the design source of truth. Update it (including its Decision Log) as design
  decisions are made rather than letting it drift from what's built.
- `TODO.md` — top-level task tracker; keep in sync with actual project state.

## Working conventions

- The GDD's status tags (✅ Decided / 🔍 Needs research / 💭 Idea) indicate how settled a design
  point is — don't build against a 🔍 or 💭 item as if it were final.
- No fail states or save/progress system are wanted for the vertical-slice scope (GDD §2, §8) —
  don't add them speculatively.
- Target language for in-game text/narration is Swedish only (GDD §2).
