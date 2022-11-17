#!/usr/bin/ruby

require_relative "../os_command"

class NvimSetup < OSCommand
  def mac
    sync
  end

  def debian
    sync
  end

  def sync
    stream_command("nvim +'PaqSync' +'COQdeps' +'CHADdeps' +qa")
  end
end

NvimSetup.run!
