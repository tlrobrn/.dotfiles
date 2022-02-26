#!/usr/bin/ruby

require_relative "../os_command"

class PlugUpdate < OSCommand
  def mac
    update
  end

  def debian
    update
  end

  def update
    stream_command("nvim +'PlugUpdate' +qa")
  end
end

PlugUpdate.run!
