# dotfiles

## Installing

You will need `git` and GNU `stow`

Clone into directory of choice and edit `.stowrc`
```
--target=/home/user_name
```

Run `stow` to symlink everything or just select what you want

```bash
stow */ # Everything (the '/' ignores the root files)
```

```bash
stow zsh # Just my zsh config
```
