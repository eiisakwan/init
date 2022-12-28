cd tmp
ls
./init.sh
./init.sh
t macos
./init.sh
./init.sh
./init.sh
pref=/Volumes/root/Scripts/init/mac/prefs/macOS10.14
for p in $pref/*.plist; do echo $p; done
for p in $pref/*; do echo $p; done
for p in $pref/*; do [[ $p == *.plist ]] && p=$p; echo $p; done
for p in $pref/*; do [[ $p != *.plist ]] || p=$p; echo $p; done
for p in $pref/*; do [[ $p != .plist* ]] || p=$p; echo $p; done
for p in $pref/*; do [[ $p != .plist* ]] || echo $p; done
for p in $pref/*; do [[ $p != *.plist ]] || echo $p; done
for p in $pref/*; do [[ $p == *.plist ]] || echo $p; done
for p in $pref/*; do [[ $p != *.plist ]] || plist=$p; echo $plist; done
for p in $pref/*; do [[ $p != *.plist ]] || p=$p; echo $p; done
for p in $pref/*; do [[ $p != *.plist ]] || echo $p; done
if [ -z $(for p in $pref/*; do [[ $p != *.plist ]] || echo $p; done) ]; then echo empty; fi
./init.sh
ll
ls .prefs
l
ll
t ch+
cd /System/Volumes/Data/mnt/root/Scripts/init/mac/filesystem/homedir/custom; clear; pwd
ln -s ../default.sh 
ln -s ../ssh.sh 
ln -s ../automount.sh 
ln -s ../icloud.sh 
cd /System/Volumes/Data/mnt/root/Scripts/init/mac/filesystem/homedir; clear; pwd
ln -s ../bash
ln -s ../bash/bash-*
ln -s ../bash/bash-symlink.sh 
ln -s ../bash/bash-mount.sh 
cd default
ln -s ../bash-symlink.sh
cd /System/Volumes/Data/mnt/root/Scripts/init/mac/filesystem/homedir/default; clear; pwd
ln -s ../icloud.sh
cat .profile
ll
ls -la
nano .profile
usr
exit
rm .automount
nano .profile
cat .profile
ls /etc/profile.d
cat /etc/profile.d/automount.sh
cat /etc/profile.d/*.sh
cat .bash_profile
cd tmp
/System/Volumes/Data/mnt/root/Scripts/init/mac/filesystem/homedir/automount.sh 
/System/Volumes/Data/mnt/root/Scripts/init/mac/filesystem/homedir/default.sh 
/System/Volumes/Data/mnt/root/Scripts/init/mac/filesystem/homedir/homedir-mount.sh 
/System/Volumes/Data/mnt/root/Scripts/init/mac/filesystem/homedir/icloud.sh 
/System/Volumes/Data/mnt/root/Scripts/init/mac/filesystem/homedir/root-mount.sh 
/System/Volumes/Data/mnt/root/Scripts/init/mac/filesystem/homedir/root-symlink.sh 
/System/Volumes/Data/mnt/root/Scripts/init/mac/filesystem/homedir/ssh.sh 
cd .ssh
lscd
cd .ssh
mkdir .keys
mv id_rsa .keys
chmod 600 .keys/*
ssh-add .keys/*
cat config
ssh ikty
mv id_rsa.pub .keys
ln -s keys/id_rsa.pub
l
ssh ikty
rm id_rsa.pub
mv .keys/id_rsa.pub .
ssh ikty
cd tmp
/System/Volumes/Data/mnt/root/Scripts/init/mac/filesystem/homedir/ssh.sh
rm -r .ssh
sudo bash
ls -la
sudo rm -r .ssh
/System/Volumes/Data/mnt/root/Scripts/init/mac/filesystem/homedir/ssh.sh 
sudo rm -r .ssh
/System/Volumes/Data/mnt/root/Scripts/init/ssh.sh 
ls .ssh
/System/Volumes/Data/mnt/root/Scripts/init/ssh.sh 
ls .ssh
/System/Volumes/Data/mnt/root/Scripts/init/ssh.sh 
..
rm -r tmp
mkdir tmp
cd tmp
/System/Volumes/Data/mnt/root/Scripts/init/mac/filesystem/homedir/default/init 
..
rm -r tmp
mkdir tmp
cd tmp
/System/Volumes/Data/mnt/root/Scripts/init/mac/filesystem/homedir/default/init 
cd .sh
cd .ssh
cat config
..
rm -r tmp
mkdir tmp
cd tmp
/System/Volumes/Data/mnt/root/Scripts/init/mac/filesystem/homedir/default/init 
cd 
shdir
cd init
# bash dir
ln -sfn root/bash .bash
ln -sfn root/Scripts Scripts
shdir
cd init
cd mac
cat filesystem.sh
rm filesystem.sh
cp init.sh .init.sh
[[ -z $(dscl . -list /Users UniqueID | awk '{print $1}' | grep -w $1) ]]
[[ -z $(dscl . -list /Users UniqueID | awk '{print $1}' | grep -w $sth) ]]
[[ -z $(dscl . -list /Users | grep kty) ]]
$(dscl . -list /Users | grep kty)
$(dscl . -list /Users | grep "kty")
$(dscl . -list /Users | grep -w "kty")
usr
t usr
$(dscl . -list /Users | grep -v "kty")
$(dscl . list /Users | grep -v "kty")
t usrdir
cd tmp
/System/Volumes/Data/mnt/root/Scripts/init/mac/filesystem/homedir/chmod.sh 
t usrdel
mate Scripts/mac/usr-del.sh
dscl . delete /Users/test NFSHomeDirectory /Volumes/Users/test
usrdel test
usrdel test4
ls /Volumes/Users/test
ls /Volumes/Users/test4
ls /Volumes/Users/test3
usr
usrdel test3
lls
cd mac
ls
badd
t badd
exit
usrdirdel test
usrdirdel test3
ls ../
usr
ls ../
usrdirdel test4
cd /App
cd /App*
ll
rm -r MAMP-6.6
rm MAMP
m
M
t pkg
ls /mnt/Downloads
ls
t pkg
badd sth
badd usrdirdel
nano ~/Scripts/mac/usrdir-del.sh
ls /Volumes/Users
usrdirdel test
sudo bash
usr
usr Volumes
usr
m
M
t tmbak
t tmbackup
badd 
badd tmbackup
tmbackup
shdir
cd init
cd mac
ls filesystem
for dir in filesystem; do [ -d $dir ] && echo $dir; done
for dir in filesystem/*/; do [ -d $dir ] && echo $dir; done
for file in /path/to/parentdir/{file1,file2,subdir/file3}; do     printf '%s\n' "$file"; done
for file in /$HOME/{file1,fil2}; do     printf '%s\n' "$file"; done
echo $USER "$USER" ${USER}
var=($( ls -la ))
echo $var
var=$( ls -la )
echo $var
cd ~/ <( ls -a)
cd ~/ <( ls -la)
a=$(( 16 + 2 ))
echo $a
usrdd
badd
t badd
t bashalias_add
nano .bash/functions/alias.sh
nano .bash/functions/bashalias.sh
nano .bash/functions/bash-'alias.sh
nano .bash/functions/bash-alias.sh
b
badd tmbackup
badd usrdd
usrdd
b
usrdir
usrdir elisa
usrdd
b
t addusr
shdir
cd init/mac
cd filest*
cdp
for d in *; do [ -d $d ] && echo $d; done
for d in *; do [ -d $d ] && echo $d;  mv $d ../; ln -sfn ../$d; done
rm *.sh
l
..
cat homedir.sh
l
cd homedir
ls ../
cat mount.sh
l
..
mv mount.sh symlink.sh filesystem
cd homedir
cat symlink.sh
..
ln -s filesystem/symlink.sh
ln -s filesystem/mount.sh
cdp
ls bash.sh
ls bash
touch filesystem.sh
cat mount.sh symlink.sh > filesystem.sh
cat filesystem.sh
l
nano filesystem.sh
usr
t shdir
echo $shdir
echo $fdir
bf
bfunc
cd $shdir/init/mac
cd usradd
ls ../../
ls ../
ls ../../../
cd /root
cd Scripts
ln -sfn mac/usr-add.sh mac/init/usradd/usr-add.sh
cd mac/init
cd usradd
cat usr-add.sh
ls ../../
ls ../../../
ls -sfn ../../../mac/usr-add.sh
sudo ls -sfn ../../../mac/usr-add.sh
rm usr-add.sh
ls -sfn ../../../mac/usr-add.sh
ls ../../../mac/usr-add.sh
ln -sfn ../../../mac/usr-add.sh
touch usr-add-lite.sh
cat usr-add.sh > usr-add-lite.sh
touch addusr.sh
t usrtmp
t shtmp
l
shtmp addusr.sh
l
cat addusr.sh
shtmp addusr.sh
b
shtmp addusr.sh
t shtmp
shtmp addusr.sh
shtmp test.sh
cd $shdir/init/mac
shdir
cd init/mac
cd usradd
shtmp addusr.sh
echo $(basename addusr.sh)
echo $(dirname addusr.sh)
shtmp addusr.sh
~/Scripts/template.sh addusr.sh
chmod +x ~/Scripts/template.sh
shtmp addusr.sh
~/Scripts/template.sh addusr.sh
chmod +x ~/Scripts/template.sh
shtmp addusr.sh
~/Scripts/template.sh addusr.sh
chmod +x ~/Scripts/template.sh
~/Scripts/template.sh addusr.sh
chmod +x ~/Scripts/template.sh
~/Scripts/template.sh addusr.sh
chmod +x ~/Scripts/template.sh
~/Scripts/template.sh addusr.sh
shdir
ln -s ~/Scripts/init/mac init
cd init
ls usradd
ln -s usradd/addusr.sh 
l
shdir
cd mac
ln -s init/usradd/addusr.sh
usrdel dummy
host
host -l
host -l
host -l localhost
host -l 192.168.1.99
ssh elisa@localhost
cd
ssh elisa@localhost -p 33366
cat /etc/ssh/sshd_configi
cat /etc/ssh/sshd_config
ssh elisa@localhost -p 33366
port install openssh
sudo port load openssh
ssh-keygen -A
cat /etc/ssh/sshd_config
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
/usr/sbin/sshd
ssh elisa@localhost -p 33366
ssh root@localhost -p 33366
service sshd stop
/usr/sbin/sshd -d -p 22
ll
cd .ssh
ll
/usr/sbin/sshd -d -p 22
def dock
exit
counts .prefs
count .prefs
count 
count .prefs/*
count Library/Preferences/*
lii .prefs
pwd
count /Volumes/Users/**/Library/Preferences/*
for usr in /Volumes/Users/*; do echo $usr; count $usr/Library/Preferences/*; done
for usr in /Volumes/Users/*; do echo $usr; count $usr/Library/Preferences/*; ls -Art | tail -n 1; done
ls -tl | head -n 1
ls -t | head -n1
ls -t
ls -t | head -n1
ls -tl | head -n1
cd /Volumes/Users
find /dir/path -type f -printf "%T@ %p\n" | sort -n | cut -d' ' -f 2- | tail -n 1
find /dir/path -type f -print "%T@ %p\n" | sort -n | cut -d' ' -f 2- | tail -n 1
man find
usrdir dummt
usrdir dummy
ls $usrdir
usrdel dummy
sudo bash
def dock
def dock | grep Found
der -app Terminal
der NSGlobalDomain KeyRepeat
der NSGlobalDomain InitialKeyRepeat
der dock
der -app dock
der -app docks
der com.apple.dock
der com.apple.dock persistent-apps
der com.apple.dock
shdir
cd mac/init/prefs
l
cd defaults
l
mkdir plist
cd plist
de export com.apple.dock $PWD/com.apple.dock.plist
de export -globalDomain $PWD/global.plist
l
der global.plist
der $PWD/global.plist
der com.apple.safari
..
shtmp trackpad.sh
def drag
def function key
def functionkey
def functionskey
def -app magnets
def -app magnets | grep Found
def magnets 
der -app  magnet 
shtmp app/magnet.sh
t shtmp
chmod +x ~/Scripts/template.sh
shtmp app/magnet.sh
~/Scripts/template.sh app/magnet.sh
~/Scripts/template.sh icloud.sh
~/Scripts/template.sh global.sh
~/Scripts/template.sh system.sh
shtmp app/mail.sh
~/Scripts/template.sh app/mail.sh
~/Scripts/template.sh spotlight.sh
~/Scripts/template.sh app/terminal.sh
~/Scripts/template.sh app/activityMonitor.sh
~/Scripts/template.sh app/chrome.sh
pkg /Volumes/Downloads/MAMP_MAMP_PRO_6.6-Intel-x86.pkg /
brew
pkg
t pkg
pkg /Volumes/Downloads/MAMP_MAMP_PRO_6.6-Intel-x86.pkg /
sudo bash
usr
sudo bash
brew install hashicorp/tap/hashicorp-vagrant
login kty
sys
nano .automount
m
aource .automount
source .automount
mount -t afp kty:112233@ikty._afpovertcp._tcp.local/Downloads ~/Downloads
rm Downloads
ln -s /mnt/Downlodas
ln -s /mnt/Downloads
mount -t afp kty:112233@ikty._afpovertcp._tcp.local/Downloads ~/Downloads
mount -t afp afp://kty:112233@ikty._afpovertcp._tcp.local/Downloads ~/Downloads
mate Scripts/mac/dotfile/macos.sh
login kty
cat .bash_profile
bp
cat .bashrc
M
cat .profile
nano .profile
ln -s /root/Scripts/mac/automount-ikty.sh .automount
cd 
sudo nano .automount
du -a | sort -n -r | head -n 5
du -a | sort -n -r
du -a | sort -n -r &
du -sh * &
du -sh * > size &
l
cat size
du -sh * > size &
ll
brew
ssh ikty
ssh root@localhost
ssh root@localhost -p 33366
ssh ktyair
sshdd
usr
usrdir ktydev
cd $usrdir
usrdel ktydev
usr
u
cd .prefs
for i in *.plist; do echo $i; done
cd .prefs
cd
cd .prefs
for i in *.plist; do echo $i; done
der ./pbs.plist
der ./loginwindow.plist
der ~/.prefs/loginwindow.plist
der /loginwindow.plist
der /loginwindow.plist >/dev/null
der /loginwindow.plist 2>/dev/null
if der /loginwindow.plist 2>/dev/null; then cant read; fi
if der /loginwindow.plist 2>/dev/null; then echo cant read; else echo can read; fi
if der /loginwindow.plist >/dev/null; then echo cant read; else echo can read; fi
if der /loginwindow.plist 1>/dev/null; then echo can read; else echo cant read; fi
if der /loginwindow.plist 2>1; then echo can read; else echo cant read; fi
if der ~/.prefs/loginwindow.plist 2>1; then echo can read; else echo cant read; fi
if der ~/.prefs/loginwindow.plist 2>/dev/null; then echo can read; else echo cant read; fi
if der ~/.prefs/loginwindow.plist 1>/dev/null; then echo can read; else echo cant read; fi
usrdd
ll
cd 
cd /Volumes
ll
default import
defaults import
cd /Volumes/Users
lii
sudo bash
