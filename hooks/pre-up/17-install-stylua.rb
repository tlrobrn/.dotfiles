#!/usr/bin/ruby

require_relative "../os_command"

class InstallStylua < OSCommand
  def mac
    stream_command("curl -L https://github.com/JohnnyMorganz/StyLua/releases/download/#{version}/stylua-macos-aarch64.zip -o #{zip_path}")
    stream_command("unzip #{zip_path} -d /usr/local/bin")
    stream_command("rm #{zip_path}")
  end

  def debian
    stream_command("curl -L https://github.com/JohnnyMorganz/StyLua/releases/download/#{version}/stylua-linux.zip -o #{zip_path}")
    stream_command("unzip #{zip_path} -d #{File.expand_path("~/.local/bin")}")
    stream_command("rm #{zip_path}")
  end

  def skip?
    !`which stylua`.empty?
  end

  def zip_path
    "/tmp/stylua.zip"
  end

  def version
    "v0.17.1"
  end
end

InstallStylua.run!
