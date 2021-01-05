# Change log

All notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](http://semver.org).

## [v0.5.1](https://github.com/puppetlabs/puppetlabs-puppet_authorization/tree/v0.5.1) (2020-03-09)

[Full Changelog](https://github.com/puppetlabs/puppetlabs-puppet_authorization/compare/0.5.0...v0.5.1)

### Added

- \(MODULES-10578\) Add EL8 to metadata.json [\#32](https://github.com/puppetlabs/puppetlabs-puppet_authorization/pull/32) ([trevor-vaughan](https://github.com/trevor-vaughan))
- Support puppetlabs/concat 6.x and puppetlabs/stdlib 6.x. [\#31](https://github.com/puppetlabs/puppetlabs-puppet_authorization/pull/31) ([pillarsdotnet](https://github.com/pillarsdotnet))

----------
At this point, the module was converted to the PDK.
----------

## Unsupported Release 0.5.0
### Summary
This release increases the upper bounds of several dependencies and adds support for two new OS.

### Changed
- Moved upper bound of compatible puppet from >= 6.0.0 to >= 7.0.0.
- Moved upper bound of compatible puppetlabs-stdlib from >= 5.0.0 to >= 6.0.0.
- Moved upper bound of compatible puppetlabs-concat from >= 5.0.0 to >= 6.0.0.
- Support added for Ubuntu 16.04 and 18.04.

## Unsupported Release 0.4.0
### Summary
This release drops outdated stdlib validate functions.

### Changed
- Moved lower bound of compatible puppet from >= 4.0.0 to >= 4.7.0

### Fixed
- Fixed warnings raised by old `validate_*` methods

## Unsupported Release 0.3.0
### Summary

Small release that updates module dependencies.

#### Changed
- puppetlabs-concat and puppetlabs-stdlib dependencies

#### Removed
- Puppet Enterprise requirement. This dependency is no longer used for modules.

## Unsupported Release 0.2.0
### Summary

A small release including a couple of added features and metadata/readme fixes.

#### Added
* Hash to data types for allow and deny rules
* support for extensions matching - updates the validation to ensure that a valid allow/deny entry has been supplied

#### Fixed
* the concat version dependancy
* readme updates - removed unused links also

## Unsupported Release 0.1.0
### Summary

This is the initial release of the module.

#### Features
* Manages the `auth.conf` file using authorization rules written as Puppet resources.


\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*