#!/usr/bin/ruby

require_relative "../os_command"

class InstallNeovim < OSCommand
  def mac
    stream_command("brew install neovim")
  end

  def debian
    stream_command("curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o #{path}")
    stream_command("chmod u+x #{path}")
  end

  def skip?
    !`which nvim`.empty?
  end

  def path
    File.expand_path("~/.local/bin/nvim")
  end
end

InstallNeovim.run!
