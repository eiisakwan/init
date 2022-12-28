#!/bin/sh
# Author: Elisa Kwan https://github.com/elisakwan/init/ish
# Downloads: https://raw.githubusercontent.com/eiisakwan/init/master/ish/install.sh
# install scripts for ish set up

echo "---> Runnning $0. Initialiasing ish "

# to use alpine repositories for ish app
cat > /etc/apk/repositories << EOF; $(echo)
http://dl-cdn.alpinelinux.org/alpine/v$(cat /etc/alpine-release | cut -d'.' -f1,2)/main
http://dl-cdn.alpinelinux.org/alpine/v$(cat /etc/alpine-release | cut -d'.' -f1,2)/community
EOF
sed -i -e '/http:\/\/apk.ish.app/d' /etc/apk/repositories
apk update

# colour_prompt
wget https://gist.githubusercontent.com/elkwan/efa18a226fbc5a757d89ea7c0d4a1a5a/raw/854258806ae0b2ea9a15dabc753377a5bdcc7cca/color_prompt.sh
cat color_prompt.sh > /etc/profile.d/color_prompt.sh.root && ln -s /etc/profile.d/color_prompt.sh.root /etc/profile.d/color_prompt.sh 

# bash at login
sed -i 's|root:x:0:0:root:/root:/bin/ash|root:x:0:0:root:/root:/bin/bash|g' /etc/passwd

setupBash()
{
  # bash file
  ln -sfn .bash/.bashrc
  ln -sfn .bash/.bash_profile
  ln -sfn .bash/.bash_functions
  ln -sfn .bash/.bash_aliases
  ln -sfn .bash/.wp_aliases
  ln -sfn .bash/.wp_functions
  
  # bash history
  ln -sfn .bash/history/.bash_hostory_$USER@${HOSTNAME%.*} .bash_history
}

setupSsh()
{
  echo "initizatiing ssh $0: "
  printf \n  "setting ssh env... "
  ssh-keygen -A
  SSH_ENV=$HOME/.ssh/environment
  echo "done"

  printf \n "generating ssh key.... "
  [ -f .ssh/id_rsa.pub ] || ssh-keygen -t rsa -b 4096 -f .ssh/id_rsa
  [ -f .ssh/id_ed25519.pub ] || ssh-keygen -t ed25519 -C "${HOSTNAME%.*}@icloud.com" -f .ssh/id_ed25519
  echo done

  printf \n "checking ssh dir... "
  [ -d .ssh ] || mkdir .ssh
  [ -d .ssh/.keys ] || mkdir .ssh/.keys
  echo done
  
  printf \n "checking file permission... "
  chmod 644 .ssh/*; chmod 600 .ssh/.keys/*
  echo done
}

setupGit() 
{
  printf \n "seting up for git ...."
  apk add git
  git config --global user.email ${HOSTNAME}@icloud.com
  git config -- global user.name ${HOSTNAME}
  echo done
}

setupApk()
{
  apk add bash bash-completion openssh sudo nano rsync util-linux 
  
  echo "apk install core app..."
  apk add openssh openssh-keygen rsync coreutils
  apk add lsof less nano curl wget
  export PAGER=less
  
  echo "installing nanro..."
  curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh
  
  echo "adding essential pkg..."
  apk update && apk upgrade
  apk add fish tree emacs meson make 
  apk add s6 nextcloud ncurses-terminfo-base 
  apk add llvm markdown mosh mosh-server 
  apk add colord samba alpine-conf
  apk add libgit2-dev cmake syntax-highlighting 
  apk add gzip apache2 htop python3
  apk add sed attr dialog grep exa
  apk update && apk upgrade
  apk add util-linux pciutils 
  apk add usbutils binutils findutils readline
  apk add ruby ruby-dev build-base ruby-json
  apk add perl dpkg openssl
  apk add stunnel links
  
  apk update && apk upgrade
  apk add man-pages mandoc docs

  echo "installing php"
  apk add php7-dba php7-sqlite3 php7-mysqli php7-mysqlnd php7-pgsql php7-pdo_dblib php7-pdo_odbc php7-pdo_pgsql php7-pdo_sqlite 

  apk add php7-snmp php7-soap php7-ldap php7-pcntl php7-pear php7-shmop php7-wddx php7-cgi php7-pdo php7-snmp php7-tokenizer 
  
  echo "Enable OpenRC & Start Services When iSH App Starts"
  apk add openrc
  cat /mnt/ish/etc/inittab > /etc/inittab
  rc-update add sshd
  rc-status
  
  apk add nodejs  
  
  # pip
  python3 -m ensurepip
  apk update 
}

setupApk
setupBash
setupSsh
setupGit
