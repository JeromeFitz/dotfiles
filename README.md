# 💽️ @jeromefitz/dotfiles

Scripts (`zsh` && `Homebrew`) to set up and keep a machine up-to-date (`macos`).

## ⏱️ Speed Test

Latest on `2021-12-04`:

- This is/was run on a 2015 Macbook Pro so take with a grain of salt 🧂️ or two 🤣️

```bash
▲ .dotfiles [main] for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done
        0.19 real         0.09 user         0.10 sys
        0.19 real         0.08 user         0.09 sys
        0.19 real         0.09 user         0.09 sys
        0.18 real         0.08 user         0.09 sys
        0.19 real         0.09 user         0.10 sys
        0.19 real         0.08 user         0.09 sys
        0.19 real         0.09 user         0.10 sys
        0.18 real         0.08 user         0.09 sys
        0.19 real         0.09 user         0.09 sys
        0.19 real         0.09 user         0.09 sys
```

## ⬇️ Download

🥝️ **Fresh install?**

📝️ _**Note:** You’ll need to set the version._

```sh
curl -LJO -k https://github.com/JeromeFitz/dotfiles/archive/v2.1.0.tar.gz
mkdir -p ~/.dotfiles
tar -xf dotfiles-2.1.0.tar.gz -C ~/.dotfiles
```

:octocat: **Git installed?**

📝️ _**Note:** No need to set version._

```sh
git clone https://github.com/JeromeFitz/dotfiles.git ~/.dotfiles
```

## ♻️ Install

```sh
cd ~/.dotfiles

# Brewfile
sh ./script/bootstrap

# # # OR # # #

# Brewfile-Slim
sh ./script/bootstrap -s
```

This will go through:

- [x] :octocat: git config
- [x] 🔗️ symlinks
- [x] 🍺️ homebrew install (+ post installs)
  - [x] 💎️ `Brewfile|Brewfile-Slim`
- [x] 🛠️ zsh configuration
- [x] 🤓️ zsh functions

### :octocat: git config

Prompt for `git`: `username|authorname|authoremail`

Sets up `gitconfig.private.symlink` which is included w/in `gitconfig.symlink` and not attributed to repo. 🙈️

### 🔗️ symlinks

Will set up `~/.[xyz]` with:

```sh
└─── symlinks
│   │   hyper.js.symlink
│   │   zshrc.symylink
│   │   *.symlink
```

### 🍺️ homebrew install

Peep the `Brewfile|Brewfile-Slim` in root to see what all will be installed.

Afterward, this will run every install located in:

```sh
└─── config
│   │  *.install.sh
```

#### 🧹️ homebrew cleanup

```bash
brew bundle cleanup
```

Will show any installation from Homebrew not in `Brewfile`.

```bash
brew bundle cleanup -f
```

Will uninstall those extra `brew|cask|tap|...`.

### 🛠️ zsh configuration

```sh
└─── config
│   │   sandboxd.plugin.zsh
│   │   *.path.zsh
│   │   *.!completion.zsh
│   │   *.completion.zsh
```

#### 🔥️ config.setup.zsh

Created/Maintained via `./scripts/zsh-config-setup`. That will cycle through the above (`path|*|completion`) to generate a hard-code list to `source` from that is pulled in via `zshrc.symlink`.

By not `typeset`’ing and looping through on `zsh` init dynamically we save `~0.56s`. 😅️

These files rarely change, so we can side-step the init hit.

The following can be run to keep up-to-date on any changes you make:

```bash
zsh-config-setup
```

And will also update via the `boostrap` and `dot` commands. 💯️

📝️ _**Note:** If we ran this dynamically first, and cached for subsequent sessions that could be a down the line trade-off for proper dynamic sourcing._

#### 🥪️ sandboxd

Utilizes [`sandboxd`](https://github.com/benvan/sandboxd) for:

- `nvm`
- `pyenv`
- `ruby`

### 🤓️ zsh functions

> `dot` is a simple script that installs some dependencies, sets sane macOS defaults, and so on. Tweak this script, and occasionally run `dot` from time to time to keep your environment fresh and up-to-date. You can find this script in `bin/`.
>
> ref: [@holman/dotfiles](https://github.com/holman/dotfiles/blob/master/bin/dot)

#### 🚈️ Slim

`dot -s` will run from `Brewfile-Slim` which is a reduced Brewfile.

## 📦️ other packages

This may seem a bit verbose, however, keeps things consistent:

- [`@jeromefitz/codestyle`](https://github.com/JeromeFitz/packages/tree/main/packages/codestyle)
  - Preferred code formatting for repo
- [`@jeromefitz/git-cz`](https://github.com/JeromeFitz/packages/tree/main/packages/git-cz)
  - Conventional Commits w/ Emojis
- [`@jeromefitz/semantic`](https://github.com/JeromeFitz/packages/tree/main/packages/semantic)
  - Semantic Release for Versioning

## 🙇️ References

Over the years I have revamped this a bit through inspiration and sheer 🍽️ `fork`ery:

- ~~croaky/dotfiles~~ 🪦️
- [thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles) 🤖️
- [thoughtbot/laptop](https://github.com/thoughtbot/laptop) 🤖️
- [dot-local](http://robots.thoughtbot.com/manage-team-and-personal-dotfiles-together-with-rcm) 🤖️
- [holman](https://github.com/holman/dotfiles)
- [jacobwgillespie](https://github.com/jacobwgillespie/dotfiles)

Latest iteration is specifically heavy from [`rholman`](#%EF%B8%8F-references) && [`jacobwgillespie`](#%EF%B8%8F-references). 🏆️

## 🔒️ \*.private

I personally prefer `.private` instead of `.local` and have a separate 🔒️ [repo](https://github.com/JeromeFitz/dotfiles-private) 🔒️ that symlinks (& sources from there...):

- `vimrc.private.symlink`
- `zshrc.private.symlink`

You are not missing anything, I assure you. (`alias` for directory changes that I do not want to put on blast basically either for NDA or contract purposes.) 🤣️
