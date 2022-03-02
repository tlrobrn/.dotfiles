#!/usr/bin/ruby

require_relative "../os_command"

class SetupPackageManager < OSCommand
  def mac
    if install_brew?
      stream_command('/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"')
    else
      stream_command("brew update")
    end
  end

  def debian
    stream_command("sudo apt-get update")
  end

  def install_brew?
    `which brew`.empty?
  end
end

SetupPackageManager.run!
