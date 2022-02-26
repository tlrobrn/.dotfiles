#!/usr/bin/ruby

require_relative "../os_command"

class InstallTmux < OSCommand
  def mac
    stream_command("brew install tmux")
  end

  def debian
    stream_command("sudo apt-get -y install tmux")
  end

  def skip?
    !`which tmux`.empty?
  end
end

InstallTmux.run!
