
The bookmark system can read a source file and output it in different formats.
Bookmarks mapped to an alias not starting with `t` are ignored. However, they
can be read by other applications directly from the source files (like my
`fzf` extensions for `zsh` and `lf`)

## Example:

### Source

```conf
tdow ~/Downloads
tm /media
_ ~/Pictures
```

### Output for bash

```bash
alias tdow="cd ~/Downloads"
alias tm="cd /media"
```

### Output for zsh

```zsh
_bookmark-ls(){ exa --icons --group-directories-first }
abbrev-alias tdow="cd ~/Downloads && _bookmark-ls"
abbrev-alias tm="cd /media && _bookmark-ls"
```

### Output for lf
```conf
map tdow $lf -remote "send $id cd ~/Downloads"
map tm $lf -remote "send $id cd /media"
```

