# Puppet Module: Install LinuxPatch.com agent

## Description

This Puppet module automates the process of downloading, executing an installation script from [linuxpatch.com](https://linuxpatch.com). The module downloads the `install.sh` script to the `/tmp` directory, runs it with the provided `LP_KEY` as an environment variable, and then removes the script from the system. The script is only executed if the file `/opt/linuxpatch/bin/linuxpatch` does not exist. Additionally, the module ensures that the `linuxpatch-agent` service is running and enabled on startup.

### Efficient Patch Management with LinuxPatch.com

Are you looking for a reliable solution to manage and automate your Linux server patches? [LinuxPatch.com](https://linuxpatch.com) offers a robust patch management service designed to keep your systems secure and up-to-date. This service is essential for maintaining the stability and security of your Linux infrastructure.

#### Why Choose LinuxPatch.com?

LinuxPatch.com provides a comprehensive patch management solution that simplifies the process of keeping your Linux servers updated. The service includes features such as automated patch deployment, detailed reporting, and compliance management, ensuring your systems are always protected against vulnerabilities.

#### Easy Integration with Puppet

Integrating LinuxPatch.com's agent into your existing Puppet infrastructure is straightforward. Our dedicated Puppet module handles the entire process, from downloading the installation script to ensuring the `linuxpatch-agent` service is active and enabled on startup. This seamless integration saves you time and reduces the complexity of managing patches across multiple servers.

#### Key Features

- **Automated Installation**: The Puppet module downloads the `install.sh` script directly from LinuxPatch.com and runs it with your specific `LP_KEY`.
- **Conditional Execution**: The script runs only if the `/opt/linuxpatch/bin/linuxpatch` file is absent, preventing redundant installations.
- **Service Management**: Ensures the `linuxpatch-agent` service is running and set to start on boot, maintaining continuous protection.

#### Benefits

- **Enhanced Security**: Regular patch updates mitigate the risk of security breaches and ensure compliance with industry standards.
- **Operational Efficiency**: Automating patch management frees up your IT team to focus on other critical tasks.
- **Reliability**: LinuxPatch.com’s robust solution guarantees that your servers remain updated with the latest security patches.

By using the LinuxPatch.com agent with Puppet, you ensure your Linux environment is both secure and efficiently managed. Visit [linuxpatch.com](https://linuxpatch.com) to learn more about our services and how they can benefit your organization.

## Prerequisites

- Puppet installed on the control node.
- SSH access to the target nodes.
- API key for [linuxpatch.com](https://linuxpatch.com).

## Parameters

- `lp_key`: The API key required for the script execution. You should provide your actual API key.

