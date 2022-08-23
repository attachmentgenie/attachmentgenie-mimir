# Class to manage the mimir service.
#
# @api private
class mimir::service {
  if $mimir::manage_service {
    case $mimir::service_provider {
      'systemd': {
        ::systemd::unit_file { "${mimir::service_name}.service":
          content => template('mimir/mimir.service.erb'),
          before  => Service['mimir'],
        }
      }
      default: {
        fail("Service provider ${mimir::service_provider} not supported")
      }
    }

    case $mimir::install_method {
      'archive': {}
      'package': {
        Service['mimir'] {
          subscribe => Package['mimir'],
        }
      }
      default: {
        fail("Installation method ${mimir::install_method} not supported")
      }
    }

    service { 'mimir':
      ensure   => $mimir::service_ensure,
      enable   => true,
      name     => $mimir::service_name,
      provider => $mimir::service_provider,
    }
  }
}
