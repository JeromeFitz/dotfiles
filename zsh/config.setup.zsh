# # 💽️ get all zsh files
#
# # 🍱️ SETUP: BEGIN
typeset -U config_files
config_files=($ZSH/**/*.zsh)

echo "# 🗺️  path"
for file in ${(M)config_files:#*/*.path.zsh}
do
  echo "source $file"
done

echo "# 🛁️  * (!path|completion|sandboxd|config.setup)"
for file in ${${${${config_files:#*/*.path.zsh}:#*/*.completion.zsh}:#*/sandboxd.plugin.zsh}:#*/config.setup.zsh}
do
  echo "source $file"
done

echo "# 🧭️  completion (after autocomplete loads)"
echo "autoload -Uz compinit && compinit"
for file in ${(M)config_files:#*/*.completion.zsh}
do
  echo "source $file"
done

unset config_files
# # 🍱️ SETUP: END
