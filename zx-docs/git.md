Change-the-author-of-a-commit-in-git
====================================

http://stackoverflow.com/questions/750172/change-the-author-of-a-commit-in-git

How do I remove a Git submodule?
================================

Via the page *[Git Submodule Tutorial][1]*:

**To remove a submodule you need to:**

   1. Delete the relevant section from the `.gitmodules` file.
   1. Stage the `.gitmodules` changes `git add .gitmodules`
   1. Delete the relevant section from `.git/config`.
   1. Run `git rm --cached path_to_submodule` (no trailing slash).
   1. Run `rm -rf .git/modules/path_to_submodule`
   1. Commit `git commit -m "Removed submodule <name>"`
   1. Delete the now untracked submodule files `rm -rf path_to_submodule`

[1]: https://git.wiki.kernel.org/index.php/GitSubmoduleTutorial#Removal

http://stackoverflow.com/questions/1260748/how-do-i-remove-a-git-submodule

What-are-the-differences-between-git-pull-and-git-fetch
=======================================================

In the simplest terms, `git pull` does a `git fetch` followed by a `git merge`.

You can do a `git fetch` at any time to update your remote-tracking branches under `refs/remotes/<remote>/`. This operation never changes any of your own local branches under `refs/heads`, and is safe to do without changing your working copy. I have even heard of people running `git fetch` periodically in a cron job in the background (although I wouldn't recommend doing this).

A `git pull` is what you would do to bring a local branch up-to-date with its remote version, while also updating your other remote-tracking branches.

Git documentation: [git pull](http://git-scm.com/docs/git-pull)

[ref](http://stackoverflow.com/questions/292357/what-are-the-differences-between-git-pull-and-git-fetch)

How to tell git which private key to use?
=========================================

ssh has the -i option to tell which private key file to use when authenticating,
Is there a similar way to tell git which private key file to use on a system with multiple private keys in the ~/.ssh directory?

Answer:
-------

In `~/.ssh/config`, add:

    host github.com
     HostName github.com
     IdentityFile ~/.ssh/id_rsa_github
     User git

Now you can do `git clone git@github.com:username/repo.git`.

NOTE:  Verify that the permissions on IdentityFile are 400.SSH will reject, in a not clearly explicit manner, SSH keys that are too readable. It will just look like a credential rejection. The solution, in this case, is:

    chmod 400 ~/.ssh/id_rsa_github

[ref](http://superuser.com/questions/232373/how-to-tell-git-which-private-key-to-use)

How to complete a git clone for a big project on an unstable connection?
========================================================================

Use shallow clone i.e. git clone --depth=1, then deepen this clone using git fetch --depth=N, with increasing N. You can use git fetch --unshallow (since 1.8.0.3) to download all remaining revisions.

[ref](http://stackoverflow.com/questions/3954852/how-to-complete-a-git-clone-for-a-big-project-on-an-unstable-connection)
