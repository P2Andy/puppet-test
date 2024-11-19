file {'/tmp/it_works2.txt':
  ensure => present,
  mode => '0640',
  content => "It works on\n ${ipaddress_ens160}!\n",
  }
