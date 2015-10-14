# change-the-author-of-a-commit-in-git

http://stackoverflow.com/questions/750172/change-the-author-of-a-commit-in-git

# How do I remove a Git submodule?

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
