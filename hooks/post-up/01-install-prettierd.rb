#!/usr/bin/ruby

require_relative "../os_command"

class InstallPrettierd < OSCommand
  def mac
    install
  end

  def debian
    install
  end

  def install
    stream_command("ASDF_NODEJS_VERSION=18 npm install -g @fsouza/prettierd")
  end
end

InstallPrettierd.run!
