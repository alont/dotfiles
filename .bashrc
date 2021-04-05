export M2_HOME=/Applications/apache-maven-3.2.1
export JAVA_HOME=`/usr/libexec/java_home`

export PATH=/usr/local/bin:$PATH:~/bin:$M2_HOME/bin
export PS1="\u@\h:\w$ "

alias dna="dig +noall +answer"
alias hgwd="cd $HGWD"
alias athenagrep="zgrep 'GET\t*/\d*\.\d*\.\d*\.\d*/\(ping\|\t\)' *"
alias ".."="cd .."
alias ls="ls -G"

