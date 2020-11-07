# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi



# 查看系统中内置的几种 shell
# cat /etc/shells

# 设置 zsh 为默认 shell
# chsh -s /bin/zsh

# 查看当前 shell
# echo $SHELL


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git					# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/README.md

	# gst       // git status
	# ga        // git add
	# gc!       // git commit -v --amend
	# gcn!			// git commit -v --no-edit --amend
	# gcmsg     // git commit -m
	# ggu       // git pull --rebase origin $(current_branch)
	# ggp       // git push origin $(current_branch)
	# ggf				// git push --force origin $(current_branch)
	# glo       // git log --oneline --decorate
	# gb				// git branch
	# gba				// git branch -a
	# gbD				// git branch -D
	# gcb				// git checkout -b
	# gco				// git checkout
	# gcf				// git config --list
	# gcp				// git cherry-pick
	# grbc			// git rebase --continue
	# gstl			// git stash list
	# gstp			// git stash pop

	npm					# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/npm/README.md

	# npmI			// npm init
	# npmD			// npm i -D
	# npmL			// npm list
	# npmL0     // npm ls --depth=0
	# npmst    	// npm start
	# npmt      // npm test
	# npmR      // npm run
	# npmO      // npm outdated
	# npmV			// npm -v

	yarn				# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/yarn/README.md

	# y					// yarn
	# ya				// yarn add
	# yad				// yarn add --dev
	# yrm				// yarn remove
	# yb				// yarn build
	# yi				// yarn init
	# yln				// yarn lint
	# yls				// yarn list
	# yout			// yarn outdated
	# yst				// yarn start
	# yt				// yarn test
	# yw				// yarn workspace
	# yws				// yarn workspaces

	tmux				# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/tmux/README.md

	# ta        // tmux attach -t
	# tkss      // tmux kill-session -t
	# ts        // tmux new-session -s
	# tl        // tmux list-sessions

	z						# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/z/README.md

	zsh-syntax-highlighting			# https://github.com/zsh-users/zsh-syntax-highlighting
	zsh-autosuggestions					# https://github.com/zsh-users/zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

alias python="/usr/local/bin/python3"

export FZF_DEFAULT_COMMAND="rg --files --smart-case --hidden --follow --sortr modified -g '!*.git'"
