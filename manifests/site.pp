file {'/tmp/it_works.txt':
  ensure => present,
  mode => '0640',
  content => "It works on\n ${ipaddress_ens160}!\n",
  }
