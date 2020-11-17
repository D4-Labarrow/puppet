# Requires ayohrling-local_security_policy

class profile::platform::baseline::users::windowstest {

  user { 'liam_sexton':
    ensure   => present,
    password => 'Puppetlabs!',
    groups   => ['Administrators'],
  }

}
