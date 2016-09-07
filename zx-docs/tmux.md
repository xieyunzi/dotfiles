development workflow with tmux and vim (TODO)
=============================================

https://www.google.com/?q=tmux+test+code

https://github.com/benmills/vimux
https://www.braintreepayments.com/blog/vimux-simple-vim-and-tmux-integration/
http://joshuadavey.com/2012/01/10/faster-tdd-feedback-with-tmux-tslime-vim-and-turbux/
http://www.drmaciver.com/2015/05/using-tmux-to-test-your-console-applications/
http://avi.io/blog/2014/08/28/my-development-workflow-vim-tmux-terminal-awesomeness/

Tmux bracketed paste mode issue at command prompt in zsh shell
==============================================================

http://stackoverflow.com/questions/33452870/tmux-bracketed-paste-mode-issue-at-command-prompt-in-zsh-shell

question
--------

Problem steps like this:

0. copy text 'kill-server' to system clipboard
0. hit `Prefix :` to enter the tmux command prompt
0. hit `command+v` to paste

The result paste text is `200~kill-server201~` instead of `kill-server`. This weird [bracketed paste mode][1] text do *not* happen in shell prompt but in tmux command prompt, and I had tried to [turn off bracketed paste mode][2] but without luck.

Environment that has this issue:

 - Mac OS 10.11.1, iTerm, zsh 5.0.7, Tmux 2.1
 - Mac OS 10.10.1, iTerm, zsh 5.1.1, Tmux 1.9

Environment that without this issue:

 - Mac OS 10.11.1, iTerm, bash, Tmux 2.1

  [1]: http://invisible-island.net/xterm/ctlseqs/ctlseqs.html#h2-Bracketed-Paste-Mode
  [2]: https://cirw.in/blog/bracketed-paste


answer
------

I'm posting this as an answer because it's a bit too long and I need some formatting... So here it goes.

I can reproduce only with zsh 5.1+. There's no reason to expect the problem on 5.0.x, because bracketed paste mode was [introduced in 5.1](https://github.com/zsh-users/zsh/blob/8bf72dd65b00ffd223d0705c8fde952ff129eafa/NEWS#L43-L45). You might be doing something wrong in your testing, or there might be something peculiar about your setup, in which case you have to explain better. Also, iTerm2 probably doesn't play any part in this, since I could reproduce in Terminal.app just fine (of course they could both have the same defect...).

Considering bracketed paste mode is a ZLE feature, I think (*disclaimer: the rest of this paragraph is purely my speculation*) the real problem is that tmux uses the underlying shell's line editing features (ZLE, in zsh's case) in its command prompt to offer better editing experience (for instance, you have access to all the Emacs style shortcuts there), but its command prompt is a dumb term, and doesn't understand the bracketed paste sequences. So we have this weird situation of two modes of terminal emulation within tmux, one is fairly smart which happens within each pane, and the other is dumb which happens in its command prompt.

Solutions and workarounds:

1. This is probably worth reporting to tmux. https://github.com/tmux/tmux/issues.

2. Turn off ZLE bracketed paste. It does work, you're probably doing it wrong. If you don't mind losing bracketed paste in tmux, you could put the following somewhere in your shell init sequence:

        (( $+TMUX )) && unset zle_bracketed_paste

3. In iTerm2, you have access to advanced paste (Edit->Paste Special->Advanced Paste..., or &#x2325;&#x2318;V). Just uncheck "Bracketed paste mode", and you shouldn't see the escape sequences.


answer
------

I solved this problem finally just deactivated the `safe-paste` plugin in my oh-my-zsh.

The [safe-paste][1] used to fix [zsh up arrow completion issue][2]. But now, the arrow completion issue is gone while inducing tmux bracketed paste problem. I haven't dived into the code of `safe-paste` yet. Hope to help others encountering the same problem.

  [1]: https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/safe-paste/safe-paste.plugin.zsh
  [2]: https://github.com/robbyrussell/oh-my-zsh/issues/1720
