# == Class: display::params
#
# Display parameters.
#
# === Authors
#
# Joshua Hoblitt <jhoblitt@cpan.org>
#
# === Copyright
#
# Copyright 2013 Joshua Hoblitt
#
class display::params {
  $lc_osfamily         = downcase($::osfamily)
  $x11vnc_package_name = 'x11vnc'
  $xvfb_erb            = "display/${lc_osfamily}/xvfb.erb"
  $x11vnc_erb          = "display/${lc_osfamily}/x11vnc.erb"
  $xvfb_service_name   = 'xvfb'
  $display             = 0
  $width               = 1280
  $height              = 800
  $color               = '24+32'
  $runuser             = 'root'
  $fbdir               = '/tmp'

  case $::osfamily {
    'redhat': {
      $xvfb_package_name = 'xorg-x11-server-Xvfb'
    }
    'debian': {
      $xvfb_package_name = 'xvfb'
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}
