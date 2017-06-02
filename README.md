# configs
主要是一些软件的配置文件

## bash

+ bashrc

## Vim

### init

sudo apt-get install vim
sudo apt-get install npm

### Need install eslint

```
npm install -g eslint
npm install -g babel-eslint
npm install -g eslint-plugin-react
```
### clone vundle

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

### use the command below to install the plugins from the command line

```
vim +PluginInstall +qall
```

## Git

+ gitconfig

## eslint 

+ eslintrc

+ dependences: 
  
  + sudo npm i -g eslint-config-airbnb@latest
  + sudo npm i -g eslint-plugin-import@latest
  + sudo npm i -g eslint-plugin-jsx-a11y@latest

## sublime text 3
    
+ sublime-keymap-User
+ sublime-packages

## keybind

+ .xbingkeysrc

相关命令：

查看按键：

```
xev
```

启动按键绑定：

```
xbindkeys
```

更新时需要kill掉已启动的应用

```
ps -aux | grep xbindkeys

kill xxxx
```
