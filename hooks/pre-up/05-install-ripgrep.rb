#!/usr/bin/ruby

require_relative "../os_command"

class InstallRipgrep < OSCommand
  def mac
    `brew install ripgrep`
  end

  def debian
    `sudo apt-get -y install ripgrep`
  end

  def skip?
    !`which rg`.empty?
  end
end

InstallRipgrep.run!
