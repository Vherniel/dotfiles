# 🍙 Hyprland Dotfiles

A highly modular, strictly typed, and "riced" Hyprland configuration for Arch Linux. Designed for advanced dual-monitor productivity with synchronized workspace switching and batch window migration.

![Hyprland Version](https://img.shields.io/badge/Hyprland-v0.40+-blue?logo=archlinux)
![License](https://img.shields.io/badge/license-MIT-green)

## ⚡ Key Features

- **Modular Architecture**: Configuration split into logical components (`input`, `keys`, `ui`, `rules`) for easier maintenance.
- **Dual Monitor Synchronization**:
  - **HDMI-A-1**: Hosts Workspaces `1-9`.
  - **DP-1**: Hosts Workspaces `11-19`.
  - **Sync-Switching**: Switching to workspace `1` automatically brings workspace `11` to the secondary monitor.
- **Batch Migration**: Instantly move *all* windows from the current monitor pair to a new workspace pair.
- **Scratchpads**: extensive use of special workspaces for "glanceable" applications (Slack, Terminals).
- **Strict Gitmoji**: Development follows strict Conventional Commits + Gitmoji standards.

## 📦 Dependencies

Ensure these packages are installed via `pacman` or `yay`:

| Package | Purpose |
| :--- | :--- |
| `hyprland` | The Compositor |
| `foot` | Terminal Emulator |
| `walker` | Application Launcher / Menu |
| `thunar` | File Manager |
| `jq` | JSON processor (Required for workspace scripts) |
| `easyeffects` | Audio effects/Equalizer |
| `hyprpolkitagent` | Polkit Authentication Agent |
| `wl-clip-persist` | Clipboard manager |
| `grim` / `slurp` | Screenshot tools |
| `playerctl` | Media control |
| `brightnessctl` | Brightness control |

## 🎮 Key Bindings

### Window Management

| Keybind | Action |
| :--- | :--- |
| `SUPER + Q` | Open Terminal (`foot`) |
| `SUPER + C` | Kill Active Window |
| `SUPER + R` | Application Launcher (`walker`) |
| `SUPER + V` | Clipboard Manager |
| `SUPER + E` | Emoji Picker |
| `SUPER + F` | Maximize (Fullscreen) |

### Dual Monitor Workflow

| Keybind | Action | Logic |
| :--- | :--- | :--- |
| `SUPER + [1-9]` | **Dual Switch** | Switches Primary to `N` and Secondary to `N+10` simultaneously. |
| `SUPER + SHIFT + [1-9]` | **Batch Move** | Moves **all** windows from current pair to Target `N` & `N+10`. |
| `SUPER + CTRL + [1-9]` | **HDMI Only** | Switch only the Primary (HDMI) monitor. |
| `SUPER + ALT + [1-9]` | **DP Only** | Switch only the Secondary (DP) monitor. |

## 📂 File Structure

```text
~/.config/hypr/
├── hyprland.conf          # Entry point
├── autostart.conf         # Startup apps & daemons
├── variables.conf         # Monitor config & Environment vars
├── input.conf             # Keyboard/Mouse sensitivity
├── keybindings.conf       # General shortcuts
├── look-and-feel.conf     # Animations, Decorations, Colors
├── permissions.conf       # Security rules
├── window-overrides.conf  # Window rules & Smart gaps
├── workspaces.conf        # Workspace-to-Monitor binding
└── scripts/
    ├── dual_switch.sh     # Logic for sync-switching
    └── dual_move.sh       # Logic for batch moving
