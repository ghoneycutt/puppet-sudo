# Class: sudo
#
# This module manages sudo and is included in the generic class
# and applied to all nodes
#
class sudo {

    package { "sudo": }

    File { require => Package["sudo"] }

    file {
        "/etc/sudoers":
            mode    => "440",
            content => template("sudo/sudoers.erb");
        "/usr/bin/sudo":
            mode    => "4111";
        "/usr/sbin/visudo":
            mode    => "755";
    } # file
} # class sudo
