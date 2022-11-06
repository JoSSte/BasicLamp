# Vagrant LAMP box

This is my gold image for working with apache and PHP
https://app.vagrantup.com/JoSSte/boxes/lamp 

## Usage
* Execute `deploy.sh` and import the box in your vagrant file

``` ruby
Vagrant.configure(2) do |config|
  config.vm.box = "JoSSte/lamp"
  config.vm.box_version = "2.0.2"
  config.vm.define "coolVMName"
  ...
end
```

## Debugging in Visual Studio Code

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


