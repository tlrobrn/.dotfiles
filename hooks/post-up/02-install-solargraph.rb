#!/usr/bin/ruby

require_relative "../os_command"

class InstallSolargraph < OSCommand
  def mac
    install
  end

  def debian
    # install
  end

  def install
    stream_command("gem install --user-install solargraph")
    stream_command("solargraph download-core")
  end
end

InstallSolargraph.run!
