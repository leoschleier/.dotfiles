# .dotfiles

Leo's .dotfiles.

## LSP

This config uses `mason-lspconfig` to automatically install most LSPs. Empirically, some issues can occur when using this installation method for `rust-analyzer`. Therefore, the present config relies on manual installation of the `rust-analyzer`.

Install `rust-analyzer` manually as follows (see [Rust Docs](https://www.rust-lang.org/tools/install)):

```bash
# Install rustup as a standalone
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install rust-analyzer
rustup component add rust-analyzer
```

Once installed, all language servers are being set up using `nvim-lspconfig`.

## Copilot

To setup GitHub Copilot with Neovim, use `:Copilot setup`. Press `Tab` in insert mode to accept the suggestion and `Ctrl-]` to dismiss.
