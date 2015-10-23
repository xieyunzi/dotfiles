# crontab reference

```
* * * * * command to be executed
- - - - -
| | | | | ----- Day of week (0 - 7) (Sunday=0 or 7)
| | | | ------- Month (1 - 12)
| | | --------- Day of month (1 - 31)
| | ----------- Hour (0 - 23)
| ------------- Minute (0 - 59)
```

# how-to-create-cronjob-using-bash (create cronjob from multiple files)

```sh
crontab -l | { cat; echo "0 0 0 0 0 some entry"; } | crontab -
```

explain:

> `crontab -l` lists the current crontab jobs, `cat` prints it, `echo` prints the new command and `crontab -` adds all the printed stuff into the crontab file.

http://stackoverflow.com/questions/878600/how-to-create-cronjob-using-bash
