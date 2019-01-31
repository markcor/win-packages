# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class win_packages::nxlog {

$programfilesx86 = $facts['programfilesx86']

   # defined_classes::pkg::win_msi_pkg  { "NxLog-CE":
    #    pkg             => "nxlog-ce-2.8.1248.msi",
     #   install_options => ['/quiet'],
	#}
	#windows_firewall::exception { 'nxlog':
  	#	ensure       => present,
  	#	direction    => 'out',
  	#	action       => 'allow',
  	#	enabled      => true,
  	#	protocol     => 'TCP',
  	#	local_port   => 514,
  	#	display_name => 'Nxlog out',
  	#	description  => 'Nxlogout. [TCP 514]',
	#}
#	file { "$programfilesx86\\nxlog\\cert\\papertrail-bundle.pem":
#		content => file("win_packages/papertrail-bundle.pem"),
#	}
	file { "$programfilesx86\\nxlog\\conf\\nxlog.conf":
		content => epp("win_packages/nxlog.conf.epp"),
	}
	service { "nxlog":
		restart   => true,
		subscribe => file["$programfilesx86\\nxlog\\conf\\nxlog.conf"],
	}
}
