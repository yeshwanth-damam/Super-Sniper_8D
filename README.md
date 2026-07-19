# Super Sniper 8D

An original mobile sniper game built with **Godot 4.4** (Forward+ renderer for
desktop, Mobile renderer for Android). This repository is developed one
milestone at a time, like a small game studio.

## Status

**Foundation and production architecture (in progress)**

- Godot 4.4 project that opens successfully.
- Bootstrap entry point and dedicated global services.
- Professional main menu shown on startup.
- Data-driven weapon and mission definition types.
- Domain-oriented folder structure ready for future development.

## Getting started

1. Install the latest stable **Godot 4.4.x** (Standard editor).
2. Open this folder as a project in Godot (`Import` → select `project.godot`).
3. Press <kbd>F5</kbd> to run. You should see the **SUPER SNIPER 8D** main menu.

The startup scene is `scenes/bootstrap/Bootstrap.tscn`. It initializes the
autoload services and opens `scenes/menu/MainMenu.tscn`.

## Project structure

```
SuperSniper8D
├── assets            # characters, environments, weapons, vehicles, ui, vfx, sfx, music, shaders
├── scenes            # bootstrap, menu, gameplay, world, player, enemies, weapons, ui, missions
├── scripts           # core, managers, gameplay, ai, weapons, save, economy, network, ui
├── resources         # authored WeaponDefinition and MissionDefinition assets
├── data              # importable balancing, localization, configuration data
├── addons            # third-party / editor plugins
├── ARCHITECTURE.md   # runtime, data, and platform integration decisions
├── icon.svg          # project icon
└── project.godot     # engine configuration
```

## Roadmap

- **Foundation:** bootstrap, modular services, local profile boundary, and main menu. ✅
- **Milestone 2 – First playable level:** rooftop scene, player camera, look
  controls, placeholder sniper rifle, scope/zoom, a hittable target.
- Later milestones: enemy AI, missions, weapon shop/upgrades, save system,
  multiple maps, and eventually an Android release.
