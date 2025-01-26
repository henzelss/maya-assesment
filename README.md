This Puppet class automates the following tasks:

Features
Package Installation

Installs essential packages: vim, curl, and git.
User Management

Creates a user monitor with:
Home directory: /home/monitor
Default shell: bash
Directory and Script Setup

Creates /home/monitor/scripts/ directory.
Downloads a memory check script from GitHub into this directory as memory_check.
Symbolic Link Creation

Creates /home/monitor/src/ directory.
Creates a symbolic link /home/monitor/src/my_memory_check pointing to the memory check script.
Cron Job Configuration

Adds a crontab entry to execute /home/monitor/src/my_memory_check every 10 minutes.
Optional Enhancements
Configures the time zone to PHT.
Sets the hostname to bpx.server.local.
Usage
Apply the Puppet class to automate the setup tasks outlined above. Ensure Puppet is installed and configured on your target system.

This automation streamlines system provisioning and maintenance with minimal manual intervention.
