
**XARGS**

*Syntax: ...  | xargs -Iv <action>  v* 
*Where v: variable name, <action>: bash command to be performed*

Example and equivalents:
```bash
find /some/path -type l -newermt '10/08/2020 08:00:00' | xargs -Iv  ls -lah v

find /some/path -type l -newermt '10/08/2020 08:00:00' | while read f; do ls -lah $f; done

find /some/path -type l -newermt '10/08/2020 08:00:00' | xargs ls -lah
```

**FIND**

Find first file in directory
```bash
find /some/path -type d | grep XXX | xargs -Iv find v -type f -print -quit
```
