# fold
:set foldlevel=0

# indent in vim
:10,100>

# reverse indent in vim
:20,80<

# update submodule in git 
git submodule update --init --recursive

# sleep in JS

this.sleep = time => new Promise(resolve => setTimeout(resolve, time))

# set Language

locale
export LC_ALL="en_US.UTF-8"

# change own of dir
sudo chown -R $(whoami) dir

# calc size of current dir
du -hc -d 1 ./

# ssh forward

```
ssh -D 4567 -p 2017 -o ServerAliveInterval=60 root@104.238.136.166
```
# electron node_moudle_version  error

```
'.../**.node' was compiled against a different Node.js version using NODE_MODULE_VERSION 57.
This version of Node.js requiresNODE_MODULE_VERSION 53. Please try re-compiling or re-installing the module
```

1. Install electron-rebuild

npm install --save-dev electron-rebuild

2. Rebuild

./node_modules/.bin/electron-rebuild

# run appifi(devel-bootstrap mode) in a new linux system

```bash
sudo apt-get install git
sudo apt-get install npm
sudo apt-get install avahi-utils
sudo apt-get install imagemagick
sudo apt-get install btrfs-tools
sudo apt-get install samba
sudo apt-get install file
sudo npm install -g n
sudo n 8.9.4
node -v
npm -v
git clone https://github.com/wisnuc/appifi.git
cd appifi
git checkout yang
npm install --registry=https://registry.npm.taobao.org
sudo node src/app.js --fake-bootstrap --disable-smb > log.txt &
```

# run fruitmix-desktop in linux

```bash
sudo apt-get install git
sudo apt-get install npm
sudo npm install -g n
sudo n latest
node -v
git clone https://github.com/wisnuc/fruitmix-desktop.git
cd fruitmix-desktop
npm install --registry=https://registry.npm.taobao.org
npm run rebuild # alt: ./node_modules/.bin/electron-rebuild -e '~/fruitmix-desktop/node_modules/electron/dist' -v 1.7.9
npm run webpack2
npm start
```
# add remote

git remote add upstream https://github.com/wisnuc/fruitmix-desktop.git

# auto login

```bash
scp lxw@10.10.9.74:~/.ssh/id_rsa.pub ~/
cat ~/id_rsa.pub  >> ~/.ssh/authorized_keys
rm ~/id_rsa.pub
```

# cnpm install package without symbolic link

```bash
cnpm i --by=npm
```
### auto mount Extra Disk

add following code into `/etc/fstab` (need to use the correct uuid and mountpoint)
Warning: if disk lost, ubuntu will fail to boot

```
# /home/lxw/ExDisk was on /dev/sdb
UUID=0c3e909b-9eed-4630-83a5-169146de7ad8 /home/lxw/ExDisk  auto  defaults  0 0
```

### Hide overflow text
```js
{ overflow: 'hidden', whiteSpace: 'nowrap', textOverflow: 'ellipsis' }
```

### Compact virtulBox vdi

```bash
# in virtual machine
sudo dd if=/dev/zero of=/emptyfile bs=1M
sudo rm -rf /emptyfile

# in VirtualBox folder
VBoxManage modifyhd yourdisk.vdi -compact
```

# is same object

```js
const isSameObj = (a, b) => {
  aj = JSON.stringify(a)
  bj = JSON.stringify(b)
  if (aj === bj) return 'same'

  let i = aj.length
  let j = Math.ceil(i / 2)
  let flag = true
  
  while(i > j) {
    const isSame = aj.slice(0, j) === bj.slice(0, j)
    if (isSame) j = Math.ceil((i + j) / 2)
    else {
      i = j
      j = Math.ceil(i / 2)
    }
  }
  console.log(aj.slice(i - 10, i + 10), bj.slice(i - 10, i + 10))
}
```

# get sudo permission and save file in vim

```vim
:w !sudo tee %
```

# manage wisnuc-bootstrap service

```bash
# edit
sudo vi /lib/systemd/system/wisnuc-bootstrap.service
# reload
sudo systemctl daemon-reload
# restart
sudo systemctl restart wisnuc-bootstrap.service
# view log
sudo journalctl -u wisnuc-bootstrap -f
```

# 解决zip文件解压乱码

```bash
unzip -O cp936 file.zip
```

# Vim keymap of expending inline style object in JSX

```
nnoremap <F2> mn:s/\([,\{v]\)[ ]/\1\r/g<CR>
nnoremap <F3> :s/ \(}}\) */\r\1\r/g<CR>
nmap <F9> <F2><F3>`n20==
```

# 搜索Terminal历史并执行

```
ctrl + r
```

# mouse key bind for logitech g102

config File: ~/.xbindkeysrc

```
sudo apt-get install xbindkeys xautomation x11-utils
xbindkeys
```

# linux setup
制作安装盘
/dev/sdx 为要被格式化的磁盘位置

```bash
sudo dd if=/pathofimage of=/dev/sdx bs=1M
```

```bash
sudo apt-get install git
sudo apt-get install vim
sudo apt-get install autojump
sudo apt-get install npm
sudo apt-get install shadowsocks-libev
sudo apt-get install fcitx fcitx-googlepinyin fcitx-table-wbpy fcitx-pinyin fcitx-sunpinyin
sudo apt-get install fcitx-bin
sudo apt-get install fcitx-table
sudo apt-get install xbindkeys xautomation x11-utils
sudo apt-get install font-manager
```

ibus-libpinyin bug
```
sudo rm ~/.cache/ibus/libpinyin/opengram.dbin ~/.cache/ibus/libpinyin/user_bigram.db
```

# ms code
```
olhLDZ^%=gyxuJOHP87452|
```

# fix perl locale warning
```
sudo locale-gen en_US.UTF-8
```

# custom systemd service

service file in `/lib/systemd/system`
```
[Unit]
Description=ss local server
After=network.target network-online.target systemd-networkd.service NetworkManager.service connman.service

[Service]
Type=simple
RemainAfterExit=yes
ExecStart=/usr/bin/ss-local
ExecStop=/bin/kill -s QUIT $MAINPID

[Install]
WantedBy=multi-user.target
```
operation
```bash
# make change take effect
sudo systemctl daemon-reload

# start service
sudo service ss-local start

# stop service
sudo service ss-local stop

# view log
journalctl -xe
```
