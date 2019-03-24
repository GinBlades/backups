Create a config file for each backup based on the sample.

```json
{
    "excludes": [
        "*vendor/*",
        "*node_modules/*",
        "*.git/*",
        ".*",
        "projects/os/*",
        "sites/_demos/*",
        "sites/_archive/*",
        "tmp/*"
    ],
    "external": true,
    "host": "vm1",
    "from": "~/",
    "to": "/mnt/e/Backups/vm1"
}
```


## To run with the Windows Task Scheduler

Create a `backup.sh` file

```bash
cd /mnt/c/Users/username/Projects/backups
ruby rsync_cmd.rb vm1
ruby rsync_cmd.rb vm2
```

Create a `backup.bat` file

```
C:\Windows\System32\bash.exe -c -l '/mnt/c/Users/username/Scripts/backup.sh'
```

Point the task scheduler at the `.bat` file. I didn't see an option to set it to run hourly with the initial setup, but afterward you select edit it from the **Properties** menu.
