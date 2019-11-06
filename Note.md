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

`'.../**.node' was compiled against a different Node.js version using NODE_MODULE_VERSION 57.
This version of Node.js requiresNODE_MODULE_VERSION 53. Please try re-compiling or re-installing the module
`

1. Install electron-rebuild

```
npm install --save-dev electron-rebuild
```

2. Rebuild

```
./node_modules/.bin/electron-rebuild
```

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

```bash
git remote add upstream https://github.com/wisnuc/fruitmix-desktop.git
```

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

```bash
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

# is same object, if not print difference

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

```.vimrc
nnoremap <F2> mn:s/\([,\{v]\)[ ]/\1\r/g<CR>
nnoremap <F3> :s/ \(}}\) */\r\1\r/g<CR>
nmap <F9> <F2><F3>`n20==
```

# 搜索Terminal历史并执行

```bash
ctrl + r
```

# mouse key bind for logitech g102

config File: ~/.xbindkeysrc

```bash
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

# fix ibus-libpinyin bug

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

+ service file in `/lib/systemd/system`

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

+ operations
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

# Wifi

```bash
# connect to wifi
sudo nmcli d wifi connect iPhone password 11345678

# show saved connections
ls -sail /etc/NetworkManager/system-connections/
```

# open minicom
```
sudo minicom -D /dev/ttyUSB0 -b 1500000 -c on
```


# make in kernel

```
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- dtbs
```


# modify `android/build.gradle`

```
buildscript {
    repositories {
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        maven { url 'https://maven.aliyun.com/repository/public/' }
    }

    dependencies {
        classpath 'com.android.tools.build:gradle:3.3.0'
    }
}

allprojects {
    repositories {
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        maven { url 'https://maven.aliyun.com/repository/public/' }
    }
}
```

# modify `~/flutter/packages/flutter_tools/gradle/flutter.gradle`

```
buildscript {
    repositories {
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        maven { url 'https://maven.aliyun.com/repository/public/' }
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:3.3.0'
    }
}
```

+ diff
```
 buildscript {
     repositories {
-        google()
-        jcenter()
+        maven { url 'https://maven.aliyun.com/repository/google' }
+        maven { url 'https://maven.aliyun.com/repository/jcenter' }
+        maven { url 'https://maven.aliyun.com/repository/public/' }
     }
     dependencies {
-        classpath 'com.android.tools.build:gradle:3.2.1'
+        classpath 'com.android.tools.build:gradle:3.3.0'
     }
 }
```

# cmake 静态编译
CMakeList添加如下选项
```
set(CMAKE_EXE_LINKER_FLAGS "-static")
```

# kill process
find all `dart` process and kill them all
```bash
# find
ps -aux | grep dart
# find && kill
pgrep -f dart | xargs kill
```

# test if file exist
```bash
myFile="/home/lxw/abc"
if [ ! -f "$myFile" ]; then
touch "$myFile"
else
echo "skip"
fi
```

# ffmpeg note

+ To set the video bitrate of the output file to 64 kbit/s:
```bash
ffmpeg -i input.avi -b:v 64k -bufsize 64k output.avi
```
+ To force the frame rate of the output file to 24 fps:
```
ffmpeg -i input.avi -r 24 output.avi
```
+ To remove audio
```bash
# -c:v copy copies the video stream.
# -an removes the audio stream.
ffmpeg -i input.mp4 -c:v copy -an output.mp4
```

# count files fastly
```
find . -type f | wc -l
```

# find files that large than 1 GiB
```bash
find . -type f -size +1G
```

# “Too many open files” exception (MacOS)

The default limit for Mac OS on how many files it can have open at a time is rather low. If you run into this limit, increase the number of available file handlers using the ulimit command:

```
ulimit -S -n 2048
```

# show temperature and cpu frequence per second
```
while [ 1 ]
do
  sleep 1
  uptime
  cat /sys/devices/system/cpu/cpu*/cpufreq/cpuinfo_cur_freq
  cat /sys/class/thermal/thermal_zone0/temp
done
```

# handle Nodejs fs.watch ENOSPC error
```
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
```

# check lines contains chinese

nodejs code

```javascript
const child = require('child_process')
const all = child.execSync(`grep -r ''`).toString().split('\n').map(l => l.trim()).filter(l => l.length)
const chinese = all.filter(l => /[\u4E00-\u9FFF\u3400-\u4dbf\uf900-\ufaff\u3040-\u309f\uac00-\ud7af]+/.test(l))
```

# run npm start with ENV

```powershell
$env:NODE_ENV='dev'; .\pocket_drive.exe
```

flutter debug launch.json
```json
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Flutter",
            "request": "launch",
            "type": "dart",
            "args": [
                "--target-platform",
                "android-arm64"
            ]
        }
    ]
}
```

# init img scripts

```bash
echo "alias ll='ls -al --color=auto'" >> ~/.bashrc
source ~/.bashrc
rm /etc/apt/sources.list
echo 'deb https://mirrors.ustc.edu.cn/debian buster main' > /etc/apt/sources.list
apt update
apt install git vim -y
cd ~
mv winasd/ d
git clone https://github.com/aidingnan/winasd.git --depth=1
cp -r d/node_modules/ winasd/
service winasd restart
```

# allow root in npm install

```bash
sudo npm install -g imagemin-cli --unsafe-perm=true --allow-root
```

# use ffmpeg to cut mp3

```bash
ffmpeg -i _.mp3 -ss 00:00:00 -t 00:00:01 -acodec copy 1.mp3
```

# setInterval in bash

```bash
while true; do ls -l; sleep 2; done
```

# monitor download status in winasd/info

```bash
while true; do curl -s http://10.10.9.103:3001/winasd/info | jq . | grep bytesWritten;sleep 2;done
```

# birthday problem

```js
const calc = (c, all) => {
  let count = c
  let result = 1n
  while (count > 0n) {
    count -= 1n
    result *= (all - count)
  }
  return 1000n - result * 1000n / (all ** c)
}
```

# echo color in bash console

```bash
echo -e "\033[01;32m 绿色字体 √ \033[0m"
```

```js
console.log('\033[01;32m', '绿色字体 √')
```

# color matrix
```js
for (let i = 0; i < 64; i++) {
  for (let j = 32; j < 48; j++) {
    const ii = i.toString().padStart(2, '0')
    const jj = j.toString().padStart(2, '0')
    const str = '\033' + `[${ii};${jj}m` + `[${ii};${jj}m` + '\033[0m '
    process.stdout.write(str)
  }
  process.stdout.write('\n')
}
```

# kill all node process
```bash
ps | grep -i "node" | awk '{print $2}' | sudo xargs kill -9
```

count files cout
```
i=0
while true;do ls -al thumbnail | wc -l;i=$(expr $i + 1);echo $i;sleep 5;done
```

# get memory usage of app in android
```bash
cd ~/Android/Sdk/platform-tools
./adb shell
dumpsys meminfo com.aidingnan.winas | grep 'TOTAL S'
```
