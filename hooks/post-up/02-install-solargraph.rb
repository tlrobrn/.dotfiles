#!/usr/bin/ruby

require_relative "../os_command"

class InstallSolargraph < OSCommand
  def mac
    install
  end

  def debian
    install
  end

  def install
    stream_command("RBENV_VERSION=3.2 gem install --user-install solargraph")
    stream_command("RBENV_VERSION=3.2 solargraph download-core")
  end
end

InstallSolargraph.run!
