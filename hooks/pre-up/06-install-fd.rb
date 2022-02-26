#!/usr/bin/ruby

require_relative "../os_command"

class InstallFd < OSCommand
  def mac
    stream_command("brew install fd")
  end

  def debian
    stream_command("sudo apt-get -y install fd-find")
    stream_command("ln -s $(which fdfind) #{File.expand_path("~/.local/bin/fd")}")
  end

  def skip?
    !`which fd`.empty?
  end
end

InstallFd.run!
