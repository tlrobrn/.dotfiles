#!/usr/bin/ruby

require_relative "../os_command"

class InstallSqlite < OSCommand
  def mac
    stream_command("brew install sqlite")
  end

  def debian
    stream_command("sudo apt-get -y install sqlite")
  end

  def skip?
    !`which sqlite`.empty?
  end
end

InstallSqlite.run!
