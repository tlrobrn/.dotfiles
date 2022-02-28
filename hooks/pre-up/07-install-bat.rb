#!/usr/bin/ruby

require_relative "../os_command"

class InstallBat < OSCommand
  def mac
    stream_command("brew install bat")
  end

  def skip?
    !`which bat`.empty?
  end
end

InstallBat.run!
