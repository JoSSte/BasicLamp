# Vagrant LAMP box

This is my gold image for working with apache and PHP

## Usage
* Execute `deploy.sh` and import the box in your vagrant file

``` ruby
Vagrant.configure(2) do |config|
  config.vm.box = "JoSSte/lamp"
  config.vm.define "coolVMName"
  ...
end
```

## Debugging

Make sure your .vscode/launch.json contains this:
``` json
{
    "name": "Listen for XDebug",
    "type": "php",
    "request": "launch",
    "pathMappings": {
        "/var/www/<yourfolder on vagrant>": "${workspaceRoot}/src"
    },
    "port": 9000,
    "log" :  true
}
```

## Information

This `.box` is meant as a golden image for building LAMP environments to facilitate rapid development on several machines. The goal is to have a box with apache, php, mysql, xdebug installed and configured, as well as modsecurity preloaded to be enabled quickly if you need that installed.

### MySQL
* Set up to listen on port 3306 on all ips
* no ports forwarded as default
* User: `vagrant`
* Pass: `secret`



### Features
* Ubuntu 21.04
* Apache 2
* php 7.4
* xdebug enabled
* MySQL

## TODO
* Versioning [link 1](https://www.vagrantup.com/docs/boxes/format) [link 2](https://martincarstenbach.wordpress.com/2020/05/05/versioning-for-your-local-vagrant-boxes-adding-a-new-box/)

