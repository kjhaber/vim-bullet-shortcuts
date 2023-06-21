# vim-bullet-shortcuts
Vim plugin containing convenient commands for editing bullet lists

This vim plugin provides a set of vim functions and mappings useful when
working with bullet list characters, such as asterisks and dashes.  The
functions and mappings include:

* Toggling between asterisk and dash
* Changing the bullet character of the current line to an asterisk ("*"), dash ("-"), right-bracket (">"), or plus ("+") character.

The commands and mappings work both with current line and with ranges.  The default mappings call `repeat#set` from the [vim-repeat](https://github.com/tpope/vim-repeat) plugin to make the `.` command repeat the action.

## Commands

### BulletChange [newChar]
Changes the bullet list character to `newChar`, e.g. `:BulletChange #` will change the line's bullet character to '#'.

### BulletChangeDash
Changes the bullet list character to "-".

Default mapping: `<Leader>b-` (normal and visual select modes)

### BulletChangeAsterisk
Changes the bullet list character to "*".

Default mapping: `<Leader>b*` (normal and visual select modes)

### BulletChangeGt
Changes the bullet list character to ">".

Default mapping: `<Leader>b>` (normal and visual select modes)

### BulletChangePlus
Changes the bullet list character to "+".

Default mapping: `<Leader>b+` (normal and visual select modes)

### BulletToggle
Switches the bullet list character between "*" and "-" characters.

Default mapping: `<Leader>bb` (normal and visual select modes), <c-b> (insert mode)

### BulletToggleIndent
Indents the line and switches the bullet list character between "*" and "-" characters.

Default mapping: `<Leader>bi` (normal and visual select modes)

### BulletToggleOutdent
Outdents (un-indents) the line and switches the bullet list character between "*" and "-" characters.

Default mapping: `<Leader>bo` (normal and visual select modes)


## Installation

Assuming you use vim-plug, Pathogen, or equivalent, add the following to your
.vimrc:

```
Plug 'kjhaber/vim-bullet-shortcuts'
```

To disable default mappings, add `let g:vim_bullet_shortcuts_map_keys = 0` to your vimrc before the plugin loads.


## License
MIT

