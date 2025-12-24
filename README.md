# Raycast Scripts

A collection of custom Raycast scripts for macOS automation and utilities.

## Scripts

### Network Utils

#### Get Public IP
- **File**: `get-public-ip.sh`
- **Description**: Retrieves your public IP address and copies it to the clipboard
- **Icon**: [Network Icon](./assets/network-icon.png)
- **Usage**: Run from Raycast to quickly get and copy your public IP

#### Get Local IP
- **File**: `get-local-ip.sh`
- **Description**: Retrieves your local/private IP address and copies it to the clipboard
- **Icon**: [Network Icon](./assets/network-icon.png)
- **Usage**: Run from Raycast to quickly get and copy your local IP

### Settings Utils

#### Toggle Setup
- **File**: `toggle-setup.sh`
- **Description**: Toggles between HOME and PORTABLE setups by switching keyboard layout and scroll direction
- **Icon**: [Setup Icon](./assets/setup-icon.png)
- **Features**:
  - Switches keyboard layout between US and Italian-Pro
  - Toggles natural scrolling on/off
  - Displays the current state after toggling

## Components

### Settings Directory

The `settings/` directory contains Swift utilities for system configuration:

- **toggle-keyboard.swift**: Toggles between US and Italian-Pro keyboard layouts
- **toggle-scroll.swift**: Toggles natural scrolling direction
- **toggle-keyboard**: Compiled binary
- **toggle-scroll**: Compiled binary

## Installation

1. Clone or download this repository
2. Compile the Swift binaries (if not already compiled):
   ```bash
   cd settings/
   swiftc -O -whole-module-optimization toggle-scroll.swift -o toggle-scroll -F /System/Library/PrivateFrameworks -framework PreferencePanesSupport

   swiftc -O -whole-module-optimization toggle-keyboard.swift -o toggle-keyboard
   ```
3. In Raycast, go to Extensions → Script Commands
4. Add the directory containing these scripts
5. The scripts will appear in Raycast's command palette

## Requirements

- macOS
- Raycast
- Swift runtime (for compiled binaries)

## Notes

The toggle-setup script uses private APIs to modify system settings. Paths in `toggle-setup.sh` are hardcoded to `/Users/rcari/Documents/Raycast/` and may need to be updated for your environment.
