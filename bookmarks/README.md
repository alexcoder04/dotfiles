
The bookmark system can read a source file and output it in different formats.

## Example:

### Source

```conf
tdow ~/Downloads
tm /media
```

### Output for bash

```bash
alias tdow="cd ~/Downloads"
alias tm="cd /media"
```

### Output for lf
```conf
map tdow $lf -remote "send $id cd ~/Downloads"
map tm $lf -remote "send $id cd /media"
```

