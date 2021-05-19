> ## Tmux

- session：会话，一个服务器可以包含多个会话
- window：窗口，一个会话可以包含多个窗口
- pane：面板，一个窗口可以包含多个面板

## Usage

```
# Basic
tmux new -s: Start new with session name
tmux a -t: Attach to named
tmux ls: List sessions
tmux kill-session -t: Kill session

<prefix> r: Reload configuration
<prefix> (: Switch to previous client
<prefix> ): Switch to next client
<prefix> ?: List key bindings

# sessions
<prefix> :new + enter: Create new sessions
<prefix> s: Choose a session from a list
<prefix> $: Rename current session

# window
<prefix> c: Create window
<prefix> ,: Rename current window
<prefix> &: Kill current window

# pane
<prefix> %: Vertical split
<prefix> ": Horizontal split

<prefix> o: Select the next pane
<prefix> x: Kill the active pane
<prefix> q: Display pane numbers
<prefix> q + number: Goto that pane
<prefix> {: Swap the active pane with the pane above
<prefix> }: Swap the active pane with the pane below

# tmux-resurrect plugin
<prefix> S: Save
<prefix> R: Restore
```
