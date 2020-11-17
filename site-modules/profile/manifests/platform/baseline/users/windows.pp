# Requires ayohrling-local_security_policy

class profile::platform::baseline::users::windows {

  # Local user accounts
  user { 'Sample Windows User':
    ensure   => present,
    password => 'Puppetlabs',
    groups   => ['Administrators'],
  }

  # Allow log as a service right
  local_security_policy { 'Log on as a service':
    ensure       => present,
    policy_value => 'Administrators',
  }
}
