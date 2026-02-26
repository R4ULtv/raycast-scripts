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

#### Check Network
- **File**: `check-network.sh`
- **Description**: Checks network connectivity and latency by pinging 1.1.1.1
- **Icon**: [Network Icon](./assets/network-icon.png)
- **Usage**: Run from Raycast to check your network connection and see average latency

### GitHub Utils

#### Switch GitHub Account
- **File**: `gh-switch.sh`
- **Description**: Switches the active GitHub CLI account and shows the user switched to
- **Icon**: [GitHub Switch Icon](./assets/gh-switch-icon.png)
- **Usage**: Run from Raycast to cycle between your GitHub accounts

#### Get GitHub User
- **File**: `gh-user.sh`
- **Description**: Shows the current active GitHub CLI user
- **Icon**: [GitHub Switch Icon](./assets/gh-switch-icon.png)
- **Usage**: Run from Raycast to see which GitHub account is currently active

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
- Swift runtime (only for Settings Utils)
- GitHub CLI (`gh`) (only for GitHub Utils)

## Notes

- The toggle-setup script uses private APIs to modify system settings
- Scripts use dynamic path resolution, making them portable across different installations without modification
- The Swift utilities rely on macOS private frameworks which may break across OS updates
