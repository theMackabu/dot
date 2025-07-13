# mise runtimes manager
eval "$(mise activate zsh)"
eval "$(mise hook-env)"

# set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# bun runtime
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# jetbrains toolbox
export PATH="$PATH:/Users/themackabu/Library/Application Support/JetBrains/Toolbox/scripts"

# Virtualization.framework cli
export VMCTLDIR="$HOME/Documents/vm"

# golang modules
export GOPATH="$HOME/.local/share/go"