# Class to install and configure mimir.
#
# Use this module to install and configure mimir.
#
# @mimir Declaring the class
#   include ::mimir
#
# @param archive_source Location of mimir binary release.
# @param group Group that owns mimir files.
# @param install_dir Location of mimir binary release.
# @param install_method How to install mimir.
# @param manage_repo Manage the mimir repo.
# @param manage_service Manage the mimir service.
# @param manage_user Manage mimir user and group.
# @param package_name Name of package to install.
# @param package_version Version of mimir to install.
# @param service_name Name of service to manage.
# @param service_provider Init system that is used.
# @param service_ensure The state of the service.
# @param user User that owns mimir files.
class mimir (
  String[1] $group,
  Stdlib::Absolutepath $install_dir,
  Enum['archive','package'] $install_method ,
  Boolean $manage_repo,
  Boolean $manage_service,
  Boolean $manage_user,
  String[1] $package_name,
  String[1] $package_version,
  String[1] $service_name,
  String[1] $service_provider,
  Enum['running','stopped'] $service_ensure,
  String[1] $user,
  Optional[Stdlib::HTTPUrl] $archive_source = undef,
) {
  contain 'mimir::install'
  contain 'mimir::config'
  contain 'mimir::service'

  Class['mimir::install']
  -> Class['mimir::config']
  ~> Class['mimir::service']
}
