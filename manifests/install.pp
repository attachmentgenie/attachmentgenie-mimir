# Class to install mimir.
#
# @api private
class mimir::install {
  if $mimir::manage_user {
    user { 'mimir':
      ensure => present,
      home   => $mimir::install_dir,
      name   => $mimir::user,
    }
    group { 'mimir':
      ensure => present,
      name   => $mimir::group,
    }
  }
  case $mimir::install_method {
    'package': {
      if $mimir::manage_repo {
        class { 'mimir::repo': }
      }
      package { 'mimir':
        ensure => $mimir::package_version,
        name   => $mimir::package_name,
      }
    }
    'archive': {
      file { 'mimir install dir':
        ensure => directory,
        group  => $mimir::group,
        owner  => $mimir::user,
        path   => $mimir::install_dir,
      }
      if $mimir::manage_user {
        File[$mimir::install_dir] {
          require => [Group['mimir'],User['mimir']],
        }
      }

      archive { 'mimir archive':
        cleanup      => true,
        creates      => "${mimir::install_dir}/mimir",
        extract      => true,
        extract_path => $mimir::install_dir,
        group        => $mimir::group,
        path         => '/tmp/mimir.tar.gz',
        source       => $mimir::archive_source,
        user         => $mimir::user,
        require      => File['mimir install dir'],
      }
    }
    default: {
      fail("Installation method ${mimir::install_method} not supported")
    }
  }
}
