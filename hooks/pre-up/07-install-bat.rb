#!/usr/bin/ruby

require_relative "../os_command"

class InstallBat < OSCommand
  def mac
    `brew install bat`
  end

  def debian
    `sudo apt-get -y install bat`
    `ln -s $(which batcat) #{File.expand_path("~/.local/bin/bat")}`
  end

  def skip?
    !`which bat`.empty?
  end
end

InstallBat.run!
