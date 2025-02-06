#!/bin/bash
# Uninstallation script for AI Terminal Assistant

# 新增：如果未传入参数，则尝试从记录文件读取安装时的 alias 名称
INSTALLED_CMD_FILE="/usr/local/share/ai_terminal_installed_cmd"
if [ -z "$1" ]; then
    if [ -f "$INSTALLED_CMD_FILE" ]; then
        CUSTOM_CMD=$(cat "$INSTALLED_CMD_FILE")
    else
        CUSTOM_CMD="ai"
    fi
else
    CUSTOM_CMD="$1"
fi

INSTALL_DIR="/usr/local/delusional-terminal-ai"
TARGET_FILE="$INSTALL_DIR/delusional-ai"

# Check if installation exists
if [ ! -f "$TARGET_FILE" ]; then
    echo "Error: Installation not found at $TARGET_FILE"
    exit 1
fi

# Confirm deletion
read -p "Are you sure you want to remove $TARGET_FILE? [y/N]: " confirm
if [[ "$confirm" =~ ^[Yy]$ ]]; then
    sudo rm -rf "$INSTALL_DIR"
    echo "Removed $TARGET_FILE"
else
    echo "Operation cancelled."
    exit 0
fi

# Remove installation record
if [ -f "$INSTALLED_CMD_FILE" ]; then
    sudo rm -f "$INSTALLED_CMD_FILE"
fi

# Ask about config directory
CONFIG_DIR="${HOME}/.config/ai_chat"
read -p "Do you want to remove the configuration directory ($CONFIG_DIR)? [y/N]: " del_config
if [[ "$del_config" =~ ^[Yy]$ ]]; then
    rm -rf "$CONFIG_DIR"
    echo "Configuration directory removed."
fi

echo "Uninstallation complete. Please remove the alias from your shell config file manually."
