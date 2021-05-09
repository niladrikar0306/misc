# append
# path+=('/Applications/IntelliJ IDEA.app/Contents/plugins/maven/lib/maven3/bin')
# or prepend
# path=('/example/bin' $path)
# export to sub-processes (make it inherited by child processes)

####### from bash_profile
# Git branch in prompt.

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "


export NVM_DIR="/Users/nkar/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/home"
export MAVEN_HOME="/Users/nkar/installed-softwares/apache-maven-3.6.3"
export export GOPATH=$HOME/go

PATH=$PATH:"/Users/nkar/installed-softwares/apache-maven-3.6.3/bin":$GOPATH/bin
alias ssh_AS-CENTKVM-3001="ssh -l nkar-hkg AS-CENTKVM-3001"
alias ssh_BK-NETOPS-1001="ssh nkar@BK-NETOPS-1001"
alias ssh_pass_HK-KUBLB-2T01="sshpass -p FANsTy2 ssh -o StrictHostKeyChecking=no nkar-hkg@HK-KUBLB-2T01"
####### end of from bash_profile

###### fix cursor
_fix_cursor() {
   echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)

######## kubernetes
alias k8s="kubectl"

###### start of prompt
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }


# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' %b'

# Set up the prompt (with git branch name)
autoload -U promptinit && promptinit

NEWLINE=$'\n'
setopt PROMPT_SUBST
PROMPT='%F{cyan}%n ${PWD/#$HOME/~} %F{green}${vcs_info_msg_0_} %F{cyan}>>> ${NEWLINE}%F{white}'
###### end of prompt
export PATH

CASE_SENSITIVE="false"
