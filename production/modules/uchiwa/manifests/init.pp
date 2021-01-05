# == Class: uchiwa
#
# Base Uchiwa class
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
#  [*package_name*]
#    String
#    Default: uchiwa
#    Name of the package to install
#
#  [*service_name*]
#    String
#    Default: uchiwa
#    Name of the service to start
#
#  [*version*]
#    String
#    Default: latest
#    Which version of the package to install
#
#  [*install_repo*]
#    Boolean
#    Default: true
#    Should we install the repo?
#
#  [*repo*]
#    String
#    Default: main
#    Which repo should we read from, main or unstable?
#
#  [*repo_source*]
#    String
#    Default: undef
#    What's the url for the repo we should install?
#
#  [*repo_key_id*]
#    String
#    Default: 7580C77F
#    The repo key for Apt
#
#  [*repo_key_source*]
#    String
#    Default: https://repositories.sensuapp.org/apt/pubkey.gpg
#    GPG key for the repo we're installing
#
#  [*manage_package*]
#    Boolean
#    Default: true
#    Should we install the package from the repo?
#
#  [*manage_services*]
#    Boolean
#    Default: true
#    Should we start the service?
#
#  [*manage_user*]
#    Boolean
#    Default: true
#    Should we add the Uchiwa user?
#
#  [*host*]
#    String
#    Default: 0.0.0.0
#    What IP should we bind to?
#
#  [*port*]
#    Integer
#    Default: 3000
#    What port should we run on?
#
#  [*user*]
#    String
#    Default: ''
#    The username of the Uchiwa dashboard. Leave empty for none.
#
#  [*pass*]
#    String
#    Default: ''
#    The password of the Uchiwa dashboard. Leave empty for none.
#
#  [*refresh*]
#    String
#    Default: 5
#    Determines the interval to pull the Sensu API, in seconds
#
#  [*sensu_api_endpoints*]
#    Array of hashes
#    Default: [{
#               name     => 'sensu',
#               ssl      => false,
#               host     => '127.0.0.1',
#               port     => 4567,
#               user     => 'sensu',
#               pass     => 'sensu',
#               path     => '',
#               timeout  => 5,
#             }]
#    An array of API endpoints to connect uchiwa to one or multiple sensu servers.
#    The host field can be an array of hostnames or ip addresses for redundancy.
#    You may also set the host field to be a single hostname or ip address string.
#
#  [*users*]
#    Array of hashes
#    An array of user credentials to access the uchiwa dashboard. If set, it takes
#    precendence over 'user' and 'pass'.
#    Example:
#    ```
#    [{
#       'username' => 'user1',
#       'password' => 'pass1',
#       'readonly' => false
#     },
#     {
#       'username' => 'user2',
#       'password' => 'pass2',
#       'readonly' => true
#     }]
#     ```
#
#  [*auth*]
#    Hash
#    A hash containing the static public and private key paths for generating and
#    validating JSON Web Token (JWT) signatures.
#    Example:
#    ```
#    {
#      'publickey'  => '/path/to/uchiwa.rsa.pub',
#      'privatekey' => '/path/to/uchiwa.rsa'
#    }
#    ```
#
class uchiwa (
  $package_name         = $uchiwa::params::package_name,
  $service_name         = $uchiwa::params::service_name,
  $version              = $uchiwa::params::version,
  $install_repo         = $uchiwa::params::install_repo,
  $repo                 = $uchiwa::params::repo,
  $repo_release         = $uchiwa::params::repo_release,
  $repo_source          = $uchiwa::params::repo_source,
  $repo_key_id          = $uchiwa::params::repo_key_id,
  $repo_key_source      = $uchiwa::params::repo_key_source,
  $manage_package       = $uchiwa::params::manage_package,
  $manage_services      = $uchiwa::params::manage_services,
  $manage_user          = $uchiwa::params::manage_user,
  $host                 = $uchiwa::params::host,
  $port                 = $uchiwa::params::port,
  $user                 = $uchiwa::params::user,
  $pass                 = $uchiwa::params::pass,
  $refresh              = $uchiwa::params::refresh,
  $sensu_api_endpoints  = $uchiwa::params::sensu_api_endpoints,
  $users                = $uchiwa::params::users,
  $auth                 = $uchiwa::params::auth,
  $ssl                  = $uchiwa::params::ssl,
  $usersoptions         = $uchiwa::params::usersoptions,
  $log_level            = $uchiwa::params::log_level
) inherits uchiwa::params {

  # validate parameters here
  validate_bool($install_repo)
  validate_bool($manage_package)
  validate_bool($manage_services)
  validate_bool($manage_user)
  validate_string($package_name)
  validate_string($service_name)
  validate_string($version)
  validate_string($repo)
  validate_string($repo_source)
  validate_string($repo_key_id)
  validate_string($repo_key_source)
  validate_string($host)
  validate_integer($port)
  validate_string($user)
  validate_string($pass)
  validate_integer($refresh)
  validate_array($sensu_api_endpoints)
  validate_array($users)
  validate_hash($auth)
  validate_hash($ssl)
  validate_hash($usersoptions)
  validate_re($log_level, 'trace|debug|info|warn|fatal')

  anchor { 'uchiwa::begin': }
  -> class { 'uchiwa::install': }
  -> class { 'uchiwa::config': }
  ~> class { 'uchiwa::service': }
  -> anchor { 'uchiwa::end': }
}