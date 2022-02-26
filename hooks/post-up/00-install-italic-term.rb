#!/usr/bin/ruby

require_relative "../os_command"

class InstallItalicTerm < OSCommand
  def mac
    stream_command("tic -o #{File.expand_path("~/.terminfo")} #{File.expand_path("~/.config/term/xterm-256color.terminfo")}")
  end
end

InstallItalicTerm.run!
