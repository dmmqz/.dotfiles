# Arch Linux installation script
## Install Arch
Before you can run this script, you will need to install Arch Linux. Run `archinstall` and select the following options:

| Section                        | Option                                                                         |
|--------------------------------|--------------------------------------------------------------------------------|
| Mirrors and repositories       | Select regions > Your country                                                  |
| Disk configuration             | Partitioning > Default partitioning layout > Select disk (with space + return) |
| Disk > File system             | btrfs (default structure: yes + use compression)                               |
| Disk > Disk encryption         | Encryption type: LUKS + Encryption password + Partitions (select the one)      |
| Hostname                       | Give your computer a name                                                      |
| Authentication > Root password | Set yours                                                                      |
| Authentication > User account  | Add a user > Superuser: Yes > Confirm and exit                                 |
| Applications > Audio           | pipewire                                                                       |
| Network configuration          | Copy ISO network configuration to installation                                 |
| Additional packages            | Add wget (type "/wget" to filter list)                                         |
| Timezone                       | Set yours                                                                      |

## Post Arch installation

After that, reboot into the installation. Once rebooted,\
run: `wget https://raw.githubusercontent.com/dmmqz/.dotfiles/refs/heads/main/install/install.sh`\
This will download the installation script in the current directory. Now\
run: `bash install.sh`

## After running `install.sh`

<!-- TODO: more detailed -->
1. cmusfm
2. Syncthing
