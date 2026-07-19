# Super Sniper 8D

An original mobile sniper game built with **Godot 4.4** (Forward+ renderer for
desktop, Mobile renderer for Android). This repository is developed one
milestone at a time, like a small game studio.

## Status

**Milestone 1 – Foundation (complete)**

- Godot 4.4 project that opens successfully.
- A professional Main Menu shown on startup.
- A clean folder structure ready for future development.

## Getting started

1. Install the latest stable **Godot 4.4.x** (Standard editor).
2. Open this folder as a project in Godot (`Import` → select `project.godot`).
3. Press <kbd>F5</kbd> to run. You should see the **SUPER SNIPER 8D** main menu.

The startup scene is `scenes/common/Main.tscn`, which instances
`scenes/menu/MainMenu.tscn`.

## Project structure

```
SuperSniper8D
├── assets            # audio, fonts, icons, materials, models, music, shaders, textures, ui
├── scenes            # common, gameplay, menu, player, enemies, ui, weapons, world
├── scripts           # enemy, gameplay, managers, player, ui, weapons, utilities
├── resources         # custom Resource data (weapons, missions, etc.)
├── saves             # runtime save data location
├── addons            # third-party / editor plugins
├── icon.svg          # project icon
└── project.godot     # engine configuration
```

## Roadmap

- **Milestone 1 – Foundation:** project setup + main menu. ✅
- **Milestone 2 – First playable level:** rooftop scene, player camera, look
  controls, placeholder sniper rifle, scope/zoom, a hittable target.
- Later milestones: enemy AI, missions, weapon shop/upgrades, save system,
  multiple maps, and eventually an Android release.
