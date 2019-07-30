# Source global definitions

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias shd='systemctl poweroff -i'
alias ppm='systemctl suspend -i '
alias start=xdg-open
alias pbcopy='xsel --clipboard --input'
alias ll='ls -al'
alias upall='(sudo dnf upgrade -y ; sudo freshclam) > /etc/upall-log &'
alias zc='vim ~/zsh_src/alias.sh'
alias vc='vim ~/.vimrc'
alias pd=pushd
alias zrc='source ~/.zshrc'
alias upvim='(pushd ~/vimrc ; git commit -am "a" ; git push ; popd) &'
alias dwvim='(pushd ~/vimrc ; git checkout . ; git pull ; popd) &'
alias dict='/usr/libexec/mozc/mozc_tool --mode=config_dialog &'
alias readyredis='systemctl start redis-sentinel ; systemctl start redis'
alias readymysql='systemctl start mysqld'
alias stopredis='systemctl stop redis-sentinel ; systemctl stop redis'
alias stopmysql='systemctl stop mysqld'
alias python='python3'
alias rbserv="ruby -run -e httpd . -p 8080"
alias fbhost="firebase deploy --only hosting"
alias fbfunc="firebase deploy --only functions"
alias fbstop="firebase hosting:disable"
alias gst="git status"
alias fbdev="firebase use offf-dev"
alias fbpro="firebase use tsttt-1534892608721"
alias rbserv="ruby -run -e httpd . -p 5000"
alias dc="sudo docker"
alias dcc="sudo docker-compose"
alias dccu="sudo docker-compose up -d"
alias dlog="sudo docker-compose logs -f"
alias carbon="nvm use lts/carbon"
alias liber="pushd ~/work/liberapp.net; carbon; cd ./docker; dccu; cd .."
alias libdb="mysql -uroot -Dliberapp -h127.0.0.1 -P3306"
alias lib_cleardb="pushd ~/work/liberapp.net; libdb < create-database.sql"
alias gl="git log --oneline --all --decorate=full --graph"

function gc(){
    g++ -o test $1
    echo "compiled!"
    ./test
}

