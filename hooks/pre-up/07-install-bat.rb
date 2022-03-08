#!/usr/bin/ruby

require_relative "../os_command"

class InstallBat < OSCommand
  def mac
    stream_command("brew install bat")
  end

  def debian
    stream_command('sudo apt-get install -y -o Dpkg::Options::="--force-overwrite" bat')
    stream_command("mkdir -p #{local_bin_path}")
    stream_command("ln -s $(which batcat) #{link_path}")
  end

  def skip?
    !`which bat`.empty?
  end

  def local_bin_path
    File.dirname(link_path)
  end

  def link_path
    File.expand_path("~/.local/bin/bat")
  end
end

InstallBat.run!
