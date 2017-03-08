# 怎样管理 linux(mac) 的配置文件

在 *nix 系统中, home 目录下一般有许多程序的配置文件([rc files](https://en.wikipedia.org/wiki/Run_commands)), 它们可以更改程序运行时的行为。

如何管理并在多台机器上分享、同步这些配置文件也算是一个棘手的问题, 当然解决方法也有不少

## 使用 git 直接管理 home 目录

使用 git 之类的版本控制工具把整个 home 目录保存下来, 这其中 ignore 文件也有两种处理方式

### 一种是先 ignore 所有, 然后排除需要的文件
示例: `cat ~/.gitignore`

```
/*
!/.gitignore
!/.bashrc
/some_dir/*
!/some_dir/sub_dir/*
# ...
```
    
### 另一种是 ignore 不需要的文件
示例: `cat ~/.gitignore`

```
/Desktop
/Documents
# ...
```

### 利弊

- 利: 简单, 直观
- 弊: home 目录会显得不干净, 而且每次增加、删除文件都需要更改 `.gitignore` 文件。

## 使用 symbolic link

把配置文件集中到一个 home 的子目录, 比如 `~/.dotfiles`, 在 home 目录创建链接到这个 `.dotfiles` 目录的 [symbolic link](https://en.wikipedia.org/wiki/Symbolic_link), 这样只需要把这个 `.dotfiles` 目录使用 `git` 管理就好了

但是会遇到几个问题

- 对待同名目录, 单纯 link 这个目录可不行, 需要在 home 目录创建同名目录, 然后分别创建这个目录下的 symlink
- 手动创建并管理这些 symlink 是非常繁琐的步骤

那么就需要一个辅助管理 symlink 的工具, [gnu stow](https://www.gnu.org/software/stow) 就是这样的工具

### 安装 stow

```
# for mac
$ brew install stow
# for ubuntu
$ apt-get install stow

# show help
$ stow -h
```

### 使用

假设你的配置文件存放在 `~/.dotfiles` 目录下, 结构为

```
├── git
│   ├── .gitconfig
│   └── .gitignore_global
├── shell
│   ├── .bashrc
│   └── .zshrc

```
要把 git 配置 link 到 home 目录下

```
# usage
$ stow -d $HOME/.dotfiles -t $HOME git
```

这样, `.gitconfig` 和 `.gitignore_global` 会被 link 到 home 目录下

```
$ ls -al ~

lrwxr-xr-x    .gitconfig -> .dotfiles/git/.gitconfig
lrwxr-xr-x    .gitignore_global -> .dotfiles/git/.gitignore_global
```

## 实际案例

[my dotfiles](https://github.com/xieyunzi/dotfiles)
https://github.com/xieyunzi/dotfiles

使用了 stow 管理 dotfiles, crontab 自动处理一些更新任务

包含了 git, bash, zsh, tmux, vim 等等的配置, 目前只在 mac 上使用

### 当然, 还有很多细节的设计

#### 如何处理不同机器所需配置间的微小差异, 以及个性化的需求

使用 `*.local` 文件存储本机的差异性需求, 会覆盖同名文件的配置, 比如 email 等配置, 工作机器和自己的机器一般会不同

待续