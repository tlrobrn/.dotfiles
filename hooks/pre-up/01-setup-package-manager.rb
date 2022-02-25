#!/usr/bin/ruby

require_relative "../os_command"

class SetupPackageManager < OSCommand
  def mac
    if install_brew?
      `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
    else
      `brew update`
    end
  end

  def debian
    `sudo apt update`
  end

  def install_brew?
    `which brew`.empty?
  end
end

SetupPackageManager.run!
