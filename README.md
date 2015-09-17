```
      ██            ██     ████ ██  ██                
     ░██           ░██    ░██░ ░░  ░██                
     ░██  ██████  ██████ ██████ ██ ░██  █████   ██████
  ██████ ██░░░░██░░░██░ ░░░██░ ░██ ░██ ██░░░██ ██░░░░ 
 ██░░░██░██   ░██  ░██    ░██  ░██ ░██░███████░░█████ 
░██  ░██░██   ░██  ░██    ░██  ░██ ░██░██░░░░  ░░░░░██
░░██████░░██████   ░░██   ░██  ░██ ███░░██████ ██████ 
 ░░░░░░  ░░░░░░     ░░    ░░   ░░ ░░░  ░░░░░░ ░░░░░░  

  ▓▓▓▓▓▓▓▓▓▓
 ░▓ about  ▓ custom *nix config files
 ░▓ author ▓ xieyunzi <xieyunzi@foxmail.com>
 ░▓ code   ▓ http://github.com/xieyunzi/dotfiles
 ░▓▓▓▓▓▓▓▓▓▓
 ░░░░░░░░░░https://github.com/xero/dotfiles#how-it-works

 fonts          > configs for gohu and other bitmap fonts
 git            > global git config and aliases
 shell          > shell config, like bash and zsh
 ssh            > remote ssh server keep alive
 sys            > system automation scripts
 tmux           > terminal multiplexer with custom status bar
 vim            > wizard status bar and sourcerer color scheme
 zsh            > zshell settings, aliases, and custom prompts
```

##table of contents
 - [introduction](#dotfiles)
 - [managing](#managing)
 - [installing](#installing)
 - [how it works](#how-it-works)
 - [tl;dr](#tldr)
 - [my shell](#my-shell)
 - [vim](#vim)
 - [previews](#previews)

#dotfiles
in the unix world programs are commonly configured in two different ways, via shell arguments or text based configuration files. programs with many options like window managers or text editors are configured on a per-user basis with files in your home directory `~`. in unix like operating systems any file or directory name that starts with a period or full stop character is considered hidden, and in a default view will not be displayed. thus the name dotfiles. 

it's been said of every console user: 
> _"you are your dotfiles"_.

since they dictate how your system will look and function. to many users (see [ricers](http://unixporn.net) and [beaners](http://nixers.net)) these files are very important, and need to be backed up and shared. people who create custom themes have the added challenge of managing multiple versions of them. i have tried many organization techniques. and just take my word for it when i say, keeping a git repo in the root of your home directory is a bad idea. i've written custom shell scripts for moving or symlinking files into place. there are even a few dotfile managers, but they all seem to have lots of dependencies. i knew there had to be a simple tool to help me.

#managing
i manage mine with [gnu stow](http://www.gnu.org/software/stow/), a free, portable, lightweight symlink farm manager. this allows me to keep a versioned directory of all my config files that are virtually linked into place via a single command. this makes sharing these files among many users (root) and computers super simple. and does not clutter your home directory with version control files.

#installing
stow is available for all linux and most other unix like distributions via your package manager.

- `sudo pacman -S stow`
- `sudo apt-get install stow`
- `brew install stow`

or clone it [from source](https://savannah.gnu.org/git/?group=stow) and [build it](http://git.savannah.gnu.org/cgit/stow.git/tree/INSTALL) yourself.

#how it works
by default the stow command will create symlinks for files in the parent directory of where you execute the command. so my dotfiles setup assumes this repo is located in the root of your home directory `~/dotfiles`. and all stow commands should be executed in that directory. otherwise you'll need to use the `-d` flag with the repo directory location.

to install most of my configs you execute the stow command with the folder name as the only argument. 

to install my **herbstluft** theme _greybeard_ use the command:

`stow herbstluftwm`

this will symlink files to `~/.config/herbstluftwm` and various other places.

but you can override the default behavior and symlink files to another location with the `-t` (target) argument flag. 

to install the **ryu-login** you need to execute the command:

`stow -t / ryu-login` 

this will symlink the file to `/etc/issue`.

**note:** stow can only create a symlink if a config file does not already exist. if a default file was created upon program installation you must delete it first before you can install a new one with stow. this does not apply to directories, only files.

#tl;dr
navigate to your home directory

`cd ~`

clone the repo:

`git clone https://github.com/xieyunzi/dotfiles.git`

enter the dotfiles directory

`cd dotfiles`

install the zsh settings

`stow zsh`

install zsh settings for the root user

`sudo stow zsh -t /root`

install awesomewm theme

`stow awesome`

uninstall awesome theme

`stow -D awesome`

install herbstluftwm

`stow herbstluftwm`

etc, etc, etc...

#my shell
i prefer a minimal setup, and choose to interact with my operating system via the so-called "terminal" or "command line", (read that quoting sarcastically) over a gui interface 2 times out of 3. with the web browser and video player among the noted outliers. in my opinion, using your computer should be a very personal experience. your colors, aliases, key-bindings, etc meticulously crafted to your exacting specifications. so for me, the unix shell is the most important part of my environment.

my terminal emulator of choice is the lightweight, unicode, 256 color [urxvt](http://linux.die.net/man/1/urxvt). i use [zsh](http://linux.die.net/man/1/zsh) as my interactive shell. it's an extensible, bash like shell with awesome completion and correction engines. i manage multiple shell sessions with [tmux](http://linux.die.net/man/1/tmux). it's a feature packed terminal multiplexer with support for buffers, split windows, detached local and remote sessions, etc. i'm a member of the cult of [vim](http://linux.die.net/man/1/vim). sing phrases to the third reincarnation of the glorious ed! lel. [mpd](http://linux.die.net/man/1/mpd) is my music server and i use [ncmpcpp](http://ncmpcpp.rybczak.net/) as it's frontend. my configs for [urxvt](http://git.io/.urxvt), [zsh](http://git.io/.zsh), [tmux](http://git.io/.tmux), [vim](http://git.io/.vim), [mpd](http://git.io/.mpd) and [ncmpcpp](http://git.io/.ncmpcpp) shown above feature my [sourcerer](http://sourcerer.xero.nu) color scheme.

#vim
with it's tight integration to the unix shell, [vim](http://www.vim.org) has quickly become my editor of choice. once you start to master the movements and operators you quickly begin manipulating, not just editing source code files.

when you learn vim it's best to use a more vanilla config. if helps you focus on learning the editor and not the plugins. these are also great for [remote machines](http://git.io/.vimrc-min). but for your local dev environment, vim's vast and powerful plugin system can add many great features. i try to keep my editor slim and fast, but i find myself loving these plugins:

- [vundle](https://github.com/gmarik/vundle.vim) - to manage other plugins
- [you complete me](https://github.com/Valloric/YouCompleteMe) - the best completion system
- [php complete](https://github.com/shawncplus/phpcomplete.vim) - extended php completions
- [syntastic](https://github.com/scrooloose/syntastic) - syntax linting
- [git gutter](https://github.com/airblade/vim-gitgutter) - git diff in the gutter
- [match it](https://github.com/isa/vim-matchit) - extended word and regex matching
- [lightline](https://github.com/itchyny/lightline.vim) - custom status line (for much rice)
- [fugitive](https://github.com/tpope/vim-fugitive) - fast git integration
