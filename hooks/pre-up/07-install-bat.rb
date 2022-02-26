#!/usr/bin/ruby

require_relative "../os_command"

class InstallBat < OSCommand
  def mac
    stream_command("brew install bat")
  end

  def debian
    stream_command("sudo apt-get -y install bat")
    stream_command("ln -s $(which batcat) #{File.expand_path("~/.local/bin/bat")}")
  end

  def skip?
    !`which bat`.empty?
  end
end

InstallBat.run!
