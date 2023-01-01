#!/bin/sh
# Author: Elisa Kwan https://github.com/elisakwan/init/ish
# Downloads: https://raw.githubusercontent.com/eiisakwan/init/master/ish/install.sh
# Install: wget https://raw.githubusercontent.com/eiisakwan/init/master/ish/install.sh -O- | sh
# install scripts for ish set up

setupBash()
{
  printf \n "setting up bash dir.."
  [ -d .bash ] || mkdir .bash
  
  # bash file
  ln -sfn .bash/.bashrc
  ln -sfn .bash/.bash_profile
  ln -sfn .bash/.bash_functions
  ln -sfn .bash/.bash_aliases
  
  # bash functions folder
  [ -d .bash/functions ] || mkdir .bash/functions
  
  # bash history
  [ -d .bash/history ] || mkdir .bash/history
  ln -sfn .bash/history/.bash_history_$USER@${HOSTNAME%.*} .bash_history
  echo "# ${HOSTNAME}" > .bash_history
}

downloadBash()
{
  printf \n "Downloading bash file.."
  cd ~/.bash
  wget https://raw.githubusercontent.com/eiisakwan/init/master/bash/skel/.bash_aliases
  wget https://raw.githubusercontent.com/eiisakwan/init/master/bash/skel/.bash_functions
  wget https://raw.githubusercontent.com/eiisakwan/init/master/bash/skel/.bash_profile
  wget https://raw.githubusercontent.com/eiisakwan/init/master/bash/skel/.bashrc
  cd ~/.bash/functions
  wget https://raw.githubusercontent.com/eiisakwan/init/master/bash/skel/functions/os.sh
  wget https://raw.githubusercontent.com/eiisakwan/init/master/bash/skel/functions/menu.sh
  wget https://raw.githubusercontent.com/eiisakwan/init/master/bash/skel/functions/prompt.sh
  cd
  echo done
}

setupSsh()
{
  echo "initizatiing ssh $0... "
  cd $HOME
  apk add openssh openssh-keygen
  SSH_ENV=$HOME/.ssh/environment
  
  #read -p "set up password for root? [y/N]:"
  #[ $REPLY = N ] || passwd
  
  echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
  sed -i "s/Port 22/Port 22000/q" /etc/ssh/sshd_config
  /usr/sbin/sshd
  
  printf \n "checking ssh dir... "
  [ -d .ssh ] || mkdir .ssh
  [ -d .ssh/.keys ] || mkdir .ssh/.keys
  touch .ssh/config
  touch .ssh/environment
  echo done
  
  printf \n "generating ssh key.... "
  [ -f .ssh/id_rsa.pub ] || ssh-keygen -t rsa -b 4096 -f .ssh/id_rsa
  [ -f .ssh/id_ed25519.pub ] || ssh-keygen -t ed25519 -C "$HOSTNAME@icloud.com" -f .ssh/id_ed25519
  echo done
  
  printf \n "checking file permission... "
  chmod -R 600 $HOME/.ssh
  chmod 644 $HOME/.ssh/config
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
  echo "apk install core app..."
  apk update
  apk add git grep sed coreutils gzip attr docs ruby bash bash-completion yarn nano curl
  apk add openssh rsync sudo tree less readline man-pages mandoc docs apache2 python3 markdown
  export PAGER=less
  
  echo "installing nanro..."
  curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh
  
  echo "installing php...."
  apk add php php-dba php-sqlite3 php-mysqli php-mysqlnd php-pgsql php-pdo_dblib php-pdo_odbc php-pdo_pgsql php-pdo_sqlite 

  apk add php-snmp php-soap php-ldap php-pcntl php-pear php-shmop php-wddx php-cgi php-pdo php-snmp php-tokenizer
  
  echo "Enabling OpenRC & Start Services When iSH App Starts"
  apk add openrc
  cat /mnt/ish/etc/inittab > /etc/inittab
  rc-update add sshd
  rc-status
  
  apk add nodejs  
  
  # pip
  python3 -m ensurepip
  apk update && apk upgrade
}

alpineNewbie() {
  echo "adding alpine essential pkg..."
  apk update && apk upgrade
	apk add fish emacs meson make
  apk add s6 nextcloud ncurses-terminfo-base 
  apk add llvm  mosh mosh-server 
  apk add colord samba alpine-conf
  apk add libgit2-dev cmake syntax-highlighting 
  apk update && apk upgrade
	apk add pciutils usbutils binutils findutils util-linux
	apk add ruby-dev ruby-json
  apk add perl openssl lsof dialog exa
  apk add stunnel links
  apk update && apk upgrade
}

echo "-------------------------------------------"
echo "---> Running install.sh. Initialiasing ish."
echo "-------------------------------------------"

# run in background
echo "Enabling ish to run in background...."
cat /dev/location > /dev/null &

# to use alpine repositories for ish app
cat > /etc/apk/repositories << EOF; $(echo)
http://dl-cdn.alpinelinux.org/alpine/v$(cat /etc/alpine-release | cut -d'.' -f1,2)/main
http://dl-cdn.alpinelinux.org/alpine/v$(cat /etc/alpine-release | cut -d'.' -f1,2)/community
EOF
sed -i -e '/http:\/\/apk.ish.app/d' /etc/apk/repositories
apk update

# colour_prompt
cd /etc/profile.d
wget https://gist.githubusercontent.com/elkwan/efa18a226fbc5a757d89ea7c0d4a1a5a/raw/854258806ae0b2ea9a15dabc753377a5bdcc7cca/color_prompt.sh
ln -sfn /etc/profile.d/color_prompt.sh.root /etc/profile.d/color_prompt.sh
cd 

# bash at login
apk add bash bash-completion
sed -i 's|root:x:0:0:root:/root:/bin/ash|root:x:0:0:root:/root:/bin/bash|g' /etc/passwd

setupBash
downloadBash
bash
setupSsh
setupGit
setupApk

ssh-keygen -A