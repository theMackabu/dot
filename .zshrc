# goto directory by name
setopt autocd

# zsh plugins
source $HOME/.config/plugins/completion/completion.zsh
source $HOME/.config/plugins/fsh/fast-syntax-highlighting.plugin.zsh
source $HOME/.config/plugins/autosuggestions/zsh-autosuggestions.plugin.zsh

# enable built in scripts
source $HOME/.local/scripts/entry.sh

# shell configuration
typeset -A \
  prompt_with_newline_terminals \
  multiplexer_terminals \
  unsupported_terminals \
  logo_ls_enabled_terminals

prompt_with_newline_terminals=(
  [iTerm.app]=1
  [Tabby]=1
  [ghostty]=1
)

multiplexer_terminals=(
  [tmux]=1
)

unsupported_terminals=(
  [WarpTerminal]=1
  [Apple_Terminal]=1
  [zed]=1
  [CodeEditApp_Terminal]=1
  [Jetbrains.Fleet]=1
)

logo_ls_enabled_terminals=(
  [iTerm.app]=1
  [""]=1
  [ghostty]=1
  [tmux]=1
  [CodeEditApp_Terminal]=1
  [Jetbrains.Fleet]=1
)

# check which group the current terminal belongs to
if [[ -n ${prompt_with_newline_terminals[$TERM_PROGRAM]} ]]; then
  # newline after every command
  precmd() precmd() echo
  eval "$(oh-my-posh init zsh --config $HOME/.config/themes/spaceship.omp.json)"
elif [[ -n ${multiplexer_terminals[$TERM_PROGRAM]} ]]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/themes/spaceship.tmux.json)"
elif [[ -z ${unsupported_terminals[$TERM_PROGRAM]} ]]; then
  # default case for all other terminals
  if [[ "$PWD" != "$HOME/Developer/rust/playground"* ]]; then
    eval "$(oh-my-posh init zsh --config $HOME/.config/themes/custom/agnoster.yml)"
  fi
fi

if [[ -n ${logo_ls_enabled_terminals[$TERM_PROGRAM]} ]]; then
  alias ls="logo-ls"
  alias l="/bin/ls"
fi

# bun completions
[ -s "/Users/themackabu/.bun/_bun" ] && source "/Users/themackabu/.bun/_bun"

# gnupg
export GPG_TTY=$(tty)

# visual editor
export EDITOR=meow

# return symbol
PROMPT_EOL_MARK="⏎"

# neovim
alias nv='nvim'

# get path
alias path='echo -e ${PATH//:/\\n}'

# get time
alias now='date +"%T"'

# meow
alias meow='_meow_handler'
alias mrrp='_meow_handler'
alias ':3'='_meow_handler'

# gui editor
alias edit="open -a CotEditor"

# funny quotes
alias quote="fortune | cowsay -W 30"

# get your ip
alias myip="curl ip.themackabu.dev"

# gnu coreutils
alias date='gdate'

# cute
alias boykisser="cowsay -f $HOME/Downloads/boykisser.cow"

alias myinfo="PF_INFO='ascii title os host kernel uptime pkgs memory' HOSTNAME=M1Pro pfetch"
alias picofetch="PF_INFO='title os host kernel uptime pkgs memory' HOSTNAME=M1Pro pfetch"

# make homebrew faster
export HOMEBREW_NO_AUTO_UPDATE=1

# deno
export DENO_INSTALL="/Users/themackabu/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# tailscale
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

# uwufetch
alias uwu="uwufetch --image ~/Desktop/awww.png"

# vm.framework
alias vm="limactl"
alias vx="lima"

# password manager
alias pass="gopass"

# cursor editor
alias c="cursor"

# close cloudflare warp
alias dewarp="killall 'Cloudflare WARP'"

# just js
alias just="~/Developer/rust/js_runtime/just"

# python
alias python="python3"
alias pip="python3 -m pip"

# godot cli
alias godot="/Applications/Godot.app/Contents/MacOS/Godot"

# pnpm
export PNPM_HOME="/Users/themackabu/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# screenshot shadow toggles
alias screen_shadow_on="defaults write com.apple.screencapture 'disable-shadow' -bool 'false'"
alias screen_shadow_off="defaults write com.apple.screencapture 'disable-shadow' -bool 'true'"

# count lines of code
alias lines="cloc"

# bat-kat
alias kat="bat"

# youtube DL mp3
alias ytmp3="noglob yt-dlp -f bestaudio --extract-audio --audio-quality 0 --audio-format mp3 -o '%(title)s.%(ext)s'"

# youtube DL mp4
alias ytdl="noglob yt-dlp -f best --format mp4 -o '%(title)s.%(ext)s'"

# best quality
alias bestdl="noglob yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' --format mp4 -o '%(title)s.%(ext)s'"

# disable globbing
alias s3mp3="noglob s3mp3"
alias gencov="noglob generate_cover"

function s3yt {
  s3mp3 "https://youtu.be/$1"
}

function s3ls {
  mc ls "s3/$1"
}

function s3mls {
  s3ls "mp3-embed/$1"
}

# youtube DL cover art
alias ytcov="ytmp3 --add-metadata --ppa \"ThumbnailsConvertor+ffmpeg_o:-c:v png -vf crop='ih'\" --embed-thumbnail --postprocessor-args \"-id3v2_version 3\" -o \"%(uploader)s/%(title)s.%(ext)s\""

# android studio path
export ANDROID_HOME=/Users/themackabu/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Wasmer
export WASMTIME_HOME="$HOME/.wasmtime"
export PATH="$WASMTIME_HOME/bin:$PATH"
export WASMER_DIR="/Users/themackabu/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

# llvm
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# postgres lib
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libpq/include"

# modular
export MODULAR_HOME="$HOME/.modular"
export PATH="$MODULAR_HOME/pkg/packages.modular.com_mojo/bin:$PATH"

# java latest version
export JAVA_TOOL_OPTIONS="--enable-preview"

# arc browser
alias arc="open -a Arc.app --args --disable-blink-features=PrettyPrintJSONDocument"

# cargo
# export CARGO_REGISTRIES_CRATES_IO_PROTOCOL="git cargo fetch"
# export CARGO_REGISTRIES_CRATES_IO_PROTOCOL="git cargo upgrade"
# export CARGO_NET_GIT_FETCH_WITH_CLI=true
# export CARGO_REGISTRIES_CRATES_IO_PROTOCOL=git

# rust nova path
export RA_PATH="/Users/themackabu/.cargo/bin/rust-analyzer"

# thefuck autocorrect
eval $(thefuck --alias)

# broot
source /Users/themackabu/.config/broot/launcher/bash/br

# fastfetch
alias ff="fastfetch --cpu-temp --gpu-temp --battery-temp"
alias neofetch="fastfetch --cpu-temp --gpu-temp --battery-temp"
alias lnconfig="~/.config/fastfetch/link_config.sh"

# piracy.mp3
function car {
  tr A-Z a-z <<< "$1" | sed -e 's/[^ ]/:pi8&:/g' -e 's/ /:pi8blank:/g'
}

# link homebrew items that aren't in path
function blink {
  local targetdir
  targetdir=($(brew --cellar $1)/*/bin) || return
  local linksdir=$(brew --repo)/bin

  for ex in $(find "$targetdir" -type f -maxdepth 1); do
    local exname=${ex##*/}
    if builtin which "$exname" &>/dev/null; then
      echo "  $exname already available in the path - skipped"
    else
      ln -s "$ex" "$linksdir/" && echo "$exname linked from $linksdir"
    fi
  done
}

# ampere simple ssh
alias ampere="ssh ampere -t"

# command handler
function command_not_found_handler() {
  if [[ $1 == "ampere-"* ]]; then
    cmd=${1#ampere-}
    ampere "$cmd"
    return 0
  fi
    
  echo "zsh: command not found: $1"
  return 127
}

# git branch remote cleanup
clean_local_branches() {
  local remote=${1:-origin}
  
  for branch in $(git branch | sed 's/\*//'); do
    if [ -z "$(git branch --all | grep $remote | grep $branch)" ]; then
      git branch -D $branch
    fi
  done
}

# handle meowing
_meow_handler() { [ $# -gt 0 ] && $HOME/.cargo/bin/meow "$@" || echo "meow"; }

# lm studio
export PATH="$PATH:/Users/themackabu/.lmstudio/bin"

# moon monorepo
export PATH="/Users/themackabu/.moon/bin:$PATH"

# cargo-mommy
alias cargo="cargo mommy"

export CARGO_MOMMYS_ROLES="mommy"
export CARGO_MOMMYS_PRONOUNS="her"
export CARGO_MOMMYS_LITTLE="boy/pet/kitty/sharky/cutie"
export CARGO_MOMMYS_EMOTES="❤️/💖/💗/💓/💞/:3"
