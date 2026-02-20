# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="dracula"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  alias-finder
  ansible
  aws
  brew
  colored-man-pages
  colorize
  copybuffer
  copyfile
  copypath
  cp
  docker
  dotenv
  gh
  git
  helm
  history-substring-search
  kubectl
  macos
  opentofu
  python
  terraform
  gcloud
  vscode
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

# Auto-update oh-my-zsh without prompting
zstyle ':omz:update' mode auto

source $ZSH/oh-my-zsh.sh

# =============================================================================
# LAZY LOADING FOR PERFORMANCE
# =============================================================================

# kubectl autocomplete - direct loading
if command -v kubectl &> /dev/null; then
  source <(kubectl completion zsh)
  compdef kubecolor=kubectl
fi

# kubectl cnpg plugin autocomplete
if command -v kubectl-cnpg &> /dev/null; then
  # Try to load cnpg completion, but suppress errors
  kubectl cnpg completion zsh 2>/dev/null | source /dev/stdin 2>/dev/null || true

  # Custom completion function for kubectl cnpg psql to autocomplete cluster names
  _kubectl_cnpg_psql_clusters() {
    local context state line
    typeset -A opt_args

    _arguments -C \
      '-n[namespace]:namespace:->namespace' \
      '1:cluster:->cluster' \
      '*::arg:->args'

    case $state in
      namespace)
        local namespaces
        namespaces=($(kubectl get namespaces -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}{end}' 2>/dev/null))
        _describe 'namespaces' namespaces
        ;;
      cluster)
        local clusters namespace
        # Extract namespace from -n flag if provided
        namespace=${opt_args[-n]:-}
        if [[ -n "$namespace" ]]; then
          clusters=($(kubectl get clusters.postgresql.cnpg.io -n "$namespace" -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}{end}' 2>/dev/null))
        else
          # Get clusters from all namespaces with format "cluster-name (namespace)"
          clusters=($(kubectl get clusters.postgresql.cnpg.io -A -o jsonpath='{range .items[*]}{.metadata.name}{"("}{.metadata.namespace}{")"}{"\n"}{end}' 2>/dev/null | awk '{print $1}'))
        fi
        _describe 'clusters' clusters
        ;;
    esac
  }

  # Register the completion function
  compdef _kubectl_cnpg_psql_clusters 'kubectl cnpg psql'
fi

# aliases
[[ -f "$HOME/dotfiles/aliases" ]] && source "$HOME/dotfiles/aliases"

# functions
[[ -f "$HOME/dotfiles/functions" ]] && source "$HOME/dotfiles/functions"

# CloudNativePG aliases
[[ -f "$HOME/dotfiles/cnpg_aliases" ]] && source "$HOME/dotfiles/cnpg_aliases"

# zsh-completions
# Only regenerate compdump once a day for better performance
autoload -U compinit
if [[ -n ${HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# iterm2
if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
fi

# zoxide (replaces autojump)
eval "$(zoxide init zsh --cmd j)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# eval "$(stack --bash-completion-script stack)"

complete -o nospace -C /usr/local/bin/terraform terraform

# starship
eval "$(starship init zsh)"

# VS Code
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"

export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export JAVA_HOME="/opt/homebrew/opt/openjdk@17"

# Krew - kubectl plugin manager (required for kubectl plugins like cnpg)
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# =============================================================================
# ORACLE CLOUD INFRASTRUCTURE (OCI) CONFIGURATION
# =============================================================================

export OCI_CONFIG_FILE_PROFILE=default
export OCI_REGION=eu-frankfurt-1

# =============================================================================
# GITLAB CONFIGURATION
# =============================================================================

# Load GitLab access token from macOS Keychain
export GITLAB_ACCESS_TOKEN=$(security find-generic-password -a "$USER" -s "gitlab_token" -w 2>/dev/null)

# =============================================================================
# ORACLE DATABASE CONFIGURATION
# =============================================================================

# Oracle TNS Names configuration
export TNS_ADMIN="$HOME/oracle/network/admin"
export NLS_LANG=AMERICAN_AMERICA.AL32UTF8

# SQLcl aliases for quick database access
alias sqldev='sql /nolog @<(echo "CONNECT \${1:-username}@DCSDEV")'
alias sqltest='sql /nolog @<(echo "CONNECT \${1:-username}@DCSTEST")'
alias sqlprod='sql /nolog @<(echo "CONNECT \${1:-username}@DCSPROD")'

# Simple connection aliases (you'll be prompted for username and password)
alias sql-dev='sql @DCSDEV'
alias sql-test='sql @DCSTEST'
alias sql-prod='sql @DCSPROD'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jirisrba/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jirisrba/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jirisrba/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jirisrba/google-cloud-sdk/completion.zsh.inc'; fi
