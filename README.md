## sudope Plugin for Fish Shell

### About

A Fish port of oh-my-zsh's [sudo plugin]

### Install

With [Oh-My-Fish]:
```fish
omf install sudope
```

### Usage

Press `Ctrl`+`s` to activate it.
It will add `sudo ` to the beginning of the line if missing, remove it if it is present while preserving the cursor position.
If the current line is empty, it will do the same thing to the most recent history item.

#### License

2015 [MIT] @ [Itzik Ephraim]

[sudo plugin]: https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/sudo
[Oh-My-Fish]: https://github.com/oh-my-fish/oh-my-fish
[MIT]: https://opensource.org/licenses/MIT
[Itzik Ephraim]: https://github.com/oranja
