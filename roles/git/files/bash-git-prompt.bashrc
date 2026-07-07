GIT_PROMPT_THEME=Default
GIT_PROMPT_FETCH_REMOTE_STATUS=0

source ~/.bash-git-prompt/gitprompt.sh
source ~/.bash-git-prompt/prompt-colors.sh

function findHereOrParent() {
  path=$(pwd)
  while [[ "$path" != "" && ! $(find "$path" -maxdepth 1 -regex "$1") ]]; do
    path=${path%/*}
  done
  echo "$path"
}

function echoError() {
  echo -ne "\033[38;5;131;48;5;0m\033[38;5;227;48;5;131m  ${1} \033[38;5;0;48;5;131m"
}

function echoRubyVersion() {
  if [[ $(which ruby) && $(findHereOrParent '.*/Gemfile') ]]; then
    CURRENT_RUBY=$((ruby --version 2>/tmp/ruby-version || echo "xxx  $(grep -o '[[:digit:]]\(\.[[:digit:]]\)\{1,\}' /tmp/ruby-version) ") | awk '{ print $2; exit; }')
    echo -ne "\033[38;5;52;48;5;0m\033[38;5;210;48;5;52m  \033[38;5;254m${CURRENT_RUBY} \033[38;5;0;48;5;52m"
  fi
}

function echoPythonVersion() {
  if [[ $(which pyenv) && $(findHereOrParent '.*\.py') ]]; then
    CURRENT_PYTHON=$(pyenv version-name)
    echo -ne "\033[38;5;221;48;5;0m\033[38;5;25;48;5;221m  \033[38;5;16m${CURRENT_PYTHON} \033[38;5;0;48;5;221m"
  fi
}

function echoGoVersion() {
  if [[ $(which go) && $(findHereOrParent '.*/go\.mod') ]]; then
    CURRENT_GO=$(go version | awk '{print $3; exit;}' | cut -c3-)
    echo -ne "\033[38;5;80;48;5;0m\033[38;5;16;48;5;80m  ${CURRENT_GO} \033[38;5;0;48;5;80m"
  fi
}

function echoRustVersion() {
  if [[ $(which rustc) && $(findHereOrParent '.*/Cargo\.toml') ]]; then
    CURRENT_RUST=$(rustc --version | awk '{print $2; exit;}')
    echo -ne "\033[38;5;172;40m\033[38;5;231;48;5;172m  ${CURRENT_RUST} \033[38;5;0;48;5;172m"
  fi
}

function echoDotNetVersion() {
  if [[ $(which dotnet) && $(findHereOrParent '.*\.\(sln\|csproj\)') ]]; then
    CURRENT_DOTNET=$(dotnet --version)
    echo -ne "\033[38;5;54;48;5;0m\033[38;5;231;48;5;54m  ${CURRENT_DOTNET} \033[38;5;0;48;5;54m"
  fi
}

function echoPath() {
  echo -ne "\033[38;5;28;48;5;0m\033[38;5;227;48;5;28m  \033[38;5;254m$(dirs +0) \033[38;5;0;48;5;28m"
}

function echoColor() {
  echo -ne "\033[48;5;${1};38;5;${2}m"
}

# Configuration
GIT_PROMPT_SHOW_UNTRACKED_FILES="all"
GIT_PROMPT_IGNORE_STASH="1"
GIT_PROMPT_LEADING_SPACE="0"

# Pre- and post-status prompt strings
GIT_PROMPT_COMMAND_FAIL=" \`echoError _LAST_COMMAND_STATE_\`"
GIT_PROMPT_COMMAND_OK=" "
GIT_PROMPT_START_USER="${ResetColor}_LAST_COMMAND_INDICATOR_\`echoRubyVersion\`\`echoPythonVersion\`\`echoGoVersion\`\`echoRustVersion\`\`echoDotNetVersion\`"
GIT_PROMPT_START_ROOT="${GIT_PROMPT_START_USER}"
GIT_PROMPT_END_USER="\`echoPath\`${ResetColor} \n${BoldGreen} sh$ ${ResetColor}"
GIT_PROMPT_END_ROOT="\`echoPath\`${ResetColor} \n${BoldRed} sh# ${ResetColor}"

# Individual overrides
GIT_PROMPT_BRANCH="\`echoColor 25 110\`\`echoColor 25 254\` "
GIT_PROMPT_CHANGED="\`echoColor 25 227\` ~"
GIT_PROMPT_CLEAN=""
GIT_PROMPT_CONFLICTS="\`echoColor 25 210\`  "
GIT_PROMPT_PREFIX="\`echoColor 0 25\`\`echoColor 25 0\` "
GIT_PROMPT_REMOTE=""
GIT_PROMPT_SEPARATOR=""
GIT_PROMPT_STAGED="\`echoColor 25 113\` ±"
GIT_PROMPT_STASHED="\`echoColor 25 110\`  "
GIT_PROMPT_SUFFIX="\`echoColor 25 0\` "
GIT_PROMPT_UNTRACKED="\`echoColor 25 227\` +"

# Symbols
GIT_PROMPT_SYMBOLS_AHEAD="\`echoColor 25 110\` "
GIT_PROMPT_SYMBOLS_BEHIND="\`echoColor 25 110\` "
GIT_PROMPT_SYMBOLS_NO_REMOTE_TRACKING="\`echoColor 25 227\` "
GIT_PROMPT_SYMBOLS_PREHASH=":"
