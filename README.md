# A Puppet Control Repository for Basics Three: Windows

Here's a visual representation of the structure of this repository:

All code contains comments with what module is required

Code tested on latest Puppet release (2019.8.1) in an enviroment consisting of a 'windows' node group with two nodes:

- Windows Server 2012 R2 (x64)
- Windows 10 Enterprise 2015 lts (x64)

```
control-repo/
├── data/                                 # Hiera data directory.
│   ├── nodes/                            # Node-specific data goes here.
│   └── common.yaml                       # Common data goes here.
├── manifests/
│   └── site.pp                           # The "main" manifest that contains a default node definition.
├── scripts/
│   ├── code_manager_config_version.rb    # A config_version script for Code Manager.
│   ├── config_version.rb                 # A config_version script for r10k.
│   └── config_version.sh                 # A wrapper that chooses the appropriate config_version script.
├── site-modules/                         # This directory contains site-specific modules and is added to $modulepath.
│   ├── profile/                          # The profile module.
│   │
│   ├── manifests
│           ├── platform                      # 
│               ├── baseline                  # baseslines for platform specefic manifests
│               │    ├── windows               # windows specefic manifests
│               │    │    ├── directories.pp   # creates new directory and sets permissions
│               │    │    ├── iis.pp           # creates IIS server
│               │    │    ├── packages.pp      # manages packages 
│               │    │    ├── registry.pp      # manages registrys
│               │    ├── users                 # user specefic manifests
│               │         ├── windows.pp       # specifes what to apply based on Windows version
│               │    
│               ├── windows.pp            # Uses logic to apply different classes based on OS (I.e Windows Server)        
├── LICENSE 
├── Puppetfile                            # A list of external Puppet modules to deploy with an environment.
├── README.md
├── environment.conf                      # Environment-specific settings. Configures the modulepath and config_version.
└── hiera.yaml                            # Hiera's configuration file. The Hiera hierarchy is defined here.
```

Basics Three: Windows
Familiarize yourself with common Windows administration tasks, and how they differ from their Linux counterparts.

In conjunction with your control repo, create a new module/profile to perform the following:

Local Accounts
- Create a local user
- Create a local group
- Ensure the user is in the group
- Grant your user the "Log on as a Service" right

File and directory permissions
- Create a new directory
- Ensure its owner is the user you are managing
- Ensure its group similarly
- Inspect the directory permissions
- Manage the directory permissions using the puppetlabs/acl module
- Grant the local user Full Control
- Grant the local group Read Only permissions
- Note: ACLs are similar but not the same as Linux permissions

Registry
- Use the puppetlabs/registry module to do the following:
- Enable Internet Explorer enhanced security configuration (IEESC)
- Enable the Windows Shutdown Event Tracker

IIS
- Use the puppetlabs/dism, puppet/windowsfeature or puppetlabs/dsc_lite modules to install IIS
- Use the puppetlabs/iis module to create a basic website
- Note: the terminology and architecture of IIS differs a bit from something like Apache

Package Management
- Install 7-zip using the puppet/staging archive module - deprecated module use puppet/archive instead
- Install 7-zip using chocolatey and the puppetlabs/chocolatey forge module

Reboots
- Extend your 7-zip code to use puppetlabs/reboot the system after installing 7-zip
- Uninstall 7-zip and verify that the system reboots after reinstalling
- Note: there are a few subtly different reboot styles in this module.
