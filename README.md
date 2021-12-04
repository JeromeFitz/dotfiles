# 💽️ @jeromefitz/dotfiles

A set of scripts (`zsh` && `Homebrew`) to set up and keep a machine up-to-date (`macos`).

## ⬇️ Download

🥝️ **Fresh install?**

📝️ _**Note:** You’ll need to set the version._

```sh
curl -LJO -k https://github.com/JeromeFitz/dotfiles/archive/v2.0.0.tar.gz
mkdir -p ~/.dotfiles
tar -xf dotfiles-2.0.0.tar.gz -C ~/.dotfiles
```

:octocat: **Git installed?**

📝️ _**Note:** No need to set version._

```sh
git clone https://github.com/JeromeFitz/dotfiles.git ~/.dotfiles
```

## ♻️ Install

```sh
cd ~/.dotfiles
sh ./script/bootstrap
```

This will go through:

- [x] :octocat: git config
- [x] 🔗️ symlinks
- [x] 🍺️ homebrew install (+ post installs)
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

Peep the `Brewfile` in root to see what all will be installed.

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

Setup file that will cycle through the above to generate a hard-code list to `source` from that you put into `zshrc.symlink`.

By not `typeset`’ing and looping through on `zsh` init we save `~0.56s`. 😅️

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
