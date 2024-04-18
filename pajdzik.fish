# https://github.com/jorgebucaran/fisher/issues/755#issuecomment-1408547461
set -e __git_plugin_initialized
__git.init

# binary aliases
alias code code-insiders

# shell aliases
alias cd.. "cd .."

# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end
