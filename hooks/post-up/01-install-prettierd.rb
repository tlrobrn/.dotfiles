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
    stream_command("npm install -g @fsouza/prettierd")
  end
end

InstallPrettierd.run!
