# Load the pure theme, with zsh-async library that's bundled with it.
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure
# Load the zsh-syntax-highlighting plugin.
zinit ice depth=1; zinit light romkatv/powerlevel10k
# Load the zsh-autosuggestions plugin.
zinit light zsh-users/zsh-autosuggestions