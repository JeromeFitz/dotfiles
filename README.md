# 💽️ @jeromefitz/dotfiles

A set of scripts to set up and keep a machine up-to-date (`macos`). Via `zsh` and `Homebrew`. 🍻️

Latest iteration heavy from [`rholman`](#%EF%B8%8F-references) && [`jacobwgillespie`](#%EF%B8%8F-references). 🙇

## ⬇️ Download

🥝️ **Fresh install?**

📝️ _**Note:** You’ll need to set the version._

```sh
curl -LJO -k https://github.com/JeromeFitz/dotfiles/archive/v1.0.0.tar.gz
mkdir -p ~/.dotfiles
tar -xf dotfiles-1.0.0.tar.gz -C ~/.dotfiles
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

Order of `source` b/c `nvm` is fickle:

```sh
└─── config
│   │   *.path.zsh
│   │   *.!completion.zsh
│   │   *.completion.zsh
│   │   nvm.*.zsh
```

#### 😱️ oh-my-zsh

I teeter back-and-forth on using `oh-my-zsh` and not.

To be completely up-front, I usually still clone `oh-my-zsh` into `./.oh-my-zsh` and via `.zshrc.private.symlink` will include specific functions. (`git`, I am specifically talking about the `git` plugin.)

### 🤓️ zsh functions

> `dot` is a simple script that installs some dependencies, sets sane macOS defaults, and so on. Tweak this script, and occasionally run `dot` from time to time to keep your environment fresh and up-to-date. You can find this script in `bin/`.
> ref: [@holman/dotfiles](https://github.com/holman/dotfiles/blob/master/bin/dot)

## 📦️ other packages

This may seem a bit verbose, however, keeps things consistent:

- [`@jeromefitz/codestyle`](https://github.com/JeromeFitz/packages/tree/main/packages/codestyle)
  - Preferred code formatting for repo
- [`@jeromefitz/git-cz`](https://github.com/JeromeFitz/packages/tree/main/packages/git-cz)
  - Conventional Commits w/ Emojis
- [`@jeromefitz/semantic`](https://github.com/JeromeFitz/packages/tree/main/packages/semantic)
  - Semantic Release for Versioning

## 🚌️ Roadmap

- [ ] lazy load `nvm`
- [ ] bonus: `init.sh` script for fresh installs
- [ ] bonus: lazy load `rbenv`
- [ ] bonus: lazy load `pyenv`

(Will probably not do any of these. 😬️)

## 🙇️ References

Over the years I have revamped this a bit through inspiration and sheer 🍽️ `fork`ery:

- [croaky/dotfiles](https://github.com/croaky/dotfiles)
- [thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles)
- [thoughtbot/laptop](https://github.com/thoughtbot/laptop)h
- [dot-local](http://robots.thoughtbot.com/manage-team-and-personal-dotfiles-together-with-rcm)
- [holman](https://github.com/holman/dotfiles)
- [jacobwgillespie](https://github.com/jacobwgillespie/dotfiles)

I personally prefer `.private` instead of `.local` and have a separate 🔒️ [repo](https://github.com/JeromeFitz/dotfiles-private) 🔒️ that symlinks (& sources from there...):

- `vimrc.private.symlink`
- `zshrc.private.symlink`

You are not missing anything, I assure you. (`alias` for directory changes that I do not want to put on blast basically either for NDA or contract purposes.) 🤣️
