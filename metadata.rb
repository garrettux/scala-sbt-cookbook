maintainer_email "garrettux@gmail.com"
license          "All rights reserved"
description      "Installs/Configures scala-sbt"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"
%w{redhat centos scientific fedora debian ubuntu}.each do |os|
  supports os
end
%w[ java apt ].each { |cb| depends cb }
