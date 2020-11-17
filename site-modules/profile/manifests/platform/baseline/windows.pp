class profile::platform::baseline::windows {
  # OS Specific
  case $::windows_installation_type {
    'Server': {
      include ::profile::platform::baseline::users::windows
      include ::profile::platform::baseline::windows::directories
      include ::profile::platform::baseline::windows::registry
      include ::profile::platform::baseline::windows::iis
      include ::profile::platform::baseline::windows::packages
    }
    'Client':   {
      include ::profile::platform::baseline::users::windows
      include ::profile::platform::baseline::windows::directories
      include ::profile::platform::baseline::windows::packages
    }
  }
}
