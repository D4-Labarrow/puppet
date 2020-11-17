# Requires puppetlabs-chocolately
# Requires puppetlabs-reboots

class profile::platform::baseline::windows::packages {

require ::chocolatey

  package { '7zip':
    ensure   => installed,
    provider => 'chocolatey',
  }

  reboot { 'after':
    subscribe       => Package['7zip'],
  }
}
