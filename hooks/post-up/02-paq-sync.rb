#!/usr/bin/ruby

require_relative "../os_command"

class PaqSync < OSCommand
  def mac
    sync
  end

  def debian
    sync
  end

  def sync
    stream_command("nvim +'PaqSync' +qa")
  end
end

PaqSync.run!
