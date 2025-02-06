#!/bin/bash

# Version info
VERSION="1.0.0"
echo "Installing Delusional Terminal AI v${VERSION}..."

# Check dependencies manually; do not auto-install
for dep in jq curl; do
    if ! command -v "$dep" &> /dev/null; then
        echo "$dep is not installed. Please install it manually."
        exit 1
    fi
done

# Check if already installed
INSTALLED_CMD_FILE="/usr/local/share/ai_terminal_installed_cmd"
if [ -f "$INSTALLED_CMD_FILE" ]; then
    EXISTING_CMD=$(cat "$INSTALLED_CMD_FILE")
    if [ -f "/usr/local/delusional-terminal-ai/delusional-ai" ]; then
        echo "Error: Already installed with alias '$EXISTING_CMD'. Please uninstall first."
        exit 1
    fi
fi

# Get custom alias name
CUSTOM_CMD="$1"
if [ -z "$CUSTOM_CMD" ]; then
    read -p "Enter alias name for the command [default: ai]: " CUSTOM_CMD
    [ -z "$CUSTOM_CMD" ] && CUSTOM_CMD="ai"
fi

# 固定安装目录和文件
INSTALL_DIR="/usr/local/delusional-terminal-ai"
TARGET_FILE="$INSTALL_DIR/delusional-ai"
SCRIPT_SOURCE="$(cd "$(dirname "$0")" && pwd)/delusional-ai"

if [ ! -f "$SCRIPT_SOURCE" ]; then
    echo "Error: 'ai' script not found in the current directory."
    exit 1
fi

# Set directory permissions and copy files
echo "Setting up installation directory..."
sudo mkdir -p "$INSTALL_DIR"
sudo chmod 755 "$INSTALL_DIR"
echo "Installing 'ai' into $INSTALL_DIR..."
sudo cp "$SCRIPT_SOURCE" "$TARGET_FILE"
sudo chmod 755 "$TARGET_FILE"

# Record installation info
sudo mkdir -p "$(dirname "$INSTALLED_CMD_FILE")"
echo "$CUSTOM_CMD" | sudo tee "$INSTALLED_CMD_FILE" >/dev/null

# Prompt user to configure alias
echo "Installation complete. Please add the following alias to your shell config file (~/.zshrc or ~/.bashrc):"
echo "alias $CUSTOM_CMD='/usr/local/delusional-terminal-ai/delusional-ai'"
echo "Then restart your shell or run: source <your-shell-config-file>"
