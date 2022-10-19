# Ubuntu 22.04 LTS fast environment installer [WORK IN PROGRESS!]

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
fastenv # Starts the installer with the selection screen
fastenv update # Runs apt, snap, composer and other updates directly
fastenv mini # Updates the system and then installs Thunderbird, Git, Sublime Text 4, and UFW)
fastenv custom # Displays the screen for selecting modules to be installed
```

## License

This project is licensed under the MIT License - see
the [LICENSE.md](LICENSE.md) file for details
