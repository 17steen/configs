# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# For example: add yourself some shortcuts to projects you often work on.
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr
#

source /etc/profile

export PATH=/opt/texlive/2021/bin/x86_64-linux/:$PATH

export PATH="$PATH:/home/steen/Programming/ScriptGenius/bin"

alias chvim="nvim ~/.config/nvim"
alias chzsh="nvim ~/Configs/ohmyzsh/example.zsh"

alias chss="cd ~/Programming/chess/"


alias gtk="cd /home/steen/Programming/gtk/"
alias gorust="cd /home/steen/Programming/rust"

alias vi=nvim

alias pi="ssh pi@192.168.0.69"

alias mk=make -j8

alias xrdp-start="sudo /etc/init.d/xrdp start"
alias xrdp-stop="sudo /etc/init.d/xrdp stop"

export MOZ_ENABLE_WAYLAND=1

export CMAKE_TOOLCHAIN_FILE="/usr/share/vcpkg/scripts/buildsystems/vcpkg.cmake"


alias srcemsdk="source \"/home/steen/emsdk/emsdk_env.sh\""
