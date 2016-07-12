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
