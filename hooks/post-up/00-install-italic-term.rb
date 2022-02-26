#!/usr/bin/ruby

require_relative "../os_command"

class InstallItalicTerm < OSCommand
  def mac
    install
  end

  def debian
    install
  end

  def install
    stream_command("tic -o #{File.expand_path("~/.terminfo")} #{File.expand_path("~/.config/term/xterm-256color.terminfo")}")
  end
end

InstallItalicTerm.run!
