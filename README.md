## sudope Plugin for Fish Shell

### About

A fish shell port of oh-my-zsh's [sudo plugin]

### Install

With [Oh-My-Fish]:
```fish
omf install sudope
```

### Usage

Fish 2.3 and later: Press <kbd>Esc</kbd>+<kbd>Esc</kbd> or <kbd>Alt</kbd>+<kbd>Esc</kbd> to activate.
(See the "Escape in Fish" appendix if you're having trouble activating sudope)

Fish 2.2 and earlier: Press <kbd>Ctrl</kbd>+<kbd>s</kbd> to activate.
(See Customization below if you want to change the binding.)

It will add `sudo ` to the beginning of the line if missing, or remove it if it is present - while preserving the cursor position.
If the current line is empty, it will do the same thing to the most recent history item.

### Customization

The default binding sequence can be overriden by setting `sudope_sequence` to the desired sequence.

For example, to set the sequence to <kbd>Alt</kbd>+<kbd>u</kbd> you can add:
```fish
set -gx sudope_sequence \eu
```
To `~/.config/omf/init.fish`.

**Escape in Fish**

<kbd>Esc</kbd> is treated specially in fish:

> The escape key can be used standalone, for example, to switch from insertion mode to normal mode when using Vi keybindings.
> Escape can also be used as a "meta" key, to indicate the start of an escape sequence, like for function or arrow keys. Custom bindings can also be defined that begin with an escape character.
>
> Holding alt and something else also typically sends escape, for example holding alt+a will send an escape character and then an "a".
>
> fish waits for a period after receiving the escape character, to determine whether it is standalone or part of an escape sequence. While waiting, additional key presses make the escape key behave as a meta key.
> If no other key presses come in, it is handled as a standalone escape. The waiting period is set to 30 milliseconds (0.03 seconds).
> It can be configured by setting the `fish_escape_delay_ms` variable to a value between 10 and 5000 ms.
> This can be a universal variable that you set once from an interactive session.
>
> Note: fish 2.2.0 and earlier used a default of 10 milliseconds, and provided no way to configure it. That effectively made it impossible to use escape as a meta key.

(from https://fishshell.com/docs/3.1/cmds/bind.html#special-case-the-escape-character)

In other words, using <kbd>Esc</kbd>+<kbd>Esc</kbd> is possible with fish 2.3+, but you might need to tweak `fish_escape_delay_ms` to more than 30ms if you're using fish 3.1+ and having trouble activating sudope reliably.

#### License

2015-2020 [ISC] @ [Itzik Ephraim]
Commits e45d168 and 0928ab2: 2017 [ISC] @ [Chloe Kudryavtsev]

[sudo plugin]: https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/sudo
[Oh-My-Fish]: https://github.com/oh-my-fish/oh-my-fish
[ISC]: http://cvsweb.openbsd.org/cgi-bin/cvsweb/src/share/misc/license.template?rev=HEAD
[Itzik Ephraim]: https://github.com/oranja
[Chloe Kudryavtsev]: https://github.com/5paceToast
