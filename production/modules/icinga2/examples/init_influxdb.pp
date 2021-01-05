class { 'icinga2':
  manage_repos => true,
}

include icinga2::feature::influxdb
