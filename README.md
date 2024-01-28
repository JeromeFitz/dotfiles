# 💽️ @jeromefitz/dotfiles

Scripts (`zsh` && `Homebrew`) to set up and keep a machine up-to-date (`macos`).

## ⏱️ Speed Test

```bash
▲ date && for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done
Mon Apr 24 23:59:05 EDT 2023
        0.06 real         0.03 user         0.02 sys
        0.06 real         0.03 user         0.02 sys
        0.05 real         0.03 user         0.03 sys
        0.05 real         0.03 user         0.03 sys
        0.05 real         0.03 user         0.02 sys
        0.05 real         0.03 user         0.02 sys
        0.05 real         0.03 user         0.02 sys
        0.05 real         0.03 user         0.02 sys
        0.05 real         0.03 user         0.02 sys
        0.05 real         0.03 user         0.02 sys
```

## ⬇️ Download

🥝️ **Fresh install?**

📝️ _**Note:** You’ll need to set the version._

```sh
curl -LJO -k https://github.com/JeromeFitz/dotfiles/archive/v3.0.4.tar.gz
mkdir -p ~/.dotfiles
tar -xf dotfiles-3.0.4.tar.gz -C ~/.dotfiles
```

:octocat: **Git installed?**

📝️ _**Note:** No need to set version. Though once you have your SSH Key setup you will want to swap the `git remote` to `git@github.com:JeromeFitz/dotfiles.git`_

```sh
git clone https://github.com/JeromeFitz/dotfiles.git ~/.dotfiles
```

## ♻️ Install

```sh
cd ~/.dotfiles

# Brewfile
sh ./scripts/bootstrap

# # # OR # # #

# Brewfile-Slim
sh ./scripts/bootstrap -s
```

This will go through:

- [x] :octocat: git config
- [x] 🔗️ symlinks
- [x] 🍺️ homebrew install (+ post installs)
  - [x] 💎️ `Brewfile|Brewfile-Slim`
- [x] 🛠️ zsh configuration
- [x] 🤓️ zsh functions

> 📝 **NOTE:** `node` sometimes gets installed immediately, other times you may need to run this twice.

### :octocat: git config

Prompt for `git`: `username|authorname|authoremail`

Sets up `gitconfig.private.symlink` which is included w/in `gitconfig.symlink` and not attributed to repo. 🙈️

#### 🚩 Multiple Git Accounts

If you have multiple `git` accounts and need to differentiate between, oh let's say, `GitHub` and `GitLab` for example, you will need to do some custom modifications to the newly created `gitconfig.private.symlink`:

```yml
...
# Default
[includeIf "gitdir:~/"]
  path = .gitconfig.private.default
# Custom
[includeIf "gitdir:~/Code/@custom/"]
  path = .gitconfig.private.custom
```

Where they are set up with the following respectively (or, you know, further customized). The main swap (aside from any `GitHub|GitLab` customizations) are the format of the `name` and `email` to associate with the commits:

`./symlinks/gitconfig.private.default.symlink`

```yml
[github]
  user = JeromeFitz
[user]
  name = Jerome Fitzgerald
  email = j@jeromefitzgerald.com

```

`./symlinks/gitconfig.private.custom.symlink`

```yml
[gitlab]
  user = CustomHandle
[user]
  name = Last, First
  email = j@custom.com
```

You will the need to run the symlinks again.

To check which `name|email` you are currently using you can run `getGitConfig`:

```bash
▲ .dotfiles [main] getGitConfig
[ git ] 📛  user.name:  Jerome Fitzgerald
[ git ] 📧  user.email: j@jeromefitzgerald.com
```

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

📝️ _**Note:** On new boxes you will need to install `node|python|ruby` accordingly._

### 🤓️ zsh functions

> `dot` is a simple script that installs some dependencies, sets sane macOS defaults, and so on. Tweak this script, and occasionally run `dot` from time to time to keep your environment fresh and up-to-date. You can find this script in `bin/`.
>
> ref: [@holman/dotfiles](https://github.com/holman/dotfiles/blob/master/bin/dot)

#### 🚈️ Slim

`dot -s` will run from `Brewfile-Slim` which is a reduced Brewfile.

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
