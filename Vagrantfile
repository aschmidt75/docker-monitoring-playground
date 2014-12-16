# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = ENV['BOXNAME'] || 'chef/ubuntu-14.04'
  config.vm.box_check_update = false

  # google cAdviros
  config.vm.network "forwarded_port", guest: 8501, host: 8501

  # seagull
  config.vm.network "forwarded_port", guest: 8502, host: 8502

  # kamon-grafana-dashboard
  config.vm.network "forwarded_port", guest: 8503, host: 8503

  # cockpit
  config.vm.network "forwarded_port", guest: 8504, host: 8504

  # boxspy
  config.vm.network "forwarded_port", guest: 8505, host: 8505

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
  
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end

  config.vm.provision 'shell', path: 'provision.d/01_os.sh'
  config.vm.provision 'shell', path: 'provision.d/10_docker.sh'
  config.vm.provision 'shell', path: 'provision.d/20_monitoring.sh'

  # start dashboards
  config.vm.provision 'shell', inline: <<EOF
cd /vagrant/scripts
./start_cadvisor.sh
./start_kamon_grafana.sh
./start_seagull.sh
./start_cockpit.sh
./start_boxspy.sh
./post_samplestats_to_statsd.sh &
EOF

end
