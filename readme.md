# Vagrant LAMP box

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

This `.box` is meant as a root box for building LAMP environments to facilitate rapid development on several machines. The goal is to have a box with apache, php, mysql, xdebug installed and configured, as well as modsecurity preloaded to be enabled quickly if you need that installed.

## TODO
* Install and configure Xdebug https://blog.bam.tech/developer-news/configure-php-debugger-with-vscode-and-vagrant
* Figure out why MySQL port forwarding fails

