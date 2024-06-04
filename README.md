# Puppet Module: Install LinuxPatch.com agent

## Description

This Puppet module automates the process of downloading, executing an installation script from [linuxpatch.com](https://linuxpatch.com). The module downloads the `install.sh` script to the `/tmp` directory, runs it with the provided `LP_KEY` as an environment variable, and then removes the script from the system. The script is only executed if the file `/opt/linuxpatch/bin/linuxpatch` does not exist. Additionally, the module ensures that the `linuxpatch-agent` service is running and enabled on startup.

## Prerequisites

- Puppet installed on the control node.
- SSH access to the target nodes.
- API key for [linuxpatch.com](https://linuxpatch.com).

## Parameters

- `lp_key`: The API key required for the script execution. You should provide your actual API key.

## Usage

1. **Clone the repository or create the module file**:

   Save the module content into a file named `linuxpatch.pp`.

2. **Set up the Puppet Manifest**:

   Ensure you have a manifest file (`site.pp` or any other name) that includes the target nodes. Here is an example of a manifest file:

   ```puppet
   node 'server1.example.com' {
     class { 'linuxpatch':
       lp_key => 'your_lp_key_here',
     }
   }

   node 'server2.example.com' {
     class { 'linuxpatch':
       lp_key => 'your_lp_key_here',
     }
   }
  ```
