#!/usr/bin/ruby

require_relative "../os_command"

class InstallJq < OSCommand
  def mac
    `brew install jq`
  end

  def debian
    `sudo apt-get -y install jq`
  end

  def skip?
    !`which jq`.empty?
  end
end

InstallJq.run!
