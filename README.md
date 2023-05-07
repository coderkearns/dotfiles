# dotfiles

## Installing

There is an `install.sh` script provided to automatically copy all needed files.

```sh
$ git clone https://github.com/coderkearns/dotfiles
$ cd dotfiles
$ ./install.sh
```

## Safe files

Don't forget to re-add the files `safe` files:

- **.bashrc.d/01_safe_vars.sh**

```sh
# Github
export GH_TOKEN="<your_personal_access_token>"
```
