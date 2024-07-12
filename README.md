# Neovim dotfiles

Here it comes the first major version of my neovim configuration. Made possible thanks to [LunarVim / nvim-basic-ide](https://github.com/LunarVim/nvim-basic-ide).

### Migration guide to lazy from packer

Now this config uses `lazy.nvim` as a plugin manager, so if you are migrating from packer you should probably remove
`$HOME/.local/share/nvim` and re-open nvim to re-install the plugins to not face any issues.

## Install Neovim 0.10

You can install Neovim with your package manager e.g. brew, apt, pacman etc.. but remember that when you update your packages Neovim may be upgraded to a newer version.

If you would like to make sure Neovim only updates when you want it to than I recommend installing from source:

**NOTE** Verify the required [build prerequisites](https://github.com/neovim/neovim/wiki/Building-Neovim#build-prerequisites) for your system.

```sh
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout release-0.10
make CMAKE_BUILD_TYPE=Release
sudo make install
```
## Dependencies
- flake8
- pynvim
- ripgrep

> Note: I recommend installing [lazygit](https://github.com/jesseduffield/lazygit) alongside neovim for a better development experience.

## Install the config

Make sure to remove or backup your current `nvim` directory

```sh
git clone https://github.com/didacdomenech/nvim.git ~/.config/nvim
```

> Note: Installation is different on Windows. Inside %APPDATA% you will find the `local` directory. Clone it there are you should good to go.

Run `nvim` and wait for the plugins to be installed

> Note: (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim)
> Note: Checkout this file for some predefined keymaps: [keymaps](https://github.com/LunarVim/nvim-basic-ide/tree/master/lua/keymaps.lua)

## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

You'll probably notice you don't have support for copy/paste also that python and node haven't been setup

So let's fix that

First we'll fix copy/paste

- On mac `pbcopy` should be builtin

- On Ubuntu

  ```sh
  sudo apt install xsel # for X11
  sudo apt install wl-clipboard # for wayland
  ```

Next we need to install python support (node is optional)

- Neovim python support (no longer required on some systems)

  ```sh
  pip install pynvim
  ```

- Neovim node support

  ```sh
  npm i -g neovim
  ```

We will also need `ripgrep` for Telescope to work:

- Ripgrep

  ```sh
  sudo apt install ripgrep
  ```

---

> Note: make sure you have [node](https://nodejs.org/en/) installed, I recommend a node manager like [fnm](https://github.com/Schniz/fnm).

## Fonts

I recommend using the following repo to get a "Nerd Font" (Font that supports icons). By default, my configuration uses JetBrains Nerd Font for GUIs like neovide. Change it in `lua/user/options.lua` to whatever you prefer.

[getnf](https://github.com/ronniedroid/getnf)

## Configuration

### LSP

To add a new LSP

First Enter:

```
:Mason
```

and press `i` on the Language Server you wish to install

Next you will need to add the server to this list: [servers](https://github.com/LunarVim/nvim-basic-ide/tree/master/lua/utils/init.lua#L3)
Note: Builtin LSP doesn't contain all lsps from [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#terraform_lsp).

If you want to install any from there, for example terraform_lsp(which adds more functionality than terraformls, like complete resource listing),

1. You can add the lsp name in [mason lsp block](https://github.com/LunarVim/nvim-basic-ide/tree/master/user/utils/init.lua#L3-L13)

```lua
-- lua/utils/init.lua
M.servers = {
	"lua_ls",
	"cssls",
	"html",
	"tsserver",
	"pyright",
	"bashls",
	"jsonls",
	"yamlls",
    "terraform_lsp" -- New LSP
}
```

2. Manually install the binary of the lsp and put it in your path by downloading the binary or through your package manager. For terraform_lsp [example](https://github.com/juliosueiras/terraform-lsp/releases)

### Formatters and linters

Make sure the formatter or linter is installed and add it to this setup function: [null-ls](https://github.com/LunarVim/nvim-basic-ide/blob/e6b6c96280ca730a2564f2e36050df055acfb1a8/lua/user/null-ls.lua#L22)

> Note: Some are already setup as examples, remove them if you want

### Plugins

### You can install new plugins here: [plugins](https://github.com/LunarVim/nvim-basic-ide/tree/master/lua/user)

Here is the wiki for installing new plugins refer to this: [wiki](https://github.com/LunarVim/nvim-basic-ide/wiki/adding_new_plugins)


