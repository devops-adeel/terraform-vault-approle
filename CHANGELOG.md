# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [v0.6.1] -  2021-01-26
## Fixed
- Fixed identity entity output

## [v0.6.0] -  2021-01-26
## Removed
- feat: removed identity group

## [v0.5.1] -  2021-01-26
### Fixed
- fixed: amended the metadata key `service_name` to `service`.

### Added
- Added changelog.md

## [v0.5.0] -  2021-01-21
### Fixed
- fix: Approle backend deletion on subsequent TF runs 

### Changed
- BREAKING: Approle auth backend must be mounted prior to running this module.  Accessor Id must be provided.

## [v0.4.3] -  2021-01-21
### Removed
- Removed Entity Policies

## [v0.4.2] -  2021-01-20
### Changed
- Increased ttl value.

## [v0.4.1] -  2021-01-14
### Added
- Added integration tests

## [v0.4.0] -  2021-01-13
### Added
- Added identity group

## [v0.3.1] -  2021-01-07
### Changed
- Added count back into the backend

## [v0.3.0] -  2021-01-07
### Removed
- Removed vault policy, added policy variable.

## [v0.2.1] - 2021-01-06
### Added
- Added further documentation and examples

## [v0.2.0] - 2021-01-05
### Added
- Added transit path for managing keys

## [v0.1.0] - 2021-01-04
### Added
- Vault Approle Backend
- Vault Approle ID + Secret.
