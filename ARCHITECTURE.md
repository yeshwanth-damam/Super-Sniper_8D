# Super Sniper 8D architecture

This project is an original mobile sniper game. It uses modular Godot 4
services and data resources so features can grow without coupling every scene
to every system.

## Runtime composition

`Bootstrap.tscn` is the project entry scene. It starts the initial menu through
`SceneManager`. The following autoloads are initialized before Bootstrap:

| Service | Responsibility |
| --- | --- |
| `GameState` | Session-only state, such as the selected mission. |
| `SaveManager` | Local player-profile API and schema boundary. |
| `AudioManager` | Audio bus settings and later shared playback services. |
| `UIManager` | Cross-scene UI events (notices and loading state). |
| `SceneManager` | High-level scene navigation. |

Systems must communicate through focused services, signals, or explicit
interfaces—not by traversing unrelated scene trees or hard-coding paths.

## Content and data

- `assets/` contains source game content organized by domain: characters,
  environments, weapons, vehicles, UI, VFX, SFX, music, and shaders.
- `resources/weapons/` stores `WeaponDefinition` (`.tres`) assets.
- `resources/missions/` stores `MissionDefinition` (`.tres`) assets.
- `data/` is reserved for static, importable data such as localization,
  balancing, and remote-config defaults.

Gameplay reads definitions from resources. A rifle or mission should never
require a source-code branch just to change numbers, text, or rewards.

## Persistence and platform integrations

The current local profile is a deliberately small JSON implementation behind
`SaveManager`. This avoids inventing an unverified SQLite dependency. When a
specific Android-compatible SQLite plugin is chosen, its repository replaces
the `SaveManager` internals while preserving its public API.

Firebase, AdMob, Google Play Billing, cloud save, and analytics are not
implemented yet. They need platform plugins, Android identifiers, and consent
requirements; they will live behind `network/` and service interfaces rather
than being referenced directly from gameplay.

## Dependency direction

```text
UI scenes / gameplay scenes
            ↓
Focused domain services and managers
            ↓
Data resources, save boundary, engine adapters
```

Lower layers must not reference menu or gameplay node paths. This keeps the
architecture testable and permits Android-specific implementations later.
