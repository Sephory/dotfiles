#!/bin/zsh

bindkey -v

setopt autocd extendedglob notify promptsubst

HISTFILE=~/.history
HISTSIZE=1000
SAVEHIST=1000
KEYTIMEOUT=1

VISUAL=nvim
EDITOR=nvim
alias e=$EDITOR
alias es="e -S"

export DOTNET_ROOT=~/.dotnet
path+=(~/.yarn/bin)
path+=(~/.cargo/bin)
path+=(~/.go/bin)
path+=(~/.dotnet)
path+=(~/.dotnet/tools)
path+=(~/.local/bin)
path+=(~/.scripts)
export PATH

function auto_title {
  : ${1=%~}
  print -Pn "\e]2;${1:q}\a"
}

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

autoload -Uz add-zsh-hook
add-zsh-hook precmd auto_title
add-zsh-hook preexec auto_title

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit


# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust


# Starship Prompt
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

# Plugins
zinit ice atinit"
  ZSH_TMUX_FIXTERM_WITH_256COLOR=tmux-256color;
  ZSH_TMUX_FIXTERM_WITHOUT_256COLOR=tmux;
  ZSH_TMUX_FIXTERM=true;
  ZSH_TMUX_AUTOSTART=true;
  ZSH_TMUX_DEFAULT_SESSION_NAME=Home" \
  svn src="tmux.plugin.zsh"
zinit snippet OMZP::tmux

zinit wait lucid for \
  OMZL::clipboard.zsh \
  OMZL::compfix.zsh \
  OMZL::completion.zsh \
  OMZL::correction.zsh \
  OMZL::directories.zsh \
  OMZL::git.zsh \
  OMZL::history.zsh \
  OMZL::prompt_info_functions.zsh \
  OMZL::spectrum.zsh \
  atload"DISABLE_AUTO_TITLE=true"\
    OMZL::termsupport.zsh \
  OMZL::theme-and-appearance.zsh \
  atinit"
    VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
    VI_MODE_SET_CURSOR=true" \
    OMZP::vi-mode \
  OMZP::fzf \
  as"completion" svn \
    OMZP::ripgrep \
  as"completion" svn \
    OMZP::fd \
  OMZP::git \
  OMZP::cp \
  OMZP::docker-compose \
  OMZP::dotnet \
  OMZP::node \
  OMZP::yarn \
  OMZP::npm

zinit as"program" pick"bin/git-dsf" \
      wait lucid for \
  zdharma-continuum/zsh-diff-so-fancy

zinit wait lucid for \
  blockf atpull"zinit creinstall -q ." \
    zsh-users/zsh-completions \
  atinit"zicompinit;zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting

# Start with Insert Mode Cursor
echo -ne '\e[5 q'
