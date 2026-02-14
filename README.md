# to-vim-tmux-zsh

开箱即用的 Neovim + tmux + zsh 开发环境配置。

## 安装

### 依赖

- [Neovim](https://neovim.io/) (>= 0.11.0)
- [Nerd Fonts](https://www.nerdfonts.com/)
- [oh-my-zsh](https://ohmyz.sh/)
- [powerlevel10k](https://github.com/romkatv/powerlevel10k) — zsh 主题
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) — zsh 插件
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) — zsh 插件
- [omz-plugin-pnpm](https://github.com/ntnyq/omz-plugin-pnpm) — zsh 插件（pnpm 补全）

### 步骤

```bash
# 克隆仓库
git clone git@github.com:FengShangWuQi/to-vim-tmux-zsh.git ~/Documents/to-vim-tmux-zsh

# 建立软链接（如已有同名文件，请先备份）
ln -s ~/Documents/to-vim-tmux-zsh/.config/nvim ~/.config/nvim
ln -s ~/Documents/to-vim-tmux-zsh/.tmux.conf ~/.tmux.conf
ln -s ~/Documents/to-vim-tmux-zsh/.tmux.conf.local ~/.tmux.conf.local
ln -s ~/Documents/to-vim-tmux-zsh/.zshrc ~/.zshrc
ln -s ~/Documents/to-vim-tmux-zsh/.p10k.zsh ~/.p10k.zsh
```

首次启动 `nvim`，[lazy.nvim](https://github.com/folke/lazy.nvim) 会自动安装所有插件。

## Neovim

本项目选择 Neovim 而非 Vim：

- **Lua 配置** — 用真正的编程语言写配置，逻辑清晰，远比 VimScript 易读易维护
- **内置 LSP 客户端** — 原生支持语言服务协议，无需依赖重量级插件即可获得补全、跳转、重构等能力
- **内置 Tree-sitter** — 基于语法树的高亮和代码分析，比正则匹配更精准
- **异步架构** — 基于 libuv 的异步 I/O，插件运行不阻塞编辑
- **现代插件生态** — Telescope、lazy.nvim、nvim-cmp 等活跃插件均为 Neovim 专属，社区发展更快

基于 [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) 的精简配置，开箱即用。

### 模式

Neovim 是模态编辑器，不同模式下按键含义不同：

| 模式 | 进入方式 | 用途 |
|---|---|---|
| Normal | `Esc` | 默认模式，用于导航和执行命令 |
| Insert | `i` / `a` / `o` | 输入文本 |
| Visual | `v` / `V` / `Ctrl-v` | 选择文本 |
| Command | `:` | 执行命令（如 `:w` 保存，`:q` 退出） |

> 首次使用建议在 Neovim 中运行 `:Tutor`，跟随内置教程学习基础操作。

### 基础操作

```
# 移动

h j k l                 左 下 上 右
w / b                   下一个 / 上一个单词
0 / $                   行首 / 行尾
gg / G                  文件开头 / 文件末尾
Ctrl-d / Ctrl-u         向下 / 向上翻半页

# 编辑

i / a                   光标前 / 光标后插入
o / O                   下方 / 上方新建一行
x                       删除光标处字符
dd                      删除整行
yy                      复制整行
p                       粘贴
u / Ctrl-r              撤销 / 重做
.                       重复上一次操作

# 组合操作（动词 + 范围）

dw                      删除一个单词
ciw                     修改光标所在单词
di"                     删除引号内的内容
ya)                     复制括号内的内容（含括号）
```

### Leader 键

本配置的 Leader 键为 **空格键**。按下空格后等待片刻，[which-key](https://github.com/folke/which-key.nvim) 会弹出提示面板，显示所有可用的后续按键。

### 搜索（Telescope）

| 快捷键 | 功能 |
|---|---|
| `<leader>sf` | 搜索文件 |
| `<leader>sg` | 全局内容搜索（grep） |
| `<leader>sw` | 搜索光标所在单词 |
| `<leader>s.` | 最近打开的文件 |
| `<leader>sr` | 恢复上次搜索 |
| `<leader>/` | 当前文件内搜索 |
| `<leader><leader>` | 切换 buffer |
| `<leader>sh` | 搜索帮助文档 |
| `<leader>sk` | 搜索快捷键 |

### 文件树（Neo-tree）

启动 nvim 会自动打开文件树，`Ctrl-l` 切换到编辑区，`Ctrl-h` 切回文件树。

| 快捷键 | 功能 |
|---|---|
| `Ctrl-t` | 打开 / 关闭文件树 |
| `Ctrl-f` | 在文件树中定位当前文件 |

文件树内操作：`Enter` 打开文件，`a` 新建，`d` 删除，`r` 重命名，`m` 移动。

### 代码导航与编辑（LSP）

| 快捷键 | 功能 |
|---|---|
| `grd` | 跳转到定义 |
| `grr` | 查找引用 |
| `grn` | 重命名符号 |
| `gra` | 代码操作（Code Action） |
| `gri` | 跳转到实现 |
| `gO` | 当前文件符号列表 |
| `K` | 查看悬浮文档 |
| `<leader>f` | 格式化当前文件 |
| `<leader>th` | 切换 Inlay Hints |

自动补全在输入时触发，`Ctrl-n` / `Ctrl-p` 上下选择，`Ctrl-y` 确认。

### 注释

| 快捷键 | 功能 |
|---|---|
| `gcc` | 切换当前行注释 |
| `gc` + 动作 | 切换选区注释（如 `gcap` 注释整段） |

### Git

| 快捷键 | 功能 |
|---|---|
| `]c` / `[c` | 下一个 / 上一个修改块（hunk） |
| `<leader>gd` | 打开 Git diff |
| `<leader>gh` | 当前文件历史 |
| `<leader>gH` | 分支历史 |

### 窗口与分屏

| 快捷键 | 功能 |
|---|---|
| `Ctrl-h/j/k/l` | 在窗口间移动焦点 |
| `:vs` / `:sp` | 垂直 / 水平分屏 |
| `:q` | 关闭当前窗口 |

### 常用命令

```
:w                      保存
:q                      退出（未保存会提示）
:wq 或 ZZ               保存并退出
:Mason                  管理语言服务（安装 / 更新 LSP）
:Lazy                   管理插件
:MarkdownPreview        预览 Markdown
:checkhealth            检查环境是否正常
```

### 学习资源

- [Learn Vim](https://github.com/iggredible/Learn-Vim) — Vim/Neovim 入门书
- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) — 配置模板，注释即教程
- [Lua 快速入门](https://learnxinyminutes.com/docs/lua/) — 10-15 分钟了解 Lua 基础

## tmux

一个窗口，帮你搞定所有

## zsh

非常棒的 shell，没理由再使用 bash
