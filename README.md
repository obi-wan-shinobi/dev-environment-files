# My Dev Environment Files

Inspired from [Josean Martinez's repository](https://github.com/josean-dev/dev-environment-files/tree/main)

# Installing stow and cloning the repository

Install [GNU stow](https://www.gnu.org/software/stow/) with the package manager of your choice.

CLone this repository in your user home

```zsh
git clone https://github.com/obi-wan-shinobi/dev-environment-files.git ~/dev-environment-files
```

# Zsh setup

Before using the [.zshrc](.zshrc) configuration, you need to make sure you have zsh and [oh-my-zsh](https://ohmyz.sh/#install) installed.

After installing oh-my-zsh, you might notice that the shell throws an error for a couple of plugins: `zsh-syntax-highlighting` and `zsh-autosuggestions`

We need to install these separately by following the process here:

- [zsh-autosuggestions install guide](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)
- [zsh-syntax-highlighting guide](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)

After you're done, we need to install node version manager (nvm) and `node` because a few neovim plugins require `npm`

Follow the steps here: [nvm install guide](https://github.com/nvm-sh/nvm?tab=readme-ov-file#install--update-script)

After doing that, if you only want to use the zsh config, you can go ahead and stow it from inside the folder (make sure the file doesn't already exist in `$HOME` directory)

```zsh
stow .
```

# Tmux setup

After installing Zsh, we need to install the tmux binary package. Follow the [tmux install guide](https://github.com/tmux/tmux/wiki/Installing#binary-packages)

Once you have installed tmux, you need to install the tmux plugin manager ([tpm](https://github.com/tmux-plugins/tpm)) by cloning the tpm repository to `~/.tmux/plugins/tpm` directory.

Clone tpm:

```zsh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

You can run stow again to create symlinks for .config/tmux/tmux.conf to ~/.config/tmux/tmux.conf

Run a tmux session and install the plugins using `<C-Space>I`

# Neovim Setup

Before using the configuration files, you need to install the latest neovim binaries. Folow the steps below to remain compatible with the current configuration. Alternatively, you can follow the [install guide](https://github.com/neovim/neovim/blob/master/INSTALL.md), just make sure you update the `PATH` variable in `.zshrc`.

## Pre-built archives

Download the latest neovim binaries, remove any previous installation from the optional (`/opt`) directory, extract the files to the `HOME` directory and rename the directory to `neovim`

```zsh
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C ~/ -xzf nvim-linux64.tar.gz
mv nvim-linux64 neovim
```

Stow the `.config/nvim` to create symlinks to `~/.config/nvim` and run `nvim` from anywhere to install `Lazy` and other plugins.

### Notes

If you are unable to load a preview using the markdown-preview plugin, refer this [thread](https://github.com/iamcco/markdown-preview.nvim/issues/148#issuecomment-1921780253)

If you get an error saying `No "python3" provider found. Run :checkhealth provider`, you need to install `pynvim` using

```zsh
pip3 install pynvim
```
