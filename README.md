# aliyun-dotfiles

一键自动化配置服务器环境（Bash & Vim）的轻量脚本，适合在新购的云服务器（如阿里云 ECS）上快速搭建顺手的命令行体验。

## 功能

运行 [`install.sh`](install.sh) 会自动完成以下配置：

- **Vim 配置** (`~/.vimrc`)：语法高亮、行号与相对行号、当前行高亮、4 空格缩进、智能搜索、UTF-8 编码、深色主题适配，以及 `Ctrl+s` 保存、`Ctrl+q` 退出、`Ctrl+a` 全选等快捷键。
- **Bash 配置** (`~/.bash_aliases`)：
  - 极简彩色提示符（隐藏主机名，仅显示末级目录）。
  - 常用别名：`..` / `...` 快速返回上级目录、`c` 清屏、`path` 换行显示 PATH。
  - 安全别名：`rm` / `cp` / `mv` 默认带 `-i`，覆盖或删除前进行确认。
- **自动加载**：在 `~/.bashrc` 中注入加载逻辑，确保每次登录都生效。

## 使用方法

```bash
# 克隆仓库
git clone https://github.com/superice119/aliyun-dotfiles.git
cd aliyun-dotfiles

# 运行安装脚本
bash install.sh
```

或者一行命令直接运行：

```bash
curl -fsSL https://raw.githubusercontent.com/superice119/aliyun-dotfiles/main/install.sh | bash
```

安装完成后，重新登录终端或执行 `source ~/.bashrc` 即可生效。

## 说明

- 脚本会**覆盖**已有的 `~/.vimrc` 和 `~/.bash_aliases`，运行前请自行备份重要配置。
- 适用于 Bash 环境（Debian / Ubuntu 等常见发行版）。
