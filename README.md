# dotfiles

## Installing

There is an `install.sh` script provided to automatically copy all needed files.

```sh
$ git clone https://github.com/coderkearns/dotfiles
$ cd dotfiles
$ ./install.sh
```

You can always re-run the installation script to update to the newest version.

## Safe files

Some files are not uploaded, like for tokens that are meant to stay secret. They have templates in the `templates/` directory
that are copied *if they don't already exist*. If any of these files already exists it will not be overridden with the default, so it is on the user to keep them up-to-date.

When a template is copied during the install script a message is given to notify you to fill out the file:

```
Copying template <file>. Edit it after installation as needed.
```

All safe files currently go in `~/.bashrc.d/`
