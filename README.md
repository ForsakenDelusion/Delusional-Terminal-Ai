# AI Terminal Assistant

Delusional Terminal AI 是一个基于 Bash 脚本的终端助手，可以回答问题并提供开发帮助。该工具支持 API 密钥管理、对话历史记录保存及清理，以及内存功能的开启与关闭，并提供了简化命令格式以方便使用。

## 目录

- [安装](#安装)
- [卸载](#卸载)
- [使用方法](#使用方法)
  - [提问](#提问)
  - [设置 API Key](#设置-api-key)
  - [内存功能管理](#内存功能管理)
  - [清理历史记录](#清理历史记录)
  - [显示状态](#显示状态)
  - [帮助信息](#帮助信息)
- [配置说明](#配置说明)
- [示例](#示例)

## 安装

1. 确保系统已安装依赖：`jq` 和 `curl`（安装过程中会检查）。
2. 执行安装脚本 `install.sh`：
   - 脚本会提示您设置一个 alias 名称（默认值为 `ai`）。
   - 工具文件 `delusional-ai` 会复制到目录 `/usr/local/delusional-terminal-ai`；
   - 安装时会记录您的 alias 至标记文件 `/usr/local/share/ai_terminal_installed_cmd`。
3. **重要提示**：安装完成后，请手动将以下 alias 添加到您的 shell 配置文件（如 `~/.zshrc` 或 `~/.bashrc`）：
   ```
   alias <alias名称>='/usr/local/delusional-terminal-ai/delusional-ai'
   ```
   添加后重启 shell 或执行 `source 配置文件` 以使 alias 生效。

## 卸载
使用提供的`uninstall.sh`脚本
