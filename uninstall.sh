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

# 检查安装文件是否存在
if [ ! -f "$TARGET_FILE" ]; then
    echo "Error: '$TARGET_FILE' 安装文件在 $INSTALL_DIR 中不存在。"
    exit 1
fi

# 确认删除安装文件
read -p "确定删除安装目录下的文件 $TARGET_FILE 吗？[y/N]: " confirm
if [[ "$confirm" =~ ^[Yy]$ ]]; then
    sudo rm -rf "$INSTALL_DIR"
    echo "已删除 $TARGET_FILE。"
else
    echo "操作已取消。"
    exit 0
fi

# 删除记录安装时 alias 名称的标记文件
if [ -f "$INSTALLED_CMD_FILE" ]; then
    sudo rm -f "$INSTALLED_CMD_FILE"
fi

# 询问是否删除配置目录
CONFIG_DIR="${HOME}/.config/ai_chat"
read -p "是否同时删除配置目录 ($CONFIG_DIR)？[y/N]: " del_config
if [[ "$del_config" =~ ^[Yy]$ ]]; then
    rm -rf "$CONFIG_DIR"
    echo "配置目录已删除。"
fi

echo "卸载完成。请手动从您的 shell 配置文件中移除之前添加的 alias 行（例如：alias $CUSTOM_CMD='/usr/local/delusional-terminal-ai/delusional-ai'）。"
