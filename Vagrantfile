Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/jammy64"

  #forward mysql port
  config.vm.network "forwarded_port", guest: 3306, host: 3309, guest_ip: '127.0.0.1', host_ip: '127.0.0.1'

  config.vm.provision "file", 
    source: "./conf/xdebug.ini", 
    destination: "/tmp/xdebug.ini"

  config.vm.provider "virtualbox" do |vb|

  #   vb.gui = true

      vb.memory = "1024"
  end

  if Vagrant.has_plugin?("vagrant-cachier")
    # Configure cached packages to be shared between instances of the same base box.
    # More info on http://fgrehm.viewdocs.io/vagrant-cachier/usage
    config.cache.scope = :box
    #config.ssh.username = "ubuntu"

    # OPTIONAL: If you are using VirtualBox, you might want to use that to enable
    # NFS for shared folders. This is also very useful for vagrant-libvirt if you
    # want bi-directional sync
    config.cache.synced_folder_opts = {
      type: :nfs,
      # The nolock option can be useful for an NFSv3 client that wants to avoid the
      # NLM sideband protocol. Without this option, apt-get might hang if it tries
      # to lock files needed for /var/cache/* operations. All of this can be avoided
      # by using NFSv4 everywhere. Please note that the tcp option is not the default.
      mount_options: ['rw', 'vers=3', 'tcp', 'nolock']
    }
    # For more information please check http://docs.vagrantup.com/v2/synced-folders/basic_usage.html
  end

  # install apache  
  config.vm.provision :shell, path: "./initscripts/lampinit.sh"
  
end