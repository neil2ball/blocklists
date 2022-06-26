# blocklists
This is a simple set of BASH scripts to update pi-hole blocklists using a cron job.

When the script runs, it looks in the folder of the given list set for ts hosts file.  See the example below.

When adding a link, just use "file://".  For example: file:///opt/blocklists/default/default-hosts.txt

The main script is blocklists/blocklists.sh

You can run the script in the shell, but it is intended for use as a cron job to automate updating the blocklists.
