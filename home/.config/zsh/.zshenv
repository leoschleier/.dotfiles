# Homebrew — set HOMEBREW_PREFIX, HOMEBREW_CELLAR, HOMEBREW_REPOSITORY,
# and prepend Homebrew paths to PATH, MANPATH, and INFOPATH.
if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

[[ -f "$HOME/.env.local" ]] && . "$HOME/.env.local"

[[ -f "$HOME/.local/bin/env" ]] && . "$HOME/.local/bin/env"

[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"
