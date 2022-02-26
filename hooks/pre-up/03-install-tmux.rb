#!/usr/bin/ruby

require_relative "../os_command"

class InstallTmux < OSCommand
  def mac
    `brew install tmux`
  end

  def debian
    `sudo apt-get -y install tmux`
  end

  def skip?
    !`which tmux`.empty?
  end
end

InstallTmux.run!
