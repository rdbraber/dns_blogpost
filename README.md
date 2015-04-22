# dns_blogpost
Files to create Vagrant virtual machines with DNS master/slave replication

The blogpost with these files can be found at: http://blog.grid-it.nl/index.php/2015/04/22/creating-a-masterslave-dns-server-combination-for-your-grid-infrastructure-3/

Make sure you have VirtualBox, Vagrant and Git installed and you’re good to go.
On the commandline just use the three following command to get your DNS setup running:
git clone https://github.com/rdbraber/dns_blogpost.git cd dns_blogpost
vagrant up
If you want to, you can make changes to the Vagrantfile and the configuration files for the DNS server to meet the requirements of your ip-plan. Two virtual machines, one OL6 and one OL7, will be started and DNS is installed, configured and started.
If you don’t have git, you can also download a zipfile containing the files.
