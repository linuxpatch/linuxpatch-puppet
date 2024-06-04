class linuxpatch (
  String $api_key,
) {
  # Define the file resource to download the install.sh script
  file { '/tmp/install.sh':
    ensure  => 'file',
    mode    => '0755',
    source  => 'https://linuxpatch.com/install.sh',
  }

  # Define the exec resource to run the script with the API_KEY
  exec { 'run_install_script':
    command     => '/tmp/install.sh',
    environment => "LP_KEY=${api_key}",
    cwd         => '/tmp',
    onlyif      => 'test ! -f /opt/linuxpatch/bin/linuxpatch',
    require     => File['/tmp/install.sh'],
  }

  # Define the file resource to clean up the script
  file { 'cleanup_install_script':
    path    => '/tmp/install.sh',
    ensure  => 'absent',
    require => Exec['run_install_script'],
  }

  # Ensure the linuxpatch-agent service is running and enabled at startup
  service { 'linuxpatch-agent':
    ensure     => 'running',
    enable     => true,
    require    => Exec['run_install_script'],
  }
}
