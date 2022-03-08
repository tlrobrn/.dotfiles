#!/usr/bin/ruby

require_relative "../os_command"

class InstallFd < OSCommand
  def mac
    stream_command("brew install fd")
  end

  def debian
    stream_command("sudo apt-get -y install fd-find")
    stream_command("mkdir -p #{local_bin_path}")
    stream_command("ln -s $(which fdfind) #{link_path}")
  end

  def skip?
    !`which fd`.empty?
  end

  def local_bin_path
    File.dirname(link_path)
  end

  def link_path
    File.expand_path("~/.local/bin/fd")
  end
end

InstallFd.run!
