#!/usr/bin/ruby

require_relative "../os_command"

class InstallWatchman < OSCommand
  def mac
    `brew install watchman`
  end

  def debian
    `sudo apt install watchman`
  end

  def skip?
    !`which watchman`.empty?
  end
end

InstallWatchman.run!
