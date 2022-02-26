#!/usr/bin/ruby

require_relative "../os_command"

class InstallWatchman < OSCommand
  def mac
    stream_command("brew install watchman")
  end

  def debian
    stream_command("sudo apt-get -y install watchman")
  end

  def skip?
    !`which watchman`.empty?
  end
end

InstallWatchman.run!
