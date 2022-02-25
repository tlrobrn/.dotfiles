#!/usr/bin/ruby

require_relative "../os_command"

class InstallNeovim < OSCommand
  def mac
    `brew install neovim`
  end

  def debian
    `sudo apt install neovim`
  end

  def skip?
    !`which nvim`.empty?
  end
end

InstallNeovim.run!
