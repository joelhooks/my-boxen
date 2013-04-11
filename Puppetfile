# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "1.2.0"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",  "1.0.0"
github "gcc",      "1.0.0"
github "git",      "1.0.0"
github "homebrew", "1.1.2"
github "hub",      "1.0.0"
github "inifile",  "0.9.0", :repo => "cprice-puppet/puppetlabs-inifile"
github "nginx",    "1.1.0"
github "nodejs",   "1.1.0"
github "nvm",      "1.0.0"
github "ruby",     "3.1.0"
github "stdlib",   "3.0.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",     "1.0.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "dropbox", 	"1.1.0"
github "chrome", 	"1.1.0"
github "tmux", 		"1.0.2"
github "macvim", 	"1.0.0"
github "sublime_text_2", "1.1.0"
github "webstorm", "0.0.0", :repo =>  "joelhooks/puppet-webstorm"
github "adium", "1.1.1"
github "firefox", "1.0.5"
github "virtualbox", "1.0.2"
github "alfred", "1.0.2"
github "istatmenus4", "1.0.0"
github "vagrant", "2.0.5"
github "pow", "1.0.0"
github "vmware_fusion", "1.0.0"
github "skype", "1.0.2"
github "ctags", "1.0.0"
github "divvy", "1.0.1"
github "transmission", "1.0.0"
github "mongodb", "1.0.0"
github "phantomjs", "1.0.0"
github "onepassword", "1.0.0"
github "caffeine", "1.0.0"
github "flux", "0.0.1"
github "airfoil", "0.0.1"
github "vlc", "1.0.0"
github "keyremap4macbook", "1.0.2"
github "skitch", "1.0.0"
github "kindle", "1.0.0"
github "sourcetree", "0.0.2"
