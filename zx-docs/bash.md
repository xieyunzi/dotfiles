How to easily start a webserver in any folder?
==============================================

```python
python -m SimpleHTTPServer 8000
```

```php
php -S 0.0.0.0:8000
```

```ruby
ruby -run -e httpd . -p8000
```

Compare file modification times
===============================

You can compare file modification times with test, using -nt (newer than) and -ot (older than) operators:

```bash
if [ "$file1" -ot "$file2" ]; then
    cp -f "$file2" "$file1"
fi
```
http://stackoverflow.com/questions/14802807/compare-files-date-bash

How to copy symbolic links?
===========================

> I use `cp -av` for most of my heavy copying.

http://superuser.com/questions/138587/how-to-copy-symbolic-links

How can I make 'rm' move files to the trash can?
================================================

Bad Idea
--------

Using rm to move files to trash is like weed. It is common and pleasuring but can be bad for you in the future. ;)

You really need control yourself when using `rm`.

Don't use rm
------------

Imagine, you get used to rm moving to trash and make a habit of it. Sure, your system is safe but when you log into a friend's (or your wife's or your boss') notebook and have to delete something? You'll be actually using the real `rm` - deleting those files forever. It's a bad habit, and you need to know that.

So instead, install `rmtrash` and make a habit of using it:

```bash
# install rmtrash, (either from the macports or by the brew.)
$ alias trash="rmtrash"
$ alias   del="rmtrash"       # del / trash are shorter than rmtrash
```

http://apple.stackexchange.com/questions/17622/how-can-i-make-rm-move-files-to-the-trash-can

String contains in Bash
=======================

outside a case statement:
-------------------------

    string='My long string';

    if [[ $string == *"My long"* ]]
    then
      echo "It's there!";
    fi

Note that spaces in the needle string need to be placed between double quotes, and the * wildcards should be outside the double quotes.

with case statement:
--------------------

    case "$string" in 
      *foo*)
        # Do stuff
        ;;
    esac

http://stackoverflow.com/questions/229551/string-contains-in-bash/229585#229585

How-to-run-process-as-background-and-never-die
==============================================

`nohup node server.js > /dev/null 2>&1 &`

 1. `nohup` means: *Do not terminate this process even when the stty is cut
    off.*
 2. `> /dev/null` means: *stdout goes to /dev/null (which is a dummy
    device that does not record any output).* 
 3. `2>&1` means: *stderr also goes to the stdout (which is already redirected to `/dev/null`). You may replace &1 with a file path to keep a log of errors, e.g.: `2>/tmp/myLog`*
 4. `&` at the end means: *run this command as a background task.*

http://stackoverflow.com/questions/4797050/how-to-run-process-as-background-and-never-die


How to redirect standard output and error to a file in unix
===========================================================

That part is written to stderr, use `2>` to redirect it. For example:

    foo > stdout.txt 2> stderr.txt

or if you want in same file:

    foo > allout.txt 2>&1

Note: this works in (ba)sh, check your shell for proper syntax

http://stackoverflow.com/questions/6674327/redirect-all-output-to-file
