# Ubuntu 22.04 LTS fast environment installer

Ubuntu script provides a ready-to-use environment.

### Installing

```bash
sudo apt update && sudo apt install --yes git
git clone https://github.com/jkbmaj/ubuntu-2204-fast-env.git ~/.fast-env
~/.fast-env/install.sh
source ~/.bashrc
```

### Usage
```
fastenv # Runs the installer with the selection screen
fastenv update # Runs system update directly
fastenv mini # Directly runs minimal installation (Updates system, then install Thunderbird, Git, Sublime Text 4 and UFW)
fastenv custom # Directly runs a custom installation (shows which modules can be installed)
```

## License

This project is licensed under the MIT License - see
the [LICENSE.md](LICENSE.md) file for details
