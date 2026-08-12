#!/usr/bin/env bash

automated_script() {
    # Ensure system services (like pacman-init or network) are ready
    systemctl is-system-running --wait &>/dev/null

    local tui_path="/usr/local/bin/fastaf-installer-tui"

    if [[ -x "$tui_path" ]]; then
        printf '%s: launching Fast-AF installer TUI\n' "$0"

        # Use 'exec' so that when the installer exits (or if they drop to a shell),
        # it doesn't loop weirdly on tty1
        exec "$tui_path"
    else
        echo "Error: Fast-AF TUI not found at $tui_path"
    fi
}

if [[ $(tty) == "/dev/tty1" ]]; then
    automated_script
fi
