# Compare file modification times

You can compare file modification times with test, using -nt (newer than) and -ot (older than) operators:

```bash
if [ "$file1" -ot "$file2" ]; then
    cp -f "$file2" "$file1"
fi
```
http://stackoverflow.com/questions/14802807/compare-files-date-bash
