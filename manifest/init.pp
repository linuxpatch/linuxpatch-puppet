# Class: linuxpatch
# This class installs and configures the Linux Patch agent by downloading, running, and cleaning up an installation script.
#
# Parameters:
#   String $api_key - The API key required for the Linux Patch agent installation.
#
class linuxpatch (
  # The API key required for the Linux Patch agent installation.
  String $api_key,
  String $lp_url = 'https://linuxpatch.com',
) {
  # Define the file resource to download the install.sh script
  file { '/tmp/install.sh':
    ensure => 'file', # Ensure the file is present
    mode   => '0755', # Set the file permissions to be executable
    source => "${lp_url}/install.sh", # Source URL for the install.sh script
  }

  # Define the exec resource to run the script with the API_KEY
  exec { 'run_install_script':
    command     => '/tmp/install.sh', # Command to execute the script
    environment => "LP_KEY=${api_key}", # Set the API key as an environment variable
    cwd         => '/tmp', # Set the working directory to /tmp
    onlyif      => 'test ! -f /opt/linuxpatch/bin/linuxpatch', # Only run if the linuxpatch is not already installed
    require     => File['/tmp/install.sh'], # Ensure the script file is present before execution
  }

  # Define the file resource to clean up the script
  file { 'cleanup_install_script':
    ensure  => 'absent', # Ensure the file is removed
    path    => '/tmp/install.sh', # Path to the script file
    require => Exec['run_install_script'], # Ensure the script has been run before cleanup
  }

  # Ensure the linuxpatch-agent service is running and enabled at startup
  service { 'linuxpatch-agent':
    ensure  => 'running', # Ensure the service is running
    enable  => true, # Enable the service to start at boot
    require => Exec['run_install_script'], # Ensure the installation script has been run before starting the service
  }
}
