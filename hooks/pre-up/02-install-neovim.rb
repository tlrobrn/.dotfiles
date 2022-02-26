#!/usr/bin/ruby

require_relative "../os_command"

class InstallNeovim < OSCommand
  def mac
    stream_command("brew install neovim")
  end

  def debian
    stream_command("sudo apt-get -y install neovim")
  end

  def skip?
    !`which nvim`.empty?
  end
end

InstallNeovim.run!
