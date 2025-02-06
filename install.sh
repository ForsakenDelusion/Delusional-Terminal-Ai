#!/bin/bash
# Installation script for AI Terminal Assistant
# This script checks that dependencies (jq, curl) are installed and copies the 'ai' script to /usr/local/bin

# Check dependencies manually; do not auto-install
for dep in jq curl; do
    if ! command -v "$dep" &> /dev/null; then
        echo "$dep is not installed. Please install it manually."
        exit 1
    fi
done

# 新增：检查是否已安装，避免重复安装（判断标记文件）
INSTALLED_CMD_FILE="/usr/local/share/ai_terminal_installed_cmd"
if [ -f "$INSTALLED_CMD_FILE" ]; then
    EXISTING_CMD=$(cat "$INSTALLED_CMD_FILE")
    if [ -f "/usr/local/delusional-terminal-ai/delusional-ai" ]; then
        echo "Error: 已安装 alias 为 '$EXISTING_CMD'。如需重新安装，请先卸载。"
        exit 1
    fi
fi

# 新增：判断是否传入自定义 alias 名称参数，否则提示输入
CUSTOM_CMD="$1"
if [ -z "$CUSTOM_CMD" ]; then
    read -p "请输入安装后的 alias 名称 [默认: ai]: " CUSTOM_CMD
    [ -z "$CUSTOM_CMD" ] && CUSTOM_CMD="ai"
fi

# 将 ai 脚本复制到固定安装目录
INSTALL_DIR="/usr/local/delusional-terminal-ai"
TARGET_FILE="$INSTALL_DIR/delusional-ai"
SCRIPT_SOURCE="$(cd "$(dirname "$0")" && pwd)/delusional-ai"

if [ ! -f "$SCRIPT_SOURCE" ]; then
    echo "Error: 'ai' script not found in the current directory."
    exit 1
fi

echo "Installing 'ai' into $INSTALL_DIR..."
sudo mkdir -p "$INSTALL_DIR"
sudo cp "$SCRIPT_SOURCE" "$TARGET_FILE"
sudo chmod +x "$TARGET_FILE"

# 新增：记录安装时的 alias 名称到标记文件
sudo mkdir -p "$(dirname "$INSTALLED_CMD_FILE")"
echo "$CUSTOM_CMD" | sudo tee "$INSTALLED_CMD_FILE" >/dev/null

# 删除自动添加 alias 到 shell 配置文件的代码块
# 提示用户手动添加 alias：
echo "安装完成。请手动将以下 alias 添加到您的 shell 配置文件（如 ~/.zshrc 或 ~/.bashrc）："
echo "alias $CUSTOM_CMD='/usr/local/delusional-terminal-ai/delusional-ai'"
echo "添加后请重启 shell 或执行: source 您的配置文件"
