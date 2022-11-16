#!/usr/bin/ruby

require_relative "../os_command"

class InstallPython3Venv < OSCommand
  def debian
    stream_command("sudo apt-get -y install python3-venv")
  end
end

InstallPython3Venv.run!
