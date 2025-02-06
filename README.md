# Delusional Terminal AI

一个基于命令行的 AI 聊天助手，支持上下文记忆、API 密钥管理和自定义配置。

## 功能特点

- 🤖 基于 DeepSeek API 的智能对话
- 💭 支持上下文记忆功能
- 🔑 安全的 API 密钥管理
- ⚙️ 可自定义配置（最大对话轮数、记忆开关等）
- 🧹 自动清理过期历史记录
- 🎨 彩色输出界面

## 系统要求

- Unix-like 操作系统 (Linux/MacOS)
- bash 或 zsh shell
- 必需工具：
  - curl
  - jq

## 安装方法

1. 克隆仓库：
```bash
git clone https://github.com/ForsakenDelusion/Delusional-Terminal-Ai
cd Delusional-Terminal-Ai
```

2. 运行安装脚本：
```bash
./install.sh
```

3. 根据提示设置命令别名（默认为 'ai'）

4. 设置 API 密钥：
```bash
ai -key YOUR_API_KEY
```

## 使用说明

### 基本用法

```bash
ai "你的问题"                # 询问问题
```

### 配置选项

```bash
ai -key [API_KEY]           # 设置或清除 API 密钥
ai -memory on/off           # 开启/关闭记忆功能
ai -clean                   # 清理对话历史
ai -status                  # 显示当前配置状态
ai -max [NUMBER]           # 设置最大对话轮数
ai -help                   # 显示帮助信息
```

### 命令别名

支持以下简写形式：
- `-k` = `-key`
- `-m` = `-memory`
- `-c` = `-clean`
- `-s` = `-status`
- `-h` = `-help`
- `-x` = `-max`

### 示例

```bash
# 询问编程问题
ai "如何使用 Python 实现快速排序？"

# 开启记忆功能
ai -memory on

# 设置最大对话轮数
ai -max 30

# 查看当前状态
ai -status
```

## 配置文件

- 配置目录：`~/.config/delusional-terminal-ai/`
- 设置文件：`settings.cfg`
- 对话历史：`dialog_history.json`

## 卸载

运行卸载脚本：
```bash
./uninstall.sh
```

## 安全性

- 配置文件权限设置为 600
- 自动清理超过 3 天的历史记录

## 故障排除

1. 如果遇到权限问题：
   ```bash
   sudo chmod +x install.sh uninstall.sh delusional-ai
   ```

2. 清除记忆：
   ```bash
   ai -clean
   ```

## 计划清单

- [ ] 加入切换DeepSeek深度思考

- [ ] 自定义大模型调用

- [ ] 自定义模型url

- [ ] ~~rust重构。。。。？~~

## 贡献

欢迎提交 Issue 和 Pull Request！

## 许可证

MIT License

## 致谢

- DeepSeek API 提供支持
- 感谢所有贡献者的支持