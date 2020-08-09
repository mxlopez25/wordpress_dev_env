## Vagrant WordPress Development Environment

Software requirements:
 * Virtualbox
 * Vagrant

After installing all required software, proceed to download the repository, and in the terminal into the repository directory, enter to the `Vagrantfile` and change port if need it:

`config.vm.network "forwarded_port", guest: 80, host: 11000`

Run the following command to start the script:

`
$ vagrant up
`

This should create the virtual machine, update the OS, install all required software, set up the database and the permissions for the WordPress enviroment.

After the script is done, enter to:

`
http://localhost:11000
`

And it will be shown the Wordpress Set up Page.