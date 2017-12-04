#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# common path
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
export PATH=/usr/local/bin:$PATH

# for go
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin

# for alias
alias vi="nvim"
alias vim="nvim"
alias bye='sudo shutdown -h now'
alias gst='git status'
alias diff='colordiff'
alias less='less -R'
export XDG_CONFIG_HOME="$HOME/.config"

# for keymap
bindkey -e

# for Android
export PATH=$PATH:/Users/yanai/Library/Android/sdk/platform-tools
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_NDK_HOME="$HOME/Library/Android/ndk"
export PATH=${PATH}:$ANDROID_NDK_HOME
export BUILD_TOOL="$HOME/Library/Android/sdk.build-tools/26.0.1/"
export PATH=${PATH}:$BUILD_TOOL

alias zipalign="/Users/yanai/Library/Android/sdk/build-tools/26.0.1/zipalign"
alias apksigner="/Users/yanai/Library/Android/sdk/build-tools/26.0.1/apksigner"

# for perl
PERL_MB_OPT="--install_base \"/Users/yana/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/yana/perl5"; export PERL_MM_OPT;
export PERL5LIB="/Users/my_user/perl5/lib/perl5:/Library/Perl/5.16:/Applications/Xcode.app/Contents/Developer/Library/Perl/5.16"

# for peco
function peco-select-history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(\history -n 1 | \
    eval $tac | \
    peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

#for rbenv
if which rbenv > /dev/null; then
  eval "$(rbenv init -)";
fi
