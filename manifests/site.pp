require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $luser,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::luser}"
  ]
}

File {
  group => 'staff',
  owner => $luser
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => Class['git']
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include dnsmasq
  include git
  include hub
  include nginx
  
  # include some provided versions
  include nodejs::v0_10
  include nodejs::v0_8_8

  # install any arbitrary nodejs version
  nodejs { 'v0.10.1': }

  class { 'nodejs::global': version => 'v0.10.0' }

  # install some npm modules
  # Yeoman tools
  nodejs::module { 'yo': node_version => 'v0.10' }
  nodejs::module { 'grunt-cli': node_version => 'v0.10' }
  nodejs::module { 'bower': node_version => 'v0.10' }

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }



  # default ruby versions
  include ruby::1_8_7
  include ruby::1_9_2
  include ruby::1_9_3
  include ruby::2_0_0

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar'
    ]:
  }

  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }
  include chrome
  include dropbox
  include tmux
  include macvim
  include sublime_text_2
  include webstorm
  include adium
  include firefox
  include virtualbox
  include alfred
  include istatmenus4
  include vagrant
  include pow
  include vmware_fusion
  include skype
  include ctags
  include divvy
  include transmission
  include mongodb
  include phantomjs
  include onepassword
  include caffeine
  include flux
  include airfoil
  include vlc
  include keyremap4macbook
  include sourcetree
  include iterm2::stable
  include processing
  include skitch
  include kindle
}
