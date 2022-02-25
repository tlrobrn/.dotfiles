#!/usr/bin/ruby

require_relative "../os_command"

class InstallFd < OSCommand
  def mac
    `brew install fd`
  end

  def debian
    `sudo apt install fd-find`
    `ln -s $(which fdfind) #{File.expand_path("~/.local/bin/fd")}`
  end

  def skip?
    !`which fd`.empty?
  end
end

InstallFd.run!
